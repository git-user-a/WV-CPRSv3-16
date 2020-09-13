inherited frmAllgyBox: TfrmAllgyBox
  Left = 487
  Top = 242
  Caption = 'frmAllgyBox'
  ClientHeight = 337
  ClientWidth = 506
  Constraints.MinWidth = 457
  Position = poMainFormCenter
  ExplicitWidth = 522
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited memReport: TRichEdit
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 500
    ExplicitWidth = 449
  end
  inherited pnlButton: TPanel
    Top = 304
    Width = 506
    Height = 33
    AutoSize = False
    Color = clSilver
    ParentBackground = False
    ExplicitTop = 336
    ExplicitWidth = 449
    ExplicitHeight = 33
    inherited cmdPrint: TButton
      AlignWithMargins = True
      Left = 291
      Top = 3
      Height = 27
      Align = alLeft
      Caption = '&Print'
      TabOrder = 3
      ExplicitLeft = 293
    end
    inherited cmdClose: TButton
      AlignWithMargins = True
      Left = 428
      Top = 3
      Height = 27
      Align = alRight
      Caption = '&Close'
      TabOrder = 4
      ExplicitLeft = 373
    end
    object cmdEdit: TButton
      AlignWithMargins = True
      Left = 99
      Top = 3
      Width = 90
      Height = 27
      Align = alLeft
      Caption = 'E&dit'
      TabOrder = 1
      Visible = False
      OnClick = cmdEditClick
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitHeight = 21
    end
    object cmdAdd: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 90
      Height = 27
      Align = alLeft
      Caption = '&Add New'
      TabOrder = 0
      OnClick = cmdAddClick
      ExplicitLeft = 2
      ExplicitTop = 0
      ExplicitHeight = 21
    end
    object cmdInError: TButton
      AlignWithMargins = True
      Left = 195
      Top = 3
      Width = 90
      Height = 27
      Align = alLeft
      Caption = '&Entered in Error'
      TabOrder = 2
      OnClick = cmdInErrorClick
      ExplicitTop = 0
      ExplicitHeight = 21
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = cmdEdit'
        'Status = stsDefault')
      (
        'Component = cmdAdd'
        'Status = stsDefault')
      (
        'Component = cmdInError'
        'Status = stsDefault')
      (
        'Component = memReport'
        'Status = stsDefault')
      (
        'Component = pnlButton'
        'Status = stsDefault')
      (
        'Component = cmdPrint'
        'Status = stsDefault')
      (
        'Component = cmdClose'
        'Status = stsDefault')
      (
        'Component = frmAllgyBox'
        'Status = stsDefault'))
  end
end
