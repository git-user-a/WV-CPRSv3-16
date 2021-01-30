unit fVW_Alerts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase508Form, VA508AccessibilityManager,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, ORCtrls, Vcl.Samples.Gauges,
  Vcl.ActnList, System.Actions, uVW_Utils, uConst;

type
  TfrmVW_Alerts = class(TfrmBase508Form)
    lblNotifications: TLabel;
    ggeInfo: TGauge;
    lstvAlerts: TCaptionListView;
    txtCmdComments: TVA508StaticText;
    txtCmdRemove: TVA508StaticText;
    txtCmdForward: TVA508StaticText;
    txtCmdProcess: TVA508StaticText;
    cmdRemove: TButton;
    cmdComments: TButton;
    cmdForward: TButton;
    cmdProcess: TButton;
    cmdProcessAll: TButton;
    cmdProcessInfo: TButton;
    pnlTools: TPanel;
    pnlHeader: TPanel;
    alAlerts: TActionList;
    acProcessInfo: TAction;
    acProcessAll: TAction;
    acProcess: TAction;
    acForward: TAction;
    acShowComments: TAction;
    acRemove: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure acProcessInfoExecute(Sender: TObject);
    procedure acProcessAllExecute(Sender: TObject);
    procedure acProcessExecute(Sender: TObject);
    procedure lstvAlertsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lstvAlertsColumnClick(Sender: TObject; Column: TListColumn);
    procedure acForwardExecute(Sender: TObject);
    procedure acShowCommentsExecute(Sender: TObject);
    procedure acRemoveExecute(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure lstvAlertsDblClick(Sender: TObject);
    procedure lstvAlertsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    FAlertsNotReady: boolean;
    FsortCol: Integer;
    FsortAscending: boolean;
    FsortDirection: string;
    fParentForm: TForm;
    procedure ShowButts(ShowButts: boolean);
    procedure doProcess;
    procedure ReformatAlertDateTime;
    procedure ReadyAlert;
    procedure WMReadyAlert(var Message: TMessage); message UM_MISC;

  public
    { Public declarations }

    onSelectRecord: TOnPatientSelect;

    property ParentForm: TForm read fParentForm write fParentForm;

    property AlertsNotReady: boolean read FAlertsNotReady write FAlertsNotReady;
    procedure AlertList;
    procedure setFontSize(aSize: Integer);
  end;

var
  frmVW_Alerts: TfrmVW_Alerts;

implementation

uses
  ORFn, VAUtils, UBACore, rCore, uCore, fAlertForward, fRptBox, uVW_Size
  , VA508AccessibilityRouter
  ;

{$R *.dfm}

procedure TfrmVW_Alerts.AlertList; // Load the items
var
  List: TStringList;
  NewItem: TListItem;
  I, J: Integer;
  Comment: String;
begin

  lstvAlerts.Items.Clear;
  List := TStringList.Create;
  NewItem := nil;
  try
    LoadNotifications(List);

    lstvAlerts.Items.BeginUpdate;

    for I := 0 to List.Count - 1 do
    begin
      // List[i] := ConvertDate(List, i);  //cla commented out 8/9/04 CQ #4749

      if Piece(List[I], U, 1) <> 'Forwarded by: ' then
      begin
        NewItem := lstvAlerts.Items.Add;
        NewItem.Caption := Piece(List[I], U, 1);
        for J := 2 to DelimCount(List[I], U) + 1 do
          NewItem.SubItems.Add(Piece(List[I], U, J));
      end
      else // this list item is forwarding information
      begin
        NewItem.SubItems[5] := Piece(List[I], U, 2);
        Comment := Piece(List[I], U, 3);
        if Length(Comment) > 0 then
          NewItem.SubItems[8] := 'Fwd Comment: ' + Comment;
      end;
    end;

    lstvAlerts.Items.EndUpdate;

  finally
    List.Free;
  end;
  (*
    with lstvAlerts do
    begin
    Columns[0].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 1), 40);          //Info                 Caption
    Columns[1].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 2), 195);         //Patient              SubItems[0]
    Columns[2].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 3), 75);          //Location             SubItems[1]
    Columns[3].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 4), 95);          //Urgency              SubItems[2]
    Columns[4].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 5), 150);         //Alert Date/Time      SubItems[3]
    Columns[5].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 6), 310);         //Message Text         SubItems[4]
    Columns[6].Width := StrToIntDef(Piece(frmFrame.EnduringPtSelColumns, ',', 7), 290);         //Forwarded By/When    SubItems[5]
    //Items not displayed in Columns:     XQAID                SubItems[6]
    //                                    Remove w/o process   SubItems[7]
    //                                    Forwarding comments  SubItems[8]
    end;
  *)
end;

procedure TfrmVW_Alerts.ShowButts(ShowButts: boolean);

  procedure ShowDisabledButtonTexts;
  begin
    if ScreenReaderActive then
    begin
      txtCmdProcess.Visible := not acProcess.Enabled;
      txtCmdRemove.Visible := not acRemove.Enabled;
      txtCmdForward.Visible := not acForward.Enabled;
      txtCmdComments.Visible := not acShowComments.Enabled;
    end;
  end;

begin
  acProcess.Enabled := ShowButts;
  acRemove.Enabled := ShowButts;
  acForward.Enabled := ShowButts;
  acShowComments.Enabled := ShowButts and (lstvAlerts.SelCount = 1) and
    (lstvAlerts.Selected.SubItems[8] <> '');
  ShowDisabledButtonTexts;
end;

procedure TfrmVW_Alerts.acForwardExecute(Sender: TObject);
var
  I: Integer;
  Alert: String;
begin
  inherited;
  if FAlertsNotReady then
    exit;
  try
    with lstvAlerts do
    begin
      if SelCount <= 0 then
        exit;
      for I := 0 to Items.Count - 1 do
        if Items[I].Selected then
          try
            Alert := Items[I].SubItems[6] + '^' + Items[I].SubItems[0] + ': ' +
              Items[I].SubItems[4];
            ForwardAlertTo(Alert);
          finally
            Items[I].Selected := False;
          end;
    end;
  finally
    if lstvAlerts.SelCount <= 0 then
      ShowButts(False);
  end;
end;

procedure TfrmVW_Alerts.acProcessAllExecute(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if FAlertsNotReady then
    exit;
  for I := 0 to lstvAlerts.Items.Count - 1 do
    lstvAlerts.Items[I].Selected := True;
  doProcess;
  ShowButts(False);
end;

{ Items[i].Selected    =  Boolean TRUE if item is selected
  "   .Caption     =  Info flag ('I')
  "   .SubItems[0] =  Patient ('ABC,PATIE (A4321)')
  "   .    "   [1] =  Patient location ('[2B]')
  "   .    "   [2] =  Alert urgency level ('HIGH, Moderate, low')
  "   .    "   [3] =  Alert date/time ('2002/12/31@12:10')
  "   .    "   [4] =  Alert message ('New order(s) placed.')
  "   .    "   [5] =  Forwarded by/when
  "   .    "   [6] =  XQAID ('OR,66,50;1416;3021231.121024')
  'TIU6028;1423;3021203.09')
  "   .    "   [7] =  Remove without processing flag ('YES')
  "   .    "   [8] =  Forwarding comments (if applicable) }

procedure TfrmVW_Alerts.doProcess;
var
  AFollowUp, I, infocount: Integer;
  enableclose: boolean;
  ADFN, x, RecordID, XQAID: string; // *DFN*

  procedure InitProgressBar;
  var
    I: Integer;
  begin
    // Count information-only selections for gauge
    infocount := 0;
    for I := 0 to lstvAlerts.Items.Count - 1 do
      if lstvAlerts.Items[I].Selected and (lstvAlerts.Items[I].SubItems[0] = 'I') then
        Inc(infocount);

    if infocount >= 1 then
    begin
      ggeInfo.Visible := True; (* BOB *)
      ggeInfo.MaxValue := infocount;
    end;
  end;

begin
  if FAlertsNotReady then
    exit;

  enableclose := False;
  with lstvAlerts do
  begin
    if SelCount <= 0 then
      exit;

    InitProgressBar;

    for I := 0 to Items.Count - 1 do
      if Items[I].Selected then
      begin
        XQAID := Items[I].SubItems[6];
        RecordID := Items[I].SubItems[0] + ': ' + Items[I].SubItems[4] +
          '^' + XQAID;
        // RecordID := patient: alert message^XQAID  ('ABC,PATIE (A4321): New order(s) placed.^OR,66,50;1416;3021231.121024')
        if Items[I].Caption = 'I' then
        // If Caption is 'I' delete the information only alert.
        begin
          ggeInfo.Progress := ggeInfo.Progress + 1;
          DeleteAlert(XQAID);
        end
        else if Piece(XQAID, ',', 1) = 'OR' then // OR,16,50;1311;2980626.100756
        begin
          ADFN := Piece(XQAID, ',', 2); // *DFN*
          AFollowUp := StrToIntDef(Piece(Piece(XQAID, ';', 1), ',', 3), 0);
          Notifications.Add(ADFN, AFollowUp, RecordID, Items[I].SubItems[3]);
          // CB
          enableclose := True;
        end
        else if Copy(XQAID, 1, 6) = 'TIUERR' then
          InfoBox(Piece(RecordID, U, 1) + #13#10#13#10 +
            'The CPRS GUI cannot yet process this type of alert.  Please use List Manager.',
            'Unable to Process Alert', MB_OK)
        else if Copy(XQAID, 1, 3) = 'TIU' then // TIU6028;1423;3021203.09
        begin
          x := GetTIUAlertInfo(XQAID);
          if Piece(x, U, 2) <> '' then
          begin
            ADFN := Piece(x, U, 2); // *DFN*
            AFollowUp := StrToIntDef(Piece(Piece(x, U, 3), ';', 1), 0);
            Notifications.Add(ADFN, AFollowUp,
              RecordID + '^^' + Piece(x, U, 3));
            enableclose := True;
          end
          else
            DeleteAlert(XQAID);
        end
        else // other alerts cannot be processed
          InfoBox('This alert cannot be processed by the CPRS GUI.',
            Items[I].SubItems[0] + ': ' + Items[I].SubItems[4], MB_OK);
      end;

    if enableclose = True then
    begin
      // Close
      // AA temporary fix ------------------------------------------------ begin
      if assigned(onSelectRecord) then
      begin
        onSelectRecord(ADFN);
        if assigned(ParentForm) then
          ParentForm.ModalResult := mrOK;

        // AlertList; // AA time to reload Alert list?
      end;
      // AA temporary fix -------------------------------------------------- end
    end
    else
    begin
      ggeInfo.Visible := False;
      // Update notification list:
      lstvAlerts.Clear;
      AlertList;
      // display alerts sorted according to parameter settings:
      FsortCol := -1; // CA - display alerts in correct sort
      // FormShow(Sender);
    end;

    if Items.Count = 0 then
      ShowButts(False);
    if SelCount <= 0 then
      ShowButts(False);
  end;
  GetBAStatus(User.DUZ, Patient.DFN);
end;

procedure TfrmVW_Alerts.ReformatAlertDateTime;
var
  I, J: Integer;
  inDateStr, holdDayTime, srtDate: String;
begin
  // convert date to yyyy/mm/dd prior to sort.
  for J := 0 to lstvAlerts.Items.Count - 1 do
  begin
    inDateStr := '';
    srtDate := '';
    holdDayTime := '';
    inDateStr := lstvAlerts.Items[J].SubItems[3];
    srtDate := ((Piece(Piece(inDateStr, '/', 3), '@', 1)) + '/' +
      Piece(inDateStr, '/', 1) + '/' + Piece(inDateStr, '/', 2) + '@' +
      Piece(inDateStr, '@', 2));
    lstvAlerts.Items[J].SubItems[3] := srtDate;
  end;
  // sort the listview records by date
  lstvAlerts.AlphaSort;
  // loop thru lstvAlerts change date to yyyy/mm/dd
  // sort list
  // change alert date/time back to mm/dd/yyyy@time for display
  for I := 0 to lstvAlerts.Items.Count - 1 do
  begin
    inDateStr := '';
    srtDate := '';
    holdDayTime := '';
    inDateStr := lstvAlerts.Items[I].SubItems[3];
    holdDayTime := Piece(inDateStr, '/', 3); // dd@time
    lstvAlerts.Items[I].SubItems[3] :=
      (Piece(inDateStr, '/', 2) + '/' + Piece(holdDayTime, '@', 1) + '/' +
      Piece(inDateStr, '/', 1) + '@' + Piece(holdDayTime, '@', 2));
  end;
end;

procedure TfrmVW_Alerts.lstvAlertsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  inherited;
  if (FsortCol = Column.Index) then
    FsortAscending := not FsortAscending;

  if FsortAscending then
    FsortDirection := 'F'
  else
    FsortDirection := 'R';

  FsortCol := Column.Index;

  if FsortCol = 4 then
    ReformatAlertDateTime
    // hds7397- ge 2/6/6 sort and display date/time column correctly - as requested
  else
    lstvAlerts.AlphaSort;

  // Set the Notifications sort method to last-used sort-type
  // ie., user clicked on which column header last use of CPRS?
  case Column.Index of
    0:
      rCore.SetSortMethod('I', FsortDirection);
    1:
      rCore.SetSortMethod('P', FsortDirection);
    2:
      rCore.SetSortMethod('L', FsortDirection);
    3:
      rCore.SetSortMethod('U', FsortDirection);
    4:
      rCore.SetSortMethod('D', FsortDirection);
    5:
      rCore.SetSortMethod('M', FsortDirection);
    6:
      rCore.SetSortMethod('F', FsortDirection);
  end;
end;

procedure TfrmVW_Alerts.lstvAlertsCompare(Sender: TObject;
  Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  inherited;
  if not(Sender is TListView) then
    exit;
  if FsortAscending then
  begin
    if FsortCol = 0 then
      Compare := CompareStr(Item1.Caption, Item2.Caption)
    else
      Compare := CompareStr(Item1.SubItems[FsortCol - 1],
        Item2.SubItems[FsortCol - 1]);
  end
  else
  begin
    if FsortCol = 0 then
      Compare := CompareStr(Item2.Caption, Item1.Caption)
    else
      Compare := CompareStr(Item2.SubItems[FsortCol - 1],
        Item1.SubItems[FsortCol - 1]);
  end;
end;

procedure TfrmVW_Alerts.lstvAlertsDblClick(Sender: TObject);
begin
  inherited;
  doProcess;
end;

procedure TfrmVW_Alerts.WMReadyAlert(var Message: TMessage);
begin
  ReadyAlert;
  Message.Result := 0;
end;


//hds7397- ge 2/6/6 sort and display date/time column correctly - as requested
procedure TfrmVW_Alerts.ReadyAlert;
begin
  if lstvAlerts.SelCount <= 0 then ShowButts(False)
  else ShowButts(True);
  GetBAStatus(User.DUZ,Patient.DFN);
  FAlertsNotReady := FALSE;
end;


procedure TfrmVW_Alerts.lstvAlertsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
//  inherited;
  if ScreenReaderSystemActive then
  begin
    FAlertsNotReady := TRUE;
    PostMessage(Handle, UM_MISC, 0, 0);
  end
  else
    ReadyAlert;
end;

procedure TfrmVW_Alerts.Panel2DblClick(Sender: TObject);
begin
  inherited;
  Panel2.Visible := not Panel2.Visible;
  pnlTools.Visible := not Panel2.Visible;
end;

procedure TfrmVW_Alerts.acProcessExecute(Sender: TObject);
begin
  inherited;
  doProcess;
end;

procedure TfrmVW_Alerts.acProcessInfoExecute(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if FAlertsNotReady then
    exit;
  if lstvAlerts.Items.Count = 0 then
    exit;
  if InfoBox('You are about to process all your INFORMATION alerts.' + CRLF +
    'These alerts will not be presented to you for individual' + CRLF +
    'review and they will be permanently removed from your' + CRLF +
    'alert list.  Do you wish to continue?', 'Warning',
    MB_YESNO or MB_ICONWARNING) = IDYES then
  begin
    for I := 0 to lstvAlerts.Items.Count - 1 do
      lstvAlerts.Items[I].Selected := False;
    // clear any selected alerts so they aren't processed
    for I := 0 to lstvAlerts.Items.Count - 1 do
      if lstvAlerts.Items[I].Caption = 'I' then
        lstvAlerts.Items[I].Selected := True;
    doProcess; // cmdProcessClick(Self);
    ShowButts(False);
  end;
end;

procedure TfrmVW_Alerts.acRemoveExecute(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if FAlertsNotReady then
    exit;
  with lstvAlerts do
  begin
    if SelCount <= 0 then
      exit;
    for I := 0 to Items.Count - 1 do
      if Items[I].Selected then
      begin
        if Items[I].SubItems[7] = '1' then // remove flag enabled
          DeleteAlertforUser(Items[I].SubItems[6])
        else
          InfoBox('This alert cannot be removed.', Items[I].SubItems[0] + ': ' +
            Items[I].SubItems[4], MB_OK);
      end;
  end;
  lstvAlerts.Clear;
  AlertList;
  FsortCol := -1; // CA - display alerts in correct sort
  // FormShow(Sender);  //CA - display alerts in correct sort
  if lstvAlerts.Items.Count = 0 then
    ShowButts(False);
  if lstvAlerts.SelCount <= 0 then
    ShowButts(False);
end;

procedure TfrmVW_Alerts.acShowCommentsExecute(Sender: TObject);
var
  tmpCmt: TStringList;
begin
  inherited;
  if lstvAlerts.ItemIndex < 0 then
    exit;
  if FAlertsNotReady then
    exit;
  tmpCmt := TStringList.Create;
  try
    tmpCmt.Text := lstvAlerts.Selected.SubItems[8];
    LimitStringLength(tmpCmt, 74);
    tmpCmt.Insert(0, StringOfChar('-', 74));
    tmpCmt.Insert(0, lstvAlerts.Selected.SubItems[4]);
    tmpCmt.Insert(0, lstvAlerts.Selected.SubItems[3]);
    tmpCmt.Insert(0, lstvAlerts.Selected.SubItems[0]);
    ReportBox(tmpCmt, 'Forwarded by: ' + lstvAlerts.Selected.SubItems[5], True);
    lstvAlerts.SetFocus;
  finally
    tmpCmt.Free;
  end;
end;

procedure TfrmVW_Alerts.setFontSize(aSize: Integer);
var
  I: Integer;
begin
  self.Font.Size := aSize;
  AdjustPanelDialog(pnlTools);
  AdjustPanelDialog(pnlHeader);
  self.Invalidate;

  with lstvAlerts do
    for I := 0 to Columns.Count - 1 do
      Columns[I].Width := -2;

  Application.ProcessMessages;
end;

end.
