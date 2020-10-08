unit uGMV_Log;

interface
uses
  Classes
  , SysUtils
  , uROR_RPCBroker
  , fROR_PCall
  ;

type
  TRPCEventItem = class(TObject)
  public
    Start: TDateTime;
    Stop: TDateTime;
    RPC: string;
    Params: TStrings;
    Results: TStrings;

    constructor Create;
    destructor Destroy; override;
  end;

  TActionEventItem = class(TObject)
  public
    Start: TDateTime;
    Stop: TDateTime;
    Action: string;
    Actor: string;
    Comments: TStrings;

    constructor Create;
    destructor Destroy; override;
  end;

function RegisterActionStart: TDateTime;
function getRPCEventItem(
  aStart, aStop: TDateTime;
  RemoteProcedure: string;
  Parameters: array of string; MultList: TStringList = nil;
  RPCMode: TRPCMode = []; RetList: TStrings = nil): TRPCEventItem;
(*
procedure RegisterActionItem(
            aStart,aStop:TDateTime;
            anAction,anActor:String;
            aComments: String ='');
*)
function EventStart(anEventName: string; anEventComment: string = ''): TDateTime;
procedure EventRegister(aStart, aStop: TDateTime;anEvent: string;aComments: string = '');
function EventStop(anEventName: string; anEventComment: string = ''; aStart: TDateTime = 0): TDateTime;
function EventAdd(anEventName: string; anEventComment: string = ''; aTime: TDateTime = 0): TDateTime;


var
  RPCLog: TStrings;
  RPCCount: Integer;
  ActionLog: TStrings;
  ActionMargin: string;
const
  ActionMarginDelta = '  ';


implementation

uses fGMV_RPCLog;


function getActionEventItem(
  aStart, aStop: TDateTime;
  anAction, anActor: string;
  aComments: string = ''): TActionEventItem;
var
  Item: TActionEventItem;
begin
  Item := TActionEventItem.Create;
  Item.Start := aStart;
  Item.Stop := aStop;
  Item.Action := anAction;
  Item.Actor := anActor;
  if aComments <> '' then
    Item.Comments.Text := aComments;
  Result := Item;
end;

procedure RegisterActionItem(
  aStart, aStop: TDateTime;
  anAction, anActor: string;
  aComments: string = '');
var
  Item: TActionEventItem;
  iLimit: Integer;
begin
  // use SHOWLOG directive to work with the log
{$IFNDEF SHOWLOG} exit; {$ENDIF}

  Item := getActionEventItem(aStart, aStop, anAction, anActor, aComments);
  ActionLog.InsertObject(0,
    FormatDateTime('hh:mm:ss.zzz', aStop) + ' ' + ActionMargin + AnActor + ': ' + AnAction, Item);

  iLimit := 300;
  if assigned(frmGMV_RPCLog) then
    iLimit := StrToIntDef(frmGMV_RPCLog.ComboBox2.Text, iLimit);

  while ActionLog.Count > iLimit do
  begin
    if ActionLog.Objects[ActionLog.Count - 1] <> nil then
      TActionEventItem(ActionLog.Objects[ActionLog.Count - 1]).Free;
    ActionLog.Delete(ActionLog.Count - 1);
  end;

  if assigned(frmGMV_RPCLog) then
  begin
    frmGMV_RPCLog.lbRoutines.Items.Assign(ActionLog);
    frmGMV_RPCLog.lbRoutines.ItemIndex := 0;
    frmGMV_RPCLog.lbRoutinesClick(nil);
  end;

  ActionMargin := copy(ActionMargin, 1, Length(ActionMargin) - Length(ActionMarginDelta));
end;

function RegisterActionStart: TDateTime;
begin
  Result := Now;
  ActionMargin := ActionMargin + ActionMarginDelta;
end;

////////////////////////////////////////////////////////////////////////////////

procedure EventRegister(
  aStart, aStop: TDateTime;
  anEvent: string;
  aComments: string = '');
var
  Item: TActionEventItem;
  iLimit: Integer;
begin
  // use SHOWLOG directive to work with the log
{$IFNDEF SHOWLOG} exit; {$ENDIF}
  Item := getActionEventItem(aStart, aStop, anEvent, '', aComments);
  ActionLog.InsertObject(0,
    FormatDateTime('hh:mm:ss.zzz', aStop) + ' ' + ActionMargin + AnEvent,
    Item);

  iLimit := 300;
  if assigned(frmGMV_RPCLog) then
    iLimit := StrToIntDef(frmGMV_RPCLog.ComboBox2.Text, iLimit);

  while ActionLog.Count > iLimit do
  begin
    if ActionLog.Objects[ActionLog.Count - 1] <> nil then
      TActionEventItem(ActionLog.Objects[ActionLog.Count - 1]).Free;
    ActionLog.Delete(ActionLog.Count - 1);
  end;

  try
    if assigned(frmGMV_RPCLog) and Assigned(frmGMV_RPCLog.lbRoutines) then
    begin
      frmGMV_RPCLog.lbRoutines.Items.Assign(ActionLog);
      frmGMV_RPCLog.lbRoutines.ItemIndex := 0;
      frmGMV_RPCLog.lbRoutinesClick(nil);
    end;
  except
  end;
end;

function EventStart(anEventName: string; anEventComment: string = ''): TDateTime;
var
  s: string;
begin
  Result := Now;
  s := anEventComment;
  if s = '' then s := 'Start';
  EventRegister(Result, Result, anEventName, s);
  ActionMargin := ActionMargin + ActionMarginDelta;
end;

function EventStop(anEventName: string; anEventComment: string = ''; aStart: TDateTime = 0): TDateTime;
var
  s: string;
begin
  s := anEventComment;
  if s = '' then s := 'Stop';
  Result := Now;
  ActionMargin := copy(ActionMargin, 1, Length(ActionMargin) - Length(ActionMarginDelta));
  EventRegister(aStart, Result, anEventName, s);
end;

function EventAdd(anEventName: string; anEventComment: string = ''; aTime: TDateTime = 0): TDateTime;
begin
  Result := Now;
  EventRegister(aTime, Result, anEventName, anEventComment);
end;


////////////////////////////////////////////////////////////////////////////////

function getRPCEventItem(
  aStart, aStop: TDateTime;
  RemoteProcedure: string;
  Parameters: array of string; MultList: TStringList = nil;
  RPCMode: TRPCMode = []; RetList: TStrings = nil): TRPCEventItem;
var
  Item: TRPCEventItem;
  i, j: Integer;
begin
  Item := TRPCEventItem.Create;
  Item.Start := aStart;
  Item.Stop := aStop;
  Item.RPC := RemoteProcedure;

  Item.Params.Add('Params: ---------------------------------------------------');
  i := 0;
  while i <= High(Parameters) do
  begin
    if (Copy(Parameters[i], 1, 1) = '@') and (Parameters[i] <> '@') then
    begin
      Item.Params.Add('Reference ' + IntToStr(i) + ' <' + Copy(Parameters[i], 2, Length(Parameters[i])) + '>');
    end
    else
    begin
      Item.Params.Add('Literal ' + IntToStr(i) + ' <' + Parameters[i] + '>');
    end;
    Inc(i);
  end;

  if MultList <> nil then
    if MultList.Count > 0 then
    begin
      Item.Params.Add('List:');
      for j := 1 to MultList.Count do
        Item.Params.Add(MultList[j - 1]);
    end;

  if RetList <> nil then
    if RetList.Count > 0 then
    begin
      Item.Results.Add('Results: --------------------------------------------------');
      for j := 0 to RetList.Count - 1 do
        Item.Results.Add(RetList[j]);
    end;
  Result := Item;
end;

constructor TRPCEventItem.Create;
begin
  inherited;
  Params := TStringList.Create;
  Results := TStringList.Create;
end;

destructor TRPCEventItem.Destroy;
begin
  if Assigned(Params) then
    FreeAndNil(Params);
  if Assigned(Results) then
    FreeAndNil(Results);
  inherited;
end;
////////////////////////////////////////////////////////////////////////////////

constructor TActionEventItem.Create;
begin
  inherited;
  Comments := TStringList.Create;
end;

destructor TActionEventItem.Destroy;
begin
  Comments.Free;
  inherited;
end;

initialization
  RPCLog := TStringList.Create;
  ActionLog := TStringList.Create;
  ActionMargin := '';
  RPCCount := 0;

finalization
//exit;
  while RPCLog.Count > 0 do
  begin
    try
      if RPCLog.Objects[0] <> nil then
        begin
        if RPCLog.Objects[0] is TRPCEventItem then
          TRPCEventItem(RPCLog.Objects[0]).Free
        else
          TObject(RPCLog.Objects[0]).Free;
        end;
      RPCLog.Delete(0);
    except
    end;
  end;
  FreeAndNil(RPCLog);

  while ActionLog.Count > 0 do
  begin
    try
      if ActionLog.Objects[0] <> nil then
        TActionEventItem(ActionLog.Objects[0]).Free;
      ActionLog.Delete(0);
    except
    end;
  end;
  FreeAndNil(ActionLog);

end.
