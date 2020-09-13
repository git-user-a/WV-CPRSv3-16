unit fGN_RPCLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DateUtils, ORNet, ORFn, System.UITypes
{$IFDEF STANDALONE}
{$ELSE}
    , rMisc, fBase508Form
{$ENDIF}
    , ComCtrls, Buttons, ExtCtrls,
  ORCtrls, ORSystem,
  VA508AccessibilityManager, VAUtils,
  Winapi.RichEdit, Vcl.Menus, Vcl.ImgList, Vcl.ToolWin
  , System.ImageList, System.Actions, Vcl.ActnList,
  Vcl.StdActns,
  Vcl.Tabs, Vcl.DockTabSet, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls
    ;

const
  UM_REFRESH_RPC = WM_APP + 1;

type
  TRPCResult = class(TObject)
  public
    RPCName: String;
    RPCResults: TStringList;
    constructor newRPCResult(aName: String; aResult: TStrings);
    destructor Destroy; override;
  end;

  TfrmRPCLog = class(TForm)
    c: TImageList;
    alLog: TActionList;
    ilWindow: TImageList;
    alWindow: TActionList;
    acAdvTools: TAction;
    acRealTime: TAction;
    acPrev: TAction;
    acNext: TAction;
    acAlignLeft: TAction;
    acAlignRight: TAction;
    acUndock: TAction;
    acFlag: TAction;
    bvlTop: TBevel;
    acClose: TAction;
    acSearch: TAction;
    acTestTime: TAction;
    acOneNext: TAction;
    acOnePrev: TAction;
    EditCopy1: TEditCopy;
    Panel3: TPanel;
    Panel4: TPanel;
    ToolBar5: TToolBar;
    ToolButton3: TToolButton;
    ToolBar6: TToolBar;
    lvRPCLog: TListView;
    MainMenu: TMainMenu;
    MenuItem3: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    Close2: TMenuItem;
    File1: TMenuItem;
    N5: TMenuItem;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Panel1: TPanel;
    Flag2: TMenuItem;
    Label2: TLabel;
    edTarget: TComboBox;
    pnlMain: TPanel;
    memData: TRichEdit;
    Panel2: TPanel;
    lblCallID: TStaticText;
    pnlMainToolbar: TPanel;
    Label1: TLabel;
    ToolBar4: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    cmbMaxCalls: TComboBox;
    splDebug: TSplitter;
    sb: TStatusBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    acSelectAll: TAction;
    ToolButton5: TToolButton;
    SelectAll2: TMenuItem;
    FileSaveAs1: TFileSaveAs;
    ToolButton1: TToolButton;
    acSymbolTable: TAction;
    ToolButton6: TToolButton;
    SymbolTable1: TMenuItem;
    acSaveOnExit: TAction;
    FileOpen1: TFileOpen;
    Open1: TMenuItem;
    N1: TMenuItem;
    FileExit1: TFileExit;
    FileSaveAs2: TFileSaveAs;
    SaveAllAs1: TMenuItem;
    Options1: TMenuItem;
    SaveLogOnExit1: TMenuItem;
    acTrackForms: TAction;
    rackForms1: TMenuItem;
    ToolButton7: TToolButton;
    acClearLog: TAction;
    Clear1: TMenuItem;
    ToolButton8: TToolButton;
    acAddWatch: TAction;
    ToolButton9: TToolButton;
    acToTheLeft: TAction;
    acNoAlign: TAction;
    ToolBar1: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    acToTheRight: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    N2: TMenuItem;
    AlignLeft1: TMenuItem;
    AlignRight1: TMenuItem;
    NoAlignment1: TMenuItem;
    ckbWrap: TCheckBox;
    acWordWrap: TAction;
    N3: TMenuItem;
    WordWrap1: TMenuItem;
    dbg: TDBGrid;
    cds: TClientDataSet;
    ds: TDataSource;
    Splitter1: TSplitter;
    DBNavigator1: TDBNavigator;
    acTest: TAction;
    procedure cmdPrevClick(Sender: TObject);
    procedure cmdNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRLTClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchTermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
    procedure sbFlagClick(Sender: TObject);
    procedure LiveListAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure acCloseExecute(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure acOnePrevExecute(Sender: TObject);
    procedure acOneNextExecute(Sender: TObject);
    procedure acTestTimeExecute(Sender: TObject);
    procedure acSearchExecute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure lvRPCLogSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cmbMaxCallsSelect(Sender: TObject);
    procedure edTargetSelect(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure lvRPCLogChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormShow(Sender: TObject);
    procedure acSelectAllExecute(Sender: TObject);
    procedure lvRPCLogResize(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure lvRPCLogDblClick(Sender: TObject);
    procedure acSymbolTableExecute(Sender: TObject);
    procedure acSaveOnExitExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs2Accept(Sender: TObject);
    procedure acTrackFormsExecute(Sender: TObject);
    procedure acClearLogExecute(Sender: TObject);
    procedure tsChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure acToTheLeftExecute(Sender: TObject);
    procedure acNoAlignExecute(Sender: TObject);
    procedure acToTheRightExecute(Sender: TObject);
    procedure acWordWrapExecute(Sender: TObject);
    procedure lvRPCLogColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvRPCLogCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDblClick(Sender: TObject);
    procedure pnlMainToolbarClick(Sender: TObject);
    procedure acTestExecute(Sender: TObject);
  private
    { Private declarations }
    _Ignore: Boolean;
    _LogSize: Integer;
{$IFDEF WATCHLIST}
    _WatchList: TList;
    _WatchNames: TStringList;
{$ENDIF}
    ColumnToSort: Integer;
    SortDirection: Integer;
    procedure HighlightRichEdit(StartChar, EndChar: Integer;
      HighLightColor: TColor; Flag: Integer = SCF_SELECTION);
    procedure OnRefreshRPCRequest();
    procedure RealTime;
    procedure doSearch;
    procedure LoadRPCResults(anItem: Integer);
    procedure PaintEditByTarget(aSearchTarget: String;
      aColor: TColor = clYellow);
    procedure setLogLength(aCount: Integer);
    procedure setActionStatus;
    procedure doSaveAs(aFileName: String; CurrentOnly: Boolean = true);
    procedure doLoadFromFile(aFileName: String);
    procedure AddFlag(aFlag: String; aComment: String = '');
    procedure SearchTarget(aTarget: String);
    procedure PositionReport;
    procedure addToLog(aLV: TListView; aName, aSecondName: string;
      aValue: TStrings);
    procedure AlignBroker(aStyle: TAlign);

  public
    { Public declarations }
    procedure addLogItem(aName, aSecondName: string; aValue: TStrings);
    procedure doPrev;
    procedure doNext;
    procedure SaveAll;
    procedure ClearLog;
    procedure ClearWatchList;
    procedure enforceLimit(aLimit: Integer);
    procedure setFontSize(aSize: Integer);
  end;

var
  frmRPCLog: TfrmRPCLog;

implementation

uses
  Clipbrd,
  uGN_RPCLog;
{$R *.DFM}

const
  fnType = 'cdsType';
  fnName = 'cdsName';
  fnDuration = 'cdsDuration';
  fnStart = 'cdsStart';
  fnObject = 'cdsObject';

const
  RpcLogPart = 3;

constructor TRPCResult.newRPCResult(aName: String; aResult: TStrings);
begin
  RPCResults := TStringList.Create;
  RPCResults.Assign(aResult);
end;

destructor TRPCResult.Destroy;
begin
  RPCResults.Free;
  Inherited;
end;

/// /////////////////////////////////////////////////////////////////////////////

procedure TfrmRPCLog.cmdPrevClick(Sender: TObject);
begin
  doPrev;
end;

procedure TfrmRPCLog.dbgDblClick(Sender: TObject);
begin
  try
    edTarget.Text := trim(cds.FieldByName(fnName).AsString);
    btnSearchClick(Self);
  except
  end;
end;

procedure TfrmRPCLog.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  sTarget: String;
  cds: TClientDataSet;
  colorBG, colorFont: TColor;

  function IsTextFound(aTarget, aString: String;
    bCase: Boolean = False): Boolean;
  begin
    if bCase then
      Result := pos(UpperCase(aTarget), UpperCase(aString)) > 0
    else
      Result := pos(aTarget, aString) > 0;
  end;

  function IsFound(aTarget: String): Boolean;
  var
    sl: TStrings;
    i: Integer;
  begin
    Result := False;
    i := cds.FieldByName(fnObject).AsLargeInt;
    if i <> 0 then
    begin
      sl := TStrings(i);
      Result := IsTextFound(aTarget, sl.Text);
    end;
  end;

begin
  colorBG := clCream;
  colorFont := clWindowText;

  cds := TClientDataSet(TDBGrid(Sender).DataSource.DataSet);

  sTarget := edTarget.Text;
  if sTarget <> '' then
  begin
    if IsFound(sTarget) or IsTextFound(sTarget, cds.FieldByName(fnName).AsString)
    then
    begin
      colorBG := clYellow;
      colorFont := clRed;
    end;
  end;

  with Sender as TDBGrid do
  begin
    if not((gdFocused in State) or (gdSelected in State)) then
    begin
      Canvas.Brush.Color := colorBG;
      Canvas.Font.Color := colorFont;
    end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmRPCLog.tsChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  lvRPCLog.Visible := NewTab = 0;
end;

procedure TfrmRPCLog.doNext;
begin
  if lvRPCLog.ItemIndex > 0 then
    lvRPCLog.ItemIndex := lvRPCLog.ItemIndex - 1;
  if lvRPCLog.ItemIndex >= 0 then
    lvRPCLog.Selected := lvRPCLog.Items[lvRPCLog.ItemIndex];
  lvRPCLog.Repaint;
  setActionStatus;
end;

procedure TfrmRPCLog.cmbMaxCallsSelect(Sender: TObject);
begin
  inherited;
  setLogLength(StrToIntDef(cmbMaxCalls.Text, _LogSize));
  PositionReport;
end;

procedure TfrmRPCLog.cmdNextClick(Sender: TObject);
begin
  doNext;
end;

procedure TfrmRPCLog.doPrev;
begin
  if lvRPCLog.ItemIndex < lvRPCLog.Items.Count - 1 then
    lvRPCLog.ItemIndex := lvRPCLog.ItemIndex + 1;

  if lvRPCLog.ItemIndex <= lvRPCLog.Items.Count - 1 then
    lvRPCLog.Selected := lvRPCLog.Items[lvRPCLog.ItemIndex];
  lvRPCLog.Repaint;
  setActionStatus;
end;

procedure TfrmRPCLog.cmdOKClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRPCLog.FileOpen1Accept(Sender: TObject);
begin
  AddFlag(RPCLog_Import, FileOpen1.Dialog.FileName);
  doLoadFromFile(FileOpen1.Dialog.FileName);
end;

procedure TfrmRPCLog.FileSaveAs1Accept(Sender: TObject);
begin
  inherited;
  doSaveAs(FileSaveAs1.Dialog.FileName);
end;

procedure TfrmRPCLog.FileSaveAs1BeforeExecute(Sender: TObject);
begin
  inherited;
  With FileSaveAs1 do
    Dialog.FileName := FormatDateTime('YYYY_MM_DD_HHNNSSS_', Now) + 'RPCLog';
end;

procedure TfrmRPCLog.FileSaveAs2Accept(Sender: TObject);
begin
  doSaveAs(FileSaveAs2.Dialog.FileName, False);
end;

procedure TfrmRPCLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Hide;
end;

procedure TfrmRPCLog.FormResize(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmRPCLog.FormShow(Sender: TObject);
begin
  inherited;
  setFontSize(Application.MainForm.Font.Size);
end;

procedure TfrmRPCLog.setFontSize(aSize: Integer);
begin
  Font.Size := aSize;
  memData.Font.Size := aSize;
end;

procedure TfrmRPCLog.FormStartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
  inherited;
  DragObject := TDragDockObjectEx.Create(Self);
  DragObject.Brush.Color := clAqua; // this will display a red outline
end;

procedure TfrmRPCLog.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  _Ignore := true;
  while i < RetainedRPCCount do
  begin
    LoadRPCResults(i);
    inc(i);
  end;
  _LogSize := ORNet.GetRPCMax;
{$IFDEF DEBUG}
  if _LogSize < 500 then
    _LogSize := 500;
{$ENDIF}
  cmbMaxCalls.Text := IntToStr(_LogSize);
  setAfterRPCEvent(OnRefreshRPCRequest);
  _Ignore := False;

  cmbMaxCalls.SelStart := 0;
  cmbMaxCalls.SelLength := 0;
{$IFDEF DEBUG}
  FileSaveAs1.Visible := true;
  Options1.Visible := true;
  FileOpen1.Visible := true;
{$ELSE}
  FileSaveAs1.Visible := RPCLog_SaveAvailable;
  Options1.Visible := RPCLog_SaveAvailable;
  FileOpen1.Visible := RPCLog_SaveAvailable;
{$ENDIF}
{$IFDEF STANDALONE}
  FileOpen1.Visible := true;
  acTestTime.Visible := False;
  acSymbolTable.Visible := False;
{$ENDIF}
{$IFDEF WATCHLIST}
  _WatchNames := TStringList.Create;
  _WatchList := TList.Create;
{$ENDIF}
  RPCLog_TrackForms := acTrackForms.Checked;

  Constraints.MinWidth := Screen.Width div 3;
end;

procedure TfrmRPCLog.ClearLog;
begin
  _Ignore := true;
  lvRPCLog.Items.BeginUpdate;
  while lvRPCLog.Items.Count > 0 do
  begin
    if Assigned(lvRPCLog.Items[0].Data) then
      TStringList(lvRPCLog.Items[0].Data).Free;
    lvRPCLog.Items.Delete(0);
  end;
  lvRPCLog.ItemIndex := -1;
  lvRPCLog.Items.EndUpdate;
  _Ignore := False;
end;

procedure TfrmRPCLog.ClearWatchList;
begin
{$IFDEF WATCHLIST}
  while _WatchList.Count > 0 do
  begin
    if Assigned(_WatchList[0]) then
    begin
      TRPCResult(_WatchList[0]).Free;
      _WatchList.Delete(0);
    end;
  end;
{$ENDIF}
end;

procedure TfrmRPCLog.FormDestroy(Sender: TObject);
begin
  ClearLog;
  setAfterRPCEvent(nil);
  ClearWatchList;
{$IFDEF WATCHLIST}
  _WatchNames.Free;
  _WatchList.Free;
{$ENDIF}
end;

procedure TfrmRPCLog.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Key := 0;
    Close;
  end
  else if (Key = VK_F1) and (ssCtrl in Shift) then
  begin
    Key := 0;
    Application.MainForm.SetFocus;
  end;
end;

procedure TfrmRPCLog.HighlightRichEdit(StartChar, EndChar: Integer;
  HighLightColor: TColor; Flag: Integer = SCF_SELECTION);
var
  Format: CHARFORMAT2;
begin
  memData.SelStart := StartChar;
  memData.SelLength := EndChar;
  // Set the background color
  FillChar(Format, SizeOf(Format), 0);
  Format.cbSize := SizeOf(Format);
  Format.dwMask := CFM_BACKCOLOR;
  Format.crBackColor := HighLightColor;
  memData.Perform(EM_SETCHARFORMAT, Flag, Longint(@Format));
end;

procedure TfrmRPCLog.LiveListAdvancedCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
begin
  if (pos(RPCLog_OnActivate, Item.SubItems[0]) = 1) or
    (pos(RPCLog_OnDeActivate, Item.SubItems[0]) = 1) or
    (pos(RPCLog_OnClose, Item.SubItems[0]) = 1) or
    (pos(RPCLog_OnHide, Item.SubItems[0]) = 1) or
    (pos(RPCLog_OnCreate, Item.SubItems[0]) = 1) or
    (pos(RPCLog_OnDestroy, Item.SubItems[0]) = 1) then
  begin
    Sender.Canvas.Font.Color := RPCLog_clFlag;
    Sender.Canvas.Brush.Color := RPCLog_bgclFlag;
    Sender.Canvas.Font.Style := [];
  end
  else if pos(RPCLog_Flag, Item.SubItems[0]) > 0 then
  begin
    Sender.Canvas.Font.Color := RPCLog_clFlag;
    Sender.Canvas.Brush.Color := RPCLog_bgclItem;
    Sender.Canvas.Font.Style := [];
  end
  else if pos(UpperCase(edTarget.Text), UpperCase(TStringList(Item.Data).Text)
    ) > 0 then
  begin
    Sender.Canvas.Font.Color := RPCLog_clTarget;
    Sender.Canvas.Brush.Color := RPCLog_bgclTarget;
    Sender.Canvas.Font.Style := [];
  end
  else if Item.Caption = '1' then
  begin
    Sender.Canvas.Font.Color := clRed;
    Sender.Canvas.Brush.Color := clYellow;
    Sender.Canvas.Font.Style := [fsbold];
  end
  else
  begin
    Sender.Canvas.Font.Color := clWindowText;
    Sender.Canvas.Brush.Color := clCream; // clWindow;
    Sender.Canvas.Font.Style := [];
  end;
end;

procedure TfrmRPCLog.lvRPCLogChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  inherited;
  if _Ignore then
    Exit;
  PositionReport;
end;

procedure TfrmRPCLog.lvRPCLogColumnClick(Sender: TObject; Column: TListColumn);
begin
  if ColumnToSort = Column.Index then
    SortDirection := -SortDirection
  else
    SortDirection := 1;

  ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfrmRPCLog.lvRPCLogCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  begin
    ix := ColumnToSort - 1;
    Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
  end;
  if SortDirection < 0 then
    Compare := -Compare;
end;

procedure TfrmRPCLog.PositionReport;
begin
  // if Assigned(lvRPCLog) then
  // sb.SimpleText := Format('Total records: %d  Current record: %d',
  // [lvRPCLog.Items.Count, lvRPCLog.ItemIndex]);
  sb.SimpleText := Format('Total records: %d  Current record: %d',
    [cds.RecordCount, cds.RecNo]);
end;

procedure TfrmRPCLog.lvRPCLogDblClick(Sender: TObject);
begin
  inherited;
  if lvRPCLog.ItemIndex >= 0 then
  begin
    edTarget.Text := trim(lvRPCLog.Items[lvRPCLog.ItemIndex].Caption);
    btnSearchClick(Self);
  end;
end;

procedure TfrmRPCLog.lvRPCLogResize(Sender: TObject);
var
  lv: TListView;
const
  _ScrollBar = 26;
begin
  inherited;
  lv := TListView(Sender);
  case lv.Columns.Count of
    0:
      Exit;
    1:
      lv.Columns.Items[0].Width := lv.Width - _ScrollBar;
    2:
      lv.Columns.Items[1].Width := lv.Width - _ScrollBar;
  end;
  // should be calculated by metrix
end;

procedure TfrmRPCLog.lvRPCLogSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  lv: TListView;
begin
  inherited;
  lv := TListView(Sender);
  if not lv.Visible then
    Exit;

  if Assigned(Item.Data) then
  begin
    memData.Lines.Text := TStringList(Item.Data).Text;
    if edTarget.Text <> '' then
      PaintEditByTarget(edTarget.Text);
  end;
  // the last RPC call # might be incorrect as not only RPC are inluded

  if lv.ItemIndex < 0 then
    lblCallID.Visible := False
  else
  begin
    lblCallID.Visible := true;
    if lv.ItemIndex = 0 then
      lblCallID.Caption := 'Last Record'
    else
      lblCallID.Caption := 'Last Record minus ' + IntToStr(lv.ItemIndex);
  end;
  setActionStatus;
end;

procedure TfrmRPCLog.acClearLogExecute(Sender: TObject);
begin
  if MessageDlg('Erase Log?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ClearLog;
    AddFlag('Log Erased by User Request');
  end;
end;

procedure TfrmRPCLog.acCloseExecute(Sender: TObject);
begin
  inherited;
  Close
end;

procedure TfrmRPCLog.acOneNextExecute(Sender: TObject);
begin
  inherited;
  doNext;
end;

procedure TfrmRPCLog.acOnePrevExecute(Sender: TObject);
begin
  inherited;
  doPrev;
end;

procedure TfrmRPCLog.acSaveOnExitExecute(Sender: TObject);
begin
  inherited;
  RPCLog_SaveOnExit := not RPCLog_SaveOnExit;
  acSaveOnExit.Checked := RPCLog_SaveOnExit;
end;

procedure TfrmRPCLog.acSearchExecute(Sender: TObject);
begin
  inherited;
  doSearch;
end;

procedure TfrmRPCLog.acSelectAllExecute(Sender: TObject);
begin
  inherited;
  try
    if memData.CanFocus then
      memData.SetFocus;
    memData.SelectAll;
  except
  end;
end;

procedure TfrmRPCLog.acSymbolTableExecute(Sender: TObject);
{$IFDEF STANDALONE}
begin
{$ELSE}
var
  sl: TStringList;
begin
  inherited;
  sl := TStringList.Create;
  ListSymbolTable(sl);
  addLogItem('Symbol Table', 'Symbol Table', sl);
{$ENDIF}
end;

procedure TfrmRPCLog.acTestExecute(Sender: TObject);
begin
  memData.Lines.Add(Format('Left %d  Top %d Width %d Height %d',
    [Self.Left, Self.Top, Self.Width, Self.Height]));
end;

procedure TfrmRPCLog.acTestTimeExecute(Sender: TObject);
begin
  inherited;
  RealTime;
end;

procedure TfrmRPCLog.acNoAlignExecute(Sender: TObject);
begin
  AlignBroker(alNone);
end;

procedure TfrmRPCLog.acToTheLeftExecute(Sender: TObject);
begin
  AlignBroker(alLeft);
end;

procedure TfrmRPCLog.acToTheRightExecute(Sender: TObject);
begin
  AlignBroker(alRight);
end;

procedure TfrmRPCLog.acTrackFormsExecute(Sender: TObject);
begin
  RPCLog_TrackForms := not RPCLog_TrackForms;
  acTrackForms.Checked := RPCLog_TrackForms;
end;

procedure TfrmRPCLog.acWordWrapExecute(Sender: TObject);
begin
  acWordWrap.Checked := not acWordWrap.Checked;
  memData.WordWrap := acWordWrap.Checked;
  if acWordWrap.Checked then
    memData.ScrollBars := ssVertical
  else
    memData.ScrollBars := ssBoth;
end;

procedure TfrmRPCLog.btnRLTClick(Sender: TObject);
begin
  RealTime;
end;

procedure TfrmRPCLog.RealTime;
{$IFDEF STANDALONE}
begin
{$ELSE}
var
  startTime, endTime: TDateTime;
  clientVer, serverVer, diffDisplay: string;
  theDiff: Integer;
  s: String;
  sl: TStringList;
const
  TX_OPTION = 'OR CPRS GUI CHART';
  disclaimer = 'NOTE: Strictly relative indicator';
begin
  clientVer := clientVersion(Application.ExeName); // Obtain before starting.
  // Check time lapse between a standard RPC call:
  startTime := Now;
  serverVer := serverVersion(TX_OPTION, clientVer);
  endTime := Now;
  theDiff := milliSecondsBetween(endTime, startTime);
  diffDisplay := IntToStr(theDiff);

  // Show the results:
  s := 'Lapsed time (milliseconds) = ' + diffDisplay + '.';
  infoBox(s, disclaimer, MB_OK);

  sl := TStringList.Create;
  sl.Add(s);
  sl.Add(disclaimer);

  addLogItem('Reat Time', 'Real Time', sl); // don't free sl
{$ENDIF}
end;

procedure TfrmRPCLog.btnSearchClick(Sender: TObject);
begin
  doSearch;
end;

procedure TfrmRPCLog.doSearch;
begin
  lvRPCLog.Repaint;
  dbg.Repaint;
end;

procedure TfrmRPCLog.dsDataChange(Sender: TObject; Field: TField);
var
  i: Longint;
begin
  try
    i := cds.FieldByName(fnObject).AsLargeInt;
    if i <> 0 then
      memData.Lines.Assign(TStrings(i));
    SearchTarget(edTarget.Text);
    dbg.Invalidate;
    Application.ProcessMessages;
  except
    on E: Exception do
      ShowMessage(E.Message);

  end;
  PositionReport;
end;

procedure TfrmRPCLog.EditCopy1Execute(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := memData.Text;
end;

procedure TfrmRPCLog.edTargetSelect(Sender: TObject);
begin
  inherited;
  SearchTarget(edTarget.Text);
end;

procedure TfrmRPCLog.SearchTermKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    SearchTarget(edTarget.Text);
    Key := 0;
  end;
end;

procedure TfrmRPCLog.SearchTarget(aTarget: string);
begin
  begin
    HighlightRichEdit(1, Length(memData.Text), clWhite);
    btnSearchClick(Self);
    lvRPCLog.Repaint;
    dbg.Repaint;

    if aTarget <> '' then
      if edTarget.Items.IndexOf(aTarget) < 0 then
        edTarget.Items.Add(aTarget);

    if edTarget.Text <> '' then
      PaintEditByTarget(edTarget.Text);
  end;
end;

procedure TfrmRPCLog.sbFlagClick(Sender: TObject);
begin
  AddFlag(RPCLog_Flag);
end;

procedure TfrmRPCLog.AddFlag(aFlag: String; aComment: String = '');
var
  sl: TStringList;
begin
  // flag by date
  sl := TStringList.Create;
  sl.Add(FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', Now));
  sl.Add(aComment);
  addLogItem(RPCLog_Flag, aFlag, sl);
end;

procedure TfrmRPCLog.OnRefreshRPCRequest();
begin
  if Assigned(frmRPCLog) then
  // at this time the latest record in the uCallList should contain the description of the last call
  begin
    LoadRPCResults(RetainedRPCCount - 1);
    enforceLimit(_LogSize);
  end;
end;

procedure TfrmRPCLog.LoadRPCResults(anItem: Integer);
var
  sl: TStringList;
  sName: String;
begin
  sl := TStringList.Create;
  LoadRPCData(sl, anItem);
  if sl.Count > 0 then
    sName := trim(piece(sl[0], '(', 1))
  else
    sName := 'Error....';

  addLogItem(sName, sName, sl);
end;

procedure TfrmRPCLog.PaintEditByTarget(aSearchTarget: String;
  aColor: TColor = clYellow);
var
  CharPos, CharPos2: Integer;
begin
  CharPos := 0;
  repeat
    // find the text and save the position
    CharPos2 := memData.FindText(aSearchTarget, CharPos,
      Length(memData.Text), []);
    CharPos := CharPos2 + 1;
    if CharPos = 0 then
      break;

    HighlightRichEdit(CharPos2, Length(aSearchTarget), aColor);

  until CharPos = 0;
end;

procedure TfrmRPCLog.Panel2DblClick(Sender: TObject);
begin
  inherited;
  HighlightRichEdit(1, Length(memData.Text), clWhite);
end;

procedure TfrmRPCLog.pnlMainToolbarClick(Sender: TObject);
begin
  acTest.Execute;
end;

procedure TfrmRPCLog.addToLog(aLV: TListView; aName, aSecondName: string;
  aValue: TStrings);
var
  sType, sDuration, sName: String;
  sStart: string;

  function getValue(aTarget: String): String;
  var
    s: String;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    sl.Text := aValue.Text;
    for s in sl do
    begin
      if pos(aTarget, s) = 1 then
      begin
        Result := copy(s, Length(aTarget) + 1, Length(s));
        break;
      end;
    end;

    if (aTarget = 'Ran at:') and (Result = '') then
      Result := FormatDateTime('hh:nn:ss.zzz a/p', Now);
    sl.Free;
  end;

  procedure addCDS;
  begin
    try
      cds.Insert;
      cds.FieldByName(fnType).AsString := sType;
      cds.FieldByName(fnName).AsString := sName; // aSecondName;
      cds.FieldByName(fnDuration).AsString := sDuration;
      cds.FieldByName(fnStart).AsString := sStart;
      cds.FieldByName(fnObject).AsInteger := Longint(aValue);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;

begin
  if not Assigned(aLV) then
    Exit;
  sType := piece(aSecondName, ' ', 1);
  if pos('--', sType) <> 1 then
    sType := '';

  sName := copy(aSecondName, Length(trim(sType)) + 1, Length(aSecondName));
  sDuration := getValue('Run time:');
  if sDuration = '' then
    sType := '*';
  sStart := getValue('Ran at:');

  with aLV.Items.Insert(0) do
  begin
    Caption := aName;
    Data := aValue;

    SubItems.Add(aSecondName);
    SubItems.Add(sDuration);
    SubItems.Add(sStart);
  end;
  aLV.ItemIndex := 0;

  addCDS;
end;

procedure TfrmRPCLog.addLogItem(aName, aSecondName: string; aValue: TStrings);
begin
  addToLog(lvRPCLog, aName, aSecondName, aValue);
end;

procedure TfrmRPCLog.enforceLimit(aLimit: Integer);
begin
  while lvRPCLog.Items.Count > aLimit do
  begin
    TStringList(lvRPCLog.Items[lvRPCLog.Items.Count - 1].Data).Free;
    lvRPCLog.Items.Delete(lvRPCLog.Items.Count - 1);
  end;
end;

procedure TfrmRPCLog.setLogLength(aCount: Integer);
var
  iCurrent: Integer;
begin
  iCurrent := _LogSize;
  if aCount < lvRPCLog.Items.Count then
  begin
    if infoBox
      ('The new size is less than the current number of records in the Log' +
      CRLF + 'Extra records will be discarded' + CRLF + CRLF +
      'Press "OK" to continue or "Cancel" to keep the current size',
      'Confirmation required', MB_OKCANCEL) <> IDOK then
      Exit
    else
    begin
      enforceLimit(aCount);
      iCurrent := aCount;
    end;
  end
  else
    iCurrent := aCount;

  _LogSize := iCurrent;
  SetRetainedRPCMax(_LogSize);
  setActionStatus;
end;

procedure TfrmRPCLog.setActionStatus;
begin
  if _Ignore then
    Exit;
  if not Assigned(lvRPCLog) then
    Exit;
  acOnePrev.Enabled := (lvRPCLog.ItemIndex < lvRPCLog.Items.Count - 1);
  acOneNext.Enabled := (lvRPCLog.ItemIndex > 0);
  acClearLog.Enabled := (lvRPCLog.Items.Count > 0);
end;

procedure TfrmRPCLog.doSaveAs(aFileName: string; CurrentOnly: Boolean = true);
var
  i: Integer;
  txt: String;
begin
  txt := '';
  if CurrentOnly then
  begin
    if lvRPCLog.ItemIndex <> -1 then
      txt := CRLF + CRLF + TStringList(lvRPCLog.Items[lvRPCLog.ItemIndex]
        .Data).Text;
  end
  else
    for i := lvRPCLog.Items.Count - 1 downto 0 do
      txt := txt + CRLF +
      // RPCLog_ItemBegin + RPCLog_ItemExport + lvRPCLog.Items[i].Caption + RPCLog_ItemEnd +
        RPCLog_ItemBegin + RPCLog_ItemExport + lvRPCLog.Items[i].SubItems[0] +
        RPCLog_ItemEnd + CRLF + TStringList(lvRPCLog.Items[i].Data).Text;

  if trim(txt) <> '' then
    with TStringList.Create do
    begin
      Text := RPCLog_ItemBegin + RPCLog_Title + RPCLog_ItemEnd +
        FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + CRLF + Application.ExeName
        + ' (' + FileVersionValue(Application.ExeName, FILE_VER_FILEVERSION) +
        ')' + CRLF + txt;
      try
        SaveToFile(aFileName);
      except
        on E: Exception do
          ShowMessage('RPCLog error:' + CRLF + CRLF + E.Message);
      end;
      Free;
    end;
end;

procedure TfrmRPCLog.SaveAll;
begin
  if acSaveOnExit.Checked then
    doSaveAs(RPCLogDefaultFileName, False);
end;

procedure TfrmRPCLog.doLoadFromFile(aFileName: String);
var
  sCaption, sName, s: String;
  sl, ItemSL: TStringList;
  li: TListItem;

  procedure AddItem(bChrono: Boolean = False);
  begin
    if bChrono then
      li := lvRPCLog.Items.Add
    else
      li := lvRPCLog.Items.Insert(0);
    li.Caption := sCaption;
    li.SubItems.Add(sName);
    li.Data := ItemSL;
  end;

begin
  sName := ''; // li.SubItems[0]
  sCaption := ''; // li caption
  sl := TStringList.Create;
  sl.Sorted := False;
  sl.LoadFromFile(aFileName);
  if sl.Count > 0 then
  begin
    ItemSL := TStringList.Create;
    ItemSL.Sorted := False;
    for s in sl do
    begin
      if pos(RPCLog_ItemBegin, s) = 1 then
      begin
        if sName <> '' then
          AddItem;
        sName := copy(s, 1 + Length(RPCLog_ItemBegin), Length(s));
        sName := copy(sName, 1, pos(RPCLog_ItemEnd, sName) - 1);
        ItemSL := TStringList.Create;
      end
      else
        ItemSL.Add(s)
    end;
    AddItem;
  end;
  sl.Free;

end;

procedure TfrmRPCLog.AlignBroker(aStyle: TAlign);
var
  frm: TForm;
  iLog: Integer;
  r: TRect;

begin
  frm := Application.MainForm;

  r := frm.Monitor.WorkareaRect;

  iLog := r.Width div RpcLogPart;

  frm.Top := r.Top;
  frm.Height := r.Bottom - r.Top;
  frm.Width := r.Width - iLog;

  Height := frm.Height;
  Top := r.Top;
  Width := iLog;

  Application.ProcessMessages;

  case aStyle of
    alLeft:
      begin
        frm.Left := frm.Monitor.Left + iLog;
        Left := frm.Monitor.Left;
      end;
    alRight:
      begin
        frm.Left := frm.Monitor.Left;
        Left := frm.Monitor.Left + frm.Width;
      end;
    alNone:
      ;
    alTop:
      ;
    alBottom:
      ;
    alClient:
      ;
    alCustom:
      ;
  end;
end;

end.
