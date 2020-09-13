inherited frmHunSpell: TfrmHunSpell
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'SpellCheck based on open source HanSpell Engine'
  ClientHeight = 516
  ClientWidth = 737
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Name = 'Tahoma'
  Position = poScreenCenter
  ExplicitWidth = 743
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 16
  object lblDictionary: TLabel [0]
    Left = 11
    Top = 1
    Width = 85
    Height = 16
    Caption = '&Dictionary File:'
  end
  object Label3: TLabel [1]
    Left = 11
    Top = 54
    Width = 726
    Height = 14
    Hint = 'URL for Medical Dictionary current being used (GPL license)'
    Caption = 
      'http://code.openhub.net/project?pid=08caPIxPvc0&prevcid=1&did=op' +
      'enmedspel%2Fsrc%2Fdictionaries&cid=sPPyiSPxN3U&fp=363738&projSel' +
      'ected=true'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsItalic, fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Label2: TLabel [2]
    Left = 11
    Top = 74
    Width = 486
    Height = 16
    Hint = 'URL for other language dictionaries'
    Caption = 
      'http://archive.services.openoffice.org/pub/mirror/OpenOffice.org' +
      '/contrib/dictionaries/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsItalic, fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object pnlMisSpelled: TPanel [3]
    Left = 0
    Top = 268
    Width = 729
    Height = 248
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 26
      Width = 176
      Height = 16
      Caption = '&Suggestions and Alternavtives:'
      FocusControl = lstSuggestions
    end
    object Label4: TLabel
      Left = 11
      Top = 3
      Width = 133
      Height = 16
      Caption = 'C&urrent Misspelt Word:'
      FocusControl = Edit2
    end
    object lstSuggestions: TListBox
      Left = 3
      Top = 43
      Width = 406
      Height = 197
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 151
      Top = 4
      Width = 554
      Height = 18
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'HighlightEdit'
      Visible = False
    end
    object btnAutoCorrect: TButton
      Left = 452
      Top = 135
      Width = 110
      Height = 25
      Caption = 'R&eplace with ...'
      TabOrder = 2
      OnClick = btnAutoCorrectClick
    end
    object btnChangeAll: TButton
      Left = 452
      Top = 87
      Width = 110
      Height = 25
      Caption = 'Change &All'
      TabOrder = 3
      OnClick = btnChangeAllClick
    end
    object btnChange: TButton
      Left = 452
      Top = 39
      Width = 110
      Height = 25
      Caption = '&Change'
      TabOrder = 4
      OnClick = btnChangeClick
    end
    object btnAddToDictionary: TButton
      Left = 611
      Top = 135
      Width = 110
      Height = 25
      Caption = 'A&dd to Dictionary'
      TabOrder = 5
      OnClick = btnAddToDictionaryClick
    end
    object btnIgnoreAll: TButton
      Left = 611
      Top = 87
      Width = 110
      Height = 25
      Caption = 'I&gnore All'
      TabOrder = 6
      OnClick = btnIgnoreAllClick
    end
    object btnIgnoreOnce: TButton
      Left = 611
      Top = 39
      Width = 110
      Height = 25
      Caption = '&Ignore Once'
      TabOrder = 7
      OnClick = btnIgnoreOnceClick
    end
    object btnCancel: TButton
      Left = 619
      Top = 216
      Width = 110
      Height = 25
      Caption = 'Ca&ncel'
      ModalResult = 2
      TabOrder = 8
      OnClick = btnCancelClick
    end
  end
  object btnClose: TButton [4]
    Left = 503
    Top = 483
    Width = 110
    Height = 25
    Caption = 'C&lose'
    ModalResult = 1
    TabOrder = 0
    Visible = False
    OnClick = btnCloseClick
  end
  object Edit1: TEdit [5]
    Left = 121
    Top = 0
    Width = 531
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnEnter = Edit1Enter
  end
  object btnSelectDict: TBitBtn [6]
    Left = 476
    Top = 26
    Width = 258
    Height = 25
    Caption = '&Browse for and select different dictionary'
    TabOrder = 2
    OnClick = btnSelectDictClick
  end
  object RichEdit1: TRichEdit [7]
    Left = 3
    Top = 101
    Width = 726
    Height = 161
    Lines.Strings = (
      'Nothing to Check !')
    ScrollBars = ssBoth
    TabOrder = 3
    Zoom = 100
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = pnlMisSpelled'
        'Status = stsDefault')
      (
        'Component = lstSuggestions'
        'Status = stsDefault')
      (
        'Component = Edit2'
        'Status = stsDefault')
      (
        'Component = btnAutoCorrect'
        'Status = stsDefault')
      (
        'Component = btnChangeAll'
        'Status = stsDefault')
      (
        'Component = btnChange'
        'Status = stsDefault')
      (
        'Component = btnAddToDictionary'
        'Status = stsDefault')
      (
        'Component = btnIgnoreAll'
        'Status = stsDefault')
      (
        'Component = btnIgnoreOnce'
        'Status = stsDefault')
      (
        'Component = btnCancel'
        'Status = stsDefault')
      (
        'Component = btnClose'
        'Status = stsDefault')
      (
        'Component = Edit1'
        'Status = stsDefault')
      (
        'Component = btnSelectDict'
        'Status = stsDefault')
      (
        'Component = RichEdit1'
        'Status = stsDefault')
      (
        'Component = frmHunSpell'
        'Status = stsDefault'))
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.Dict'
    FileName = 'en_US-large.dic'
    Filter = 'HanSpell Dictionary & Aff file|*.dic'
    Title = 'Specify Dictionary file (Corresponding *.aff file also required)'
    Left = 655
    Top = 65534
  end
  object SpellChecker1: TskaHunSpellChecker
    Active = False
    Left = 56
    Top = 160
  end
end
