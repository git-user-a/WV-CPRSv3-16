inherited frmVW_Alerts: TfrmVW_Alerts
  Caption = 'VW_Alerts'
  ClientHeight = 205
  ClientWidth = 876
  Constraints.MinHeight = 240
  ParentFont = True
  ExplicitWidth = 892
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 774
    Height = 205
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 774
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlHeader'
      ShowCaption = False
      TabOrder = 0
      object ggeInfo: TGauge
        AlignWithMargins = True
        Left = 562
        Top = 3
        Width = 209
        Height = 14
        Align = alRight
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
        ExplicitLeft = 664
      end
      object lblNotifications: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 59
        Height = 14
        Align = alLeft
        Caption = 'Notifications'
        ExplicitHeight = 13
      end
    end
    object pnlTools: TPanel
      Left = 0
      Top = 173
      Width = 774
      Height = 32
      Align = alBottom
      Caption = 'pnlTools'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 2
      OnDblClick = Panel2DblClick
      object cmdComments: TButton
        AlignWithMargins = True
        Left = 408
        Top = 4
        Width = 95
        Height = 24
        Action = acShowComments
        Align = alLeft
        TabOrder = 4
      end
      object cmdForward: TButton
        AlignWithMargins = True
        Left = 307
        Top = 4
        Width = 95
        Height = 24
        Action = acForward
        Align = alLeft
        TabOrder = 3
      end
      object cmdProcess: TButton
        AlignWithMargins = True
        Left = 206
        Top = 4
        Width = 95
        Height = 24
        Action = acProcess
        Align = alLeft
        TabOrder = 2
      end
      object cmdProcessAll: TButton
        AlignWithMargins = True
        Left = 105
        Top = 4
        Width = 95
        Height = 24
        Action = acProcessAll
        Align = alLeft
        TabOrder = 1
      end
      object cmdProcessInfo: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 95
        Height = 24
        Action = acProcessInfo
        Align = alLeft
        TabOrder = 0
      end
      object cmdRemove: TButton
        AlignWithMargins = True
        Left = 684
        Top = 4
        Width = 86
        Height = 24
        Action = acRemove
        Align = alRight
        TabOrder = 5
      end
      object txtCmdComments: TVA508StaticText
        Name = 'txtCmdComments'
        Left = 408
        Top = 0
        Width = 159
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Show Comments Button Disabled'
        TabOrder = 6
        Visible = False
        ShowAccelChar = True
      end
      object txtCmdForward: TVA508StaticText
        Name = 'txtCmdForward'
        Left = 307
        Top = 0
        Width = 118
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Forward Button Disabled'
        TabOrder = 7
        Visible = False
        ShowAccelChar = True
      end
      object txtCmdProcess: TVA508StaticText
        Name = 'txtCmdProcess'
        Left = 4
        Top = 0
        Width = 118
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Process Button Disabled'
        TabOrder = 8
        Visible = False
        ShowAccelChar = True
      end
      object txtCmdRemove: TVA508StaticText
        Name = 'txtCmdRemove'
        Left = 651
        Top = 0
        Width = 120
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Remove Button Disabled'
        TabOrder = 9
        Visible = False
        ShowAccelChar = True
      end
    end
    object lstvAlerts: TCaptionListView
      AlignWithMargins = True
      Left = 3
      Top = 23
      Width = 768
      Height = 147
      Align = alClient
      Columns = <
        item
          Caption = 'Info'
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Patient'
          Tag = 1
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Location'
          Tag = 2
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Urgency'
          Tag = 3
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Alert Date/Time'
          Tag = 4
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Message'
          Tag = 5
          Width = -2
          WidthType = (
            -2)
        end
        item
          Caption = 'Forwarded By/When'
          Tag = 6
          Width = -2
          WidthType = (
            -2)
        end>
      HideSelection = False
      HoverTime = 0
      IconOptions.WrapText = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      ShowWorkAreas = True
      ShowHint = True
      TabOrder = 1
      ViewStyle = vsReport
      OnColumnClick = lstvAlertsColumnClick
      OnCompare = lstvAlertsCompare
      AutoSize = False
      Caption = 'Notifications'
    end
  end
  object Panel2: TPanel [1]
    Left = 774
    Top = 0
    Width = 102
    Height = 205
    Align = alRight
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    Visible = False
    OnDblClick = Panel2DblClick
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 20
      Width = 96
      Height = 24
      Margins.Top = 20
      Margins.Bottom = 0
      Action = acProcessInfo
      Align = alTop
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 3
      Top = 47
      Width = 96
      Height = 24
      Margins.Bottom = 0
      Action = acProcessAll
      Align = alTop
      TabOrder = 1
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 3
      Top = 74
      Width = 96
      Height = 24
      Margins.Bottom = 0
      Action = acProcess
      Align = alTop
      TabOrder = 2
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 3
      Top = 101
      Width = 96
      Height = 24
      Margins.Bottom = 0
      Action = acForward
      Align = alTop
      TabOrder = 3
    end
    object Button5: TButton
      AlignWithMargins = True
      Left = 3
      Top = 128
      Width = 96
      Height = 24
      Margins.Bottom = 0
      Action = acShowComments
      Align = alTop
      TabOrder = 4
    end
    object Button6: TButton
      AlignWithMargins = True
      Left = 3
      Top = 178
      Width = 96
      Height = 24
      Action = acRemove
      Align = alBottom
      TabOrder = 5
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 24
    Top = 64
    Data = (
      (
        'Component = frmVW_Alerts'
        'Status = stsDefault')
      (
        'Component = lstvAlerts'
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
        'Component = cmdRemove'
        'Status = stsDefault')
      (
        'Component = cmdComments'
        'Status = stsDefault')
      (
        'Component = cmdForward'
        'Status = stsDefault')
      (
        'Component = cmdProcess'
        'Status = stsDefault')
      (
        'Component = cmdProcessAll'
        'Status = stsDefault')
      (
        'Component = cmdProcessInfo'
        'Status = stsDefault')
      (
        'Component = pnlTools'
        'Status = stsDefault')
      (
        'Component = pnlHeader'
        'Status = stsDefault')
      (
        'Component = Panel1'
        'Status = stsDefault')
      (
        'Component = Panel2'
        'Status = stsDefault')
      (
        'Component = Button1'
        'Status = stsDefault')
      (
        'Component = Button2'
        'Status = stsDefault')
      (
        'Component = Button3'
        'Status = stsDefault')
      (
        'Component = Button4'
        'Status = stsDefault')
      (
        'Component = Button5'
        'Status = stsDefault')
      (
        'Component = Button6'
        'Status = stsDefault'))
  end
  object alAlerts: TActionList
    Left = 136
    Top = 96
    object acProcessInfo: TAction
      Caption = 'Process Info'
      OnExecute = acProcessInfoExecute
    end
    object acProcessAll: TAction
      Caption = 'Process All'
      OnExecute = acProcessAllExecute
    end
    object acProcess: TAction
      Caption = 'Process'
      OnExecute = acProcessExecute
    end
    object acForward: TAction
      Caption = 'Forward'
      OnExecute = acForwardExecute
    end
    object acShowComments: TAction
      Caption = 'Show Comments'
      OnExecute = acShowCommentsExecute
    end
    object acRemove: TAction
      Caption = 'Remove'
      OnExecute = acRemoveExecute
    end
  end
end
