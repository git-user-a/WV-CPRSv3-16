unit fVW_PtSelOptns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ORDtTmRng, ORCtrls, StdCtrls, ExtCtrls, ORFn, fBase508Form,
  VA508AccessibilityManager;

type
  TSetCaptionTopProc = procedure of object;
  TSetPtListTopProc = procedure(IEN: Int64) of object;

  TfrmVW_PtSelOptns = class(TfrmBase508Form)
    orapnlMain: TORAutoPanel;
    lblPtList: TLabel;
    lblDateRange: TLabel;
    cboList: TORComboBox;
    cboDateRange: TORComboBox;
    calApptRng: TORDateRangeDlg;
    pnlDateRange: TPanel;
    rgPtList: TRadioGroup;
    rgInDepth: TRadioGroup;
    procedure radHideSrcClick(Sender: TObject);
    procedure radShowSrcClick(Sender: TObject);
    procedure radLongSrcClick(Sender: TObject);
    procedure cboListExit(Sender: TObject);
    procedure cboListKeyPause(Sender: TObject);
    procedure cboListMouseClick(Sender: TObject);
    procedure cboListNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cboDateRangeExit(Sender: TObject);
    procedure cboDateRangeMouseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgPtListClick(Sender: TObject);
  private
    FLastTopList: string;
    FLastDateIndex: Integer;
    FSrcType: Integer;
    FSetCaptionTop: TSetCaptionTopProc;
    FSetPtListTop: TSetPtListTopProc;
    procedure ShowDateRange;
  public
    function IsLast5(x: string): Boolean;
    function IsFullSSN(x: string): Boolean;
    procedure SetDefaultPtList(Dflt: string);
    procedure UpdateDefault;
    property LastTopList: string read FLastTopList write FLastTopList;
    property SrcType: Integer read FSrcType write FSrcType;
    property SetCaptionTopProc: TSetCaptionTopProc read FSetCaptionTop write FSetCaptionTop;
    property SetPtListTopProc: TSetPtListTopProc   read FSetPtListTop  write FSetPtListTop;
    procedure SaveSettings;
    procedure Init;
    procedure setFontSize(aSize:Integer);
  end;

const
{ constants referencing the value of the tag property in components }
  TAG_SRC_DFLT = 11;                             // default patient list
  TAG_SRC_PROV = 12;                             // patient list by provider
  TAG_SRC_TEAM = 13;                             // patient list by team
  TAG_SRC_SPEC = 14;                             // patient list by treating specialty
  TAG_SRC_CLIN = 16;                             // patient list by clinic
  TAG_SRC_WARD = 17;                             // patient list by ward
  TAG_SRC_PCMM = 18;                             // patient list by PCMM team added 5/27/2014 by TDP
  TAG_SRC_ALL  = 19;                             // all patients

var
//  frmPtSelOptns: TfrmPtSelOptns;
  clinDoSave, clinSaveToday: boolean;
  clinDefaults: string;

implementation

{$R *.DFM}

uses
  rCore, VA508AccessibilityRouter, VAUtils,
  fVW_PtSelOptSave,
  uVW_Size;

const
  TX_LS_DFLT = 'This is already saved as your default patient list settings.';
  TX_LS_PROV = 'A provider must be selected to save patient list settings.';
  TX_LS_TEAM = 'A team must be selected to save patient list settings.';
  TX_LS_SPEC = 'A specialty must be selected to save patient list settings.';
  TX_LS_CLIN = 'A clinic and a date range must be selected to save settings for a clinic.';
  TX_LS_WARD = 'A ward must be selected to save patient list settings.';
  TX_LS_PCMM = 'A PCMM team must be selected to save patient list settings.';
  TC_LS_FAIL = 'Unable to Save Patient List Settings';
  TX_LS_SAV1 = 'Save ';
  TX_LS_SAV2 = CRLF + 'as your default patient list setting?';
  TC_LS_SAVE = 'Save Patient List Settings';

function TagByIndex(anIndex:Integer):Integer;
begin
  case anIndex of
    0: Result := TAG_SRC_ALL;
    1: Result := TAG_SRC_WARD;
    2: Result := TAG_SRC_TEAM;
    3: Result := TAG_SRC_SPEC;
    4: Result := TAG_SRC_PROV;
    5: Result := TAG_SRC_CLIN;
    6: Result := TAG_SRC_PCMM;
    7: Result := TAG_SRC_DFLT;
  else
    Result := TAG_SRC_DFLT;
  end;
end;

function TfrmVW_PtSelOptns.IsLast5(x: string): Boolean;
{ returns true if string matchs patterns: A9999 or 9999 (BS & BS5 xrefs for patient lookup) }
var
  i: Integer;
begin
  Result := False;
  if not ((Length(x) = 4) or (Length(x) = 5)) then Exit;
  if Length(x) = 5 then
  begin
    if not CharInSet(x[1], ['A'..'Z', 'a'..'z']) then Exit;
    x := Copy(x, 2, 4);
  end;
  for i := 1 to 4 do if not CharInSet(x[i], ['0'..'9']) then Exit;
  Result := True;
end;

function TfrmVW_PtSelOptns.IsFullSSN(x: string): boolean;
var
  i: integer;
begin
  Result := False;
  if (Length(x) < 9) or (Length(x) > 12) then Exit;
  case Length(x) of
    9:  // no dashes, no 'P'
        for i := 1 to 9 do if not CharInSet(x[i], ['0'..'9']) then Exit;
   10:  // no dashes, with 'P'
        begin
          for i := 1 to 9 do if not CharInSet(x[i], ['0'..'9']) then Exit;
          if (Uppercase(x[10]) <> 'P') then Exit;
        end;
   11:  // dashes, no 'P'
        begin
          if (x[4] <> '-') or (x[7] <> '-') then Exit;
          x := Copy(x,1,3) + Copy(x,5,2) + Copy(x,8,4);
          for i := 1 to 9 do if not CharInSet(x[i], ['0'..'9']) then Exit;
        end;
   12:  // dashes, with 'P'
        begin
          if (x[4] <> '-') or (x[7] <> '-') then Exit;
          x := Copy(x,1,3) + Copy(x,5,2) + Copy(x,8,5);
          for i := 1 to 9 do if not CharInSet(x[i], ['0'..'9']) then Exit;
          if UpperCase(x[10]) <> 'P' then Exit;
        end;
  end;
  Result := True;
end;

procedure TfrmVW_PtSelOptns.radHideSrcClick(Sender: TObject);
{ called by radDflt & radAll - hides list source combo box and refreshes patient list }
begin
  cboList.Pieces := '2';
  FSrcType := TagByIndex(rgPtList.ItemIndex);
  FLastTopList := '';
  pnlDateRange.Hide;
  cboList.Visible := False;
  cboList.Caption := TRadioButton(Sender).Caption;
  if assigned(fSetCaptionTop) then
    FSetCaptionTop;
  FSetPtListTop(0);
end;

procedure TfrmVW_PtSelOptns.radShowSrcClick(Sender: TObject);
{ called by radTeams, radSpecialties, radWards - shows items for the list source }
begin
  cboList.Pieces := '2';
  FSrcType := TagByIndex(rgPtList.ItemIndex);
  FLastTopList := '';
  pnlDateRange.Hide;
  if assigned(fSetCaptionTop) then
    FSetCaptionTop;
  with cboList do
  begin
    Clear;
    LongList := False;
    Sorted := True;
    case FSrcType of
    TAG_SRC_TEAM: ListTeamAll(Items);
    TAG_SRC_SPEC: ListSpecialtyAll(Items);
    TAG_SRC_WARD: ListWardAll(Items);
//    TAG_SRC_PCMM: ListPcmmAll(Items);  // TDP - Added 5/27/2014 PCMM team
    end;
    Visible := True;
  end;
  cboList.Caption := TRadioButton(Sender).Caption;
end;

procedure TfrmVW_PtSelOptns.rgPtListClick(Sender: TObject);
begin
  inherited;
  case rgPtList.ItemIndex of
    -1: exit;
    0,7:radHideSrcClick(nil);
    1,2,3,6: radShowSrcClick(nil);
    4,5:radLongSrcClick(nil);
  end;

  rgInDepth.Visible := rgPtList.ItemIndex = 0;
end;

procedure TfrmVW_PtSelOptns.radLongSrcClick(Sender: TObject);
{ called by radProviders, radClinics - switches to long list & shows items for the list source }
begin
  cboList.Pieces := '2';
  FSrcType := TagByIndex(rgPtList.ItemIndex);
  FLastTopList := '';
  if assigned(FSetCaptionTop) then
    FSetCaptionTop;
  with cboList do
  begin
    Sorted := False;
    LongList := True;
    Clear;
    case FSrcType of
      TAG_SRC_PROV:
        begin
          cboList.Pieces := '2,3';
          pnlDateRange.Hide;
          ListProviderTop(Items);
        end;
      TAG_SRC_CLIN:
        begin
          ShowDateRange;
          ListClinicTop(Items);
        end;
    end;
    InitLongList('');
    Visible := True;
  end;
  cboList.Caption := TRadioButton(Sender).Caption;
end;

procedure TfrmVW_PtSelOptns.cboListExit(Sender: TObject);
begin
  with cboList do if ItemIEN > 0 then FSetPtListTop(ItemIEN);
end;

procedure TfrmVW_PtSelOptns.cboListKeyPause(Sender: TObject);
begin
  with cboList do if ItemIEN > 0 then FSetPtListTop(ItemIEN);
end;

procedure TfrmVW_PtSelOptns.cboListMouseClick(Sender: TObject);
begin
  with cboList do if ItemIEN > 0 then FSetPtListTop(ItemIEN);
end;

procedure TfrmVW_PtSelOptns.cboListNeedData(Sender: TObject; const StartFrom: String; Direction, InsertAt: Integer);
{CQ6363 Notes: This procedure was altered for CQ6363, but then changed back to its original form, as it is now.

The problem is that in LOM1T, there are numerous entries in the HOSPITAL LOCATION file (44) that are lower-case,
resulting in a "B" xref that looks like this:

^SC("B","module 1x",2897) =
^SC("B","pt",3420) =
^SC("B","read",3146) =
^SC("B","zz GIM/WONG NEW",2902) =
^SC("B","zz bhost/arm",3076) =
^SC("B","zz bhost/day",2698) =
^SC("B","zz bhost/eve/ornelas",2885) =
^SC("B","zz bhost/resident",2710) =
^SC("B","zz bhost/sws",2946) =
^SC("B","zz c&P ortho/patel",3292) =
^SC("B","zz mhc md/kelley",320) =
^SC("B","zz/mhc/p",1076) =
^SC("B","zzMHC MD/THRASHER",1018) =
^SC("B","zztest clinic",3090) =
^SC("B","zzz-hbpc-phone-jung",1830) =
^SC("B","zzz-hbpcphone cocohran",1825) =
^SC("B","zzz-home service",1428) =
^SC("B","zzz-phone-deloye",1834) =
^SC("B","zzz/gmonti impotence",2193) =

ASCII sort mode puts those entries at the end of the "B" xref, but when retrieved by CPRS and upper-cased, it
messes up the logic of the combo box.  This problem has been around since there was a CPRS GUI, and the best
possible fix is to require those entries to either be in all uppercase or be removed.  If that's cleaned up,
the logic below will work correctly.
}
begin
  case Self.SrcType of
  TAG_SRC_PROV: cboList.ForDataUse(SubSetOfProviders(StartFrom, Direction));
  TAG_SRC_CLIN: cboList.ForDataUse(SubSetOfClinics(StartFrom, Direction));
  end;
end;

procedure TfrmVW_PtSelOptns.ShowDateRange;
var
  DateString, DRStart, DREnd: string;
  TStart, TEnd: boolean;
begin
  with cboDateRange do if Items.Count = 0 then
  begin
    ListDateRangeClinic(Items);
    ItemIndex := 0;
  end;
  DateString := DfltDateRangeClinic; // Returns "^T" even if no settings.
  DRStart := piece(DateString,U,1);
  DREnd := piece(DateString,U,2);
  if (DRStart <> ' ') then
    begin
      TStart := false;
      TEnd := false;
      if ((DRStart = 'T') or (DRStart = 'TODAY')) then
        TStart := true;
      if ((DREnd = 'T') or (DREnd = 'TODAY')) then
        TEnd := true;
      if not (TStart and TEnd) then
        cboDateRange.ItemIndex := cboDateRange.Items.Add(DRStart + ';' +
          DREnd + U + DRStart + ' to ' + DREnd);
    end;
  pnlDateRange.Show;
end;

procedure TfrmVW_PtSelOptns.cboDateRangeExit(Sender: TObject);
begin
  if cboDateRange.ItemIndex <> FLastDateIndex then cboDateRangeMouseClick(Self);
end;

procedure TfrmVW_PtSelOptns.cboDateRangeMouseClick(Sender: TObject);
begin
  if (cboDateRange.ItemID = 'S') then
  begin
    with calApptRng do if Execute
      then cboDateRange.ItemIndex := cboDateRange.Items.Add(RelativeStart + ';' +
           RelativeStop + U + TextOfStart + ' to ' + TextOfStop)
      else cboDateRange.ItemIndex := -1;
  end;
  FLastDateIndex := cboDateRange.ItemIndex;
  if cboList.ItemIEN > 0 then FSetPtListTop(cboList.ItemIEN);
end;

procedure TfrmVW_PtSelOptns.FormCreate(Sender: TObject);
begin
  FLastDateIndex := -1;
end;

procedure TfrmVW_PtSelOptns.SetDefaultPtList(Dflt: string);
begin
  if Length(Dflt) > 0 then                   // if default patient list available, use it
  begin
    if rgPtList.Items.Count >= 8 then
      rgPtList.Items[7] := '&Default: ' + Dflt
    else
      rgPtList.Items.Add('&Default: ' + Dflt);
    rgPtList.ItemIndex := 7;
  end
  else                                       // otherwise, select from all patients
  begin
     while rgPtList.Items.Count > 7 do
       rgPtList.Items.Delete(7);
    rgPtList.TabStop := True;
    rgPtList.Hint := 'No default radio button available. Press 1 of 7 to move to the other patient list categories press tab';
    // fixes CQ #4716: 508 - No Default rad btn on Patient Selection screen doesn't read in JAWS. [CPRS v28.1] (TC).
  end;
end;

procedure TfrmVW_PtSelOptns.UpdateDefault;
begin
  FSrcType := TAG_SRC_DFLT;
end;

procedure TfrmVW_PtSelOptns.SaveSettings;
var
  x: string;
begin
  x := '';
  case FSrcType of
  TAG_SRC_DFLT: InfoBox(TX_LS_DFLT, TC_LS_FAIL, MB_OK);
  TAG_SRC_PROV: if cboList.ItemIEN <= 0
                  then InfoBox(TX_LS_PROV, TC_LS_FAIL, MB_OK)
                  else x := 'P^' + IntToStr(cboList.ItemIEN) + U + U +
                            'Provider = ' + cboList.Text;
  TAG_SRC_TEAM: if cboList.ItemIEN <= 0
                  then InfoBox(TX_LS_TEAM, TC_LS_FAIL, MB_OK)
                  else x := 'T^' + IntToStr(cboList.ItemIEN) + U + U +
                            'Team = ' + cboList.Text;
  TAG_SRC_SPEC: if cboList.ItemIEN <= 0
                  then InfoBox(TX_LS_SPEC, TC_LS_FAIL, MB_OK)
                  else x := 'S^' + IntToStr(cboList.ItemIEN) + U + U +
                            'Specialty = ' + cboList.Text;
  TAG_SRC_CLIN: if (cboList.ItemIEN <= 0) or (Pos(';', cboDateRange.ItemID) = 0)
                  then InfoBox(TX_LS_CLIN, TC_LS_FAIL, MB_OK)
                  else
                    begin
                      clinDefaults := 'Clinic = ' + cboList.Text + ',  ' + cboDaterange.text;
//                      frmPtSelOptSave := TfrmPtSelOptSave.create(Application); // Calls dialogue form for user input.
//                      frmPtSelOptSave.showModal;
//                      frmPtSelOptSave.free;
//                      if (not clinDoSave) then
//                        Exit;
//                      if clinSaveToday then
//                        x := 'CT^' + IntToStr(cboList.ItemIEN) + U + cboDateRange.ItemID + U +
//                            'Clinic = ' + cboList.Text + ',  ' +  cboDateRange.Text
//                      else
//                        x := 'C^' + IntToStr(cboList.ItemIEN) + U + cboDateRange.ItemID + U +
//                            'Clinic = ' + cboList.Text + ',  ' +  cboDateRange.Text;
                      case getSaveChoice(clinDefaults) of
                        -1: Exit;
                        1:
                        x := 'CT^' + IntToStr(cboList.ItemIEN) + U + cboDateRange.ItemID + U +
                            'Clinic = ' + cboList.Text + ',  ' +  cboDateRange.Text
                      else
                        x := 'C^' + IntToStr(cboList.ItemIEN) + U + cboDateRange.ItemID + U +
                            'Clinic = ' + cboList.Text + ',  ' +  cboDateRange.Text;
                      end;
                    end;
  TAG_SRC_WARD: if cboList.ItemIEN <= 0
                  then InfoBox(TX_LS_WARD, TC_LS_FAIL, MB_OK)
                  else x := 'W^' + IntToStr(cboList.ItemIEN) + U + U +
                            'Ward = ' + cboList.Text;
  TAG_SRC_ALL : x := 'A';
  end;
  if (x <> '') then
    begin
      if not (FSrcType = TAG_SRC_CLIN) then // Clinics already have a "confirm" d-box.
        begin
          if (InfoBox(TX_LS_SAV1 + Piece(x, U, 4) + TX_LS_SAV2, TC_LS_SAVE, MB_YESNO) = IDYES) then
            begin
              SavePtListDflt(x);
              UpdateDefault;
            end;
        end
      else // Skip second confirmation box for clinics.
        begin
          SavePtListDflt(x);
          UpdateDefault;
        end;
    end;
end;

procedure TfrmVW_PtSelOptns.Init;
begin
  if rgPtList.ItemIndex < 0 then
    rgPtList.ItemIndex := 0;
  rgPtList.Buttons[6].Enabled := false; //tmp
end;

procedure TfrmVW_PtSelOptns.setFontSize(aSize: Integer);
var
  i: Integer;
begin
  Self.Font.Size := aSize;

  i := getMainFormTextHeight;

  rgPtList.Height := (i + 2) * 5;
  rgInDepth.Height := (i + 2) * 4;

  i := getMainFormTextWidth('Team/Personal');
  self.Width := i * 3 + 8;
end;

initialization
  SpecifyFormIsNotADialog(TfrmVW_PtSelOptns);

end.
