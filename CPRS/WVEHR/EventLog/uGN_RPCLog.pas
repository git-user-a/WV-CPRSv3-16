unit uGN_RPCLog;

interface
uses
  Dialogs, Forms, Classes, System.SysUtils, System.Types, Graphics;

function RPCLogExists:Boolean;
procedure RPCLogInit;
procedure RPCLogClose;
procedure AddLogLine(aLine, aTitle: string; bLoud: Boolean = true);
procedure AddFlag(aText,aTitle: string);
procedure ShowBroker; overload;
procedure ShowBroker(RR:TRect); overload;
procedure RPCLogNext;
procedure RPCLogPrev;
procedure RPCLogSaveAll;
procedure RPCLogDump;
procedure DebugShowServer;
function RPCLogDefaultFileName:TFileName;
procedure RPCLogSetFontSize(aSize:Integer);

var
  RPCLog_SaveAvailable: Boolean; // If TRUE saving of the Log is available
  RPCLog_TrackForms: Boolean; // If TRUE Forms events are tracked
  RPCLog_SaveOnExit: Boolean; // If TRUE Log will be saved by RPCLogClose
  RPCLog_Chronological: Boolean; // If TRUE the oldest record is on the top

  RPCLog_clFlag: Integer = clBlue;
  RPCLog_clItem: Integer = clBlue;
  RPCLog_clTarget: Integer = clRed;

  RPCLog_bgclTarget: Integer = clYellow;
  RPCLog_bgclFlag: Integer = clInfoBk;
  RPCLog_bgclItem: Integer = clInactiveCaption;

const

  RPCLog_Title = 'RPC Log';

  RPCLog_Prefix = '--- ';
  RPCLog_ItemBegin = {RPCLog_Prefix +} '<<< ';
  RPCLog_ItemEnd = {RPCLog_Prefix +} '>>>';

  RPCLog_Flag = RPCLog_Prefix + '���������';
  RPCLog_ItemExport = RPCLog_Prefix + '---  ';
  RPCLog_OnActivate = RPCLog_Prefix + 'Activate ';
  RPCLog_OnDeactivate = RPCLog_Prefix + 'Deactivate ';
  RPCLog_OnCreate = RPCLog_Prefix + 'Create ';
  RPCLog_OnHide = RPCLog_Prefix + 'Hide ';
  RPCLog_Onshow = RPCLog_Prefix + 'Show ';
  RPCLog_OnClose = RPCLog_Prefix + 'Close ';
  RPCLog_OnDestroy = RPCLog_Prefix + 'Destroy ';
  RPCLog_Import = RPCLog_Prefix + '--- IMPORT ---';
  RPCLog_Export = RPCLog_Prefix + '--- EXPORT ---';

implementation

uses
  VAUtils, WinApi.SHFolder, Windows, fEventLog
  ;

var
  RPCLog_Enabled: Boolean; // Indicates the Log is available


function RPCLogExists:Boolean;
begin
  Result := Assigned(frmRPCLog);
end;

procedure RPCLogInit;
// Create the Log window, updates RPCLog_Enabled flag
begin
  if not Assigned(frmRPCLog) then
    try
      frmRPCLog := TfrmRPCLog.Create(Application);
    except
      on E: Exception do
      begin
        ShowMessage('RPC Log: ' + #10#13#10#13 + E.Message);
        if Assigned(frmRPCLog) then
          frmRPCLog.Free;
        frmRPCLog := nil;
      end;
    end;

  RPCLog_Enabled := Assigned(frmRPCLog);
end;

procedure RPCLogClose;
// Destroys the Log window, updates RPCLog_Enabled flag
begin
  RPCLogSaveAll;
  if Assigned(frmRPCLog) then
    begin
      frmRPCLog.Free;
      frmRPCLog := nil;
    end;
  RPCLog_Enabled := Assigned(frmRPCLog);
end;

procedure AddLogLine(aLine, aTitle: string; bLoud: Boolean = true);
// Adds record to the Log. Does nothing if the bLoud is False
var
  sl: TStringList;
begin
  if not bLoud then
    Exit;

  if not RPCLog_Enabled then
    exit;

  sl := TStringList.Create;
  sl.Text := aLine;
  if assigned(frmRPCLog) then
    frmRPCLog.addLogItem(aTitle, aTitle, sl);
end;

procedure AddFlag(aText,aTitle: string);
// Adds Flag record to the Log
var
  s: String;
begin
  if not RPCLog_Enabled then
    exit;

  s := RPCLog_Flag + ' ' + aTitle;
  if aText = '' then
    aText := aTitle;
  AddLogLine(aTitle, s);
end;

procedure ShowBroker(RR:TRect);
// Opens Log Window in specified position
var
  b: Boolean;
begin
  b := RPCLogExists;
  RPCLogInit;
  if Assigned(frmRPCLog) then
  begin
    if (RR.Top<> RR.Bottom) and (RR.Left <> RR.Right) then
      begin
        frmRPCLog.Top := RR.Top;
        frmRPCLog.Left := RR.Left;
        if Screen.MonitorCount > 0 then
          frmRPCLog.Height := RR.Bottom - RR.Top
        else
          frmRPCLog.Height := Screen.DesktopHeight;
        frmRPCLog.Width := RR.Right;
      end;
    frmRPCLog.Show;
    frmRPCLog.BringToFront;
    if not b then
      frmRPCLog.acToTheLeft.Execute;
  end;
end;

procedure ShowBroker;
// Opens Log Window in the default position
var
  RR: TRect;
begin
  RR.Top := 0;
  RR.Bottom := 0;
  RR.Left := 0;
  RR.Right := 0;
  ShowBroker(RR);
end;

procedure RPCLogNext;
// Scrolls log to the next record
begin
  if Assigned(frmRPCLog) then
    frmRPCLog.doNext;
end;

procedure RPCLogPrev;
// Scrolls log to the previous record
begin
  if Assigned(frmRPCLog) then
    frmRPCLog.doPrev;
end;

procedure RPCLogSaveAll;
// Saves log in the file with the Default name
begin
  if assigned(frmRPCLog) and RPCLog_SaveOnExit then
    frmRPCLog.SaveAll;
end;

function RPCLogDefaultFileName:TFileName;
// Default file name

  // Finds the users special directory (AVCatcher code)
  function LocalAppDataPath: string;
  const
    SHGFP_TYPE_CURRENT = 0;
  var
    path: array [0 .. MaxChar] of char;
  begin
    SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, SHGFP_TYPE_CURRENT, @path[0]);
    Result := StrPas(path);
  end;

begin
  Result := LocalAppDataPath;
  if (Copy(Result, Length(Result), 1) <> '\') then
    Result := Result + '\';

  Result := result + piece(ExtractFileName(Application.ExeName), '.', 1) + '_v' +
      FileVersionValue(Application.ExeName, 'FileVersion') + '_Log_' +
      FormatDateTime('YYYY_MM_DD_HH_NN_SS', Now) + '.txt';
end;

procedure DebugShowServer;
begin
  RPCLogInit;
  if assigned(frmRPCLog) then
    begin
      frmRPCLog.acSymbolTable.Execute;
      ShowBroker;
    end;
end;

procedure RPCLogDump;
begin
  RPCLogInit;
  frmRPCLog.SaveAll;
end;

procedure RPCLogSetFontSize(aSize:Integer);
begin
  if assigned(frmRPCLog) then
    frmRPCLog.setFontSize(aSize);
end;

initialization
  RPCLog_Enabled := False;
  RPCLog_SaveAvailable := False;
  RPCLog_TrackForms := True;
  RPCLog_SaveOnExit := False;
  RPCLog_Chronological := False;

end.
