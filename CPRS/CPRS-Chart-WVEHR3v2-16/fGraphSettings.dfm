inherited frmGraphSettings: TfrmGraphSettings
  Left = 109
  Top = 60
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Graph Settings'
  ClientHeight = 424
  ClientWidth = 434
  Position = poMainFormCenter
  ExplicitWidth = 440
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel [0]
    Left = 0
    Top = 391
    Width = 434
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object btnClose: TButton
      AlignWithMargins = True
      Left = 356
      Top = 3
      Width = 75
      Height = 27
      Align = alRight
      Cancel = True
      Caption = 'Close'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object gpMain: TGridPanel [1]
    Left = 0
    Top = 3
    Width = 434
    Height = 388
    Align = alBottom
    Caption = 'gpMain'
    ColumnCollection = <
      item
        Value = 33.282404999433570000
      end
      item
        Value = 33.115676145622960000
      end
      item
        Value = 33.601918854943460000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pnlSources
        Row = 0
      end
      item
        Column = 1
        Control = pnlOptions
        Row = 0
      end
      item
        Column = 2
        Control = pnlDetails
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = pnlShowDefaults
        Row = 1
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = pnlSaveDefaults
        Row = 2
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = pnlSettings
        Row = 3
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 32.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 32.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 44.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 8.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 1
    object pnlSources: TPanel
      Left = 1
      Top = 1
      Width = 143
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 0
      object lblSources: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 137
        Height = 13
        Align = alTop
        Caption = 'Sources Displayed:'
        ParentShowHint = False
        ShowHint = False
        ExplicitWidth = 91
      end
      object lstSourcesCopy: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 137
        Height = 20
        Align = alTop
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        Visible = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 236
        Width = 143
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 1
        object btnAll: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 65
          Height = 28
          Align = alLeft
          Caption = 'All'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnClick = btnAllClick
        end
        object brnClear: TButton
          AlignWithMargins = True
          Left = 75
          Top = 3
          Width = 65
          Height = 28
          Align = alRight
          Cancel = True
          Caption = 'Clear'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = btnAllClick
        end
      end
      object lstSources: TCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 48
        Width = 137
        Height = 185
        Align = alClient
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        Sorted = True
        TabOrder = 2
      end
    end
    object pnlOptions: TPanel
      Left = 144
      Top = 1
      Width = 143
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 1
      object lblOptions: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 137
        Height = 13
        Align = alTop
        Caption = 'Options:'
        ParentShowHint = False
        ShowHint = False
        ExplicitWidth = 39
      end
      object lstATypes: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 137
        Height = 20
        Align = alTop
        ItemHeight = 13
        TabOrder = 0
        Visible = False
      end
      object chklstOptions: TCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 48
        Width = 137
        Height = 219
        OnClickCheck = chklstOptionsClickCheck
        Align = alClient
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        Sorted = True
        TabOrder = 1
      end
    end
    object pnlDetails: TPanel
      Left = 287
      Top = 1
      Width = 146
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 2
      object lblMaxGraphs: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'Max Graphs in Display:'
        ParentShowHint = False
        ShowHint = False
        ExplicitWidth = 108
      end
      object lblMinGraphHeight: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 48
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'Minimum Graph Height:'
        ParentShowHint = False
        ShowHint = False
        ExplicitWidth = 110
      end
      object lblMaxSelect: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 93
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'Max Items to Select:'
        ParentShowHint = False
        ShowHint = False
        WordWrap = True
        ExplicitWidth = 96
      end
      object lblOutpatient: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 138
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'Outpatient Date Default:'
        ParentShowHint = False
        ShowHint = False
        WordWrap = True
        ExplicitWidth = 115
      end
      object lblInpatient: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 184
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'Inpatient Date Default:'
        ParentShowHint = False
        ShowHint = False
        WordWrap = True
        ExplicitWidth = 107
      end
      object Panel2: TPanel
        Left = 0
        Top = 19
        Width = 146
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 0
        object lblMaxGraphsRef: TLabel
          AlignWithMargins = True
          Left = 86
          Top = 3
          Width = 57
          Height = 20
          Align = alRight
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          ExplicitLeft = 89
          ExplicitHeight = 26
        end
        object spnMaxGraphs: TUpDown
          Left = 66
          Top = 3
          Width = 17
          Height = 21
          AlignButton = udLeft
          Min = 1
          Max = 20
          ParentShowHint = False
          Position = 5
          ShowHint = False
          TabOrder = 0
          OnClick = spnMaxGraphsClick
        end
        object txtMaxGraphs: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 62
          Height = 20
          Align = alLeft
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '5'
          OnChange = txtMaxGraphsChange
          OnExit = txtMaxGraphsExit
          OnKeyPress = txtMaxGraphsKeyPress
          ExplicitHeight = 21
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 64
        Width = 146
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 1
        object lblMinGraphHeightRef: TLabel
          AlignWithMargins = True
          Left = 86
          Top = 3
          Width = 57
          Height = 20
          Align = alRight
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          ExplicitLeft = 89
          ExplicitTop = 9
          ExplicitHeight = 17
        end
        object txtMinGraphHeight: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 62
          Height = 20
          Align = alLeft
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '90'
          OnChange = txtMinGraphHeightChange
          OnExit = txtMinGraphHeightExit
          OnKeyPress = txtMinGraphHeightKeyPress
          ExplicitHeight = 21
        end
        object spnMinGraphHeight: TUpDown
          Left = 66
          Top = 3
          Width = 17
          Height = 21
          Min = 10
          Max = 1000
          ParentShowHint = False
          Position = 90
          ShowHint = False
          TabOrder = 1
          OnClick = spnMinGraphHeightClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 109
        Width = 146
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 2
        object lblMaxSelectRef: TLabel
          AlignWithMargins = True
          Left = 86
          Top = 3
          Width = 57
          Height = 20
          Align = alRight
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          ExplicitLeft = 89
          ExplicitTop = 9
          ExplicitHeight = 17
        end
        object txtMaxSelect: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 62
          Height = 20
          Align = alLeft
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '100'
          OnChange = txtMaxSelectChange
          OnExit = txtMaxSelectExit
          OnKeyPress = txtMaxSelectKeyPress
          ExplicitHeight = 21
        end
        object spnMaxSelect: TUpDown
          Left = 66
          Top = 3
          Width = 17
          Height = 21
          Min = 1
          Max = 1000
          ParentShowHint = False
          Position = 100
          ShowHint = False
          TabOrder = 1
          OnClick = spnMaxSelectClick
        end
      end
      object cboDateRangeOutpatient: TORComboBox
        AlignWithMargins = True
        Left = 3
        Top = 157
        Width = 140
        Height = 21
        Style = orcsDropDown
        Align = alTop
        AutoSelect = True
        Caption = ''
        Color = clWindow
        DropDownCount = 9
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
        TabOrder = 3
        TabStop = True
        Text = ''
        CharsNeedMatch = 1
      end
      object cboDateRangeInpatient: TORComboBox
        AlignWithMargins = True
        Left = 3
        Top = 203
        Width = 140
        Height = 21
        Style = orcsDropDown
        Align = alTop
        AutoSelect = True
        Caption = ''
        Color = clWindow
        DropDownCount = 9
        Items.Strings = (
          'S^Date Range...'
          '1^Today'
          '2^One Week'
          '3^Two Weeks'
          '4^One Month'
          '5^Six Months'
          '6^One Year'
          '7^Two Years'
          '8^All Results')
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
        TabOrder = 4
        TabStop = True
        Text = ''
        CharsNeedMatch = 1
      end
    end
    object pnlShowDefaults: TPanel
      Left = 1
      Top = 271
      Width = 432
      Height = 32
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 3
      object bvlDefaults: TBevel
        Left = 0
        Top = 0
        Width = 432
        Height = 2
        Align = alTop
        ExplicitLeft = 176
        ExplicitTop = 42
        ExplicitWidth = 248
      end
      object lblShow: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 72
        Height = 24
        Align = alLeft
        Alignment = taCenter
        Caption = 'Show Defaults:'
        ParentShowHint = False
        ShowHint = False
        ExplicitHeight = 13
      end
      object btnPersonal: TButton
        AlignWithMargins = True
        Left = 143
        Top = 5
        Width = 140
        Height = 24
        Align = alRight
        Cancel = True
        Caption = 'Personal'
        TabOrder = 0
        OnClick = btnPublicClick
      end
      object btnPublic: TButton
        AlignWithMargins = True
        Left = 289
        Top = 5
        Width = 140
        Height = 24
        Align = alRight
        Cancel = True
        Caption = 'Public'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = btnPublicClick
      end
    end
    object pnlSaveDefaults: TPanel
      Left = 1
      Top = 303
      Width = 432
      Height = 32
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 4
      object lblSave: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 79
        Height = 26
        Align = alLeft
        Alignment = taCenter
        Caption = 'Save as Default:'
        ParentShowHint = False
        ShowHint = False
        ExplicitHeight = 13
      end
      object btnPersonalSave: TButton
        AlignWithMargins = True
        Left = 146
        Top = 3
        Width = 137
        Height = 26
        Align = alRight
        Cancel = True
        Caption = 'Personal'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = SaveClick
        ExplicitLeft = 88
      end
      object btnPublicSave: TButton
        AlignWithMargins = True
        Left = 289
        Top = 3
        Width = 140
        Height = 26
        Align = alRight
        Cancel = True
        Caption = 'Public'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = SaveClick
      end
    end
    object pnlSettings: TPanel
      Left = 1
      Top = 335
      Width = 432
      Height = 44
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSources'
      ShowCaption = False
      TabOrder = 5
      object bvlBase: TBevel
        Left = 0
        Top = 0
        Width = 432
        Height = 2
        Align = alTop
        ExplicitLeft = 13
        ExplicitTop = 42
        ExplicitWidth = 412
      end
      object lblConversions: TLabel
        Left = 215
        Top = 31
        Width = 46
        Height = 13
        Caption = 'Functions'
        ParentShowHint = False
        ShowHint = False
        Visible = False
      end
      object bvlMid: TBevel
        Left = 0
        Top = 42
        Width = 432
        Height = 2
        Align = alBottom
        ExplicitLeft = 176
        ExplicitWidth = 248
      end
      object lblOptionsInfo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 426
        Height = 13
        Align = alTop
        Caption = 'Settings saved as your defaults are applied to new graphs.'
        ParentShowHint = False
        ShowHint = False
        WordWrap = True
        ExplicitWidth = 275
      end
      object cboConversions: TORComboBox
        Left = 0
        Top = 21
        Width = 116
        Height = 21
        Style = orcsDropDown
        Align = alLeft
        AutoSelect = True
        Caption = ''
        Color = clWindow
        DropDownCount = 8
        Items.Strings = (
          '<none>'
          'Standard Deviations'
          'Inverse Values')
        ItemHeight = 13
        ItemTipColor = clWindow
        ItemTipEnable = True
        ListItemsOnly = False
        LongList = False
        LookupPiece = 0
        MaxLength = 0
        ParentShowHint = False
        ShowHint = False
        Sorted = False
        SynonymChars = '<>'
        TabOrder = 0
        Text = ''
        Visible = False
        CharsNeedMatch = 1
      end
      object lstOptions: TListBox
        Left = 289
        Top = 21
        Width = 143
        Height = 21
        Align = alRight
        ItemHeight = 13
        Items.Strings = (
          '3D^A'
          'Clear Background^B'
          'Dates^C'
          'Fixed Date Range^M'
          'Gradient^D'
          'Hints^E'
          'Legend^F'
          'Lines^G'
          'Sort by Type^H'
          'Stay on Top^I'
          'Values^J'
          'Zoom, Horizontal^K'
          'Zoom, Vertical^L')
        Sorted = True
        TabOrder = 1
        Visible = False
      end
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 48
    Top = 88
    Data = (
      (
        'Component = frmGraphSettings'
        'Status = stsDefault')
      (
        'Component = pnlBottom'
        'Status = stsDefault')
      (
        'Component = btnClose'
        'Status = stsDefault')
      (
        'Component = gpMain'
        'Status = stsDefault')
      (
        'Component = pnlSources'
        'Status = stsDefault')
      (
        'Component = pnlOptions'
        'Status = stsDefault')
      (
        'Component = pnlDetails'
        'Status = stsDefault')
      (
        'Component = pnlShowDefaults'
        'Status = stsDefault')
      (
        'Component = pnlSaveDefaults'
        'Status = stsDefault')
      (
        'Component = pnlSettings'
        'Status = stsDefault')
      (
        'Component = lstSourcesCopy'
        'Status = stsDefault')
      (
        'Component = Panel1'
        'Status = stsDefault')
      (
        'Component = btnAll'
        'Status = stsDefault')
      (
        'Component = brnClear'
        'Status = stsDefault')
      (
        'Component = lstSources'
        'Status = stsDefault')
      (
        'Component = lstATypes'
        'Status = stsDefault')
      (
        'Component = chklstOptions'
        'Status = stsDefault')
      (
        'Component = Panel2'
        'Status = stsDefault')
      (
        'Component = spnMaxGraphs'
        'Status = stsDefault')
      (
        'Component = txtMaxGraphs'
        'Status = stsDefault')
      (
        'Component = Panel3'
        'Status = stsDefault')
      (
        'Component = txtMinGraphHeight'
        'Status = stsDefault')
      (
        'Component = spnMinGraphHeight'
        'Status = stsDefault')
      (
        'Component = Panel4'
        'Status = stsDefault')
      (
        'Component = txtMaxSelect'
        'Status = stsDefault')
      (
        'Component = spnMaxSelect'
        'Status = stsDefault')
      (
        'Component = cboDateRangeOutpatient'
        'Status = stsDefault')
      (
        'Component = cboDateRangeInpatient'
        'Status = stsDefault')
      (
        'Component = btnPersonal'
        'Status = stsDefault')
      (
        'Component = btnPublic'
        'Status = stsDefault')
      (
        'Component = btnPersonalSave'
        'Status = stsDefault')
      (
        'Component = btnPublicSave'
        'Status = stsDefault')
      (
        'Component = cboConversions'
        'Status = stsDefault')
      (
        'Component = lstOptions'
        'Status = stsDefault'))
  end
end
