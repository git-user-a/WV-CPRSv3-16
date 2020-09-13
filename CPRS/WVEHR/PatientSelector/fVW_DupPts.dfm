inherited frmVW_DupPts: TfrmVW_DupPts
  Left = 160
  Top = 190
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Similar Patients'
  ClientHeight = 366
  ClientWidth = 497
  Position = poScreenCenter
  ExplicitWidth = 513
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDupPts: TPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 491
    Height = 325
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblSelDupPts: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 485
      Height = 13
      Align = alTop
      Caption = 'Please select the correct patient:'
      ExplicitWidth = 155
    end
    object lvItems: TListView
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 485
      Height = 300
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = 'DFN'
        end
        item
          AutoSize = True
          Caption = 'Name'
        end
        item
          AutoSize = True
          Caption = 'DOB'
        end
        item
          AutoSize = True
          Caption = 'SSN'
        end>
      GridLines = True
      HideSelection = False
      Items.ItemData = {
        05570000000100000000000000FFFFFFFFFFFFFFFF03000000FFFFFFFF000000
        0007430061007000740069006F006E0003310031003100C8B24C190532003200
        32003200320040D44C19053300330033003300330098CC4C19FFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvItemsDblClick
      ExplicitTop = 128
      ExplicitHeight = 194
    end
  end
  object pnlBottom: TPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 331
    Width = 491
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    ShowCaption = False
    TabOrder = 1
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 413
      Top = 3
      Width = 75
      Height = 26
      Align = alRight
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 332
      Top = 3
      Width = 75
      Height = 26
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Left = 24
    Top = 56
    Data = (
      (
        'Component = pnlDupPts'
        'Status = stsDefault')
      (
        'Component = btnOK'
        'Status = stsDefault')
      (
        'Component = btnCancel'
        'Status = stsDefault')
      (
        'Component = frmVW_DupPts'
        'Status = stsDefault')
      (
        'Component = pnlBottom'
        'Status = stsDefault')
      (
        'Component = lvItems'
        'Status = stsDefault'))
  end
end
