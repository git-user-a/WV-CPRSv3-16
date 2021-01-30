inherited frmPtSel: TfrmPtSel
  Left = 290
  Top = 149
  BorderIcons = [biSystemMenu]
  Caption = 'Patient Selection'
  ClientHeight = 555
  ClientWidth = 785
  OldCreateOrder = True
  Position = poDefault
  OnResize = FormResize
  ExplicitWidth = 801
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  object sptVert: TSplitter [0]
    Left = 0
    Top = 322
    Width = 785
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 290
  end
  object pnlDivide: TORAutoPanel [1]
    Left = 0
    Top = 326
    Width = 785
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    Visible = False
    ExplicitTop = 294
    object lblNotifications: TLabel
      Left = 4
      Top = 4
      Width = 58
      Height = 13
      Caption = 'Notifications'
    end
    object ggeInfo: TGauge
      Left = 212
      Top = 1
      Width = 100
      Height = 15
      BackColor = clHighlightText
      Color = clBtnFace
      ForeColor = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCaptionText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Progress = 0
      Visible = False
    end
  end
  object pnlPtSel: TORAutoPanel [2]
    Left = 0
    Top = 32
    Width = 785
    Height = 290
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 4
    OnResize = pnlPtSelResize
    ExplicitTop = 0
    object lblPatient: TLabel
      Left = 216
      Top = 4
      Width = 33
      Height = 13
      Caption = 'Patient'
      ShowAccelChar = False
    end
    object cboPatient: TORComboBox
      Left = 216
      Top = 33
      Width = 272
      Height = 251
      Hint = 'Enter name or use "Last 4" (x1234) format'
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Patient'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = True
      LookupPiece = 2
      MaxLength = 0
      ParentShowHint = False
      Pieces = '2,3'
      ShowHint = True
      Sorted = False
      SynonymChars = '<>'
      TabPositions = '20,25,30'
      TabOrder = 1
      Text = ''
      OnChange = cboPatientChange
      OnDblClick = cboPatientDblClick
      OnEnter = cboPatientEnter
      OnExit = cboPatientExit
      OnKeyDown = cboPatientKeyDown
      OnKeyUp = cboPatientKeyUp
      OnKeyPause = cboPatientKeyPause
      OnMouseClick = cboPatientMouseClick
      OnNeedData = cboPatientNeedData
      CharsNeedMatch = 1
      UniqueAutoComplete = True
    end
    object cmdSaveList: TButton
      Left = 494
      Top = 252
      Width = 175
      Height = 21
      Caption = 'Save Patient List Settings'
      TabOrder = 0
      OnClick = cmdSaveListClick
    end
    object RadioGroup1: TRadioGroup
      Left = 494
      Top = 181
      Width = 281
      Height = 65
      Caption = 'Specific "In-Depth" Lookup by '
      ItemIndex = 0
      Items.Strings = (
        '&None of the below'
        '&PHONE NUMBER [RESIDENCE]'
        '&DATE OF BIRTH')
      TabOrder = 2
      OnClick = onclick1
    end
  end
  object pnlNotifications: TORAutoPanel [3]
    Left = 0
    Top = 526
    Width = 785
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object txtCmdComments: TVA508StaticText
      Name = 'txtCmdComments'
      Left = 441
      Top = 0
      Width = 159
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Show Comments Button Disabled'
      TabOrder = 7
      Visible = False
      ShowAccelChar = True
    end
    object txtCmdRemove: TVA508StaticText
      Name = 'txtCmdRemove'
      Left = 577
      Top = 0
      Width = 120
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Remove Button Disabled'
      TabOrder = 9
      Visible = False
      ShowAccelChar = True
    end
    object txtCmdForward: TVA508StaticText
      Name = 'txtCmdForward'
      Left = 344
      Top = 0
      Width = 118
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Forward Button Disabled'
      TabOrder = 5
      Visible = False
      ShowAccelChar = True
    end
    object txtCmdProcess: TVA508StaticText
      Name = 'txtCmdProcess'
      Left = 232
      Top = 0
      Width = 118
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Process Button Disabled'
      TabOrder = 3
      Visible = False
      ShowAccelChar = True
    end
    object cmdRemove: TButton
      AlignWithMargins = True
      Left = 687
      Top = 3
      Width = 95
      Height = 23
      Align = alRight
      Caption = 'Remove'
      Enabled = False
      TabOrder = 8
      OnClick = cmdRemoveClick
      ExplicitLeft = 577
      ExplicitTop = 10
      ExplicitHeight = 21
    end
    object cmdComments: TButton
      AlignWithMargins = True
      Left = 407
      Top = 3
      Width = 95
      Height = 23
      Align = alLeft
      Caption = 'Show Comments'
      Enabled = False
      TabOrder = 6
      OnClick = cmdCommentsClick
      ExplicitLeft = 441
      ExplicitTop = 10
      ExplicitHeight = 21
    end
    object cmdForward: TButton
      AlignWithMargins = True
      Left = 306
      Top = 3
      Width = 95
      Height = 23
      Align = alLeft
      Caption = 'Forward'
      Enabled = False
      TabOrder = 4
      OnClick = cmdForwardClick
      ExplicitLeft = 335
      ExplicitTop = 10
      ExplicitHeight = 21
    end
    object cmdProcess: TButton
      AlignWithMargins = True
      Left = 205
      Top = 3
      Width = 95
      Height = 23
      Align = alLeft
      Caption = 'Process'
      Enabled = False
      TabOrder = 2
      OnClick = cmdProcessClick
      ExplicitLeft = 229
      ExplicitTop = 10
      ExplicitHeight = 21
    end
    object cmdProcessAll: TButton
      AlignWithMargins = True
      Left = 104
      Top = 3
      Width = 95
      Height = 23
      Align = alLeft
      Caption = 'Process All'
      TabOrder = 1
      OnClick = cmdProcessAllClick
      ExplicitLeft = 120
      ExplicitTop = 10
      ExplicitHeight = 21
    end
    object cmdProcessInfo: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 95
      Height = 23
      Align = alLeft
      Caption = 'Process Info'
      TabOrder = 0
      OnClick = cmdProcessInfoClick
      ExplicitLeft = 11
      ExplicitTop = 10
      ExplicitHeight = 21
    end
  end
  object lstvAlerts: TCaptionListView [4]
    Left = 0
    Top = 343
    Width = 785
    Height = 183
    Align = alClient
    Columns = <
      item
        Caption = 'Info'
        Width = 30
      end
      item
        Caption = 'Patient'
        Tag = 1
        Width = 120
      end
      item
        Caption = 'Location'
        Tag = 2
        Width = 60
      end
      item
        Caption = 'Urgency'
        Tag = 3
        Width = 67
      end
      item
        Caption = 'Alert Date/Time'
        Tag = 4
        Width = 110
      end
      item
        Caption = 'Message'
        Tag = 5
        Width = 280
      end
      item
        Caption = 'Forwarded By/When'
        Tag = 6
        Width = 180
      end>
    HideSelection = False
    HoverTime = 0
    IconOptions.WrapText = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    PopupMenu = popNotifications
    ShowWorkAreas = True
    ShowHint = True
    TabOrder = 2
    ViewStyle = vsReport
    OnColumnClick = lstvAlertsColumnClick
    OnCompare = lstvAlertsCompare
    OnDblClick = lstvAlertsDblClick
    OnInfoTip = lstvAlertsInfoTip
    OnKeyDown = lstvAlertsKeyDown
    OnMouseUp = lstvAlertsMouseUp
    OnSelectItem = lstvAlertsSelectItem
    AutoSize = False
    Caption = 'Notifications'
    HideTinyColumns = False
    ExplicitTop = 311
    ExplicitHeight = 209
  end
  object pnlButtons: TPanel [5]
    Left = 0
    Top = 0
    Width = 785
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlButtons'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -14
    object bbInquiryDemographics: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 94
      Height = 26
      Align = alLeft
      Caption = '&Inquiry'
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbInquiryDemographicsClick
      ExplicitLeft = 111
    end
    object cmdOK: TButton
      AlignWithMargins = True
      Left = 620
      Top = 3
      Width = 78
      Height = 26
      Align = alRight
      Caption = 'OK'
      TabOrder = 1
      OnClick = cmdOKClick
      ExplicitLeft = 577
      ExplicitTop = 5
      ExplicitHeight = 21
    end
    object cmdCancel: TButton
      AlignWithMargins = True
      Left = 704
      Top = 3
      Width = 78
      Height = 26
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = cmdCancelClick
      ExplicitLeft = 682
      ExplicitTop = 11
      ExplicitHeight = 21
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 72
    Top = 88
    Data = (
      (
        'Component = pnlDivide'
        'Status = stsDefault')
      (
        'Component = pnlPtSel'
        'Status = stsDefault')
      (
        'Component = cboPatient'
        'Status = stsDefault')
      (
        'Component = cmdOK'
        'Status = stsDefault')
      (
        'Component = cmdCancel'
        'Status = stsDefault')
      (
        'Component = cmdSaveList'
        'Status = stsDefault')
      (
        'Component = pnlNotifications'
        'Status = stsDefault')
      (
        'Component = cmdProcessInfo'
        'Status = stsDefault')
      (
        'Component = cmdProcessAll'
        'Status = stsDefault')
      (
        'Component = cmdProcess'
        'Status = stsDefault')
      (
        'Component = cmdForward'
        'Status = stsDefault')
      (
        'Component = cmdRemove'
        'Status = stsDefault')
      (
        'Component = lstvAlerts'
        'Status = stsDefault')
      (
        'Component = frmPtSel'
        'Status = stsDefault')
      (
        'Component = cmdComments'
        'Status = stsDefault')
      (
        'Component = txtCmdComments'
        'Status = stsDefault')
      (
        'Component = txtCmdRemove'
        'Status = stsDefault')
      (
        'Component = txtCmdForward'
        'Status = stsDefault')
      (
        'Component = txtCmdProcess'
        'Status = stsDefault')
      (
        'Component = pnlButtons'
        'Status = stsDefault')
      (
        'Component = bbInquiryDemographics'
        'Status = stsDefault'))
  end
  object popNotifications: TPopupMenu
    Left = 508
    Top = 323
    object mnuProcess: TMenuItem
      Caption = 'Process'
      OnClick = cmdProcessClick
    end
    object mnuForward: TMenuItem
      Caption = 'Forward'
      OnClick = cmdForwardClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuRemove: TMenuItem
      Caption = 'Remove'
      OnClick = cmdRemoveClick
    end
  end
end
