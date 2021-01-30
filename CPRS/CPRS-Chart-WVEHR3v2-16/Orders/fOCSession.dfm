inherited frmOCSession: TfrmOCSession
  Left = 366
  Top = 222
  Width = 730
  Height = 500
  HorzScrollBar.Visible = True
  VertScrollBar.Visible = True
  AutoScroll = True
  BorderIcons = []
  Caption = 'Order Checks'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  DefaultMonitor = dmMainForm
  Position = poScreenCenter
  ShowHint = True
  OnMouseWheelDown = FormMouseWheelDown
  ExplicitWidth = 730
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TORAutoPanel [0]
    Left = 0
    Top = 0
    Width = 714
    Height = 420
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 706
    ExplicitHeight = 346
    object lblHover: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 21
      Width = 708
      Height = 13
      Align = alTop
      Caption = 
        'If the order check description is cut short, hover over the text' +
        ' to view the complete description.'
      ExplicitLeft = 16
      ExplicitTop = 32
      ExplicitWidth = 445
    end
    object lblJustify: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 377
      Width = 708
      Height = 13
      Align = alBottom
      Caption = 'Enter reason for overriding order checks:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 6
      ExplicitTop = 396
    end
    object grdchecks: TCaptionStringGrid
      AlignWithMargins = True
      Left = 3
      Top = 37
      Width = 708
      Height = 290
      Margins.Top = 0
      Align = alClient
      ColCount = 3
      DefaultDrawing = False
      FixedColor = clBtnShadow
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowMoving, goTabs]
      ScrollBars = ssVertical
      TabOrder = 1
      OnDrawCell = grdchecksDrawCell
      OnEnter = grdchecksEnter
      OnKeyDown = grdchecksKeyDown
      OnMouseDown = grdchecksMouseDown
      OnMouseMove = grdchecksMouseMove
      OnMouseWheelDown = grdchecksMouseWheelDown
      OnMouseWheelUp = grdchecksMouseWheelUp
      OnSelectCell = grdchecksSelectCell
      Caption = ''
      JustToTab = True
      ExplicitLeft = 16
      ExplicitTop = 67
      ExplicitWidth = 682
      ExplicitHeight = 279
    end
    object lblInstr: TVA508StaticText
      Name = 'lblInstr'
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 708
      Height = 15
      Margins.Bottom = 0
      Align = alTop
      Alignment = taLeftJustify
      AutoSize = True
      Caption = 
        'To cancel an order select the order by checking the checkbox and' +
        ' press the "Cancel Checked Order(s)" button.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      ShowAccelChar = True
      ExplicitLeft = 0
      ExplicitTop = 12
      ExplicitWidth = 641
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 330
      Width = 714
      Height = 44
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 376
      object memNote: TMemo
        AlignWithMargins = True
        Left = 171
        Top = 3
        Width = 540
        Height = 38
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'NOTE: The override reason is for tracking purposes and '
          'does not change or place new order(s).')
        ReadOnly = True
        TabOrder = 0
        OnEnter = memNoteEnter
        ExplicitLeft = 168
        ExplicitTop = 0
        ExplicitWidth = 546
        ExplicitHeight = 44
      end
      object cmdCancelOrder: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 162
        Height = 38
        Align = alLeft
        Caption = 'Cancel Checked Order(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 4
        ParentFont = False
        TabOrder = 1
        OnClick = cmdCancelOrderClick
      end
    end
    object txtJustify: TCaptionEdit
      AlignWithMargins = True
      Left = 3
      Top = 396
      Width = 708
      Height = 21
      Align = alBottom
      AutoSize = False
      MaxLength = 80
      TabOrder = 3
      OnKeyDown = txtJustifyKeyDown
      Caption = 'Enter justification for overriding critical order checks -'
      ExplicitTop = 408
    end
  end
  object pnlButtons: TPanel [1]
    Left = 0
    Top = 420
    Width = 714
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlButtons'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 423
    object cmdMonograph: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 162
      Height = 35
      Align = alLeft
      Caption = 'Drug Interaction Monograph'
      TabOrder = 0
      OnClick = cmdMonographClick
      ExplicitLeft = 608
      ExplicitTop = 20
      ExplicitHeight = 21
    end
    object cmdContinue: TButton
      AlignWithMargins = True
      Left = 400
      Top = 3
      Width = 162
      Height = 35
      Align = alRight
      Caption = 'Accept Order(s)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cmdContinueClick
    end
    object btnReturn: TButton
      AlignWithMargins = True
      Left = 568
      Top = 3
      Width = 143
      Height = 35
      Align = alRight
      Cancel = True
      Caption = 'Return to Orders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnReturnClick
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = pnlBottom'
        'Status = stsDefault')
      (
        'Component = txtJustify'
        'Status = stsDefault')
      (
        'Component = cmdCancelOrder'
        'Status = stsDefault')
      (
        'Component = memNote'
        'Status = stsDefault')
      (
        'Component = frmOCSession'
        'Status = stsDefault')
      (
        'Component = grdchecks'
        'Status = stsDefault')
      (
        'Component = pnlTop'
        'Status = stsDefault')
      (
        'Component = pnlButtons'
        'Status = stsDefault')
      (
        'Component = cmdMonograph'
        'Status = stsDefault')
      (
        'Component = cmdContinue'
        'Status = stsDefault')
      (
        'Component = btnReturn'
        'Status = stsDefault'))
  end
end
