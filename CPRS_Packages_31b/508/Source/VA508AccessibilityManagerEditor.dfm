object va508CollectionEditor: Tva508CollectionEditor
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = '508 Accessibility Manager'
  ClientHeight = 447
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object splMain: TSplitter
    Left = 257
    Top = 30
    Height = 398
    ExplicitLeft = 320
    ExplicitTop = 72
    ExplicitHeight = 100
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 30
    Width = 257
    Height = 398
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object lbCtrllList: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 10
      Width = 251
      Height = 13
      Margins.Top = 10
      Align = alTop
      Caption = 'Control List'
      ExplicitWidth = 54
    end
    object lstCtrls: TListView
      Left = 0
      Top = 23
      Width = 257
      Height = 375
      Hint = 'List of all 508 compatible controls on the form'
      Align = alClient
      Columns = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ViewStyle = vsList
      OnSelectItem = lstCtrlsSelectItem
    end
  end
  object pnlRight: TPanel
    Left = 260
    Top = 30
    Width = 385
    Height = 398
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lblAccLbl: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 66
      Width = 379
      Height = 13
      Align = alTop
      Caption = 'Access Label:'
      ExplicitWidth = 65
    end
    object lblAccProp: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 109
      Width = 379
      Height = 13
      Align = alTop
      Caption = 'Access Property:'
      ExplicitWidth = 82
    end
    object lnlAccTxt: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 152
      Width = 379
      Height = 13
      Align = alTop
      Caption = 'Access Text:'
      ExplicitWidth = 62
    end
    object lblHeader: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 20
      Width = 379
      Height = 13
      Margins.Top = 20
      Align = alTop
      Caption = 'Settings for TEdt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 94
    end
    object chkDefault: TCheckBox
      AlignWithMargins = True
      Left = 3
      Top = 43
      Width = 379
      Height = 17
      Hint = 
        'The screen reader will announce the default property when readin' +
        'g'
      Margins.Top = 10
      Align = alTop
      Caption = 'Use Default '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = chkDefaultClick
    end
    object cmbAccessLbl: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 82
      Width = 379
      Height = 21
      Hint = 'The screen reader will announce this label when reading'
      Align = alTop
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = cmbAccessLblChange
    end
    object cmbAccessProp: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 125
      Width = 379
      Height = 21
      Hint = 'The screen reader will announce this property when reading'
      Align = alTop
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = cmbAccessPropChange
    end
    object memAccessTxt: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 168
      Width = 379
      Height = 57
      Hint = 'The screen reader will announce this text when reading'
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = memAccessTxtChange
    end
    object pnlLstView: TPanel
      Left = 0
      Top = 228
      Width = 385
      Height = 170
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object lblAccColumns: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 379
        Height = 13
        Align = alTop
        Caption = 'Access Columns:'
        ExplicitWidth = 80
      end
      object lstAccessCol: TCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 19
        Width = 379
        Height = 148
        Hint = 'The screen reader will announce these columns when reading'
        OnClickCheck = lstAccessColClickCheck
        Align = alClient
        Columns = 4
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 645
    Height = 30
    AutoSize = True
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 2
    Visible = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Width = 24
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 55
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 428
    Width = 645
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 104
    Bitmap = {
      494C010102001000B40018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000600000059000000AA000000DE0000
      00F9000000F9000000DE000000AA000000590000000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003928
      0C4FA77524E9B98028FFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
      BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFB98028FFA574
      22E837270C4D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000052000000E1000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000E100000051000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B780
      29F1D89633FFDB9833FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFDB9833FFD896
      32FFB67F27EF0000000000000000000000000000000000000000000000000000
      0000000000010000008F000000FF000000FF000000D20000006B000000280000
      000700000007000000290000006C000000D3000000FF000000FF0000008F0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D896
      32FFDB9833FFDB9833FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFDB9833FFDB98
      33FFD89632FF0000000000000000000000000000000000000000000000000000
      000000000090000000FF000000F70000006A0000000100000000000000000000
      0000000000000000000000000000000000020000007A000000FD000000FF0000
      008F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFF1F0ECFFF1F0ECFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
      BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFF1F0ECFFF1F0ECFFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000000000
      0053000000FF000000F800000042000000000000000000000000000000000000
      000000000000000000000000000000000016000000D4000000FF000000FD0000
      00FF000000510000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000060000
      00E2000000FF0000006A00000000000000000000000000000000000000000000
      0000000000000000000000000016000000D4000000FF000000D40000007A0000
      00FF000000E10000000600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFF1F0ECFFF1F0ECFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
      BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFF1F0ECFFF1F0ECFFDB9833FFDB98
      33FFDB9833FF00000000000000000000000000000000000000000000005A0000
      00FF000000D10000000100000000000000000000000000000000000000000000
      00000000000000000016000000D4000000FF000000D400000016000000020000
      00D3000000FF0000005900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFEFE9DDFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFEFE8DCFFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000AB0000
      00FF000000690000000000000000000000000000000000000000000000000000
      000000000016000000D4000000FF000000D40000001600000000000000000000
      006C000000FF000000AA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFE2B46EFFEFE9DDFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFEFE9DDFFE2B36CFFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000E00000
      00FF000000260000000000000000000000000000000000000000000000000000
      0016000000D4000000FF000000D4000000160000000000000000000000000000
      0029000000FF000000DE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000FA0000
      00FF000000060000000000000000000000000000000000000000000000160000
      00D4000000FF000000D400000016000000000000000000000000000000000000
      0007000000FF000000F900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000FA0000
      00FF000000060000000000000000000000000000000000000016000000D40000
      00FF000000D40000001600000000000000000000000000000000000000000000
      0007000000FF000000F900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000E00000
      00FF0000002600000000000000000000000000000016000000D4000000FF0000
      00D4000000160000000000000000000000000000000000000000000000000000
      0028000000FF000000DE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000AB0000
      00FF00000068000000000000000000000016000000D4000000FF000000D40000
      0016000000000000000000000000000000000000000000000000000000000000
      006B000000FF000000AA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFD09130FFBC8228FFB98028FFB98028FFB98028FFB980
      28FFB98028FFB98028FFB98028FFB98028FFBC8229FFD1912FFFDB9833FFDB98
      33FFDB9833FF00000000000000000000000000000000000000000000005A0000
      00FF000000D00000000100000016000000D4000000FF000000D4000000160000
      0000000000000000000000000000000000000000000000000000000000010000
      00D2000000FF0000005900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFBC8229FFCBA264FFEBE5DAFFF1F0ECFFF1F0ECFFF1F0
      ECFFF1F0ECFFF1F0ECFFF1F0ECFFECE6DBFFCAA163FFBC8229FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000060000
      00E3000000FF00000073000000D4000000FF000000D400000016000000000000
      00000000000000000000000000000000000000000000000000000000006A0000
      00FF000000E10000000600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFB98028FFECE6DBFFB6B5A8FFA6A595FFA6A595FFB7B6
      A9FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFECE6DBFFB98028FFDB9833FFDB98
      33FFDB9833FF0000000000000000000000000000000000000000000000000000
      0054000000FF000000FC000000FF000000D40000001600000000000000000000
      0000000000000000000000000000000000000000000000000042000000F70000
      00FF000000520000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DB98
      33FFDB9833FFDB9833FFB98028FFF1F0ECFFA6A595FFA6A595FFA6A595FFA6A5
      95FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFB98028FFDB9833FFDB98
      33FF6E4C1A800000000000000000000000000000000000000000000000000000
      000000000090000000FF000000FC000000730000000100000000000000000000
      0000000000000000000000000000000000010000006A000000F8000000FF0000
      008F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68B
      30E9DB9833FFDB9833FFB98028FFF1F0ECFFA6A595FFA6A595FFA6A595FFA6A5
      95FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFB98028FFDB9833FF6E4C
      1A80000000000000000000000000000000000000000000000000000000000000
      00000000000100000090000000FF000000FF000000D000000068000000260000
      0006000000060000002600000069000000D1000000FF000000FF000000900000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004530
      1151C68B30E9DB9833FFB98028FFF1F0ECFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
      BDFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFB98028FF6E4C1A800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000054000000E3000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000E200000053000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000060000005A000000AB000000E00000
      00FA000000FA000000E0000000AB0000005A0000000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF000000000000FFFFFFFF
      FFFF000000000000FFFFFFFE007F000000000000E00007FC003F000000000000
      E00007F0000F000000000000E00007F07E0F000000000000E00007E1FE070000
      00000000E00007C3FC03000000000000E00007C3F803000000000000E00007C7
      F063000000000000E00007C7E0E3000000000000E00007C7C1E3000000000000
      E00007C783E3000000000000E00007C707E3000000000000E00007C60FE30000
      00000000E00007C01FC3000000000000E00007C03FC3000000000000E00007E0
      7F87000000000000E00007F07E0F000000000000E0000FF0000F000000000000
      E0001FFC003F000000000000FFFFFFFE007F000000000000FFFFFFFFFFFF0000
      00000000FFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
