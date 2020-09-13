inherited frmVW_PtSelect: TfrmVW_PtSelect
  Caption = 'Patient Selector'
  ClientHeight = 656
  ClientWidth = 936
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 952
  ExplicitHeight = 695
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCanvas: TPanel [0]
    Left = 0
    Top = 0
    Width = 936
    Height = 656
    Align = alClient
    Caption = 'pnlCanvas'
    ShowCaption = False
    TabOrder = 0
    object splAlerts: TSplitter
      Left = 1
      Top = 398
      Width = 934
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      ExplicitLeft = 0
      ExplicitTop = 401
      ExplicitWidth = 732
    end
    object pnlButtons: TPanel
      Left = 1
      Top = 1
      Width = 934
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlButtons'
      Color = clSilver
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object cmdOK: TButton
        AlignWithMargins = True
        Left = 737
        Top = 3
        Width = 102
        Height = 26
        Align = alRight
        Caption = '&Select'
        Default = True
        ModalResult = 1
        TabOrder = 3
      end
      object cmdCancel: TButton
        AlignWithMargins = True
        Left = 845
        Top = 3
        Width = 86
        Height = 26
        Align = alRight
        Cancel = True
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 4
      end
      object bbInquiryDemographics: TBitBtn
        AlignWithMargins = True
        Left = 111
        Top = 3
        Width = 94
        Height = 26
        Action = acInquiry
        Align = alLeft
        Caption = '&Inquiry'
        NumGlyphs = 2
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 102
        Height = 26
        Action = acSaveCategory
        Align = alLeft
        Caption = 'S&ave Settings'
        NumGlyphs = 2
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        AlignWithMargins = True
        Left = 214
        Top = 3
        Width = 97
        Height = 26
        Margins.Left = 6
        TabStop = False
        Action = acAlertsShow
        Align = alLeft
        State = cbChecked
        TabOrder = 2
      end
    end
    object pnlAlerts: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 405
      Width = 928
      Height = 247
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlALerts - parent of  TfrmWV_Alerts'
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 408
      ExplicitWidth = 934
    end
    object pnlTop: TPanel
      Left = 1
      Top = 33
      Width = 934
      Height = 365
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 371
      object bvlTool: TBevel
        Left = 0
        Top = 0
        Width = 934
        Height = 2
        Align = alTop
        Shape = bsTopLine
        ExplicitWidth = 732
      end
      object pnlRight: TPanel
        AlignWithMargins = True
        Left = 725
        Top = 5
        Width = 209
        Height = 357
        Margins.Left = 0
        Margins.Right = 0
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitHeight = 363
        object pnlDemographics: TPanel
          Left = 0
          Top = 28
          Width = 209
          Height = 294
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlDemographics - parent of TfrmWV_PtSelDemog'
          Constraints.MinHeight = 100
          TabOrder = 0
          ExplicitHeight = 300
        end
        object pnlDemographicHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 203
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 1
          object Label1: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 104
            Height = 16
            Align = alLeft
            Caption = 'Patient Demographics'
            ExplicitHeight = 13
          end
        end
        object pnlDemographicButtons: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 325
          Width = 203
          Height = 32
          Margins.Bottom = 0
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 2
          Visible = False
          ExplicitTop = 331
          object BitBtn2: TBitBtn
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 102
            Height = 26
            Action = acSaveCategory
            Align = alLeft
            Caption = 'S&ave Settings'
            NumGlyphs = 2
            TabOrder = 0
          end
          object BitBtn3: TBitBtn
            AlignWithMargins = True
            Left = 111
            Top = 3
            Width = 86
            Height = 26
            Action = acInquiry
            Align = alLeft
            Caption = '&Inquiry'
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object pnlPtSel: TPanel
        AlignWithMargins = True
        Left = 211
        Top = 5
        Width = 511
        Height = 357
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 363
        object cboPatient: TORComboBox
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 505
          Height = 326
          Hint = 'Enter name or use "Last 4" (x1234) format'
          Margins.Bottom = 0
          Style = orcsSimple
          Align = alClient
          AutoSelect = False
          Caption = 'Patient'
          Color = clInfoBk
          DropDownCount = 8
          Items.Strings = (
            '1^2^3^4^5^6'
            '1^2^3^4^5^6'
            '1^2^3^4^5^6'
            '1^2^3^4^5^6'
            ''
            '')
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = True
          LongList = True
          LookupPiece = 2
          MaxLength = 0
          ParentShowHint = False
          Pieces = '2,3,2,2,2'
          ShowHint = True
          Sorted = False
          SynonymChars = '<>'
          TabPositions = '5,20,25'
          TabOrder = 1
          Text = ''
          CheckEntireLine = True
          OnChange = cboPatientChange
          OnClick = cboPatientClick
          OnDblClick = cboPatientDblClick
          OnKeyDown = cboPatientKeyDown
          OnNeedData = cboPatientNeedData
          CharsNeedMatch = 1
          ExplicitHeight = 332
        end
        object pnlPatientHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 505
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 0
          object lblPatient: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 33
            Height = 16
            Align = alLeft
            Caption = 'Patient'
            ShowAccelChar = False
            ExplicitHeight = 13
          end
        end
      end
      object pnlOptions: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 202
        Height = 357
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnlOptions - parent of TfrmWV_PtSelOptns'
        TabOrder = 0
        ExplicitHeight = 363
        object pnlOptionsHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 199
          Height = 22
          Margins.Right = 0
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 0
          object lblOptions: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 87
            Height = 16
            Align = alLeft
            Caption = 'Search Categories'
            ExplicitHeight = 13
          end
        end
      end
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 32
    Top = 88
    Data = (
      (
        'Component = frmVW_PtSelect'
        'Status = stsDefault')
      (
        'Component = pnlButtons'
        'Status = stsDefault')
      (
        'Component = cmdOK'
        'Status = stsDefault')
      (
        'Component = cmdCancel'
        'Status = stsDefault')
      (
        'Component = bbInquiryDemographics'
        'Status = stsDefault')
      (
        'Component = pnlTop'
        'Status = stsDefault')
      (
        'Component = pnlRight'
        'Status = stsDefault')
      (
        'Component = pnlDemographics'
        'Status = stsDefault')
      (
        'Component = pnlDemographicHeader'
        'Status = stsDefault')
      (
        'Component = pnlPtSel'
        'Status = stsDefault')
      (
        'Component = cboPatient'
        'Status = stsDefault')
      (
        'Component = pnlPatientHeader'
        'Status = stsDefault')
      (
        'Component = pnlOptions'
        'Status = stsDefault')
      (
        'Component = pnlOptionsHeader'
        'Status = stsDefault')
      (
        'Component = pnlAlerts'
        'Status = stsDefault')
      (
        'Component = BitBtn1'
        'Status = stsDefault')
      (
        'Component = CheckBox1'
        'Status = stsDefault')
      (
        'Component = pnlDemographicButtons'
        'Status = stsDefault')
      (
        'Component = BitBtn2'
        'Status = stsDefault')
      (
        'Component = BitBtn3'
        'Status = stsDefault')
      (
        'Component = pnlCanvas'
        'Status = stsDefault'))
  end
  object alPatientSelector: TActionList
    Left = 48
    Top = 264
    object acInquiry: TAction
      Caption = '&Inquiry'
      Hint = 'Show Detailed Patient Info'
      ImageIndex = 20
      OnExecute = acInquiryExecute
    end
    object acSaveCategory: TAction
      Caption = 'S&ave Settings'
      OnExecute = acSaveCategoryExecute
    end
    object acAlertsShow: TAction
      Caption = 'Show &Alerts'
      Checked = True
      OnExecute = acAlertsShowExecute
    end
  end
end
