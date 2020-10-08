unit fGMV_TimeOutManager;
{
================================================================================
*
*       Application:  Vitals
*       Revision:     $Revision: 1 $  $Modtime: 4/29/09 9:30a $
*       Developer:    doma.user@domain.ext
*       Site:         Hines OIFO
*
*       Description:  Time Out functionality (Just like Roll'n'Scroll)
*
*       Notes:
*
================================================================================
*       $Archive: /Vitals/5.0 (Version 5.0)/5.0.23 (Patch 23)/VITALS_5_0_23_8/Source/VITALSCOMMON/fGMV_TimeOutManager.pas $
*
 *
*
================================================================================
}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls;

type
  TfrmGMV_TimeOutManager = class(TForm)
    LastChanceTimer: TTimer;
    Label1: TLabel;
    lblSecondsLeft: TLabel;
    lblMessage: TLabel;
    btnCancelTimeout: TButton;
    procedure LastChanceTimerTimer(Sender: TObject);
  private
    SecondsLeft: Integer;
  public
    { Public declarations }
  end;

type
  TMDShutDownProcedure = procedure;

procedure InitTimeOut(ShutDownProcedureName: TMDShutDownProcedure);
procedure UpdateTimeOutInterval(Seconds: Cardinal);
procedure ShutDownTimeOut;

implementation
{$IFDEF DLL}
uses frmPatientVitals;
{$ENDIF}

type
  TMDTimeOut = class(TTimer)
  private
    FHooked: Boolean;
    TimeOutInterval: Cardinal;
    TimeOutKeyHandle: HHOOK;
    TimeOutMouseHandle: HHOOK;
    ShutDownProcedure: TMDShutDownProcedure;
  protected
    procedure ResetTimeOut;
    procedure TimeOutTimer(Sender: TObject);
  end;

var
  MDTimeOut: TMDTimeOut = nil;

function TimeoutKeyHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall; forward;

function TimeoutMouseHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall; forward;

{$R *.DFM}

function TimeoutKeyHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT;
{ this is called for every keyboard event that occurs }
begin
  Result := 0;
  if lParam shr 31 = 1 then
    MDTimeOut.ResetTimeout; // on KeyUp only
  try
    Result := CallNextHookEx(MDTimeOut.TimeoutKeyHandle, Code, wParam, lParam);
  except
  end;
end;

function TimeoutMouseHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT;
{ this is called for every mouse event that occurs }
begin
  Result := 0;
  if (Code >= 0) and (wParam > WM_MOUSEFIRST) and (wParam <= WM_MOUSELAST) then
    MDTimeOut.ResetTimeout; // all click events
  try
    Result := CallNextHookEx(MDTimeOut.TimeoutMouseHandle, Code, wParam, lParam);
  except
  end;
end;

procedure InitTimeOut(ShutDownProcedureName: TMDShutDownProcedure);
begin
  if (not assigned(MDTimeOut)) then
    begin
      MDTimeOut := TMDTimeOut.Create(Application);
      with MDTimeOut do
        begin
          ShutDownProcedure := ShutDownProcedureName;
          OnTimer := TimeOutTimer;
          TimeOutInterval := 10000;
          TimeOutKeyHandle :=
            SetWindowsHookEx(WH_KEYBOARD, TimeOutKeyHook, 0, GetCurrentThreadID);
          TimeOutMouseHandle :=
            SetWindowsHookEx(WH_MOUSE, TimeOutMouseHook, 0, GetCurrentThreadID);
          Interval := TimeOutInterval;
          Enabled := True;
          FHooked := True;
        end;
    end;
end;

procedure UpdateTimeOutInterval(Seconds: Cardinal);
begin
  if (assigned(MDTimeOut)) then
    with MDTimeOut do
      begin
        Interval := Seconds * 1000;
        TimeOutInterval := Seconds * 1000;
        Enabled := True;
      end;
end;

procedure ShutDownTimeOut;
begin
  if (assigned(MDTimeOut)) then
    begin
      with MDTimeOut do
        begin
          Enabled := False;
          if FHooked then
            begin
              UnhookWindowsHookEx(TimeOutKeyHandle);
              UnhookWindowsHookEx(TimeOutMouseHandle);
              FHooked := False;
            end;
        end;
        FreeAndNil(MDTimeOut);  // AAN 040406
    end;
end;

procedure TMDTimeOut.ResetTimeout;
{ this restarts the timer whenever there is a keyboard or mouse event }
begin
  Enabled := False;
  Interval := TimeoutInterval;
  Enabled := True;
end;

procedure TMDTimeOut.TimeOutTimer(Sender: TObject);
{ when the timer expires, the application is closed after warning the user }
begin
  Enabled := False;
{$IFNDEF DLL} //zzzzzzandria 050425
  { Check for minimized main form and then bring to front }
  with Application do
    begin
      if MainForm <> nil then
        if MainForm.WindowState = wsMinimized then
          MainForm.WindowState := wsNormal;
      BringToFront;
      ProcessMessages;
    end;

  with TfrmGMV_TimeOutManager.Create(Application) do
  try
    lblMessage.Caption :=
      'The application ' + Application.Title + ' is about to ' +
      'close due to inactivity.  Press the &Cancel button below to ' +
      'continue working.';
    SecondsLeft := 15;
    LastChanceTimer.Interval := 1000;
    LastChanceTimer.Enabled := True;
    ShowModal;
    LastChanceTimer.Enabled := False;
    if ModalResult <> mrCancel then
      if assigned(ShutDownProcedure) then
        ShutDownProcedure
      else
        Application.Terminate
    else
      Self.Enabled := True;
  finally
    Free;
  end;
{$ELSE}
//  if Assigned(frmVitals) then
//    frmVitals.ModalResult := mrCancel;
  Application.Terminate;
{$ENDIF}
end;

////////////////////////////////////////////////////////////////////////////////

procedure TfrmGMV_TimeOutManager.LastChanceTimerTimer(Sender: TObject);
begin
  LastChanceTimer.Enabled := False;
  dec(SecondsLeft);
  lblSecondsLeft.Caption := IntToStr(SecondsLeft);
  LastChanceTimer.Enabled := (SecondsLeft > 0);
  if not LastChanceTimer.Enabled then
    ModalResult := mrOk;
end;

initialization
  initTimeOut(nil);
  UpdateTimeoutInterval(10000);
  
finalization
  shutDownTimeOut;
end.
