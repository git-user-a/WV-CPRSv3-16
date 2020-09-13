inherited frmSignOrders: TfrmSignOrders
  Left = 337
  Top = 142
  Caption = 'Sign Orders'
  ClientHeight = 613
  ClientWidth = 894
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  OldCreateOrder = True
  Position = poScreenCenter
  OnMouseDown = clstOrdersMouseDown
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  OnResize = FormResize
  ExplicitWidth = 910
  ExplicitHeight = 652
  PixelsPerInch = 96
  TextHeight = 13
  object gbdxLookup: TGroupBox [0]
    AlignWithMargins = True
    Left = 3
    Top = 166
    Width = 888
    Height = 43
    Align = alTop
    Caption = 'Lookup Diagnosis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = True
    Visible = False
    object buOrdersDiagnosis: TButton
      Left = 7
      Top = 16
      Width = 86
      Height = 21
      Caption = '&Diagnosis'
      Enabled = False
      TabOrder = 0
      OnClick = buOrdersDiagnosisClick
    end
  end
  object pnlEsig: TPanel [1]
    Left = 0
    Top = 565
    Width = 894
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 538
    DesignSize = (
      894
      48)
    object lblESCode: TLabel
      Left = 7
      Top = -1
      Width = 123
      Height = 13
      Anchors = [akLeft]
      Caption = 'Electronic Signature Code'
    end
    object txtESCode: TCaptionEdit
      Left = 6
      Top = 18
      Width = 137
      Height = 21
      Anchors = [akLeft]
      PasswordChar = '*'
      TabOrder = 0
      Caption = 'Electronic Signature Code'
    end
    object cmdOK: TButton
      Left = 730
      Top = 19
      Width = 72
      Height = 21
      Anchors = [akRight]
      Caption = 'Sign'
      Default = True
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 812
      Top = 19
      Width = 72
      Height = 21
      Anchors = [akRight]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = cmdCancelClick
    end
  end
  object pnlCombined: TORAutoPanel [2]
    Left = 0
    Top = 212
    Width = 894
    Height = 204
    Align = alClient
    BevelOuter = bvNone
    Color = clYellow
    TabOrder = 2
    Visible = False
    ExplicitTop = 241
    ExplicitHeight = 274
  end
  object pnlTop: TPanel [3]
    Left = 0
    Top = 0
    Width = 894
    Height = 163
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 304
    inline fraCoPay: TfraCoPayDesc
      Left = 173
      Top = 0
      Width = 721
      Height = 163
      Align = alClient
      AutoSize = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      Visible = False
      ExplicitLeft = 173
      ExplicitWidth = 131
      ExplicitHeight = 163
      inherited pnlRight: TPanel
        Left = 448
        Width = 273
        Height = 163
        ExplicitLeft = 448
        ExplicitWidth = 273
        ExplicitHeight = 163
        inherited Spacer2: TLabel
          Top = 22
          Width = 273
          ExplicitTop = 0
          ExplicitWidth = 273
        end
        inherited lblCaption: TStaticText
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 267
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 267
        end
        inherited pnlMain: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 267
          Height = 132
          Align = alClient
          ExplicitLeft = 3
          ExplicitTop = 28
          ExplicitWidth = 267
          ExplicitHeight = 132
          inherited spacer1: TLabel
            Top = 17
            Width = 263
            ExplicitTop = 17
            ExplicitWidth = 262
          end
          inherited pnlHNC: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblHNC2: TVA508StaticText
              Width = 129
              Height = 18
              ExplicitWidth = 129
              ExplicitHeight = 18
            end
            inherited lblHNC: TVA508StaticText
              Width = 31
              Height = 18
              ExplicitWidth = 31
              ExplicitHeight = 18
            end
          end
          inherited pnlMST: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblMST2: TVA508StaticText
              Width = 25
              Height = 18
              ExplicitWidth = 25
              ExplicitHeight = 18
            end
            inherited lblMST: TVA508StaticText
              Width = 31
              Height = 18
              ExplicitWidth = 31
              ExplicitHeight = 18
            end
          end
          inherited pnlSWAC: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblSWAC2: TVA508StaticText
              Width = 127
              Height = 18
              ExplicitWidth = 127
              ExplicitHeight = 18
            end
            inherited lblSWAC: TVA508StaticText
              Width = 40
              Height = 18
              ExplicitWidth = 40
              ExplicitHeight = 18
            end
          end
          inherited pnlIR: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblIR2: TVA508StaticText
              Width = 133
              Height = 18
              ExplicitWidth = 133
              ExplicitHeight = 18
            end
            inherited lblIR: TVA508StaticText
              Width = 16
              Height = 18
              ExplicitWidth = 16
              ExplicitHeight = 18
            end
          end
          inherited pnlAO: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblAO2: TVA508StaticText
              Width = 115
              Height = 18
              ExplicitWidth = 115
              ExplicitHeight = 18
            end
            inherited lblAO: TVA508StaticText
              Width = 19
              Height = 18
              ExplicitWidth = 19
              ExplicitHeight = 18
            end
          end
          inherited pnlSC: TPanel
            Top = 2
            Width = 263
            ExplicitTop = 2
            ExplicitWidth = 263
            inherited lblSC2: TVA508StaticText
              Width = 175
              Height = 18
              ExplicitWidth = 175
              ExplicitHeight = 18
            end
            inherited lblSC: TVA508StaticText
              Width = 27
              Height = 18
              ExplicitWidth = 27
              ExplicitHeight = 18
            end
          end
          inherited pnlCV: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblCV2: TVA508StaticText
              Width = 116
              Height = 18
              ExplicitWidth = 116
              ExplicitHeight = 18
            end
            inherited lblCV: TVA508StaticText
              Width = 27
              Height = 18
              ExplicitWidth = 27
              ExplicitHeight = 18
            end
          end
          inherited pnlSHD: TPanel
            Width = 263
            ExplicitWidth = 263
            inherited lblSHAD: TVA508StaticText
              Width = 33
              Height = 18
              ExplicitWidth = 33
              ExplicitHeight = 18
            end
            inherited lblSHAD2: TVA508StaticText
              Width = 159
              Height = 18
              ExplicitWidth = 159
              ExplicitHeight = 18
            end
          end
        end
      end
      inherited pnlSCandRD: TPanel
        Width = 448
        Height = 163
        ExplicitWidth = 448
        ExplicitHeight = 163
        inherited lblSCDisplay: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 442
          ExplicitLeft = 184
          ExplicitTop = -2
          ExplicitWidth = 406
        end
        inherited memSCDisplay: TCaptionMemo
          AlignWithMargins = True
          Left = 3
          Top = 26
          Width = 442
          Height = 134
          ExplicitLeft = 3
          ExplicitTop = 26
          ExplicitWidth = 442
          ExplicitHeight = 134
        end
      end
    end
    object pnlProvInfo: TPanel
      Left = 0
      Top = 0
      Width = 173
      Height = 163
      Align = alLeft
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 1
      object lblProvInfo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 41
        Height = 13
        Align = alTop
        Caption = 'prov info'
      end
    end
  end
  object lblDEAText: TStaticText [4]
    AlignWithMargins = True
    Left = 6
    Top = 545
    Width = 885
    Height = 17
    Margins.Left = 6
    Align = alBottom
    Caption = 
      'By completing the two-factor authentication protocol at this tim' +
      'e, you are legally signing the prescription(s) and authorizing t' +
      'he transmission of the above informationto the pharmacy for disp' +
      'ensing.  The two-factor authentication protocol may only be comp' +
      'leted by the practitioner whose name and DEA registration number' +
      ' appear above. '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 4
    ExplicitTop = 520
    ExplicitWidth = 1574
  end
  object pnlCSOrderList: TPanel [5]
    Left = 0
    Top = 416
    Width = 894
    Height = 126
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitTop = 150
    object lblCSOrderList: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 170
      Height = 17
      Align = alTop
      Caption = 'Controlled Substance EPCS Orders'
      TabOrder = 0
    end
    object lblSmartCardNeeded: TStaticText
      AlignWithMargins = True
      Left = 3
      Top = 26
      Width = 135
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
    end
    object clstCSOrders: TCaptionCheckListBox
      AlignWithMargins = True
      Left = 3
      Top = 52
      Width = 888
      Height = 71
      OnClickCheck = clstCSOrdersClickCheck
      Align = alClient
      AllowGrayed = True
      PopupMenu = poBACopyPaste
      Style = lbOwnerDrawVariable
      TabOrder = 2
      OnClick = clstCSOrdersClick
      OnDrawItem = clstCSOrdersDrawItem
      OnMeasureItem = clstCSOrdersMeasureItem
      Caption = 'The following orders will be signed -'
    end
  end
  object pnlOrderList: TPanel [6]
    Left = 0
    Top = 212
    Width = 894
    Height = 204
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitTop = 0
    ExplicitHeight = 150
    object clstOrders: TCaptionCheckListBox
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 888
      Height = 144
      OnClickCheck = clstOrdersClickCheck
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      PopupMenu = poBACopyPaste
      ShowHint = True
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnClick = clstOrdersClick
      OnDrawItem = clstOrdersDrawItem
      OnKeyUp = clstOrdersKeyUp
      OnMeasureItem = clstOrdersMeasureItem
      OnMouseDown = clstOrdersMouseDown
      OnMouseMove = clstOrdersMouseMove
      Caption = 'The following orders will be signed -'
    end
    object pnlDEAText: TPanel
      Left = 0
      Top = 0
      Width = 894
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 212
      object laDiagnosis: TLabel
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 46
        Height = 13
        Align = alLeft
        Caption = 'Diagnosis'
      end
      object lblOrderList: TStaticText
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 254
        Height = 17
        Align = alLeft
        Caption = 'All Orders Except Controlled Susbtance EPCS Orders'
        TabOrder = 0
      end
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 40
    Top = 32
    Data = (
      (
        'Component = gbdxLookup'
        'Status = stsDefault')
      (
        'Component = buOrdersDiagnosis'
        'Status = stsDefault')
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
        'Component = frmSignOrders'
        'Status = stsDefault')
      (
        'Component = pnlDEAText'
        'Status = stsDefault')
      (
        'Component = lblDEAText'
        'Status = stsDefault')
      (
        'Component = pnlProvInfo'
        'Status = stsDefault')
      (
        'Component = pnlOrderList'
        'Status = stsDefault')
      (
        'Component = lblOrderList'
        'Status = stsDefault')
      (
        'Component = clstOrders'
        'Status = stsDefault')
      (
        'Component = pnlCSOrderList'
        'Status = stsDefault')
      (
        'Component = lblCSOrderList'
        'Status = stsDefault')
      (
        'Component = lblSmartCardNeeded'
        'Status = stsDefault')
      (
        'Component = clstCSOrders'
        'Status = stsDefault')
      (
        'Component = pnlEsig'
        'Status = stsDefault')
      (
        'Component = txtESCode'
        'Status = stsDefault')
      (
        'Component = cmdOK'
        'Status = stsDefault')
      (
        'Component = cmdCancel'
        'Status = stsDefault')
      (
        'Component = pnlCombined'
        'Status = stsDefault')
      (
        'Component = pnlTop'
        'Status = stsDefault'))
  end
  object poBACopyPaste: TPopupMenu
    Left = 40
    Top = 72
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
      OnClick = buOrdersDiagnosisClick
    end
    object Exit1: TMenuItem
      Caption = '&Exit'
      ShortCut = 16453
      OnClick = Exit1Click
    end
  end
end
