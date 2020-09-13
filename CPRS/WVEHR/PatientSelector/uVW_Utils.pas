unit uVW_Utils;

interface

function IsLast5(x: string): Boolean;
function IsFullSSN(x: string): boolean;

implementation
uses
  SysUtils;


function IsLast5(x: string): Boolean;
{ returns true if string matchs patterns: A9999 or 9999 (BS & BS5 xrefs for patient lookup) }
var
  i: Integer;
begin
  Result := False;
  if not ((Length(x) = 4) or (Length(x) = 5)) then Exit;
  if Length(x) = 5 then
  begin
    if not (x[1] in ['A'..'Z', 'a'..'z']) then Exit;
    x := Copy(x, 2, 4);
  end;
  for i := 1 to 4 do if not (x[i] in ['0'..'9']) then Exit;
  Result := True;
end;

function IsFullSSN(x: string): boolean;
var
  i: integer;
begin
  Result := False;
  if (Length(x) < 9) or (Length(x) > 12) then Exit;
  case Length(x) of
    9:  // no dashes, no 'P'
        for i := 1 to 9 do if not (x[i] in ['0'..'9']) then Exit;
   10:  // no dashes, with 'P'
        begin
          for i := 1 to 9 do if not (x[i] in ['0'..'9']) then Exit;
          if (Uppercase(x[10]) <> 'P') then Exit;
        end;
   11:  // dashes, no 'P'
        begin
          if (x[4] <> '-') or (x[7] <> '-') then Exit;
          x := Copy(x,1,3) + Copy(x,5,2) + Copy(x,8,4);
          for i := 1 to 9 do if not (x[i] in ['0'..'9']) then Exit;
        end;
   12:  // dashes, with 'P'
        begin
          if (x[4] <> '-') or (x[7] <> '-') then Exit;
          x := Copy(x,1,3) + Copy(x,5,2) + Copy(x,8,5);
          for i := 1 to 9 do if not (x[i] in ['0'..'9']) then Exit;
          if UpperCase(x[10]) <> 'P' then Exit;
        end;
  end;
  Result := True;
end;
end.
