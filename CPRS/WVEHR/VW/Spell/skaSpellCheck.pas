unit skaSpellCheck;
(* ***************************** BEGIN LICENSE BLOCK **********************
 *
 * Copyright (C) 2015
 * Sunil Kumar Arora (digitiger@gmail.com        sunil@healthsevak.com)
 * All Rights Reserved.
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 *Special Note:
 * This work has heavily relies upon rather build upon Copyrighted work by
 * Miha Vrhovnik (http://simail.sf.net, http://xcollect.sf.net)  which is
 * available at http://sourceforge.net/projects/hunspell/
 *
 * Alternatively, the content of this file maybe used under the terms of either
 * the GNU General Public License Version 2 or later (the "GPL"), or the GNU
 * Lesser General Public License Version 2.1 or later (the "LGPL"), in which
 * case the provisions of the GPL or the LGPL are applicable instead of those
 * above. If you wish to allow use of your version of this file only under the
 * terms of either the GPL or the LGPL, and not to allow others to use your
 * version of this file under the terms of the MPL, indicate your division by
 * deleting the provisions above and replace them with the notice and other
 * provisions required by the GPL or LGPL. If you do not delete the provisions
 * above, a recipient may use your version of this file under the terms of any
 * one of the MPL, the GPL or the LGPL.
 *
 * *********************** END LICENSE BLOCK *********************************)

interface

uses
  Windows, Classes, SysUtils, ComCtrls, StdCtrls, Graphics, Forms, Controls;

  const
    AboutThis = 'A wrapper component developed by Sunil K Arora '
      + '(digitiger@gmail.com) of HealthSevak using OpenSource HanSpell engine';
type
  TSpellState = (ssNoengine, ssInActive, ssReady, ssChecking, ssCancelled,
                                                                  ssCompleted);
  TStateChangeEvent = procedure (const Sender : TObject;
                                          const State : TSpellState) of object;

  TskaHunSpellChecker = class(TComponent)
  private
    FActiveOrLoaded: Boolean;
    FpointerHunLib: Pointer;
    FSourceEdit: TRichEdit;
    FSuggestionList: TListbox;

    FAffixFileName: string;
    FDictFileName: string;
    CurrentWord: String;
    CurrentText: String;
    FoundAt: Integer;
    PosOfFirstCharInCurrentLine: integer;
    CurrentLine: Integer;
    FIgnore: TStringList;
    WaitForUser: Boolean;
    WordLength:integer;
    WordPos: Integer;
    PREditorWndProc:pointer;
    FHighlightColor: TColor;
    FUndoList: TStringList;
    FCustDict: TStringList;
    FCustom: String;
    FModified: Boolean;
    FHighlightEdit: TEdit;
    FTxtBeforeManualEdit: String;

    FStatus: TSpellState;
    FOnStart: TNotifyEvent;
    FOnAbort  : TNotifyEvent;
    FOnStateChange  : TStateChangeEvent;
    FIgnoreWordWdigits: boolean;
    FIgnoreCaps: boolean;
    FOptionsKey: String;
    FHyphenated: Boolean;
    function AddCustomWord(aWord: String; isInternal: Boolean = False): Boolean;
                                                            overload; virtual;
    Function CurrentWordDetail(WithPosition: Boolean= True): String;
    function GetActive: Boolean;
    procedure GetOptions;
    function GetStatus: TSpellState;
    procedure Initialize;
    procedure SetActive(const Value: Boolean);
    procedure SetAffixFileName(const Value: string);
    procedure SetCustomDict(const Value: String);
    procedure SetDictFileName(const Value: string);
    procedure SetHighLightEdit(const Value: TEdit);
    procedure SetOptions;
    procedure SetSourceEdit(const Value: TRichEdit);
    Function ShowMisSpelledWord:boolean;
    procedure Loaded; override;
    procedure ReplaceCurrentWordWith(const aNewWord: String);
    function GetAboutThis: String;
    procedure SaveForUndo(const Ignoring: Boolean=False);
    procedure InformStatusChange;
    procedure SetIgnoreCaps(const Value: boolean);
    procedure SetIgnoreWordWdigits(const Value: boolean);
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; SourceTextRichEdit: TRichedit;
                               SuggestList: TListbox); ReIntroduce; overload;
    destructor Destroy; override;

    function AbortSpellCheck(Verbose: Boolean = True):Boolean;
    function AddCustomWord: Boolean; overload; virtual;
    procedure Change;
    procedure ChangeAll;
    procedure CheckSpelling;
    procedure Close; virtual;
    procedure CorrectWithMyWord;
    procedure GetSuggestions(const aMisSpeltWord: string;
                                      const SuggestionList: TStrings); dynamic;
    procedure IgnoreAll;
    procedure IgnoreOnce;
    function IsMisspelled(const AWord: string): Boolean; dynamic;
    procedure ManualChangeStart;
    procedure ManualChangeDone;
    function Open:Boolean; virtual;
    procedure ReOpen;
    function ReStart: Boolean; virtual;
    function Undo: Boolean;
    property SpellCheckState: TSpellState read GetStatus default ssInActive;
  published
    property About: String read GetAboutThis;
    property Active: Boolean read GetActive write SetActive;
    property AffixFileName: string read FAffixFileName write SetAffixFileName;
    property HyphenatedWords: Boolean read FHyphenated write FHyphenated default false;
    property IgnoreAllCaps: boolean read FIgnoreCaps write SetIgnoreCaps default true;
    property IgnoreWordWithDigits:boolean read FIgnoreWordWdigits write SetIgnoreWordWdigits default true;
    property CustDictionaryFile: String read FCustom write SetCustomDict;
    property DictionaryFileName:string read FDictFileName write SetDictFileName;
    property ColorForMisspelled: TColor read FHighlightColor
                                            write FHighlightColor default clRed;
    property MisSpeltWord: TEdit read FHighlightEdit write SetHighLightEdit;
    property IsModified: Boolean read FModified;
    property OnStart : TNotifyEvent read FOnStart write FOnStart;
    property OnStateChange : TStateChangeEvent read FOnStateChange
                                                          write FOnStateChange;
    property OnAbort : TNotifyEvent read FOnAbort write FOnAbort;
    property SourceTextControl: TRichEdit read FSourceEdit write SetSourceEdit;
    property SuggestionList:TListbox read FSuggestionList write FSuggestionList;

  end;

  procedure Register;

  Const
    CompletionMessage = 'Spell Check Complete.';
    CaptionForNewWord = 'New Word Suggestion';
    ConfirmAbort = 'Really abort?';
    ConfirmComplete   = 'If you accept last change than SpellCheck is complete.'
                        + #13 + '  To review last change click on "Cancel".';
    PromptForNewWord = 'Specify the replacement for current mis-spelt word:';
    DLLNotLoaded = 'Failed to load SpellCheck Engine DLL.';
    MisSpeltReplacement = 'The new word specified by you "%s" looks mis-spelt!'
                          +' Would you want to still use it?   Click NO button '
                          +'to specify better replacement word.';

  var
    OldRichEditWndProc: {integer}pointer;
    CurrentMe: TskaHunSpellChecker;
implementation
   uses messages, Dialogs, RichEdit, SHFolder,  uHunSpellLib, Registry;

procedure Register;
begin
  RegisterComponentsProc('SkA Utility', [TskaHunSpellChecker]);
end;

{ TskaHunSpellChecker }

function TskaHunSpellChecker.AbortSpellCheck(Verbose: Boolean = True): Boolean;
begin
  if FStatus <> ssChecking then
  begin
    FStatus := ssCancelled;
    Close;
    exit;
  end;

  Result := (not isModified)  or
            (not Verbose) or (MessageDlg(ConfirmAbort, mtConfirmation,
                                                  [mbYes, mbNo],0, mbNo) = 6);

  if Result  then
  begin
    if FUndoList.Count > 0 then
       SourceTextControl.Text := FUndoList[0];
    FUndoList.Clear;
    FUndoList.Add(SourceTextControl.Text);
   FIgnore.Clear;
   FStatus := ssCancelled;
   SourceTextControl.Invalidate;
   if Assigned(OnAbort) then
     OnAbort(Self);
  end;
end;

function TskaHunSpellChecker.AddCustomWord(aWord: String;
                                        isInternal: Boolean = False): Boolean;
begin
  Result := False;
  if (not active) or (trim(aWord) = '') or (SpellCheckState <> ssChecking)
    or (not assigned(SourceTextControl)) or (not assigned(SuggestionList)) then
  begin
    Result := False;
    exit;
  end;
  uHunSpellLib.hunspell_put_word(FpointerHunLib, PAnsiChar(AnsiString(aWord)));
  Result := True;
end;

procedure TskaHunSpellChecker.ChangeAll;
begin
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
                                         or (not assigned(SuggestionList)) then
     exit;
  SaveForUndo;
  SourceTextControl.Text := StringReplace(SourceTextControl.Text,
                    CurrentWord, SuggestionList.Items[SuggestionList.ItemIndex],
                    [rfReplaceAll,rfIgnoreCase]);
  WaitForUser := False;
  FModified := True;
  SourceTextControl.Invalidate;

end;

function TskaHunSpellChecker.AddCustomWord: Boolean;
begin
  Result := AddCustomWord(CurrentWord, False);
  FCustdict.Add(CurrentWord);
  WaitForUser := False;
  SourceTextControl.Invalidate;
end;

procedure TskaHunSpellChecker.ReOpen;
begin
  Close;
  Open;
end;

procedure TskaHunSpellChecker.ReplaceCurrentWordWith(const aNewWord: String);
var
  full: String;
  prefix: string;
  suffix: string;
begin
  full := SourceTextControl.Lines[CurrentLine];
{remember there is one extra space at the start of the line prefixed while
 populating this variable}
  prefix := copy(CurrentText, 2, WordPos-2);
  Suffix :=  copy(CurrentText, WordPos+WordLength,
                           length(CurrentText));
  SaveForUndo;
  FModified := True;
  SourceTextControl.Lines[CurrentLine] :=prefix + aNewWord + suffix;
  WaitForUser := False;
  FStatus := ssChecking;
  FModified := True;
  SourceTextControl.Invalidate;
end;

function TskaHunSpellChecker.ReStart: Boolean;
begin
  Close;
  Result := Open;
  Initialize;
  WaitForUser := False;
  if FStatus <> ssChecking then
  begin
    FStatus := ssChecking;
    InformStatusChange;
  end;
  SourceTextControl.Invalidate;
  Result := not WaitForUser;
end;

procedure TskaHunSpellChecker.Change;

begin
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
                                          or (not assigned(SuggestionList)) then
     exit;
  ReplaceCurrentWordWith(SuggestionList.Items[SuggestionList.ItemIndex]);
end;

procedure TskaHunSpellChecker.CheckSpelling;
begin
 if (SpellCheckState = ssChecking) or (not assigned(SourceTextControl))
    or (trim(SourceTextControl.Text)= '') or (not assigned(SuggestionList)) then
     exit;

 Initialize;
 FUndoList.Clear;
  FUndoList.Add(SourceTextControl.Text);
 FIgnore.Clear;
 WaitForUser := False;
 FStatus := ssChecking;
 if Assigned(OnStart) then
   OnStart(Self);
 SourceTextControl.Invalidate;
end;

procedure TskaHunSpellChecker.Close;
begin
  if not Active then Exit;
    uHunSpellLib.hunspell_uninitialize(FpointerHunLib);
  FpointerHunLib := nil;
  FStatus := ssInActive;
  InformStatusChange;
end;


procedure TskaHunSpellChecker.CorrectWithMyWord;
var
  NewWord: String;
  GotIt: Boolean;
begin
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
                                        or (not assigned(SuggestionList)) then
     exit;

  if SuggestionList.Count > 0 then
    NewWord := SuggestionList.Items[0]
  else
    NewWord := CurrentWord;

  GotIt := False;
  while not GotIt do
  begin
    if not InputQuery(CaptionForNewWord, PromptForNewWord, NewWord)  then
      exit;

    GotIt := (not IsMisspelled(NewWord))
          or (MessageDlg(Format(MisSpeltReplacement,[NewWord]),
                                        mtWarning, [mbYes, mbNo],0, mbNo) =6) ;
  end;

  if IsMisspelled(NewWord) then
    AddCustomWord(NewWord, True);
    
  ReplaceCurrentWordWith(NewWord);
end;

constructor TskaHunSpellChecker.Create(AOwner: TComponent);
begin
  inherited;
   ColorForMisspelled := clRed;

   CurrentMe := Self;
   FIgnore := TStringList.Create;
   FCustDict := TStringList.Create;

   if (trim(CustDictionaryFile)<>'') and (FileExists(CustDictionaryFile)) then
    try
      FCustDict.LoadFromFile(CustDictionaryFile);
    except
    end;

   FUndoList := TStringList.Create;

   FOptionsKey := '\software\'
                + ChangeFileExt(ExtractFileName(Application.ExeName),'')
                + '\skaHunSpellCheckOptions';
   if csDesigning in componentState then
   begin
   IgnoreAllCaps := True;
   IgnoreWordWithDigits := True;
   end
   else
     GetOptions;

   FStatus := ssInActive;
   WaitForUser := False;
   WordPos := 0;
end;

constructor TskaHunSpellChecker.Create(AOwner: TComponent;
  SourceTextRichEdit: TRichedit; SuggestList: TListbox);
begin
   create(AOwner);
   SourceTextControl := SourceTextRichEdit;
   SuggestionList := SuggestList;
end;

function TskaHunSpellChecker.CurrentWordDetail(WithPosition: Boolean): String;
begin
  Result := '$$' + CurrentWord + '$$';
  if WithPosition then
    Result :='$$' + IntToStr(CurrentLine) + '$$' + IntToStr(FoundAt+1) + Result;
end;

destructor TskaHunSpellChecker.Destroy;
begin
  Close;
  FIgnore.clear;
  FreeAndNil(FIgnore);
  FreeAndNil(FUndoList);
  if not (csDesigning in ComponentState) then
  try
    if FCustDict.Count > 0 then
    try
      FCustDict.SaveToFile(CustDictionaryFile);
    except
    end;
    SetOptions;
  finally
    FCustDict.Free;
  end;
  inherited;
end;

function TskaHunSpellChecker.GetAboutThis: String;
begin
  Result := AboutThis;
end;

function TskaHunSpellChecker.GetActive: Boolean;
begin
  Result := (FpointerHunLib <> nil);
end;

procedure TskaHunSpellChecker.GetOptions;
var
reg:TRegistry;
begin
 reg:=TRegistry.Create;
 try
 reg.RootKey := HKEY_CURRENT_USER;

 //first get the dicationary file name
  Reg.OpenKey(FOptionsKey,True);
  if reg.ValueExists('DicFileName')  then
    DictionaryFileName:=Reg.readString('DicFileName')
  else
    Reg.WriteString('DicFileName',DictionaryFileName);

 //IgnoreAllCaps  ?
 if reg.ValueExists('IgnoreAllCaps')  then
    IgnoreAllCaps:=Reg.readBool('IgnoreAllCaps')
  else
    Reg.WriteBool('IgnoreAllCaps',IgnoreAllCaps);


  //IgnoreWordsWithDigits  ?
 if reg.ValueExists('IgnoreWordWithDigits')  then
    IgnoreWordWithDigits:=Reg.readBool('IgnoreWordWithDigits')
  else
    Reg.WriteBool('IgnoreWordWithDigits',IgnoreWordWithDigits);

 finally
    Reg.Free;
 end;

end;

function TskaHunSpellChecker.GetStatus: TSpellState;
begin
  Result := FStatus;
end;

procedure TskaHunSpellChecker.GetSuggestions(const aMisSpeltWord: string;
                                                const SuggestionList: TStrings);
var
  i: Integer;
  pMisSpelt: PAnsiChar;
  suggestions: PPAnsiChar;
  Results: PPAnsiChar;
  Count: Integer;
begin
  if (not Active) or (not Assigned(SuggestionList)) then
    exit;

  pMisSpelt := PAnsiChar(AnsiString(aMisSpeltWord));

  if not uHunSpellLib.hunspell_spell(FpointerHunLib, pMisSpelt) then
    uHunSpellLib.hunspell_suggest_auto(FpointerHunLib, pMisSpelt, suggestions);
  begin
    Count :=uHunSpellLib.hunspell_suggest(FpointerHunLib,pMisSpelt,suggestions);
    Results := suggestions;
    for i := 1 to Count do
    begin
      SuggestionList.Add(Results^);
      Inc(Integer(Results), SizeOf(Pointer));
    end;
    uHunSpellLib.hunspell_suggest_free(FpointerHunLib, suggestions, Count);
  end; 
end;

function TskaHunSpellChecker.ShowMisSpelledWord: boolean;
var
   I , l :integer;
   CharPosion:integer;
   FirstVisibleLine, LastVisibleLine:integer;

   hndl: hwnd;
   dcForHndl: THandle;
   visrect:Trect;
   vispoint:TPoint;
   procedure ShowMisSpelletWord;
   begin
     if Assigned(FHighlightEdit) then
     begin
       FHighlightEdit.Font.Color := ColorForMisspelled;
       FHighlightEdit.Text := CurrentWord;
       FHighlightEdit.Show;
     end ;

     if ((PosOfFirstCharInCurrentLine + FoundAt) < 1) then
        exit;

     SendMessage (SourceTextControl.Handle, EM_POSFROMCHAR, integer(@VisPoint),
                                      PosOfFirstCharInCurrentLine + FoundAt-1);
     SetTextColor(dcForHndl, ColorForMisspelled);
     TextOut(dcForHndl, VisPoint.x, VisPoint.y, pchar(CurrentWord), WordLength);
   end;

   function WordIsIgnorable: Boolean;
   var
     i: Integer;
   begin
     Result := False;
     if IgnoreAllCaps then
     begin
       Result := True;
        for i := 1 to WordLength do
        begin
          Result := Result and (ord(CurrentWord[i]) in [65..90]);
        end;
        if Result then
          exit;
     end;



     if IgnoreWordWithDigits then
     begin
       Result := False;
        for i := 1 to WordLength do
        begin
          Result := Result or (ord(CurrentWord[i]) in [48..57]);
          if Result then
            break;
        end;
     end;
   end;
begin
  Result := False;
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
     or (not assigned(SuggestionList)) then
     exit;

  hndl:=SourceTextControl.Handle;

  result:= SendMessage (hndl, EM_GETRECT, 0, integer(@visrect))=0;

  dcForHndl := getdc(hndl);

  if result then
  begin
   // VisPoint := visrect.BottomRight;
    vispoint.Y := visrect.Bottom;
    vispoint.X := visrect.Right;
    CharPosion := SendMessage (hndl, EM_CHARFROMPOS, 0, integer(@VisPoint));
    LASTVISIBLELINE := SendMessage (hndl, EM_LINEFROMCHAR, CharPosion, 0);
    FIRSTVISIBLELINE := SendMessage (hndl, EM_GETFIRSTVISIBLELINE, 0, 0);

    SetBkMode (dcForHndl, TRANSPARENT);
    SelectObject(dcForHndl, SourceTextControl.font.Handle);
    i := 0;

    if WaitForUser then
    begin
      ShowMisSpelletWord;
      exit;
    end;

    For l := 0 to SourceTextControl.Lines.Count -1  do
    begin
    {$R-}
      CurrentLine := l;
      if trim(SourceTextControl.Lines[CurrentLine]) = '' then
        continue;

      CurrentText := ' ' + SourceTextControl.Lines[CurrentLine];
      PosOfFirstCharInCurrentLine := SendMessage (SourceTextControl.Handle,
                                                  EM_LINEINDEX, CurrentLine, 0);
      i := 0;

      While i <= LENgth(CurrentText) do
      begin
        FoundAt := i -1;
        if Assigned(FHighlightEdit) then
          FHighlightEdit.Hide;


        //SuggestionList.Clear;
        {Any character except these will count as a word delimiter}
        if HyphenatedWords then
           While CurrentText[i] in ['A'..'Z','a'..'z','0'..'9','-'] do inc(i)
        else
          While CurrentText[i] in ['A'..'Z','a'..'z','0'..'9'] do inc(i);


        WordLength        := i- FoundAt -1;
        WordPos           := i-WordLength;
        CurrentWord          := copy(CurrentText, WordPos, WordLength);
       // if WordIsCorrect then
       if (((FIgnore.IndexOf(CurrentWordDetail(True))< 0)  //SingelIgnore
              and (FIgnore.IndexOf(CurrentWordDetail(False))< 0) //IgnoreAll
              and (IsMisspelled(CurrentWord))))
              and (not WordIsIgnorable) then

        begin
           GetSuggestions(CurrentWord, SuggestionList.Items);
           if SuggestionList.Count > 0 then
             SuggestionList.ItemIndex := 0;
          ShowMisSpelletWord;
          if CurrentLine > LastVisibleLine then
            SendMessage(SourceTextControl.Handle, EM_LINESCROLL, 0,
                                            (CurrentLine - lastvisibleLine)+5);
          WaitForUser := True;
          exit;
        End
        else
           SuggestionList.Clear;
        inc(i);
      end;
    end;
    if (CurrentLine >= SourceTextControl.Lines.Count-1)
                                          and (i >= length(CurrentText) +1) then
    begin
      if (not FModified)
         or (MessageDlg(ConfirmComplete,mtConfirmation,[mbOK, mbCancel],0)=mrOk)
         then
      begin
        FStatus := ssCompleted;
        InformStatusChange;
      end
      else
        Undo;
    end;
    {$R+}
  end;
  ReleaseDC(SourceTextControl.Handle, dcForHndl);

End;

function TskaHunSpellChecker.Undo: Boolean;
var
  tmpStr: String;
  tmpCount: Integer;
  SrcText: String;
begin
  if FUndoList.Count > 1 then
  try
    tmpStr := FUndoList.Strings[FUndoList.Count-1];
    if (AnsiPos('$$',tmpStr)=1) and (copy(tmpStr,length(tmpStr)-1,2) = '$$')then
    //if last action was ignoring word then just remove it from ignore list
    begin
      tmpCount := strtoInt(StringReplace(tmpStr,'$$','',[rfReplaceAll]));
      while FIgnore.Count > tmpCount do
        FIgnore.Delete(FIgnore.Count -1);
    end
    else
    SourceTextControl.Text := tmpStr;

    Result := True;
    FUndoList.Delete(FUndoList.Count-1);
    ReStart;
  except
    Result := False;
  end;
end;

procedure TskaHunSpellChecker.IgnoreAll;
begin
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
                                        or (not assigned(SuggestionList)) then
     exit;

  SaveForUndo(True);
  FIgnore.Add(CurrentWordDetail(False)) ;
  WaitForUser := False;
  SourceTextControl.Invalidate;
end;

procedure TskaHunSpellChecker.IgnoreOnce;
begin
  if (SpellCheckState <> ssChecking) or (not assigned(SourceTextControl))
                                          or (not assigned(SuggestionList)) then
     exit;

  if trim(CurrentWord) <> '' then
  begin
    SaveForUndo(True);
    FIgnore.Add(CurrentWordDetail(True)) ;
  end;
  WaitForUser := False;
  SourceTextControl.Invalidate;
end;

procedure TskaHunSpellChecker.InformStatusChange;
begin
  if Assigned(OnStateChange) then
    OnStateChange(Self, FStatus);
end;

procedure TskaHunSpellChecker.Initialize;
begin
  CurrentWord := '';
  WordLength := 0;
  FoundAt := -1;
  CurrentLine := 0;
  WordPos := 0;
  SuggestionList.Clear;
end;

function TskaHunSpellChecker.IsMisspelled(const AWord: string): Boolean;
begin
  if (not Active) then
    Result := True
  else
    Result := not uHunSpellLib.hunspell_spell(FpointerHunLib,
                                                PAnsiChar(AnsiString(AWord)));
end;

procedure TskaHunSpellChecker.Loaded;
begin
  inherited;
  SetActive(FActiveOrLoaded);
end;

procedure TskaHunSpellChecker.ManualChangeDone;
begin
  if trim(FTxtBeforeManualEdit) = '' then
    exit;
  FUndoList.Add(FTxtBeforeManualEdit);
  ReStart;
end;

procedure TskaHunSpellChecker.ManualChangeStart;
begin
  FTxtBeforeManualEdit := FSourceEdit.Text;
end;

function TskaHunSpellChecker.Open: Boolean;
var
  CurrentLine: integer;
  function GetSpecialFolderPath(folder : integer) : string;
      var
        path: array [0..MAX_PATH] of char;
    begin
      if SUCCEEDED(SHGetFolderPath(0,folder,0,0,@path[0])) then
        Result := path
      else
        Result := '';
    end;
begin
  Result := True;
  if Active then Exit;
  Result := False;
  FpointerHunLib := Nil;
  if not uHunSpellLib.LoadLibHunspell('') then
  begin
     MessageDlg(DLLNotLoaded, mtError, [mbOK],0);
     Exit;
  end;
  FpointerHunLib := uHunSpellLib.hunspell_initialize(
                                        PAnsiChar(AnsiString(FAffixFileName)),
                                        PAnsiChar(AnsiString(FDictFileName)));
  Result := Assigned(FpointerHunLib);

  if Result then
  begin
    FStatus := ssReady;
    InformStatusChange;
  end;
  if trim(CustDictionaryFile) = '' then
    CustDictionaryFile := IncludeTrailingPathDelimiter(
                GetSpecialFolderPath(CSIDL_PERSONAL)) + 'CustomDictionary.txt';
  if (Result) and (assigned(FCustDict)) then
     for CurrentLine := 0 to FCustDict.Count - 1 do
       AddCustomWord(FCustDict[CurrentLine], True);
end;

procedure TskaHunSpellChecker.SaveForUndo(const Ignoring: Boolean = False);
begin
  if Ignoring then
    FUndoList.Add('$$'+ IntToStr(FIgnore.Count)+'$$')
  else
    FUndoList.Add(SourceTextControl.Text);
end;

procedure TskaHunSpellChecker.SetActive(const Value: Boolean);
begin
  if (csDesigning in ComponentState) or (csLoading in ComponentState) then
    FActiveOrLoaded := Value
  else
    if Value then
      FActiveOrLoaded := Open
    else
      Close;
end;

procedure TskaHunSpellChecker.SetAffixFileName(const Value: string);
begin
  Close;
  FAffixFileName := Value;
  if (trim(DictionaryFileName) = '') and (trim(value)<>'') then
    DictionaryFileName := ChangeFileExt(value, '.dic');
end;

procedure TskaHunSpellChecker.SetCustomDict(const Value: String);
begin
  FCustom := Value;
  if (not (csDesigning in componentState))
                          and (FileExists(Value)) and assigned(FCustDict) then
  begin
    FCustDict.Clear;
    FCustDict.LoadFromFile(Value);
  end;
end;

procedure TskaHunSpellChecker.SetDictFileName(const Value: string);
begin
  Close;
  FDictFileName := Value;
  if (trim(AffixFileName) = '') and (trim(value)<>'') then
    AffixFileName := ChangeFileExt(value, '.aff');
end;

procedure TskaHunSpellChecker.SetHighLightEdit(const Value: TEdit);
begin
  if FHighlightEdit = Value then
    exit;

  FHighlightEdit := Value;

  if Active then
    FHighlightEdit.Text := CurrentWord;


end;

procedure TskaHunSpellChecker.SetIgnoreCaps(const Value: boolean);
begin
  if (FIgnoreCaps = Value) then
    exit;

  FIgnoreCaps := Value;
  if SpellCheckState = ssChecking then
    ReStart;
end;

procedure TskaHunSpellChecker.SetIgnoreWordWdigits(const Value: boolean);
begin
  if (FIgnoreWordWdigits = Value) then
    exit;

  FIgnoreWordWdigits := Value;
  if SpellCheckState = ssChecking then
    ReStart;

end;

procedure TskaHunSpellChecker.SetOptions;
var
reg:TRegistry;
begin
 reg:=TRegistry.Create;
 try
 reg.RootKey := HKEY_CURRENT_USER;


  Reg.OpenKey(FOptionsKey,True);

  //first save the dicationary file name
  Reg.WriteString('DicFileName',DictionaryFileName);

 //IgnoreAllCaps  ?
 Reg.WriteBool('IgnoreAllCaps',IgnoreAllCaps);


  //IgnoreWordsWithDigits  ?
 Reg.WriteBool('IgnoreWordWithDigits',IgnoreWordWithDigits);

 finally
    Reg.Free;
 end;
end;

Function RichEditWndProc(handle:HWnd;uMsg,wParam,lParam:longint):longint stdcall;
begin
  Result := CallWindowProc(OldRichEditWndProc, handle, uMsg, wParam, lParam);
   if (uMsg=WM_PAINT) and assigned(CurrentMe) then
     CurrentMe.ShowMisSpelledWord;
End;

procedure TskaHunSpellChecker.SetSourceEdit(const Value: TRichEdit);
begin
  if FSourceEdit = Value then
    exit;

  FSourceEdit := Value;

  if csDesigning in ComponentState then
    exit;

  PREditorWndProc:=@RichEditWndProc;
  //raise the limit of text which could be inserted into this Richedit
  Value.perform(EM_EXLIMITTEXT, 0, 65535*32);
  OldRichEditWndProc := pointer(SetWindowLong(Value.handle, GWL_WNDPROC,
                                                    longint(@RichEditWndProc)));
end;

end.
