unit frmEPrescribe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls;

type
  TEPrescribeForm = class(TForm)
    btnClose: TButton;
    pnlCanvas: TPanel;
    browser: TWebBrowser;
    pnlTools: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure browserNewWindow2(Sender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
  private
    { Private declarations }
  public
    { Public declarations }
{$IFDEF CCOW}
    class function AllowContextChange(var WhyNot: string): Boolean;
{$ENDIF}
  end;

var
  ePrescribing: TEPrescribeForm;

procedure CallERx(action: Integer);   //ERx 9/4/12


implementation

uses fFrame, ORFn, ORNet, uCore, System.UITypes, uConst, System.StrUtils
, System.Types;

{$R *.dfm}

///////////////////////////////////////////////////////////////////////////////
procedure CallERx(Action: Integer);
// ERx 9/4/12  added entire function
var
  results, headers: TStringList;
  line, s: string;
  varUrl, varFlags, varTarget, varPostData, varHeaders: OleVariant;
  dynData: TByteDynArray;
  i: Integer;
begin
{$IFDEF WORLDVISTA}
  if assigned(ePrescribing) then
  begin
    ePrescribing.BringToFront;
    exit;
  end;
{$ENDIF}
  if Patient.DFN = '' then
  begin
    MessageDlg('No patient is selected.', mtWarning, [mbOK], 0);
    exit;
  end;
  try
    results := TStringList.Create;
    headers := TStringList.Create;
    try
      case Action of
        ERX_ACTION_ORDER:
          CallV('C0P ERX ORDER RPC', [User.DUZ, Patient.DFN]);
        ERX_ACTION_ALERT:
          CallV('C0P ERX ALERT RPC', [User.DUZ, Patient.DFN, 1,
            Notifications.RecordID]);
      Else
        exit;
      end;
      s := AnsiReplaceStr(RPCBrokerV.results.Text, '^M', sLineBreak);

      results.Text := s;
      // results.SaveToFile('rpcresults.txt');

      varUrl := Null;
      while (results.count > 0) and not AnsiStartsText('RxInput=',
        results[0]) do
      begin
        line := TRIM(results[0]);
        results.Delete(0);

        if line = '' then
          continue;

        if AnsiStartsText('POST ', line) then
        begin
          varUrl := Piece(line, ' ', 2);
          continue;
        end;

        headers.values[Piece(line, ':', 1)] := TRIM(Piece(line, ':', 2));
      end;

      if VarIsNull(varUrl) then
        exit;

      s := results.Text;
      SetLength(dynData, Length(s));
      Move(s[1], dynData[0], Length(s));
      DynArrayToVariant(Variant(varPostData), dynData, TypeInfo(TByteDynArray));

      headers.values['Content-Length'] := IntToStr(Length(s));

      varHeaders := '';
{$IFDEF VER140}    // Lets Delphi 6 compile and run correctly (RV)
      for i := 0 to headers.count - 1 do
        varHeaders := varHeaders + headers.Names[i] + ': ' +
          Piece(headers[i], '=', 2) + sLineBreak;
{$ELSE}   // Delphi 7 version
      for i := 0 to headers.count - 1 do
        varHeaders := varHeaders + headers.Names[i] + ': ' +
          headers.ValueFromIndex[i] + sLineBreak;
{$ENDIF}
      varFlags := Null;
      varTarget := Null;
{$IFDEF WORLDVISTA}
      ePrescribing := TEPrescribeForm.Create(Application);
      ePrescribing.browser.Navigate2(varUrl, varFlags, varTarget, varPostData,
        varHeaders);
      ePrescribing.ShowModal;
{$ENDIF}
    finally
      results.Free;
      headers.Free;
    end;
  except
    on E: Exception do
      MessageDlg('An error occurred: ' + E.Message, mtError, [mbOK], 0);
  end;
  SendMessage(Application.MainForm.Handle, UM_NEWORDER, ORDER_SIGN, 0);
end;


{ TEPrescribeForm }

{$IFDEF CCOW}
class function TEPrescribeForm.AllowContextChange(var WhyNot: string): Boolean;
begin
  Result := True;
  if ePrescribing <> nil then
    case BOOLCHAR[frmFrame.CCOWContextChanging] of
      '1':
        begin
          WhyNot := 'E-prescribing window is still in use.';
          Result := False;
        end;
      '0':
        begin
          if WhyNot = 'COMMIT' then
          begin
            ePrescribing.Close;
          end
          else
          begin
            Result := MessageDlg('CPRS is attempting to change context.  ' +
              sLineBreak + sLineBreak +
              'Click OK to close the e-prescribing window and change context.' +
              sLineBreak + sLineBreak +
              'Click Cancel to prevent the context change and keep the e-prescribing window open.',
              mtConfirmation, mbOKCancel, 0) = mrOK;
            if Result then
              ePrescribing.Close;
          end;
        end;
    end;
end;
{$ENDIF}

procedure TEPrescribeForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s: String;
begin
  if (self = ePrescribing) then
  begin
    ePrescribing := nil;
{$IFDEF CCOW}
    if not frmFrame.ContextChanging then
{$ENDIF}
    begin
      CallV('C0P ERX PULLBACK', [User.DUZ, Patient.DFN]);
      s := Trim(RPCBrokerV.Results.Text);

      if (s = 'OK') then
        frmFrame.mnuFileRefreshClick(self)
      else
        MessageDlg(s, mtWarning, [mbOK], 0);
    end;
  end;

  Action := caFree;
end;

procedure TEPrescribeForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TEPrescribeForm.browserNewWindow2(Sender: TObject;
  var ppDisp: IDispatch; var Cancel: WordBool);
var
  tmpfrm: TEPrescribeForm;
begin
  tmpfrm := TEPrescribeForm.Create(Application);
  tmpfrm.Show;

  ppDisp := tmpfrm.browser.Application;
end;

end.
