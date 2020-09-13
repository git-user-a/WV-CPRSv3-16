inherited frmReview: TfrmReview
  Left = 141
  Top = 70
  BorderIcons = [biMaximize]
  Caption = 'Review / Sign Changes'
  ClientHeight = 626
  ClientWidth = 687
  Constraints.MinHeight = 450
  Constraints.MinWidth = 695
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  OnResize = FormResize
  ExplicitWidth = 703
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 13
  object laDiagnosis: TLabel [0]
    AlignWithMargins = True
    Left = 3
    Top = 213
    Width = 681
    Height = 13
    Align = alTop
    Caption = 'Diagnosis'
    Visible = False
    ExplicitWidth = 46
  end
  object gbxDxLookup: TGroupBox [1]
    Left = 0
    Top = 167
    Width = 687
    Height = 43
    Align = alTop
    Caption = 'Lookup Diagnosis'
    TabOrder = 0
    TabStop = True
    Visible = False
    object buDiagnosis: TButton
      Left = 10
      Top = 15
      Width = 83
      Height = 21
      Caption = '&Diagnosis'
      Enabled = False
      TabOrder = 0
      OnClick = buDiagnosisClick
    end
  end
  object pnlCombined: TORAutoPanel [2]
    Left = 0
    Top = 229
    Width = 687
    Height = 133
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    ExplicitHeight = 97
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 574
    Width = 687
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 538
    DesignSize = (
      687
      52)
    object pnlSignature: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 152
      Height = 46
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblESCode: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 123
        Height = 13
        Align = alTop
        Caption = 'Electronic Signature Code'
      end
      object txtESCode: TCaptionEdit
        Left = 0
        Top = 22
        Width = 137
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
        OnChange = txtESCodeChange
        Caption = 'Electronic Signature Code'
      end
    end
    object cmdOK: TButton
      Left = 526
      Top = 18
      Width = 72
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 604
      Top = 18
      Width = 72
      Height = 21
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = cmdCancelClick
    end
  end
  object pnlDEAText: TPanel [4]
    Left = 0
    Top = 446
    Width = 687
    Height = 3
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    ExplicitTop = 410
  end
  object pnlTop: TPanel [5]
    Left = 0
    Top = 0
    Width = 687
    Height = 167
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitWidth = 304
    inline fraCoPay: TfraCoPayDesc
      AlignWithMargins = True
      Left = 208
      Top = 3
      Width = 476
      Height = 161
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      Visible = False
      ExplicitLeft = 208
      ExplicitTop = 3
      ExplicitWidth = 93
      ExplicitHeight = 161
      inherited pnlRight: TPanel
        Left = 210
        Width = 266
        Height = 161
        AutoSize = True
        ExplicitLeft = 210
        ExplicitWidth = 266
        ExplicitHeight = 161
        inherited Spacer2: TLabel
          Top = 158
          Width = 266
          Align = alBottom
          Visible = False
          ExplicitTop = 22
          ExplicitWidth = 266
        end
        inherited lblCaption: TStaticText
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 260
          Caption = 'Patient Orders Related To:'
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 260
        end
        inherited pnlMain: TPanel
          Left = 0
          Top = 22
          Width = 266
          Height = 136
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 22
          ExplicitWidth = 266
          ExplicitHeight = 136
          inherited spacer1: TLabel
            Width = 262
            ExplicitWidth = 229
          end
          inherited pnlHNC: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblHNC2: TVA508StaticText
              Width = 129
              ExplicitWidth = 129
            end
            inherited lblHNC: TVA508StaticText
              Width = 31
              ExplicitWidth = 31
            end
          end
          inherited pnlMST: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblMST2: TVA508StaticText
              Width = 25
              ExplicitWidth = 25
            end
            inherited lblMST: TVA508StaticText
              Width = 31
              ExplicitWidth = 31
            end
          end
          inherited pnlSWAC: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblSWAC2: TVA508StaticText
              Width = 127
              ExplicitWidth = 127
            end
            inherited lblSWAC: TVA508StaticText
              Width = 40
              ExplicitWidth = 40
            end
          end
          inherited pnlIR: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblIR2: TVA508StaticText
              Width = 133
              ExplicitWidth = 133
            end
            inherited lblIR: TVA508StaticText
              Width = 19
              ExplicitWidth = 19
            end
          end
          inherited pnlAO: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblAO2: TVA508StaticText
              Width = 115
              ExplicitWidth = 115
            end
            inherited lblAO: TVA508StaticText
              Width = 23
              ExplicitWidth = 23
            end
          end
          inherited pnlSC: TPanel
            Width = 262
            ExplicitWidth = 262
          end
          inherited pnlCV: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblCV2: TVA508StaticText
              Width = 142
              ExplicitWidth = 142
            end
          end
          inherited pnlSHD: TPanel
            Width = 262
            ExplicitWidth = 262
            inherited lblSHAD: TVA508StaticText
              Width = 33
              ExplicitWidth = 33
            end
            inherited lblSHAD2: TVA508StaticText
              Width = 159
              ExplicitWidth = 159
            end
          end
        end
      end
      inherited pnlSCandRD: TPanel
        Width = 210
        Height = 161
        ExplicitWidth = 210
        ExplicitHeight = 161
        inherited lblSCDisplay: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 204
          Height = 16
          ExplicitLeft = 48
          ExplicitTop = -2
          ExplicitWidth = 240
          ExplicitHeight = 16
        end
        inherited memSCDisplay: TCaptionMemo
          Top = 22
          Width = 210
          Height = 139
          Ctl3D = False
          ParentCtl3D = False
          ExplicitTop = 22
          ExplicitWidth = 210
          ExplicitHeight = 139
        end
      end
    end
    object pnlProvInfo: TPanel
      Left = 0
      Top = 0
      Width = 205
      Height = 167
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object lblProvInfo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 50
        Height = 13
        Align = alTop
        Caption = 'lblProvInfo'
      end
    end
  end
  object pnlCSReview: TPanel [6]
    Left = 0
    Top = 362
    Width = 687
    Height = 84
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitTop = 326
    object lblCSReview: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 166
      Height = 13
      Align = alTop
      Caption = 'Controlled Substance EPCS Orders'
    end
    object lstCSReview: TCaptionCheckListBox
      AlignWithMargins = True
      Left = 3
      Top = 48
      Width = 681
      Height = 33
      OnClickCheck = lstCSReviewClickCheck
      Align = alClient
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnClick = lstCSReviewClick
      OnDrawItem = lstCSReviewDrawItem
      OnKeyUp = lstCSReviewKeyUp
      OnMeasureItem = lstCSReviewMeasureItem
      OnMouseDown = lstCSReviewMouseDown
      OnMouseMove = lstCSReviewMouseMove
      Caption = ''
    end
    object lblSmartCardNeeded: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 681
      Height = 20
      Align = alTop
      Caption = 'SMART card required'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 135
    end
  end
  object pnlReview: TPanel [7]
    Left = 0
    Top = 229
    Width = 687
    Height = 133
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitHeight = 97
    object lstReview: TCaptionCheckListBox
      AlignWithMargins = True
      Left = 3
      Top = 29
      Width = 681
      Height = 73
      OnClickCheck = lstReviewClickCheck
      Align = alClient
      ItemHeight = 15
      ParentShowHint = False
      PopupMenu = poBACopyPaste
      ShowHint = True
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnClick = lstReviewClick
      OnDrawItem = lstReviewDrawItem
      OnKeyUp = lstReviewKeyUp
      OnMeasureItem = lstReviewMeasureItem
      OnMouseDown = lstReviewMouseDown
      OnMouseMove = lstReviewMouseMove
      Caption = 'Signature will be Applied to Checked Items'
    end
    object lblSig: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 6
      Width = 681
      Height = 17
      Margins.Top = 6
      Align = alTop
      Caption = 'All Orders Except Controlled Substance EPCS Orders'
      TabOrder = 2
      TabStop = True
      ExplicitWidth = 254
    end
  end
  object lblDEAText: TStaticText [8]
    AlignWithMargins = True
    Left = 3
    Top = 452
    Width = 681
    Height = 17
    Align = alBottom
    Caption = 
      'By completing the two-factor authentication protocol at this tim' +
      'e, you are legally signing the prescription(s) and authorizing t' +
      'he transmission of the above informationto the pharmacy for disp' +
      'ensing.  The two-factor authentication protocol may only be comp' +
      'leted by the practitioner whose name and DEA registration number' +
      ' appear above. '
    TabOrder = 7
    ExplicitTop = 424
    ExplicitWidth = 1574
  end
  object pnlOrderAction: TPanel [9]
    Left = 0
    Top = 472
    Width = 687
    Height = 102
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    Visible = False
    ExplicitTop = 436
    object Label1: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 26
      Width = 111
      Height = 17
      Align = alTop
      Caption = 'For orders, select from:'
      TabOrder = 4
    end
    object radSignChart: TRadioButton
      Left = 16
      Top = 49
      Width = 101
      Height = 17
      Caption = '&Signed on Chart'
      TabOrder = 0
      OnClick = radReleaseClick
    end
    object radHoldSign: TRadioButton
      Left = 16
      Top = 71
      Width = 101
      Height = 17
      Caption = '&Hold until Signed'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = radReleaseClick
    end
    object grpRelease: TGroupBox
      Left = 145
      Top = 49
      Width = 241
      Height = 42
      TabOrder = 3
      Visible = False
      object radVerbal: TRadioButton
        Left = 8
        Top = 19
        Width = 53
        Height = 17
        Caption = '&Verbal'
        Enabled = False
        TabOrder = 0
      end
      object radPhone: TRadioButton
        Left = 80
        Top = 19
        Width = 77
        Height = 17
        Caption = '&Telephone'
        Enabled = False
        TabOrder = 1
      end
      object radPolicy: TRadioButton
        Left = 168
        Top = 19
        Width = 49
        Height = 17
        Caption = '&Policy'
        Enabled = False
        TabOrder = 2
      end
    end
    object radRelease: TRadioButton
      Left = 153
      Top = 46
      Width = 113
      Height = 17
      Caption = '&Release to Service'
      TabOrder = 2
      Visible = False
      OnClick = radReleaseClick
    end
    object lblHoldSign: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 288
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'These orders can only be signed by the prescribing provider.'
      TabOrder = 5
      Visible = False
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 648
    Top = 80
    Data = (
      (
        'Component = fraCoPay'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlRight'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblCaption'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlMain'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlHNC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblHNC2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblHNC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlMST'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblMST2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblMST'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlSWAC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSWAC2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSWAC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlIR'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblIR2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblIR'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlAO'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblAO2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblAO'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlSC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSC2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSC'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlCV'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblCV2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblCV'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlSHD'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSHAD'
        'Status = stsDefault')
      (
        'Component = fraCoPay.lblSHAD2'
        'Status = stsDefault')
      (
        'Component = fraCoPay.pnlSCandRD'
        'Status = stsDefault')
      (
        'Component = fraCoPay.memSCDisplay'
        'Status = stsDefault')
      (
        'Component = gbxDxLookup'
        'Status = stsDefault')
      (
        'Component = buDiagnosis'
        'Status = stsDefault')
      (
        'Component = frmReview'
        'Status = stsDefault')
      (
        'Component = pnlProvInfo'
        'Status = stsDefault')
      (
        'Component = pnlDEAText'
        'Status = stsDefault')
      (
        'Component = lblDEAText'
        'Status = stsDefault')
      (
        'Component = pnlBottom'
        'Status = stsDefault')
      (
        'Component = pnlSignature'
        'Status = stsDefault')
      (
        'Component = txtESCode'
        'Status = stsDefault')
      (
        'Component = pnlOrderAction'
        'Status = stsDefault')
      (
        'Component = Label1'
        'Status = stsDefault')
      (
        'Component = radSignChart'
        'Status = stsDefault')
      (
        'Component = radHoldSign'
        'Status = stsDefault')
      (
        'Component = grpRelease'
        'Status = stsDefault')
      (
        'Component = radVerbal'
        'Status = stsDefault')
      (
        'Component = radPhone'
        'Status = stsDefault')
      (
        'Component = radPolicy'
        'Status = stsDefault')
      (
        'Component = radRelease'
        'Status = stsDefault')
      (
        'Component = cmdOK'
        'Status = stsDefault')
      (
        'Component = cmdCancel'
        'Status = stsDefault')
      (
        'Component = lblHoldSign'
        'Status = stsDefault')
      (
        'Component = pnlCombined'
        'Status = stsDefault')
      (
        'Component = pnlReview'
        'Status = stsDefault')
      (
        'Component = lstReview'
        'Status = stsDefault')
      (
        'Component = lblSig'
        'Status = stsDefault')
      (
        'Component = pnlCSReview'
        'Status = stsDefault')
      (
        'Component = lstCSReview'
        'Status = stsDefault')
      (
        'Component = lblSmartCardNeeded'
        'Status = stsDefault')
      (
        'Component = pnlTop'
        'Status = stsDefault'))
  end
  object poBACopyPaste: TPopupMenu
    Left = 576
    Top = 80
    object Copy1: TMenuItem
      Caption = '&Copy'
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object Paste1: TMenuItem
      Caption = '&Paste'
      Enabled = False
      ShortCut = 16470
      OnClick = Paste1Click
    end
    object Diagnosis1: TMenuItem
      Caption = '&Diagnosis...'
      ShortCut = 32836
      OnClick = buDiagnosisClick
    end
    object Exit1: TMenuItem
      Caption = '&Exit'
      ShortCut = 16453
      OnClick = Exit1Click
    end
  end
end
