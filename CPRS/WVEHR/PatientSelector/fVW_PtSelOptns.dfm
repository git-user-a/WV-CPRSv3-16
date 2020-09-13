inherited frmVW_PtSelOptns: TfrmVW_PtSelOptns
  Left = 200
  Top = 190
  BorderStyle = bsNone
  Caption = 'frmVW_PtSelOptns'
  ClientHeight = 552
  ClientWidth = 224
  DefaultMonitor = dmDesktop
  ParentFont = True
  Position = poDesigned
  ExplicitWidth = 224
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  object lblPtList: TLabel [0]
    AlignWithMargins = True
    Left = 3
    Top = 104
    Width = 218
    Height = 13
    Align = alTop
    Caption = 'Patient List'
    Visible = False
    ExplicitWidth = 53
  end
  object orapnlMain: TORAutoPanel [1]
    Left = 0
    Top = 120
    Width = 224
    Height = 293
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
  end
  object rgPtList: TRadioGroup [2]
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 218
    Height = 98
    Margins.Top = 0
    Align = alTop
    Columns = 2
    Items.Strings = (
      '&All'
      '&Wards'
      '&Team/Personal'
      '&Specialties'
      '&Providers'
      '&Clinics'
      'PC&MM'
      'No &Default')
    Constraints.MinHeight = 98
    TabOrder = 1
    OnClick = rgPtListClick
  end
  object cboList: TORComboBox [3]
    AlignWithMargins = True
    Left = 3
    Top = 123
    Width = 218
    Height = 287
    Style = orcsSimple
    Align = alClient
    AutoSelect = True
    Caption = 'Patient List'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 2
    MaxLength = 0
    ParentShowHint = False
    Pieces = '2'
    ShowHint = True
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 2
    Text = ''
    OnExit = cboListExit
    OnKeyPause = cboListKeyPause
    OnMouseClick = cboListMouseClick
    OnNeedData = cboListNeedData
    CharsNeedMatch = 1
  end
  object pnlDateRange: TPanel [4]
    Left = 0
    Top = 497
    Width = 224
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlDateRange'
    ShowCaption = False
    TabOrder = 3
    object lblDateRange: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 218
      Height = 13
      Align = alTop
      Caption = 'List Appointments for'
      ExplicitWidth = 102
    end
    object cboDateRange: TORComboBox
      AlignWithMargins = True
      Left = 3
      Top = 31
      Width = 218
      Height = 21
      Style = orcsDropDown
      Align = alBottom
      AutoSelect = True
      Caption = 'List Appointments for'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = False
      LookupPiece = 0
      MaxLength = 0
      Pieces = '2'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      Text = ''
      OnExit = cboDateRangeExit
      OnMouseClick = cboDateRangeMouseClick
      CharsNeedMatch = 1
    end
  end
  object rgInDepth: TRadioGroup [5]
    AlignWithMargins = True
    Left = 3
    Top = 416
    Width = 218
    Height = 78
    Align = alBottom
    Caption = 'Lookup By '
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      '&NAME or LAST 4 SSN'
      '&PHONE NUMBER [RESIDENCE]'
      '&DATE OF BIRTH')
    TabOrder = 4
    Visible = False
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 40
    Top = 176
    Data = (
      (
        'Component = orapnlMain'
        'Status = stsDefault')
      (
        'Component = cboList'
        'Status = stsDefault')
      (
        'Component = cboDateRange'
        'Status = stsDefault')
      (
        'Component = frmVW_PtSelOptns'
        'Status = stsDefault')
      (
        'Component = pnlDateRange'
        'Status = stsDefault')
      (
        'Component = rgPtList'
        'Status = stsDefault')
      (
        'Component = rgInDepth'
        'Status = stsDefault'))
  end
  object calApptRng: TORDateRangeDlg
    DateOnly = True
    Instruction = 'Enter a date range -'
    LabelStart = 'First Appointment Date'
    LabelStop = 'Last Appointment Date'
    RequireTime = False
    Format = 'mmm d,yy'
    Left = 128
    Top = 176
  end
end
