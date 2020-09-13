inherited frmVW_PtSelOptSave: TfrmVW_PtSelOptSave
  Left = 452
  Top = 229
  BorderStyle = bsDialog
  Caption = 'Save Patient List Settings'
  ClientHeight = 204
  ClientWidth = 272
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 278
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  object pnlClinSave: TPanel [0]
    Left = 0
    Top = 0
    Width = 272
    Height = 204
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lblClinSettings: TMemo
      Left = 16
      Top = 10
      Width = 245
      Height = 75
      TabStop = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object rGrpClinSave: TKeyClickRadioGroup
      Left = 48
      Top = 98
      Width = 177
      Height = 59
      Caption = 'Select Desired Clinic Save Option:'
      Items.Strings = (
        'Save For All Days of Week'
        'Save For Current Day Only')
      TabOrder = 0
      TabStop = True
      OnClick = rGrpClinSaveClick
    end
    object btnOK: TButton
      Left = 50
      Top = 168
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
    end
    object btnCancel: TButton
      Left = 150
      Top = 168
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = pnlClinSave'
        'Status = stsDefault')
      (
        'Component = lblClinSettings'
        'Status = stsDefault')
      (
        'Component = rGrpClinSave'
        'Status = stsDefault')
      (
        'Component = btnOK'
        'Status = stsDefault')
      (
        'Component = btnCancel'
        'Status = stsDefault')
      (
        'Component = frmVW_PtSelOptSave'
        'Status = stsDefault'))
  end
end
