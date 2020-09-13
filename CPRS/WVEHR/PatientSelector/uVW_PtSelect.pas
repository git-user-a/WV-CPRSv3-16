unit uVW_PtSelect;

interface

uses
  Forms, fVW_PtSelect, fVW_PtSelOptns;

function WV_SelectPatient:Integer;
procedure WV_UpdatePatient(aDFN:String);

implementation
uses
  ORFn,
  rCore,
  uCore,
  UBACore,
  uBAGlobals,
  System.SysUtils,
  Vcl.COntrols
  ;

var
  _PtSelector: TfrmVW_PtSelect;

//function _SelectPatient:Integer;

  procedure WV_UpdatePatient(aDFN:String);
  begin

    // 9/23/2002: Code used to check for changed pt. DFN here, but since same patient could be
    // selected twice in diff. Encounter locations, check was removed and following code runs
    // no matter; in fFrame code then updates Encounter display if Encounter.Location has changed.
    // NOTE: Some pieces in RPC returned arrays are modified/rearranged by ListPtByDflt call in rCore!
    Patient.DFN := aDFN; // The patient object in uCore must have been created already!
    Encounter.Clear;
    Changes.Clear; // An earlier call to ReviewChanges should have cleared this.

    if assigned(_PtSelector) then
    with _PtSelector, _PtSelector._Options do
    begin
      if (SrcType = TAG_SRC_CLIN) and (cboList.ItemIEN > 0) and
        IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 4)) then
      // Clinics, not by default.
      begin
        Encounter.Location := cboList.ItemIEN;
        with cboPatient do
          Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 4));
      end
      else if (SrcType = TAG_SRC_DFLT) and (DfltPtListSrc = 'C') and
        IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 4)) then
        with cboPatient do // "Default" is a clinic.
        begin
          Encounter.Location := StrToIntDef(Piece(Items[ItemIndex], U, 10), 0);
          // Piece 10 is ^SC( location IEN in this case.
          Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 4));
        end
      else if ((SrcType = TAG_SRC_DFLT) and (DfltSrc = 'Combination') and
        (copy(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 3), 1, 2) = 'Cl')
        ) and (IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 8)))
      then
        with cboPatient do // "Default" combination, clinic pt.
        begin
          Encounter.Location := StrToIntDef(Piece(Items[ItemIndex], U, 7), 0);
          // Piece 7 is ^SC( location IEN in this case.
          Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 8));
        end
      else if Patient.Inpatient then // Everything else:
      begin
        Encounter.Inpatient := True;
        Encounter.Location := Patient.Location;
        Encounter.DateTime := Patient.AdmitTime;
        Encounter.VisitCategory := 'H';
      end;
//      if User.IsProvider then
//        Encounter.Provider := User.DUZ;

    end;

      if User.IsProvider then
        Encounter.Provider := User.DUZ;

  GetBAStatus(Encounter.Provider,Patient.DFN);
  //HDS00005025
  if BILLING_AWARE then
    if Assigned(UBAGLOBALS.BAOrderList) then UBAGLOBALS.BAOrderList.Clear;

  end;

function WV_SelectPatient:Integer;
begin
  Result := mrCancel;
  if not assigned(_PtSelector) then
    Application.CreateForm(TfrmVW_PtSelect,_PtSelector);
  try
    if not assigned(_PtSelector) then
      exit;
    _PtSelector.setFontSize(Application.MainForm.Font.Size);
    Result := _PtSelector.ShowModal;
    if Result = mrOK then
      WV_UpdatePatient(_PtSelector.selectedDFN);
  except
  end;
end;

end.
