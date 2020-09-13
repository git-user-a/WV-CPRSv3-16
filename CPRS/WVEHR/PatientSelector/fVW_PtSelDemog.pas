unit fVW_PtSelDemog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ORCtrls, fBase508Form, VA508AccessibilityManager,
  Vcl.ComCtrls;

type
  TfrmVW_PtDemog = class(TfrmBase508Form)
    Memo: TCaptionMemo;
    pnlMain: TPanel;
    lvPtDemog: TListView;
    procedure FormShow(Sender: TObject);
    procedure MemoEnter(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvPtDemogResize(Sender: TObject);
  private
    FLastDFN: string;
  public
    procedure ClearIDInfo;
    procedure ShowDemog(ItemID: string);
    procedure ToggleMemo;
    procedure InitData(aList:TStringList);
  end;


implementation

uses rCore, VA508AccessibilityRouter, uCombatVet, ORFn;

{$R *.DFM}

const
{ constants referencing the value of the tag property in components }
  UNKNOWN      = 'unknown'; // ...?';

procedure TfrmVW_PtDemog.ClearIDInfo;
{ clears controls with patient ID info }
begin
  FLastDFN := '';
  Memo.Clear;
  lvPtDemog.Clear;
end;

procedure TfrmVW_PtDemog.ShowDemog(ItemID: string);
{ gets a record of patient indentifying information from the server and displays it }
var
  PtRec: TPtIDInfo;
  sCombat:String;

  function CombatInfo(anID:String):String;
  var
    CV : TCombatVet;
  begin
    Result := '';
    CV := TCombatVet.Create(anID);
    if CV.IsEligible then
      Result := CV.ExpirationDate + ' ' + CV.OEF_OIF;
    CV.Free;
  end;

  function getDOB(aDob:String):String;
  var
    d:Real;
  begin
      d := StrToFloatDef(aDOB, -1);
      if d < 0 then
        Result := aDob
      else
        begin
          d := FMDateTimeToDateTime(d);
          Result := FormatDateTime('MMM dd, YYYY',d);
        end;
  end;

  procedure setPtDemog(aData: TptIDInfo);
  var
    sl: TStringList;
  begin
    sl := TStringList.Create;
    with aData do
      begin
        sl.Add('Name^'+Name);
        sl.Add('SSN^'+SSN);
        sl.Add('DOB^'+getDob(DOB));
        sl.Add('Sex^'+Sex);
        sl.Add('Age^'+Age);
        sl.Add('Location^'+Location);
        sl.Add('Room/Bed^'+RoomBed);
        if sCombat <> '' then
          sl.Add('CV^' + sCombat);
        if HRN <> '' then
          sl.Add('HRN^'+HRN);
        if altHRN <> '' then
          sl.Add('Alt HRN^'+altHRN);
      end;
    InitData(sl);
    sl.Free;
  end;

  procedure setLabels(aName,aValue:TStaticText;aText:String;aHide:Boolean = false);
  begin
    if aText = '' then
      aValue.Caption := UNKNOWN;

    if aHide then
      begin
        aName.Visible := aText <> '';
        aValue.Visible := aText <> '';
      end;
  end;

begin
  if ItemID = FLastDFN then Exit;

  Memo.Clear;

  FLastDFN := ItemID;

  PtRec := GetPtIDInfo(ItemID);

  sCombat := CombatInfo(ItemID);

  setPtDemog(PtRec);

  with PtRec do
  begin
    Memo.Lines.Add(Name);
    Memo.Lines.Add('SSN ' + SSN + '.');
    Memo.Lines.Add('DOB ' + DOB + '.');
    if Sex <> '' then
      Memo.Lines.Add(Sex + '.');
    if Vet <> '' then
      Memo.Lines.Add(Vet + '.');
    if SCsts <> '' then
      Memo.Lines.Add(SCsts + '.');
    if Location <> '' then
      Memo.Lines.Add('Location ' + Location + '.');
    if RoomBed <> '' then
      Memo.Lines.Add('Room/Bed ' + RoomBed + '.');
  end;
  if sCombat <> '' then
    Memo.Lines.Add('CV ' + sCombat);

  Memo.SelectAll;

  if ScreenReaderSystemActive then
  begin
    Memo.SelStart := 0;
    GetScreenReader.Speak('Selected Patient Demographics');
    GetScreenReader.Speak(Memo.Text);
  end;

end;

procedure TfrmVW_PtDemog.ToggleMemo;
{ toggle Memo visibility }
begin
  if Memo.Visible then
  begin
    Memo.Hide;
  end
  else
  begin
    Memo.Show;
    Memo.BringToFront;
  end;
end;

procedure TfrmVW_PtDemog.FormShow(Sender: TObject);
begin
  inherited;
  lvPtDemogResize(nil);
end;

procedure TfrmVW_PtDemog.lvPtDemogResize(Sender: TObject);
begin
  inherited;
  lvPtDemog.Columns[0].Width := 80;
  lvPtDemog.Columns[1].Width := lvPtDemog.Width -
    lvPtDemog.Columns[0].Width - 8;
end;

procedure TfrmVW_PtDemog.MemoEnter(Sender: TObject);
/// reads the Memo contents if the Screenreader is active
begin
  inherited;
  if ScreenReaderSystemActive then
  begin
    Memo.SelStart := 0;
    GetScreenReader.Speak('Selected Patient Demographics');
    GetScreenReader.Speak(Memo.Text);
  end;
end;

procedure TfrmVW_PtDemog.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
/// notifies on position in the Memo if the Screenreader is active
begin
  inherited;
  if ScreenReaderSystemActive then
  begin
    if Memo.SelStart = Memo.GetTextLen then
      if ((Key = VK_DOWN) or (Key = VK_RIGHT)) then GetScreenReader.Speak('End of Data');
    if Memo.SelStart = 0 then
      if ((Key = VK_UP) or (Key = VK_LEFT)) then GetScreenReader.Speak('Start of Data')
  end;
end;

procedure TfrmVW_PtDemog.InitData(aList: TStringList);
var
  s: String;
  li: TListItem;
begin
  if not assigned(aList) then
    exit;
  lvPtDemog.Items.Clear;

  for s in aList do
    begin
      if pos('^',s) < 1 then
        continue;

      li := lvPtDemog.Items.Add;
      li.Caption := piece(s,'^',1);
      li.SubItems.Add(piece(s,'^',2));
    end;

end;

initialization
  SpecifyFormIsNotADialog(TfrmVW_PtDemog);

end.
