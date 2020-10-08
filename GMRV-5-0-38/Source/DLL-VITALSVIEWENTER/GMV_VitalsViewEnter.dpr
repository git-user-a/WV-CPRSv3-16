library GMV_VitalsViewEnter;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  TRPCB,
  CCOWRPCBroker,
  Dialogs,
  Forms,
  Controls,
  System.UITypes,
  fGMV_PatientVitals in '..\VitalsView\fGMV_PatientVitals.pas' {frmVitals} ,
  fGMV_ShowSingleVital in '..\VitalsView\fGMV_ShowSingleVital.pas' {frmGMV_ShowSingleVital} ,
  fGMV_DateRange in '..\VitalsCommon\fGMV_DateRange.pas' {frmGMV_DateRange} ,
  uGMV_GlobalVars in '..\VitalsUtils\uGMV_GlobalVars.pas',
  uGMV_Const in '..\VitalsUtils\uGMV_Const.pas',
  uGMV_User in '..\VitalsCommon\uGMV_User.pas',
  uGMV_FileEntry in '..\VitalsCommon\uGMV_FileEntry.pas',
  uGMV_Utils in '..\VitalsUtils\uGMV_Utils.pas',
  fGMV_InputLite in '..\VitalsDataEntry\fGMV_InputLite.pas' {frmGMV_InputLite} ,
  mGMV_Lookup in '..\VitalsDataEntry\mGMV_Lookup.pas' {fraGMV_Lookup: TFrame} ,
  uGMV_Template in '..\VitalsDataEntry\uGMV_Template.pas',
  mGMV_InputOne2 in '..\VitalsDataEntry\mGMV_InputOne2.pas' {fraGMV_InputOne2: TFrame} ,
  fGMV_SupO2 in '..\VitalsDataEntry\fGMV_SupO2.pas' {frmGMV_SupO2} ,
  fGMV_Qualifiers in '..\VitalsDataEntry\fGMV_Qualifiers.pas' {frmGMV_Qualifiers} ,
  uGMV_QualifyBox in '..\VitalsDataEntry\uGMV_QualifyBox.pas',
  uGMV_SaveRestore in '..\VitalsCommon\uGMV_SaveRestore.pas',
  fGMV_DateTimeDLG in '..\VitalsCommon\fGMV_DateTimeDLG.pas' {fGMV_DateTime} ,
  fGMV_PtSelect in '..\VitalsPatient\fGMV_PtSelect.pas' {frmGMV_PtSelect} ,
  uGMV_VitalTypes in '..\VitalsCommon\uGMV_VitalTypes.pas',
  uGMV_Patient in '..\VitalsCommon\uGMV_Patient.pas',
  mGMV_MDateTime in '..\VitalsCommon\mGMV_MDateTime.pas',
  uGMV_Common in '..\VitalsUtils\uGMV_Common.pas',
  mGMV_GridGraph in '..\VitalsView\mGMV_GridGraph.pas' {fraGMV_GridGraph: TFrame} ,
  uGMV_VersionInfo in '..\VitalsUtils\uGMV_VersionInfo.pas',
  fROR_PCall in '..\ROR\fROR_PCall.pas' {RPCErrorForm} ,
  uROR_RPCBroker in '..\ROR\uROR_RPCBroker.pas',
  uVHA_ATE740X in '..\VS_Monitors\uVHA_ATE740X.pas',
  RS232 in '..\VS_Monitors\RS232.pas',
  fGMV_InputTemp in '..\VitalsDataEntry\fGMV_InputTemp.pas' {frmGMV_InputTemp} ,
  uGMV_Engine in '..\VitalsUtils\uGMV_Engine.pas',
  uGMV_EXEVersion in '..\VitalsUtils\uGMV_EXEVersion.pas',
  uGMV_Setup in '..\VitalsCommon\uGMV_Setup.pas',
  fGMV_EnteredInError in '..\VitalsDataEntry\fGMV_EnteredInError.pas' {frmGMV_EnteredInError} ,
  uGMV_DLLCommon in '..\VitalsUtils\uGMV_DLLCommon.pas',
  fGMV_PtInfo in '..\VitalsPatient\fGMV_PtInfo.pas' {fraGMV_PatientInfo} ,
  fGMV_AboutDlg in '..\VitalsCommon\fGMV_AboutDlg.pas' {frmGMV_AboutDlg} ,
  fGMV_Info in '..\VitalsView\fGMV_Info.pas' {frmGMV_Info} ,
  fGMV_HospitalSelector2 in '..\VitalsCommon\fGMV_HospitalSelector2.pas' {frmGMV_HospitalSelector2} ,
  fGMV_RPCLog in '..\VitalsCommon\fGMV_RPCLog.pas' {frmGMV_RPCLog} ,
  fGMV_SelectColor in '..\VitalsCommon\fGMV_SelectColor.pas' {frmGMV_SelectColor} ,
  fGMV_UserSettings in '..\VitalsCommon\fGMV_UserSettings.pas' {frmGMV_UserSettings} ,
  uGMV_CRC32 in '..\VitalsUtils\uGMV_CRC32.pas',
  uXML in '..\VitalsUtils\uXML.pas',
  uGMV_Monitor in '..\VS_Monitors\uGMV_Monitor.pas',
  mGMV_DefaultSelector in '..\VITALSCOMMON\mGMV_DefaultSelector.pas' {frDefaultSelector: TFrame} ,
  uGMV_RPC_Names in '..\VITALSCOMMON\uGMV_RPC_Names.pas',
  uGMV_Log in '..\VITALSCOMMON\uGMV_Log.pas',
  uGMV_WindowsEvents in '..\VITALSCOMMON\uGMV_WindowsEvents.pas',
  uGMV_AppVersion in '..\VITALSCOMMON\uGMV_AppVersion.pas',
  U_HelpMGR in '..\VITALSCOMMON\U_HelpMGR.pas';

{$R *.res}


/// /////////////////////////////////////////////////////////////////////////////
procedure VitalsExit; export; stdcall;
begin
  Application.Terminate;
  // if Assigned(frmVitals) then
  // try
  // frmVitals.ModalResult := mrCancel;
  // except
  // end;
end;

function CheckVersion: Integer;
var
  sName: String;
  sPrevName: String;
begin
  Result := 0;

  with TVersionInfo.Create(Application) do
    try
      OpenFile(GetModuleName(HInstance));
      sName := FileVersion;
      sPrevName := PreviousVersion;
    finally
      free;
    end;
  // sName := CurrentDllNameAndVersion;
  // sPrevName := PrevDllNameAndVersion;
  if (getDLLInfo(sName) <> 'YES') and (getDLLInfo(sPrevName) <> 'YES') then
    begin
      ShowMessage(
        '       This version of the Vitals Viewer (' + sName + ')' + #13#10 +
        '               is not compatible with the server software.' + #13#10#13#10 +
        'Please contact IRM to update the GMV_VitalsViewEnter.dll file.');
      Result := -1;
    end;
  CheckBrokerFlag := getSystemParameterByName('CHECKBROKERSTATUS') = 'TRUE';
end;

procedure setTimeOut(aSeconds: Integer); export; stdcall;
begin
  // UpdateTimeOutInterval(aSeconds); // requires fGMV_TimeOutManager;
end;

/// /////////////////////////////////////////////////////////////////////////////
// This will be used by CPRS
/// /////////////////////////////////////////////////////////////////////////////

function VitalsViewDLG( // called from Coversheet of the CPRS
  const aBroker: TRPCBroker;
  aDFN, // '72'
  aLocation, // '36'
  DateStart, // '04/30/05'
  DateStop, // '10/31/05'
  aSignature, // 'CPRS'
  aContextIn, // 'OR CPRS GUI CHART'
  aContextOut, // 'OR CPRS GUI CHART'
  aName, // 'SKYWALKER, LUKE'
  anInfo, // '555-11-2222'
  aHospitalName: String): Integer; export; stdcall; // 'MICU^P
var
  anItem: TRPCEventItem;
begin
  { WindowsLogLine(
    'VtalsViewDLG  '+ ' ' +#13#10+
    'DFN:        '+aDFN + ' ' +#13#10+
    'Location:   '+aLocation+ ' ' +#13#10+
    'Date Start: '+DateStart + ' ' +#13#10+
    'Date Stop:  '+DateStop + ' ' +#13#10+
    'Signature:  '+aSignature + ' ' +#13#10+
    'Context In: '+aContextIn+ ' ' +#13#10+
    'Context Out:'+aContextOut+ ' ' +#13#10+
    //    'Name:       '+aName+ ' ' +#13#10+
    //    'Info:       '+anInfo+ ' ' +#13#10+
    'Hospital:  '+aHospitalName); }// ZZZZZZBELLC  REMED OUT AFTER CALL WITH ANDREY. THIS WAS USED FOR TESTNG
    // zzzzzzandria 2008-02-06 =============================================== begin
    anItem := getRPCEventItem(Now, Now,
    'VtalsViewDLG',
    ['DFN:        '+aDFN,
    'Location:   '+aLocation,
    'Date Start: '+DateStart,
    'Date Stop:  '+DateStop,
    'Signature:  '+aSignature,
    'Context In: '+aContextIn,
    'Context Out:'+aContextOut,
    'Name:       '+aName,
    'Info:       '+anInfo,
    'Hospital:  '+aHospitalName],
    nil,
    [],
    nil
    );
  RPCLog.InsertObject(0, FormatDateTime('hh:mm:ss.zzz', Now) + '   ' + 'VitalsViewDLG', anItem);
  // zzzzzzandria 2008-02-06 ================================================= end

  // called from Coversheet of the CPRS
  // no need to tweak the timeout since Application.Terminate is working
  // InitTimeOut(nil);

  RPCBroker := TCCOWRPCBroker(aBroker);
  RPCBroker.ClearParameters := True;
  RPCBroker.ClearResults := True;

  Result := -1;
  if CheckVersion < 0 then
    Exit;

  if (aContextIn <> '') and not CreateContext(aContextIn) then
    begin
      MessageDLG('You do not have the <' + aContextIn + '> options' + #13 +
        'Please contact IRMS', mtError, [mbOK], 0);
      Result := -1;
      Exit;
    end
  else
    begin
      Result := ProcessInPatientVitals(aDFN, aLocation, DateStart, DateStop, aSignature, aName, anInfo, aHospitalName);
      if (aContextOut <> '') and not aBroker.CreateContext(aContextOut) then
        begin
          MessageDLG('You do not have the <' + aContextOut +
            'options' + #13 + 'Please contact IRMS', mtError, [mbOK], 0);
          Result := -2;
        end;
    end;
  // ShutDownTimeOut;
  WindowsLogLine('VtalsViewDLG: OK');
end;

/// /////////////////////////////////////////////////////////////////////////////

function VitalsEnterDLG(
  const aBroker: TRPCBroker;
  aPatient, // '72'
  aLocation, // '36'
  aTemplate, // ''
  aSignature: String; // 'CPRS'
  aDateTime: TDateTime; // 38656.59678
  aPatientName, // 'SKYWALKER, LUKE'
  aPatientInfo: String): Integer; export; stdcall; // ' 555-11-2222 May 20, 1966 (39)
var
  anItem: TRPCEventItem;
begin
  // zzzzzzandria 2008-02-06 =============================================== begin
  anItem := getRPCEventItem(Now, Now,
    'VtalsEnterDLG',
    ['DFN:       ' + aPatient,
    'Location:   ' + aLocation,
    'Template:   ' + aTemplate,
    'Signature:  ' + aSignature,
    'DateTime:   ' + FloatToStr(aDateTime),
    'Name:       ' + aPatientName,
    'Info:       ' + aPatientInfo],
    nil,
    [],
    nil
    );

  RPCLog.InsertObject(0, FormatDateTime('hh:mm:ss.zzz', Now) + '   ' +
    'VitalsEnterDLG',
    anItem);
  // zzzzzzandria 2008-02-06 ================================================= end
  Result := -1;
  if CheckVersion < 0 then
    Exit;

  if aLocation = '' then
    begin
      MessageDLG('Unknown patient location.' + #13 + #10 + 'Please select location prior to entering Vitals', mtError, [mbOK], 0);
      Exit;
    end;
  try
    RPCBroker := TRPCBroker(aBroker);

    RPCBroker.ClearParameters := True;
    RPCBroker.ClearResults := True;

    Result := VitalsInputDLG(
      aPatient,
      aLocation,
      aTemplate,
      aSignature,
      aDateTime,
      aPatientName,
      aPatientInfo
      );
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

/// //////////////////////////////////////////////////////////////////////////

function VitalsEnterForm(const aBroker: TRPCBroker; aDFN, aLocation, aTemplate, aSignature: String; aDateTime: TDateTime): TfrmGMV_InputLite; export; stdcall;
begin
  RPCBroker := TRPCBroker(aBroker);

  RPCBroker.ClearParameters := True;
  RPCBroker.ClearResults := True;

  Result := nil;
  if CheckVersion < 0 then
    Exit;

  Result := VitalsInputForm(aDFN, aLocation, aTemplate, aSignature, aDateTime);
end;

function getVitalsViewForm(
  const aBroker: TRPCBroker;
  aDFN,
  aLocation,
  DateStart,
  DateStop,
  aSignature,
  aContextIn,
  aContextOut,
  aName,
  anInfo,
  aHospitalName: String): TfrmVitals; export; stdcall;
begin
  RPCBroker := TCCOWRPCBroker(aBroker);
  RPCBroker.ClearParameters := True;
  RPCBroker.ClearResults := True;

  Result := nil;
  if CheckVersion < 0 then
    Exit;

  Result := getVitalsForm(aDFN, aLocation, DateStart, DateStop,
    aSignature, aName, anInfo, aHospitalName);
end;

function LatestVitalsList(const aBroker: TRPCBroker; aPatient, aDelim: String; bSilent: Boolean): TStringList; export; stdcall;
var
  bParams, bResults: Boolean;
begin
  bParams := aBroker.ClearParameters;
  bResults := aBroker.ClearResults;

  RPCBroker := TCCOWRPCBroker(aBroker);
  RPCBroker.ClearParameters := True;
  RPCBroker.ClearResults := True;

  Result := nil;
  if CheckVersion >= 0 then
    Result := GetLatestVitals(aPatient, aDelim, bSilent);

  aBroker.ClearParameters := bParams;
  aBroker.ClearResults := bResults;
end;

/// /////////////////////////////////////////////////////////////////////////////

exports
  VitalsEnterDLG name 'GMV_VitalsEnterDLG', // VitalsInputDLG  - fGMV_InputLite
  VitalsViewDLG name 'GMV_VitalsViewDLG', // ProcessInPatientVitals - frmPatientVitals
  getVitalsViewForm name 'GMV_VitalsViewForm', // getVitalsForm - frmPatientVitals
  VitalsEnterForm name 'GMV_VitalsEnterForm', // VitalsInputForm  - fGMV_InputLite
  VitalsExit name 'GMV_VitalsExit', // Application.Terminate
  LatestVitalsList name 'GMV_LatestVitalsList'; // GetLatestVitals - fGMV_InputLite

begin

  (*
    There library GMV_VitalsViewEnter includes 6 functions:

    'GMV_VitalsExit'       - procedure
    'GMV_VitalsEnterDLG'   - function
    'GMV_VitalsViewDLG'    - function
    'GMV_VitalsViewForm'   - function
    'GMV_VitalsEnterForm'  - function
    'GMV_LatestVitalsList' - function

    procedure GMV_VitalsExit;export;stdcall;
    - no parameters.
    Does not used in CPRS

    function GMV_VitalsViewDLG(
    const aBroker:TRPCBroker;
    aDFN,
    aLocation,
    DateStart,
    DateStop,
    aSignature,
    aContextIn,
    aContextOut,
    aName,
    anInfo,
    aHospitalName: String):Integer;export;stdcall;

    Created the Vitals View window and shows it as the modal dialog.
    Returns the result of the modal dialog.
    Parameters:
    aBroker: TRPCBroker - an nstance of the TRPCBroker to be used for RPC execution
    aDFN: String - the patient DFN
    aLocation: String - the location ID
    DateStart: String - date "From" Windows format
    DateStop: String - date "To" - Windows format
    aSignature: String - string identifying the calling application
    aContextIn: String - the application context to be set up at startup of the function
    aContextOut: String - the application context to be set up on exit of the function
    aName: String - patient Name
    anInfo: String - Patient info
    aHospitalName: String - contains 2 parts delimited by '^'.
    First part contains the hospital name, second - the abbreviation of
    the Vitals sign to be selected at the start up
    Result Type: Integer;


    function GMV_VitalsEnterForm(
    const aBroker:TRPCBroker;
    aDFN,
    aLocation,
    aTemplate,
    aSignature: String;
    aDateTime:TDateTime):TfrmGMV_InputLite;export;stdcall;

    Creates the Vitals Input form and returns it to the calling application
    Parameters:
    aBroker: TRPCBroker - an nstance of the TRPCBroker to be used for RPC execution
    aDFN: String - the patient DFN
    aLocation: String - the location ID
    aTemplate: String - the template ID to be used
    aSignature: String - string identifying the calling application
    aDateTime: TDateTime - date to be used for the input
    Result type TfrmGMV_InputLite

    function GMV_VitalsViewForm(
    const aBroker:TRPCBroker;
    aDFN,
    aLocation,
    DateStart,
    DateStop,
    aSignature,
    aContextIn,
    aContextOut,
    aName,
    anInfo,
    aHospitalName: String):TfrmVitals;export;stdcall;

    Created the Vitals View window and returns it to the calling application
    Parameters:
    aBroker: TRPCBroker - an nstance of the TRPCBroker to be used for RPC execution
    aDFN: String - the patient DFN
    aLocation: String - the location ID
    DateStart: String - date "From" Windows format
    DateStop: String - date "To" - Windows format
    aSignature: String - string identifying the calling application
    aContextIn: String - the application context to be set up at startup of the function
    aContextOut: String - the application context to be set up on exit of the function
    aName: String - patient Name
    anInfo: String - Patient info
    aHospitalName: String - contains 2 parts delimited by '^'.
    First part contains the hospital name, second - the abbreviation of
    the Vitals sign to be selected at the start up
    Result: TfrmVitals;

    function  GMV_LatestVitalsList(
    const aBroker:TRPCBroker;
    aPatient,
    aDelim:String;
    bSilent:Boolean):TStringList;export;stdcall;

    Returns the list of strings with the set of latest Vitals signs for the patient;
    Parameters:
    aBroker: TRPCBroker - an nstance of the TRPCBroker to be used for RPC execution
    aPatient: String - the patient DFN
    aDelim: String - reserved
    bSilent: Boolean - if True no error messages will be generated
    Result Type: TStringList

  *)

end.
