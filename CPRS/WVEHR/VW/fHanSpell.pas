unit fHanSpell;
{Copyright © 2008, Gary Darby,  www.DelphiForFun.org
 This program may be used or modified for any non-commercial purpose
 so long as this original notice remains in place.
 All other rights are reserved
 }

{A program to quickly highlight a predefined set of words with specified colors
in a RichEdit control. Technique to intercept WindowProc is converted from
Basic code provided by Emile Tredoux to Delphi.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RichEdit, Buttons, ExtCtrls, ShellAPI, 
  skaSpellCheck,
  VA508AccessibilityManager, fBase508Form;

type
  TfrmHunSpell = class(TfrmBase508Form)
    lblDictionary: TLabel;
    btnClose: TButton;
    OpenDialog1: TOpenDialog;
    SpellCheck1: TskaHunSpellChecker;
    Edit1: TEdit;
    btnSelectDict: TBitBtn;
    Label3: TLabel;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    pnlMisSpelled: TPanel;
    Label1: TLabel;
    lstSuggestions: TListBox;
    Label4: TLabel;
    Edit2: TEdit;
    btnAutoCorrect: TButton;
    btnChangeAll: TButton;
    btnChange: TButton;
    btnAddToDictionary: TButton;
    btnIgnoreAll: TButton;
    btnIgnoreOnce: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIgnoreOnceClick(Sender: TObject);
    procedure btnIgnoreAllClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnChangeAllClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelectDictClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure btnAutoCorrectClick(Sender: TObject);
    procedure btnAddToDictionaryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    NoEngineOpted: Boolean;
    FSourceControl: TCustomMemo;
    WaitForUser: Boolean;

  public
    { Public declarations }
    Showhighlight:boolean;
    highlightcolor:TColor;
    HighLightList:TStringlist;
    OldRichEditWndProc: {integer}pointer;
    PRichEditWndProc:pointer;
    class function DoHanSpellCheck(AnEditControl: TCustomMemo): TModalResult; static;
  end;

 var
  frmHunSpell: TfrmHunSpell;
  
implementation
{$R *.DFM}

  uses uSpell, VAUtils;

class function TfrmHunSpell.DoHanSpellCheck(AnEditControl: TCustomMemo): TModalResult;
var
  frm: TfrmHunSpell;
begin
  Result := mrCancel;
  frm:= TfrmHunSpell.create(Application);
  try
    frm.RichEdit1.Text:= AnEditControl.Text;
    frm.FSourceControl := AnEditControl;
    Result := frm.ShowModal;
  finally
    frm.Free;
  end;
end;

 {************ HighLight ***********888}
 procedure TfrmHunSpell.FormShow(Sender: TObject);
begin
 if SpellCheck1.SpellCheckState = ssNotStarted then
   SpellCheck1.CheckSpelling;
end;

{************* FormCreate **********}
procedure TfrmHunSpell.btnAddToDictionaryClick(Sender: TObject);
begin
  SpellCheck1.AddCustomWord;
end;

procedure TfrmHunSpell.btnAutoCorrectClick(Sender: TObject);
begin
   SpellCheck1.CorrectWithMyWord;
end;

procedure TfrmHunSpell.btnCancelClick(Sender: TObject);
begin
  if SpellCheck1.AbortSpellCheck(True) then
     Close;
end;

procedure TfrmHunSpell.btnChangeAllClick(Sender: TObject);
begin
  SpellCheck1.ChangeAll;
end;

procedure TfrmHunSpell.btnChangeClick(Sender: TObject);
begin
  SpellCheck1.Change;
end;

procedure TfrmHunSpell.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmHunSpell.btnIgnoreAllClick(Sender: TObject);
begin
  SpellCheck1.IgnoreAll;
end;

procedure TfrmHunSpell.btnIgnoreOnceClick(Sender: TObject);
begin
  SpellCheck1.IgnoreOnce;
end;

procedure TfrmHunSpell.btnSelectDictClick(Sender: TObject);
var
  aff: String;
begin
  if OpenDialog1.Execute then
  begin
    if SpellCheck1.DictFileName = OpenDialog1.FileName then
      exit;

    aff := ChangeFileExt(OpenDialog1.FileName, '.aff');
    if not FileExists(aff) then
    begin
      ShowMessage('Correspong AFF file named "'+ aff + '" not found!' + #13 + '  Specify dictionary file whose *.aff is also present in same directory.');
      OpenDialog1.FileName := '';
      btnSelectDictClick(self);
    end
    else
    begin
      if SpellCheck1.SpellCheckState = ssChecking then
        SpellCheck1.AbortSpellCheck(False);
      Edit1.Text := OpenDialog1.FileName;
      SpellCheck1.DictFileName := OpenDialog1.FileName;
      SpellCheck1.AffFileName := aff;
      SpellCheck1.Open;
      WaitForUser := False;
      SpellCheck1.CheckSpelling;
    end;
  end;
end;

procedure TfrmHunSpell.Edit1Enter(Sender: TObject);
begin
  btnSelectDict.SetFocus;
end;

procedure TfrmHunSpell.FormActivate(Sender: TObject);
begin
  if ( not SpellCheck1.Active) and (not NoEngineOpted) then
  begin
     btnSelectDictClick(self);
     NoEngineOpted := True;
  end;
end;

procedure TfrmHunSpell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SpellCheck1.SpellCheckState = ssCompleted then
  begin
    ShowMsg(TX_SPELL_COMPLETE, TShow508MessageIcon(1), smbOK) ;
    if Assigned(FSourceControl) then
      FSourceControl.Text := RichEdit1.Text;
  end
  else
        ShowMsg(TX_SPELL_CANCELLED + CRLF + TX_NO_CORRECTIONS,TShow508MessageIcon(1), smbOK) ;
end;

procedure TfrmHunSpell.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\dict\en-US-OpenMedSpel.dic')
    and FileExists(ExtractFilePath(Application.ExeName)+'\dict\en-US-OpenMedSpel.aff') then
  begin
    SpellCheck1.AffFileName := ExtractFilePath(Application.ExeName)+'\dict\en-US-OpenMedSpel.aff';
    SpellCheck1.DictFileName := ExtractFilePath(Application.ExeName)+'\dict\en-US-OpenMedSpel.dic';
    Edit1.Text := SpellCheck1.DictFileName;
    SpellCheck1.Active := True;
  end
  else
    Edit1.Text := 'Dictionary File for SpellCheck Engine not found!';
  SpellCheck1.SourceTextControl := RichEdit1;
  SpellCheck1.SuggestionList := lstSuggestions;
  SpellCheck1.HighlightEditControl := Edit2;
  SpellCheck1.btnClose := btnClose;
end;



end.
