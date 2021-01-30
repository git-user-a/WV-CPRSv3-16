inherited frmGraphProfiles: TfrmGraphProfiles
  Left = 721
  Top = 528
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Select Items and Define Views'
  ClientHeight = 443
  ClientWidth = 536
  Position = poMainFormCenter
  ExplicitWidth = 542
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  object lblSelection: TLabel [0]
    Left = 142
    Top = 29
    Width = 28
    Height = 13
    Hint = 'Make selections move them to the right.'
    Caption = 'Items:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblDisplay: TLabel [1]
    Left = 312
    Top = 29
    Width = 89
    Height = 13
    Hint = 
      'These items can be saved as a View and/or displayed on the graph' +
      '.'
    Caption = 'Items for Graphing:'
    ParentShowHint = False
    ShowHint = False
  end
  object bvlBase: TBevel [2]
    Left = 8
    Top = 339
    Width = 457
    Height = 2
  end
  object lblEditInfo: TLabel [3]
    Left = 142
    Top = 278
    Width = 202
    Height = 13
    Caption = 'Items for Graphing can be saved as Views.'
  end
  object lblSelectionInfo: TLabel [4]
    Left = 142
    Top = 8
    Width = 89
    Height = 13
    Caption = 'Select Items using:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblSelectandDefine: TLabel [5]
    AlignWithMargins = True
    Left = 3
    Top = 349
    Width = 530
    Height = 13
    Align = alBottom
    Caption = 
      'Use Select/Define button or Right-click on graphs to select item' +
      's for display.'
    WordWrap = True
    ExplicitLeft = 0
    ExplicitTop = 409
    ExplicitWidth = 359
  end
  object lblEditInfo1: TLabel [6]
    Left = 142
    Top = 294
    Width = 187
    Height = 13
    Caption = 'Edit Views by saving to the same name.'
  end
  object lblUser: TLabel [7]
    Left = 8
    Top = 236
    Width = 36
    Height = 13
    Caption = 'Person:'
    ParentShowHint = False
    ShowHint = False
    WordWrap = True
  end
  object pnlTempData: TPanel [8]
    Left = 0
    Top = 290
    Width = 536
    Height = 56
    Align = alBottom
    Color = 10930928
    ParentBackground = False
    TabOrder = 18
    Visible = False
    ExplicitTop = 353
    ExplicitWidth = 518
    object lblSave: TLabel
      Left = 184
      Top = 16
      Width = 3
      Height = 13
      Visible = False
    end
    object lblClose: TLabel
      Left = 192
      Top = 0
      Width = 3
      Height = 13
      Visible = False
    end
    object lstActualItems: TORListBox
      Left = 8
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Caption = ''
      ItemTipColor = clWindow
      LongList = False
    end
    object lstDrugClass: TListBox
      Left = 112
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 1
    end
    object lstScratch: TListBox
      Left = 216
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 2
    end
    object lstTests: TListBox
      Left = 320
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object btnClear: TButton [9]
    Left = 8
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Clear Selections'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnClick = btnClearClick
  end
  object btnSave: TButton [10]
    Left = 286
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Save Personal...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 11
    OnClick = btnSaveClick
  end
  object btnDelete: TButton [11]
    Left = 100
    Top = 313
    Width = 85
    Height = 20
    Caption = 'Delete...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    OnClick = btnDeleteClick
  end
  object btnRemoveOne: TButton [12]
    Left = 280
    Top = 173
    Width = 21
    Height = 21
    Caption = '<'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    OnClick = btnRemoveOneClick
  end
  object btnRemoveAll: TButton [13]
    Left = 280
    Top = 205
    Width = 21
    Height = 21
    Caption = '<<'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = btnRemoveAllClick
  end
  object lstItemsDisplayed: TORListBox [14]
    Left = 312
    Top = 44
    Width = 150
    Height = 228
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 2
    OnDblClick = lstItemsDisplayedDblClick
    Caption = ''
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = lstItemsDisplayedChange
  end
  object pnlSource: TPanel [15]
    Left = 247
    Top = -2
    Width = 190
    Height = 25
    BevelOuter = bvNone
    TabOrder = 10
    object radSourcePat: TRadioButton
      Left = 106
      Top = 5
      Width = 82
      Height = 17
      Hint = 
        'Use this for selecting patient items. Note: this form is used pr' +
        'imarily for defining views, #13 not selecting data.'
      Caption = 'Patient Items'
      TabOrder = 1
      OnClick = radSourceAllClick
    end
    object radSourceAll: TRadioButton
      Left = 0
      Top = 5
      Width = 60
      Height = 17
      Hint = 'Use this for defining views. It shows every possible item.'
      Caption = 'All Items'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = radSourceAllClick
    end
  end
  object lstItemsSelection: TORListBox [16]
    Left = 142
    Top = 44
    Width = 124
    Height = 225
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 1
    Visible = False
    OnDblClick = cboAllItemsClick
    Caption = ''
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = cboAllItemsChange
  end
  object pnlApply: TPanel [17]
    Left = 0
    Top = 365
    Width = 536
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
    ExplicitTop = 422
    ExplicitWidth = 518
    object lblApply: TLabel
      Left = 0
      Top = 0
      Width = 536
      Height = 13
      Align = alTop
      Caption = 'Display Items for Graphing to:'
      ExplicitWidth = 138
    end
    object radTop: TRadioButton
      Left = 8
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Top'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object radBottom: TRadioButton
      Left = 74
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Bottom'
      TabOrder = 1
    end
    object radBoth: TRadioButton
      Left = 141
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Both'
      TabOrder = 2
    end
    object radNeither: TRadioButton
      Left = 208
      Top = 17
      Width = 81
      Height = 17
      Caption = 'No Change'
      TabOrder = 3
    end
  end
  object btnAdd: TButton [18]
    Left = 280
    Top = 125
    Width = 21
    Height = 21
    Caption = '>'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnClick = cboAllItemsClick
  end
  object btnAddAll: TButton [19]
    Left = 280
    Top = 93
    Width = 21
    Height = 21
    Caption = '>>'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = cboAllItemsClick
  end
  object btnRename: TButton [20]
    Left = 195
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Rename...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnClick = btnRenameClick
  end
  object btnSavePublic: TButton [21]
    Left = 379
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Save Public...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object cboAllItems: TORComboBox [22]
    Left = 142
    Top = 44
    Width = 124
    Height = 228
    Style = orcsSimple
    AutoSelect = True
    Caption = ''
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 0
    MaxLength = 0
    ParentShowHint = False
    Pieces = '3'
    ShowHint = False
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    Text = ''
    OnChange = cboAllItemsChange
    OnDblClick = cboAllItemsClick
    OnNeedData = cboAllItemsNeedData
    CharsNeedMatch = 1
  end
  object pnlAllSources: TPanel [23]
    Left = 8
    Top = 30
    Width = 128
    Height = 245
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    object splViews: TSplitter
      Left = 0
      Top = 122
      Width = 128
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 0
      ExplicitWidth = 125
    end
    object pnlSources: TPanel
      Left = 0
      Top = 0
      Width = 128
      Height = 122
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblSource: TLabel
        Left = 0
        Top = 0
        Width = 128
        Height = 13
        Hint = 'These are the different types of data for graphing.'
        Align = alTop
        Caption = 'Sources:'
        ParentShowHint = False
        ShowHint = False
        ExplicitWidth = 42
      end
      object lstSources: TORListBox
        Left = 0
        Top = 13
        Width = 128
        Height = 109
        Align = alClient
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnDblClick = lstSourcesDblClick
        OnEnter = lstSourcesEnter
        OnExit = lstSourcesExit
        Caption = ''
        ItemTipColor = clWindow
        LongList = False
        Pieces = '2'
        OnChange = lstSourcesChange
      end
    end
    object pnlOtherSources: TPanel
      Left = 0
      Top = 125
      Width = 128
      Height = 120
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BorderWidth = 1
      TabOrder = 1
      object pnlOtherSourcesUser: TPanel
        Left = 3
        Top = 76
        Width = 122
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object lblOtherPersons: TLabel
          Left = 0
          Top = 7
          Width = 122
          Height = 13
          Align = alBottom
          Caption = 'Select Person:'
          ExplicitWidth = 69
        end
        object cboUser: TORComboBox
          Left = 0
          Top = 20
          Width = 122
          Height = 21
          Style = orcsDropDown
          Align = alBottom
          AutoSelect = True
          Caption = ''
          Color = clWindow
          DropDownCount = 6
          Items.Strings = (
            '')
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = False
          LongList = True
          LookupPiece = 0
          MaxLength = 0
          Pieces = '2'
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 0
          TabStop = True
          Text = ''
          OnClick = cboUserClick
          OnNeedData = cboUserNeedData
          CharsNeedMatch = 1
        end
      end
      object pnlOtherSourcesBottom: TPanel
        Left = 3
        Top = 3
        Width = 122
        Height = 73
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object lstOtherSources: TORListBox
          Left = 0
          Top = 30
          Width = 122
          Height = 43
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnDblClick = lstSourcesDblClick
          OnEnter = lstOtherSourcesEnter
          OnExit = lstOtherSourcesExit
          Caption = ''
          ItemTipColor = clWindow
          LongList = False
          Pieces = '2'
          OnChange = lstOtherSourcesChange
        end
        object pnlOtherViews: TPanel
          Left = 0
          Top = 0
          Width = 122
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblOtherViews: TLabel
            Left = 0
            Top = 17
            Width = 122
            Height = 13
            Align = alBottom
            Caption = 'Other Views:'
            ExplicitWidth = 60
          end
          object lblSelectOthers: TLabel
            Left = 0
            Top = 0
            Width = 122
            Height = 13
            Align = alTop
            Caption = 'Select Views from others'
            ExplicitWidth = 116
          end
        end
      end
    end
  end
  object btnViews: TButton [24]
    Left = 8
    Top = 5
    Width = 120
    Height = 21
    Caption = 'Show Other Views'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    Visible = False
    OnClick = btnViewsClick
  end
  object btnDefinitions: TButton [25]
    Left = 8
    Top = 281
    Width = 120
    Height = 21
    Caption = 'View Definitions...'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 16
    OnClick = btnDefinitionsClick
  end
  object pnlBottom: TPanel [26]
    Left = 0
    Top = 408
    Width = 536
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 17
    ExplicitTop = 465
    ExplicitWidth = 518
    object btnClose: TButton
      AlignWithMargins = True
      Left = 438
      Top = 3
      Width = 95
      Height = 29
      Align = alRight
      Cancel = True
      Caption = 'Close'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 420
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 48
    Top = 64
    Data = (
      (
        'Component = btnClear'
        'Status = stsDefault')
      (
        'Component = btnSave'
        'Status = stsDefault')
      (
        'Component = btnDelete'
        'Status = stsDefault')
      (
        'Component = btnRemoveOne'
        'Status = stsDefault')
      (
        'Component = btnRemoveAll'
        'Status = stsDefault')
      (
        'Component = lstItemsDisplayed'
        'Status = stsDefault')
      (
        'Component = pnlSource'
        'Status = stsDefault')
      (
        'Component = radSourcePat'
        'Status = stsDefault')
      (
        'Component = radSourceAll'
        'Status = stsDefault')
      (
        'Component = lstItemsSelection'
        'Status = stsDefault')
      (
        'Component = pnlTempData'
        'Status = stsDefault')
      (
        'Component = lstActualItems'
        'Status = stsDefault')
      (
        'Component = lstDrugClass'
        'Status = stsDefault')
      (
        'Component = lstScratch'
        'Status = stsDefault')
      (
        'Component = lstTests'
        'Status = stsDefault')
      (
        'Component = pnlApply'
        'Status = stsDefault')
      (
        'Component = radTop'
        'Status = stsDefault')
      (
        'Component = radBottom'
        'Status = stsDefault')
      (
        'Component = radBoth'
        'Status = stsDefault')
      (
        'Component = radNeither'
        'Status = stsDefault')
      (
        'Component = btnAdd'
        'Status = stsDefault')
      (
        'Component = btnAddAll'
        'Status = stsDefault')
      (
        'Component = btnRename'
        'Status = stsDefault')
      (
        'Component = btnSavePublic'
        'Status = stsDefault')
      (
        'Component = cboAllItems'
        'Status = stsDefault')
      (
        'Component = frmGraphProfiles'
        'Status = stsDefault')
      (
        'Component = pnlAllSources'
        'Status = stsDefault')
      (
        'Component = pnlSources'
        'Status = stsDefault')
      (
        'Component = lstSources'
        'Status = stsDefault')
      (
        'Component = pnlOtherSources'
        'Status = stsDefault')
      (
        'Component = pnlOtherSourcesUser'
        'Status = stsDefault')
      (
        'Component = cboUser'
        'Status = stsDefault')
      (
        'Component = pnlOtherSourcesBottom'
        'Status = stsDefault')
      (
        'Component = lstOtherSources'
        'Status = stsDefault')
      (
        'Component = btnViews'
        'Status = stsDefault')
      (
        'Component = btnDefinitions'
        'Status = stsDefault')
      (
        'Component = pnlOtherViews'
        'Status = stsDefault')
      (
        'Component = pnlBottom'
        'Status = stsDefault')
      (
        'Component = btnClose'
        'Status = stsDefault'))
  end
end
