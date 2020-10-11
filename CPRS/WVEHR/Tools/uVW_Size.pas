unit uVW_Size;

interface
uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  messages,
  Comctrls,
  StdCtrls,
  Windows,
  System.UITypes,
  vcl.ExtCtrls,
  vcl.Tabs,
  Buttons;


function getMainFormTextHeight: Integer;
function getMainFormTextWidth(aText: String): Integer;

procedure adjustToolsPanel(aPanel: TPanel; aTop: Integer = 0);
procedure adjustStatusBar(aStatusBar: TStatusBar; aTop: Integer = 0);
procedure adjustToolBar(aToolBar: TToolBar; aTop: Integer = 0);
procedure adjustTabSet(aTabSet: TTabSet; aTop: Integer = 0);
procedure adjustSpeedButton(aSB: TSpeedButton);
procedure adjustToolBarPanel(aPanel: TPanel; iStart: Integer = 0);
procedure adjustCheckBox(aCB: TCheckBox);
procedure adjustPanelDialog(aPanel: TPanel);
procedure adjustBitButton(aBB: TBitBtn);
procedure adjustButton(aBtn: TButton);

implementation
const
  U = '^';
  CRLF = #13#10;

  MarginLeft = 3;
  MarginTop = 3;
  MarginBottom = 3;

function getMainFormTextHeight: Integer;
begin
  Result := Application.MainForm.Canvas.TextHeight('QWERTYU1234567890');
end;

function getMainFormTextWidth(aText: String): Integer;
begin
  Result := Application.MainForm.Canvas.TextWidth(aText);
end;

const
  MinHeight = 26;

procedure adjustToolsPanel(aPanel: TPanel; aTop: Integer = 0);
var
  i: Integer;
begin
  if aPanel = nil then
    Exit;

  i := getMainFormTextHeight + 6;
  if aTop = 0 then
    i := i + MarginTop + MarginBottom
  else
    i := i + 2 * aTop;

  if i < MinHeight then
    i := MinHeight;

  aPanel.Height := i;
  aPanel.Font.Size := Application.MainForm.Font.Size;
end;

procedure adjustTabSet(aTabSet: TTabSet; aTop: Integer = 0);
var
  i: Integer;
begin
  if aTabSet = nil then
    Exit;
  i := getMainFormTextHeight;
  if aTop = 0 then
    i := i + MarginTop + MarginBottom
  else
    i := i + 2 * aTop;

  if i < MinHeight then
    i := MinHeight;

  aTabSet.Height := i;
  aTabSet.TabHeight := i - 2;
  aTabSet.Font.Size := Application.MainForm.Font.Size;
end;

procedure adjustStatusBar(aStatusBar: TStatusBar; aTop: Integer = 0);
var
  i: Integer;
begin
  if aStatusBar = nil then
    Exit;
  i := getMainFormTextHeight;
  if aTop = 0 then
    aStatusBar.Height := i + MarginTop + MarginBottom
  else
    aStatusBar.Height := i + 2 * aTop;
  aStatusBar.Font.Size := Application.MainForm.Font.Size;
  aStatusBar.Height := aStatusBar.Height + 1;
  aStatusBar.Invalidate;
end;

procedure adjustToolBar(aToolBar: TToolBar; aTop: Integer = 0);
var
  i: Integer;
begin
  if aToolBar = nil then
    Exit;
  i := getMainFormTextHeight;

  if aTop = 0 then
    i := i + MarginTop + MarginBottom
  else
    i := i + 2 * aTop;
  if i < MinHeight then
    i := MinHeight;

  aToolBar.Font.Size := Application.MainForm.Font.Size;

  aToolBar.Height := i + 4;
  aToolBar.AutoSize := True;
  aToolBar.ButtonHeight := i;
  aToolBar.ButtonWidth := i;
  aToolBar.Invalidate;
end;

procedure adjustSpeedButton(aSB: TSpeedButton);
var
  i: Integer;
begin
  aSB.Font.Size := Application.MainForm.Font.Size;
  i := getMainFormTextWidth(aSB.Caption) + 2 * MarginLeft + 8;
  if aSB.Glyph <> nil then
    i := i + aSB.Glyph.Width;

  if i < 20 then
    i := 20;
  aSB.Width := i;

  aSB.Invalidate;
end;

procedure adjustBitButton(aBB: TBitBtn);
var
  i: Integer;
begin
  aBB.Font.Size := Application.MainForm.Font.Size;
  i := getMainFormTextWidth(aBB.Caption + 'W') + 2 * MarginLeft;
  if aBB.Glyph <> nil then
    i := i + aBB.Glyph.Width;
  aBB.Width := i;

  aBB.Invalidate;
end;

procedure adjustCheckBox(aCB: TCheckBox);
begin
  aCB.Font.Size := Application.MainForm.Font.Size;
  aCB.Width := getMainFormTextWidth(aCB.Caption + 'W') + 2 * MarginLeft;
  case aCB.Align of
    alNone: ;
    alTop: ;
    alBottom: ;
    alLeft: aCB.Left := aCB.Left + 1;
    alRight:  aCB.Left := aCB.Left - 1 ;
    alClient: ;
    alCustom: ;
  end;
  aCB.Invalidate;
end;

procedure adjustToolBarPanel(aPanel: TPanel; iStart: Integer = 0);
var
  iHeight, ii,
  iWidth, i: Integer;
begin
  adjustToolsPanel(aPanel);

  iHeight := aPanel.Height;
  iWidth := iStart;
  for i := 0 to aPanel.ControlCount - 1 do
  begin
    if aPanel.Controls[i] is TSpeedButton then
      adjustSpeedButton(TSpeedButton(aPanel.Controls[i]))
    else if aPanel.Controls[i] is TCheckBox then
      adjustCheckBox(TCheckBox(aPanel.Controls[i]))
    else if aPanel.Controls[i] is TBitBtn then
      adjustBitButton(TBitBtn(aPanel.Controls[i]))
    else if aPanel.Controls[i] is TButton then
      adjustButton(TButton(aPanel.Controls[i]))
    else if aPanel.Controls[i] is TLabel then
      begin
        ii := TButton(aPanel.Controls[i]).Height;
        if TButton(aPanel.Controls[i]).AlignWithMargins then
          ii := ii + TButton(aPanel.Controls[i]).Margins.Top +
            TButton(aPanel.Controls[i]).Margins.Bottom;
        if aPanel.Height < ii then
          aPanel.Height := ii;
      end
      ;

    iWidth := iWidth + TControl(aPanel.Controls[i]).Width;

    if TControl(aPanel.Controls[i]).AlignWithMargins then
      iWidth := iWidth + TControl(aPanel.Controls[i]).Margins.Left +
        TControl(aPanel.Controls[i]).Margins.Right;
  end;

  aPanel.Width := iWidth;
  aPanel.Invalidate;
end;

procedure adjustPanelDialog(aPanel: TPanel);
var
  iHeight: Integer;
begin
  adjustToolBarPanel(aPanel);
  iHeight := getMainFormTextHeight + 8;
  if iHeight < MinHeight then
    iHeight := MinHeight;


  iHeight := iHeight + (MarginTop + MarginBottom) * 2;
  aPanel.Height := iHeight;
end;


procedure adjustButton(aBtn: TButton);
var
  i: Integer;
begin
  aBtn.Font.Size := Application.MainForm.Font.Size;
  i := getMainFormTextWidth(aBtn.Caption + 'W') + 2 * MarginLeft;
  aBtn.Width := i;

  aBtn.Invalidate;
end;

end.
