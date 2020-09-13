inherited frmVW_PtDemog: TfrmVW_PtDemog
  Left = 100
  BorderStyle = bsNone
  Caption = 'frmVW_PtDemog'
  ClientHeight = 274
  ClientWidth = 203
  DefaultMonitor = dmDesktop
  ParentFont = True
  Position = poDesigned
  ExplicitWidth = 203
  ExplicitHeight = 274
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TCaptionMemo [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 197
    Height = 268
    Align = alClient
    HideSelection = False
    Lines.Strings = (
      'Memo')
    ReadOnly = True
    TabOrder = 1
    Visible = False
    WantReturns = False
    OnEnter = MemoEnter
    OnKeyDown = MemoKeyDown
    Caption = ''
  end
  object pnlMain: TPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 197
    Height = 268
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 0
    object lvPtDemog: TListView
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 187
      Height = 258
      Align = alClient
      BorderStyle = bsNone
      Columns = <
        item
          Width = 80
        end
        item
        end>
      ParentColor = True
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
      OnResize = lvPtDemogResize
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 32
    Top = 32
    Data = (
      (
        'Component = Memo'
        'Status = stsDefault')
      (
        'Component = frmVW_PtDemog'
        'Status = stsDefault')
      (
        'Component = pnlMain'
        'Status = stsDefault')
      (
        'Component = lvPtDemog'
        'Status = stsDefault'))
  end
end
