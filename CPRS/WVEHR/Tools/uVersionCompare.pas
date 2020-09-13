unit uVersionCompare;

interface
uses
  SysUtils, Forms, Windows, Dialogs
  , VAUtils, ORFn, ORNet, ORSystem
  ;

function IsCompatibleVersion(var sWarning:String): Boolean;


implementation

const
  CRLF = #13#10;
  TX_OPTION     = 'OR CPRS GUI CHART';
  TX_VER1       = 'This is version ';
  TX_VER2       = ' of CPRSChart.exe.';
  TX_VER3       = CRLF + 'The running server version is ';
  TX_VER_REQ    = ' version server is required.';
  TX_VER_OLD    = CRLF + 'It is strongly recommended that you upgrade.';
  TX_VER_OLD2   = CRLF + 'The program cannot be run until the client is upgraded.';
  TX_VER_NEW    = CRLF + 'The program cannot be run until the server is upgraded.';
  TC_VER        = 'Server/Client Incompatibility';
  TC_CLIERR     = 'Client Specifications Mismatch';

  function ServerVersion(const Option, VerClient: string): string;
  begin
    Result := sCallV('ORWU VERSRV', [Option, VerClient]);
  end;


  function IsCompatibleVersion(var sWarning:String): Boolean;
  var
    iCompare: Integer;
    ClientVer, ServerVer, ServerReq,
    sValue,
    sMsg: String;
    sHdr: String;

    function CompareVersionPart(const A, B: string; iPart:Integer = 4): Integer;
    var
      NumA, NumB: Integer;
    begin
      NumA := (StrToInt(Piece(A, '.', 1)) * 16777216);// +
      if iPart >=2 then
        NumA := NumA + (StrToInt(Piece(A, '.', 2)) * 65536);// +
      if iPart >=3 then
        NumA := NumA +  (StrToInt(Piece(A, '.', 3)) * 256);// +
      if iPart >=4 then
        NumA := NumA + StrToInt(Piece(A, '.', 4));
      NumB := (StrToInt(Piece(B, '.', 1)) * 16777216);// +
      if iPart >=2 then
        NumB := NumB +  (StrToInt(Piece(B, '.', 2)) * 65536);// +
      if iPart >=3 then
        NumB := NumB +  (StrToInt(Piece(B, '.', 3)) * 256);// +
      if iPart >=4 then
        NumB := NumB +  StrToInt(Piece(B, '.', 4));
      Result := NumA - NumB;
    end;

  begin
    sMsg := '';
    // make sure we're using the matching server version
    //updateSplash('Verifying version...');
    ClientVer := ClientVersion(Application.ExeName);
    ServerVer := ServerVersion(TX_OPTION, ClientVer);
    ServerReq := Piece(FileVersionValue(Application.ExeName,
      FILE_VER_INTERNALNAME), ' ', 1);
    if ServerReq <> '' then
      iCompare := CompareVersion(ServerVer, ServerReq)
    else
      iCompare := -1;

    if (ServerVer = '0.0.0.0') then
    begin
      sMsg := 'Unable to determine current version of server.';
      sHdr := TX_OPTION;
    end
    else if (ClientVer <> ServerVer) then
    begin
      sMsg := 'Client "version" does not match client "required" server.';
      sHdr := TC_CLIERR;
{$IFDEF xDEBUG}
      iCompare := CompareVersionPart(ServerVer, ServerReq, 3);
      if iCompare = 0 then
        begin
          if (infoBox('Client and Server build numbers mismatched' + CRLF+ CRLF +
            char(VK_TAB) + 'Server: '+ char(VK_TAB) + char(VK_TAB) + ServerVer + CRLF +
            char(VK_TAB) + 'Required: '+ char(VK_TAB) + ServerReq + CRLF + crLF +
            'Proceed with the execution?',
            TC_CLIERR, MB_YESNO) <> ID_YES) then
              sMsg := 'Mismatched Client and Server buld numners'
          else
            sMsg := '';
        end;
{$ENDIF}
    end
    else
    begin
      if iCompare <> 0 then
      begin
        sValue := sCallV('ORWU DEFAULT DIVISION', [nil]);
        if sValue = '1' then
        begin
          if iCompare < 0 then
            begin
              sMsg := TX_VER1 + ClientVer + TX_VER2 + CRLF + ServerReq + TX_VER_REQ +
                TX_VER3 + ServerVer + '.' + TX_VER_NEW;
              sHdr := TC_VER;
            end
          else
            begin
              sHdr := TC_CLIERR;
              if (infoBox('Proceed with mismatched Client and Server versions?',
                TC_CLIERR, MB_YESNO) = ID_NO) then
                sMsg := 'Mismatched Client and Server versions';
            end;
        end
        else
        begin
          sHdr := TC_VER;
          if (iCompare > 0) then
          // Server newer than Required
            sMsg := TX_VER1 + ClientVer + TX_VER2 + CRLF + ServerReq +
              TX_VER_REQ + TX_VER3 + ServerVer + '.' + TX_VER_OLD2
          else
            sMsg := TX_VER1 + ClientVer + TX_VER2 + CRLF + ServerReq +
              TX_VER_REQ + TX_VER3 + ServerVer + '.' + TX_VER_OLD;
        end;
{
        if (sMsg = '') and (iCompare < 0) then
        // Server older then Required
        begin
          sMsg := TX_VER1 + ClientVer + TX_VER2 + CRLF + ServerReq + TX_VER_REQ +
            TX_VER3 + ServerVer + '.' + TX_VER_NEW;
          sHdr := TC_VER;
        end;
}
      end;
    end;

    Result := sMsg = '';

    if not Result then
      InfoBox(sMsg,sHdr,mb_OK);

    sWarning :=
      'Client: ' + Char(VK_TAB) + Char(VK_TAB)+ ClientVer + CRLF +
      'Server: ' + Char(VK_TAB) + Char(VK_TAB)+ ServerVer + CRLF +
      'Required: ' + Char(VK_TAB) + Char(VK_TAB)+ ServerReq + CRLF + CRLF + sMsg;

  end;

end.
