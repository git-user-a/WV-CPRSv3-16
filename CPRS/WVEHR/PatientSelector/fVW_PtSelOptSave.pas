unit fVW_PtSelOptSave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ORCtrls, ORFn, fBase508Form, VA508AccessibilityManager;

type
  TfrmVW_PtSelOptSave = class(TfrmBase508Form)
    pnlClinSave: TPanel;
    rGrpClinSave: TKeyClickRadioGroup;
    lblClinSettings: TMemo;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure rGrpClinSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function getSaveChoice(aComment: String): Integer;

implementation

{$R *.DFM}

uses
  rCore;

var
  frmPtSelOptSave: TfrmVW_PtSelOptSave;

function getSaveChoice(aComment: String): Integer;
var
  frm: TfrmVW_PtSelOptSave;
begin
  REsult := -1;
  Application.CreateForm(TfrmVW_PtSelOptSave, frm);
  try
    frm.lblClinSettings.text := 'Save ' + aComment + CRLF +
      ' defaults as follows?';
    if frm.ShowModal = mrOK then
      Result := frm.rGrpClinSave.ItemIndex;
  finally
    frm.Free;
  end;
end;

procedure TfrmVW_PtSelOptSave.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := (ModalResult = mrCancel) or
    ((rGrpClinSave.ItemIndex > -1) and (rGrpClinSave.ItemIndex < 2))
end;

procedure TfrmVW_PtSelOptSave.FormCreate(Sender: TObject);
begin
  ResizeAnchoredFormToFont(self);
  rGrpClinSave.ItemIndex := -1;
  btnOK.Enabled := False;
end;

procedure TfrmVW_PtSelOptSave.rGrpClinSaveClick(Sender: TObject);
begin
  btnOK.Enabled := rGrpClinSave.ItemIndex >= 0;
end;

end.
