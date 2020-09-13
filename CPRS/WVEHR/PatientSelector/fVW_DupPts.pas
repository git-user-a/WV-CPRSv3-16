unit fVW_DupPts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ORCtrls, ExtCtrls, OrFn, fBase508Form,
  VA508AccessibilityManager, Vcl.ComCtrls;

type
  TfrmVW_DupPts = class(TfrmBase508Form)
    pnlDupPts: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    lblSelDupPts: TLabel;
    pnlBottom: TPanel;
    lvItems: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lvItemsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setFontSize(aSize: Integer);
    procedure setItemList(aList:TStringList);
    procedure refreshColumns(aListView:TListView);
    function getSelectedID: String;
  end;

function getUniqueItem(aList:TStringList):String;

implementation

{$R *.dfm}

uses rCore, uCore, uVW_Size;

var
  frmVW_DupPts: TfrmVW_DupPts;

function getUniqueItem(aList:TStringList):String;
begin
  if not assigned(frmVW_DupPts) then
    Application.CreateForm(TfrmVW_DupPts,frmVW_DupPts);

  frmVW_DupPts.setItemList(alist);
  try
    frmVW_DupPts.setFontSize(Application.MainForm.Font.Size);

    if frmVW_DupPts.ShowModal = mrOK then
      Result := frmVW_DupPts.getSelectedID
    else
      Result := '';
  except
    frmVW_DupPts.Hide;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TfrmVW_DupPts.refreshColumns(aListView:TListView);
var
  i: Integer;
begin
  if not assigned(aListView) then
    exit;
  for i := 0 to aListView.Columns.Count - 1 do
    aListView.Columns[i].Width := -2;
  aListView.Invalidate;
  Application.ProcessMessages;
end;

procedure TfrmVW_DupPts.setItemList(aList: TSTringList);
var
  s: String;
  li: TListItem;
begin
  lvItems.Clear;
  if not assigned(aList) then
    exit;
  for s in aList do
    begin
      li := lvItems.Items.Add;
      li.Caption := piece(s,U,1);
      li.SubItems.Add(piece(s,U,2));
      li.SubItems.Add(piece(s,U,3));
      li.SubItems.Add(piece(s,U,4));
    end;
  if aList.Count > 0 then
    lvItems.ItemIndex := 0;

  refreshColumns(lvItems);
end;

function TfrmVW_DupPts.getSelectedID: String;
begin
  Result := '';
  if lvItems.ItemIndex > -1 then
    Result := lvItems.Items[lvItems.ItemIndex].Caption;
end;

procedure TfrmVW_DupPts.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOK then
    if getSelectedID = '' then
    begin
      infoBox('A patient has not been selected.', 'No Patient Selected', MB_OK);
      CanClose := False;
    end;
end;

procedure TfrmVW_DupPts.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;
end;

procedure TfrmVW_DupPts.lvItemsDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

procedure TfrmVW_DupPts.setFontSize(aSize: Integer);
begin
  self.Font.Size := aSize;
  adjustPanelDialog(pnlBottom);
  refreshColumns(lvItems);
end;

end.
