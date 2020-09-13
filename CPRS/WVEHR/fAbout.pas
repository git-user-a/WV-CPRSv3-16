unit fAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, VA508AccessibilityManager, fBase508Form, Vcl.AppEvnts;

type
  TfrmAbout = class(TfrmBase508Form)
    cmdOK: TButton;
    lblProductName: TStaticText;
    lblCompanyName: TStaticText;
    lblComments: TStaticText;
    lblCRC: TStaticText;
    lblFileDescription: TStaticText;
    lblInternalName: TStaticText;
    lblOriginalFileName: TStaticText;
    pnlButton: TPanel;
    pnlBackground: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlImage: TPanel;
    Image1: TImage;
    lblCopyright: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fMode: String;
    fHeight: Integer;
    procedure setMode(aMode: String);
  public
    { Public declarations }
    property Mode: String read fMode write setMode;
  end;

procedure ShowAbout;
procedure SplashAbout;
procedure SplashHide;

implementation

{$R *.DFM}

uses
  ORSystem, ORFn, VAUtils // ICD-10 Remediation
  ;

var
  frmAbout: TfrmAbout;

procedure SplashHide;
begin
  if assigned(frmAbout) then
    frmAbout.Hide;
  Application.ProcessMessages;
end;

procedure SplashAbout;

begin
  if not assigned(frmAbout) then
    frmAbout := TfrmAbout.Create(Application); // show splash screen
  with frmAbout do
  begin
    Mode := 'SPLASH';
    Show;
    Refresh;
  end;
end;

procedure ShowAbout;
begin
  if not assigned(frmAbout) then
    frmAbout := TfrmAbout.Create(Application);
  try
    with frmAbout do
    begin
      Mode := 'ABOUT';
      ShowModal;
    end;
  finally
    frmAbout.Hide;
  end;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  inherited;
  lblCompanyName.Caption := { 'Developed by the ' + } FileVersionValue
    (Application.ExeName, FILE_VER_COMPANYNAME);
  lblFileDescription.Caption := { 'Compiled: ' + } FileVersionValue
    (Application.ExeName, FILE_VER_FILEDESCRIPTION); // date
  // lblFileVersion.Caption        := FileVersionValue(Application.ExeName, FILE_VER_FILEVERSION);
  lblInternalName.Caption := FileVersionValue(Application.ExeName,
    FILE_VER_INTERNALNAME);
  lblCopyright.Caption := FileVersionValue(Application.ExeName,
    FILE_VER_LEGALCOPYRIGHT);
  lblOriginalFileName.Caption := FileVersionValue(Application.ExeName,
    FILE_VER_ORIGINALFILENAME); // patch
  lblProductName.Caption := FileVersionValue(Application.ExeName,
    FILE_VER_PRODUCTNAME);
  lblComments.Caption := FileVersionValue(Application.ExeName,
    FILE_VER_COMMENTS); // Delphi version comment
  lblComments.Caption := 'Delphi Compiler Version ' + FloatToStr(CompilerVersion);


  lblCRC.Caption := 'CRC: ' + IntToHex(CRCForFile(Application.ExeName), 8);

{$IFDEF DEBUG}
  pnlButton.ShowCaption := True;
{$ENDIF}
  fHeight := Height;
end;

procedure TfrmAbout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

function getTitleHeight(aForm: TForm): Integer;
var
  P: TPoint;
  R: TRect;
begin
  P.X := 0;
  P.Y := 0;
  P := aForm.ClientToScreen(P);
  getWindowRect(aForm.Handle, R);
  Result := P.Y - R.Location.Y;
end;

procedure TfrmAbout.setMode(aMode: string);
begin
  if aMode <> fMode then
  begin
    fMode := aMode;
    if fMode = 'SPLASH' then
    begin
      Height := fHeight - pnlButton.Height;
      BorderStyle := bsNone;
    end
    else
    begin
      Height := fHeight;
      BorderStyle := bsSingle;
    end;
    pnlButton.Visible := fMode <> 'SPLASH';
  end;
end;

end.

