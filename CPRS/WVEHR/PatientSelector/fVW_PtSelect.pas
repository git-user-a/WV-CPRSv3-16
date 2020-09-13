unit fVW_PtSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase508Form, VA508AccessibilityManager,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, ORCtrls, fVW_Alerts, fVW_PtSelDemog,
  fVW_PtSelOptns, Vcl.ActnList, System.Actions;

type
  TfrmVW_PtSelect = class(TfrmBase508Form)
    pnlButtons: TPanel;
    cmdOK: TButton;
    cmdCancel: TButton;
    bbInquiryDemographics: TBitBtn;
    pnlTop: TPanel;
    bvlTool: TBevel;
    pnlRight: TPanel;
    pnlDemographics: TPanel;
    pnlDemographicHeader: TPanel;
    Label1: TLabel;
    pnlPtSel: TPanel;
    cboPatient: TORComboBox;
    pnlPatientHeader: TPanel;
    lblPatient: TLabel;
    pnlOptions: TPanel;
    pnlOptionsHeader: TPanel;
    lblOptions: TLabel;
    pnlAlerts: TPanel;
    splAlerts: TSplitter;
    alPatientSelector: TActionList;
    acInquiry: TAction;
    BitBtn1: TBitBtn;
    acSaveCategory: TAction;
    acAlertsShow: TAction;
    CheckBox1: TCheckBox;
    pnlDemographicButtons: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    pnlCanvas: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cboPatientNeedData(Sender: TObject; const StartFrom: string;
      Direction, InsertAt: Integer);
    procedure acInquiryExecute(Sender: TObject);
    procedure cboPatientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboPatientDblClick(Sender: TObject);
    procedure cboPatientClick(Sender: TObject);
    procedure cboPatientChange(Sender: TObject);
    procedure acSaveCategoryExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acAlertsShowExecute(Sender: TObject);
  private
    { Private declarations }
    fSelectedDFN, FLastDFN: String;
    FDfltSrc: string;
    FDfltSrcType: string;
    procedure ClearIDInfo;
    procedure doInquiry;
    procedure ViewUpdate;
  public
    { Public declarations }
    _Demographics: TfrmVW_PtDemog;
    _Options: TfrmVW_PtSelOptns;
    _Alerts: TfrmVW_Alerts;
    property DfltSrc: String read FDfltSrc;
    property SelectedDFN: String read fSelectedDFN write fSelectedDFN;
    procedure SetCaptionTop;
    procedure SetPtListTop(IEN: Int64);
    procedure ShowDemog(ItemID: string);
    function DupLastSSN(var DFN: string): Boolean;
    procedure setFontSize(aSize: Integer);
  end;

var
  frmVW_PtSelect: TfrmVW_PtSelect;
  IsRPL, RPLJob, DupDFN: string;
  RPLProblem: Boolean;

implementation

uses
  uVW_Utils,
  ORFn,
  ORNet,
  rCore,
  uCore,
  uConst,
  fRptBox,
  fVW_DupPts, uVW_Size;

{$R *.dfm}

procedure setFormParented(aForm: TForm; aParent: TWinControl;
  anAlign: TAlign = alClient);
begin
  if aForm.Parent <> aParent then
  begin
    aForm.BorderStyle := bsNone;
    aForm.Parent := aParent;
    aForm.Align := anAlign;
    // aForm.Menu := nil;
    if not aForm.Visible then
      aForm.Show;
  end;
end;

/// /////////////////////////////////////////////////////////////////////////////
procedure TfrmVW_PtSelect.ViewUpdate;
begin
  pnlAlerts.Visible := acAlertsShow.Checked;
  splAlerts.Visible := acAlertsShow.Checked;
  splAlerts.Top := pnlAlerts.Top - splAlerts.Height;

  if pnlAlerts.Visible then
  begin
    pnlButtons.Align := alTop;
    pnlButtons.Top := 0;
    pnlButtons.TabOrder := 0;
  end
  else
  begin
    pnlButtons.Align := alBottom;
    pnlButtons.Top := Height - pnlButtons.Height;
    pnlButtons.TabOrder := 2;
  end;
end;

procedure TfrmVW_PtSelect.acAlertsShowExecute(Sender: TObject);
begin
  inherited;
  acAlertsShow.Checked := not acAlertsShow.Checked;
  ViewUpdate;
end;

procedure TfrmVW_PtSelect.acInquiryExecute(Sender: TObject);
begin
  inherited;
  doInquiry;
end;

procedure TfrmVW_PtSelect.doInquiry;
{ present Patient demographic info in report box }
var
  sl: TStringList;

  procedure LoadDemographics(Dest: TStrings; const PtDFN: string);
  // copy from rCover.pas
  begin
    CallVistA('ORWPT PTINQ', [PtDFN], Dest);
  end;

begin
  if cboPatient.ItemID <> '' then
  begin
    sl := TStringList.Create;
    try
      LoadDemographics(sl, IntToStr(cboPatient.ItemID));
      ReportBox(sl, 'Patient Inquiry', True);
    finally
      sl.Free;
    end;
  end;
end;

procedure TfrmVW_PtSelect.ShowDemog(ItemID: string);
{ gets a record of patient indentifying information from the server and displays it }
begin
  if (ItemID <> FLastDFN) or (StrToInt64Def(ItemID, 0) > 0) then
  begin
    FLastDFN := ItemID;
    acInquiry.Enabled := True;
    if assigned(_Demographics) then
      _Demographics.ShowDemog(ItemID);
  end;
end;

function TfrmVW_PtSelect.DupLastSSN(var DFN: string): Boolean;
{ check for duplacate SSN }
var
  // aDFN: String;
  i: Integer;
  PtStrs: TStringList;
begin
  Result := false;
  CallV('DG CHK BS5 XREF ARRAY', [DFN]);
  if (RPCBrokerV.Results[0] = '1') then
  begin
    // Result := True;
    PtStrs := TStringList.Create;
    try
    with RPCBrokerV do
      if Results.Count > 0 then
      begin
        for i := 1 to Results.Count - 1 do
        begin
          if Piece(Results[i], U, 1) = '1' then
            PtStrs.Add(Piece(Results[i], U, 2) + U + Piece(Results[i], U, 3) + U
              + FormatFMDateTimeStr('mmm dd,yyyy', Piece(Results[i], U, 4)) + U
              + Piece(Results[i], U, 5));
        end;
      end;
    DFN := getUniqueItem(PtStrs);
    finally
      PtStrs.Free;
    end;
    Result := DFN = '';
  end;
end;

procedure TfrmVW_PtSelect.acSaveCategoryExecute(Sender: TObject);
begin
  inherited;
  _Options.SaveSettings;
end;

procedure TfrmVW_PtSelect.cboPatientChange(Sender: TObject);
{ update patient info on changing the selection }

  procedure ShowMatchingPatients;
  begin
    with cboPatient do
    begin
      ClearIDInfo;
      if ShortCount > 0 then
      begin
        if ShortCount = 1 then
        begin
          ItemIndex := 0;
          ShowDemog(cboPatient.ItemID);
        end;
        Items.Add(LLS_LINE);
        Items.Add(LLS_SPACE);
      end;
      InitLongList('');
    end;
  end;

  procedure SelectByNameOrSSN;
  begin
    with cboPatient do
    begin
      if IsLast5(Text) then
      begin
        if (IsRPL = '1') then
          ListPtByRPLLast5(Items, Text)
        else
          ListPtByLast5(Items, Text);
        ShowMatchingPatients;
      end
      else if IsFullSSN(Text) then
      begin
        if (IsRPL = '1') then
          ListPtByRPLFullSSN(Items, Text)
        else
          ListPtByFullSSN(Items, Text);
        ShowMatchingPatients;
      end;
    end;
  end;

  function getData(aList: TStrings): TStrings;
  var
    i: Integer;
    s, ss: String;
  begin
    Result := TStringList.Create;
    for s in aList do
    begin
      i := pos('!', s);
      if i > 0 then
      begin
        ss := ' ' + copy(s, i + 1, Length(s)); // aa replacing ! with space
        ss := Piece(trim(ss), ' ', 2);
        ss := copy(s, 1, i - 1) + ss;
        Result.Add(ss); // SS
      end
      else
        Result.Add(s);
    end;

  end;

  procedure SelectByPhone;
  var
    slData, slTemp: TStrings;
  begin
    slTemp := TStringList.Create;
    try
      ListPtByTimson(slTemp, cboPatient.Text);
      slData := getData(slTemp);
      try
        cboPatient.Items.Clear;
        cboPatient.ForDataUse(slData);
      finally
        slData.Free;
      end;
    finally
      slTemp.Free;
    end;
  end;

  procedure SelectByDOB;
  begin
    SelectByPhone;
  end;

begin
  inherited;
  case _Options.rgInDepth.ItemIndex of
    0:
      SelectByNameOrSSN;
    1:
      SelectByPhone;
    2:
      SelectByDOB;
  end;
end;

procedure TfrmVW_PtSelect.cboPatientClick(Sender: TObject);
{ check access to selected patient, process selection if allowed }
{ AA: validation moved to CanClose }
var
  NewDFN: String;
begin
  inherited;
  ShowDemog(cboPatient.ItemID);
  NewDFN := cboPatient.ItemID;
end;

procedure TfrmVW_PtSelect.cboPatientDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

procedure TfrmVW_PtSelect.cboPatientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    cboPatientDblClick(Sender);
    Key := 0;
  end;
end;

procedure TfrmVW_PtSelect.cboPatientNeedData(Sender: TObject;
  const StartFrom: string; Direction, InsertAt: Integer);
var
  i: Integer;
  NoAlias, ThePatient: String;
  PatientList: TStringList;

const
  ALIASSTRING = ' -- ALIAS';

begin
  inherited;
  NoAlias := StartFrom;
  with Sender as TORComboBox do
  begin
    if Items.Count > ShortCount then
      NoAlias := Piece(Items[Items.Count - 1], U, 1) + U + NoAlias;
  end;
  if pos(ALIASSTRING, NoAlias) > 0 then
    NoAlias := copy(NoAlias, 1, pos(ALIASSTRING, NoAlias) - 1);
  PatientList := TStringList.Create;
  try
    begin
      if (IsRPL = '1') then
        PatientList.Assign(ReadRPLPtList(RPLJob, NoAlias, Direction))
      else
      begin
        PatientList.Assign(SubSetOfPatients(NoAlias, Direction));

        for i := 0 to PatientList.Count - 1 do
        begin
          ThePatient := PatientList[i];
          if (Uppercase(Piece(ThePatient, U, 2)) <> Uppercase(Piece(ThePatient,
            U, 6))) then
          begin
            SetPiece(ThePatient, U, 2, Piece(ThePatient, U, 2) + ALIASSTRING);
            PatientList[i] := ThePatient;
          end;
        end;

      end;
      cboPatient.ForDataUse(PatientList);
    end;
  finally
    PatientList.Free;
  end;
end;

procedure TfrmVW_PtSelect.FormClose(Sender: TObject; var Action: TCloseAction);
{ hides istead of closing - to avoid re-creation the next time the dialog is needed }
begin
  inherited;
  hide;
end;

procedure TfrmVW_PtSelect.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
{ verification the selection is valid }
var
  NewDFN: String;
  DateDied: TFMDateTime;
  AccessStatus: Integer;
begin
  inherited;
  if ModalResult <> mrOK then
    CanClose := True
  else
  begin
    CanClose := false;
    if Length(cboPatient.ItemID) <= 0 then // *DFN*
      InfoBox('A patient has not been selected.', 'No Patient Selected', MB_OK)
    else
    begin
      NewDFN := cboPatient.ItemID; // *DFN*
      { AA: commented out until verified HasActiveFlag is required -------------------
        if FLastPt <> cboPatient.ItemID then
        begin
        HasActiveFlg(FlagList, HasFlag, cboPatient.ItemID);
        FLastPt := cboPatient.ItemID;
        end;
      }

      if DupLastSSN(NewDFN) then // Check for, deal with duplicate patient data.
        exit;

      if not AllowAccessToSensitivePatient(NewDFN, AccessStatus) then
        exit;

      DateDied := DateOfDeath(NewDFN);
      if (DateDied > 0) and
        (InfoBox('This patient died ' + FormatFMDateTime('mmm dd,yyyy hh:nn',
        DateDied) + CRLF + 'Do you wish to continue?', 'Deceased Patient',
        MB_YESNO or MB_DEFBUTTON2) = ID_NO) then
        exit;

      SelectedDFN := NewDFN;
      CanClose := True;
    end;
  end;
end;

procedure TfrmVW_PtSelect.FormCreate(Sender: TObject);
// populating main form with child forms

  procedure setAlerts;
  begin
    if not assigned(_Alerts) then
      _Alerts := TfrmVW_Alerts.Create(Application);
    if assigned(_Alerts) then
    begin
      setFormParented(_Alerts, pnlAlerts);
      _Alerts.AlertList;
    end;
  end;

  procedure SetupOptions;
  begin
    // _Options := TfrmVW_PtSelOptns.Create(self); // Was application - kcm
    _Options := TfrmVW_PtSelOptns.Create(Application);
    setFormParented(_Options, pnlOptions);

    with _Options do
    begin
      SetCaptionTopProc := SetCaptionTop;
      SetPtListTopProc := SetPtListTop;
    end;
  end;

  procedure setDemographics;
  begin
    if not assigned(_Demographics) then
      _Demographics := TfrmVW_PtDemog.Create(Application);
    if assigned(_Demographics) then

      setFormParented(_Demographics, pnlDemographics);
  end;

begin
  inherited;
  setAlerts;
  SetupOptions;
  setDemographics;

  cboPatient.InitLongList('');
  if cboPatient.Items.Count > 0 then
  begin
    cboPatient.ItemIndex := 0;
    cboPatientClick(nil);
  end;
end;

procedure TfrmVW_PtSelect.FormShow(Sender: TObject);
begin
  inherited;
  if assigned(_Options) then
    _Options.Init;
end;

procedure TfrmVW_PtSelect.ClearIDInfo;
{ clear demographic info }
begin
  FLastDFN := '';
  acInquiry.Enabled := false;
  if assigned(_Demographics) then
    _Demographics.ClearIDInfo;
end;

procedure TfrmVW_PtSelect.SetCaptionTop;
{ Show patient list name, set top list to 'Select ...' if appropriate. }
{ Called by _Options form on changing of the selection }
var
  X: string;
begin
  X := '';
  lblPatient.Caption := 'Patients';
  if (not User.IsReportsOnly) then
  begin
    case _Options.SrcType of
      TAG_SRC_DFLT:
        begin
          if FDfltSrc <> '' then
            lblPatient.Caption := lblPatient.Caption + ' (' + FDfltSrc + ')';
        end;
      TAG_SRC_PROV:
        X := 'Provider';
      TAG_SRC_TEAM:
        X := 'Team';
      TAG_SRC_SPEC:
        X := 'Specialty';
      TAG_SRC_CLIN:
        X := 'Clinic';
      TAG_SRC_WARD:
        X := 'Ward';
      // TAG_SRC_PCMM:
      // X := 'Pcmm Team'; // TDP - Added 5/27/2014 to handle PCMM team addition
      // TAG_SRC_ALL: { Nothing }
      // ;
    end; // case stmt
  end; // begin
  if Length(X) > 0 then
    with cboPatient do
    begin
      RedrawSuspend(Handle);
      ClearIDInfo;
      ClearTop;
      Text := '';
      Items.Add('^Select a ' + X + '...');
      Items.Add(LLS_LINE);
      Items.Add(LLS_SPACE);
      cboPatient.InitLongList('');
      RedrawActivate(cboPatient.Handle);
    end;
end;

procedure TfrmVW_PtSelect.SetPtListTop(IEN: Int64);
{ Sets top items in patient list according to list source type and optional list source IEN. }
{ Called by _Options to populate patient list on change of selection }
var
  NewTopList: string;
  FirstDate, LastDate: string;
begin
  // NOTE:  Some pieces in RPC returned arrays are rearranged by ListPtByDflt call in rCore!
  IsRPL := User.IsRPL;
  if (IsRPL = '') then
  // First piece in ^VA(200,.101) should always be set (to 1 or 0).
  begin
    InfoBox('Patient selection list flag not set.',
      'Incomplete User Information', MB_OK);
    RPLProblem := True;
    exit;
  end;
  // FirstDate := 0; LastDate := 0; // Not req'd, but eliminates hint.
  // Assign list box TabPosition, Pieces properties according to type of list to be displayed.
  // (Always use Piece "2" as the first in the list to assure display of patient's name.)
  cboPatient.pieces := '2,3';
  // This line and next: defaults set - exceptions modifield next.
  cboPatient.tabPositions := '20,28';
  if ((_Options.SrcType = TAG_SRC_DFLT) and (FDfltSrc = 'Combination')) then
  begin
    cboPatient.pieces := '2,3,4,5,9';
    cboPatient.tabPositions := '20,28,35,45';
  end;
  if ((_Options.SrcType = TAG_SRC_DFLT) and (FDfltSrcType = 'Ward')) or
    (_Options.SrcType = TAG_SRC_WARD) then
    cboPatient.tabPositions := '35';
  if ((_Options.SrcType = TAG_SRC_DFLT) and (AnsiStrPos(pChar(FDfltSrcType),
    'Clinic') <> nil)) or (_Options.SrcType = TAG_SRC_CLIN) then
  begin
    cboPatient.pieces := '2,3,9';
    cboPatient.tabPositions := '24,45';
  end;
  NewTopList := IntToStr(_Options.SrcType) + U + IntToStr(IEN);
  // Default setting.
  if (_Options.SrcType = TAG_SRC_CLIN) then
    with _Options.cboDateRange do
    begin
      if ItemID = '' then
        exit; // Need both clinic & date range.
      FirstDate := Piece(ItemID, ';', 1);
      LastDate := Piece(ItemID, ';', 2);
      NewTopList := IntToStr(_Options.SrcType) + U + IntToStr(IEN) + U + ItemID;
      // Modified for clinics.
    end;
  if NewTopList = _Options.LastTopList then
    exit; // Only continue if new top list.
  _Options.LastTopList := NewTopList;

  RedrawSuspend(cboPatient.Handle);
  ClearIDInfo;
  cboPatient.ClearTop;
  cboPatient.Text := '';
  if (IsRPL = '1') then // Deal with restricted patient list users.
  begin
    RPLJob := MakeRPLPtList(User.RPLList);
    // MakeRPLPtList is in rCore, writes global "B" x-ref list.
    if (RPLJob = '') then
    begin
      InfoBox('Assignment of valid OE/RR Team List Needed.',
        'Unable to build Patient List', MB_OK);
      RPLProblem := True;
      exit;
    end;
  end
  else
  begin
    case _Options.SrcType of
      TAG_SRC_DFLT:
        ListPtByDflt(cboPatient.Items);
      TAG_SRC_PROV:
        ListPtByProvider(cboPatient.Items, IEN);
      TAG_SRC_TEAM:
        ListPtByTeam(cboPatient.Items, IEN);
      TAG_SRC_SPEC:
        ListPtBySpecialty(cboPatient.Items, IEN);
      TAG_SRC_CLIN:
        ListPtByClinic(cboPatient.Items, _Options.cboList.ItemIEN, FirstDate,
          LastDate);
      TAG_SRC_WARD:
        ListPtByWard(cboPatient.Items, IEN);
      // TDP - Added 5/27/2014 to handle PCMM team addition
      // TAG_SRC_PCMM:
      // ListPtByPcmmTeam(cboPatient.Items, IEN);
      TAG_SRC_ALL:
        ListPtTop(cboPatient.Items);
    end;
  end;
  if _Options.cboList.Visible then
  begin
    lblPatient.Caption := 'Patients';
    if _Options.cboList.Text <> '' then
      lblPatient.Caption := lblPatient.Caption + ' (' +
        _Options.cboList.Text + ')';
  end;
  if _Options.SrcType = TAG_SRC_ALL then
    lblPatient.Caption := 'Patients (All Patients)';

  with cboPatient do
    if ShortCount > 0 then
    begin
      Items.Add(LLS_LINE);
      Items.Add(LLS_SPACE);
    end;
  cboPatient.Caption := lblPatient.Caption;
  cboPatient.InitLongList('');
  RedrawActivate(cboPatient.Handle);
end;

procedure TfrmVW_PtSelect.setFontSize(aSize: Integer);
var
  i: Integer;
begin
  self.Font.Size := aSize;

  AdjustPanelDialog(pnlButtons);
  adjustToolsPanel(pnlOptionsHeader);
  adjustToolsPanel(pnlDemographicHeader);
  adjustToolsPanel(pnlPatientHeader);

  _Demographics.Font.Size := aSize;
  _Options.setFontSize(aSize);
  _Alerts.setFontSize(aSize);

  i := getMainFormTextWidth('Team/Personal');
  pnlOptions.Width := round(i * 2.5);
  pnlRight.Width := pnlOptions.Width;

  if pnlPtSel.Width < pnlRight.Width then
    self.Width := 3 * pnlRight.Width;

  self.Invalidate;
  Application.ProcessMessages;
end;

end.
