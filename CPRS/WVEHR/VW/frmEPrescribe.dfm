object EPrescribeForm: TEPrescribeForm
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'E-Prescribing'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCanvas: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object browser: TWebBrowser
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 778
      Height = 520
      Align = alClient
      TabOrder = 0
      OnNewWindow2 = browserNewWindow2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 768
      ExplicitHeight = 514
      ControlData = {
        4C00000069500000BE3500000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object pnlTools: TPanel
    Left = 0
    Top = 526
    Width = 784
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlTools'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object btnClose: TButton
      AlignWithMargins = True
      Left = 706
      Top = 3
      Width = 75
      Height = 29
      Align = alRight
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
end
