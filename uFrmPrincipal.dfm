object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Jogo da Velha'
  ClientHeight = 395
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -40
  Font.Name = 'Small Fonts'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 48
  object PEscolha: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 395
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 121
      Top = 54
      Width = 156
      Height = 48
      Caption = 'Escolha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 248
      Top = 232
      Width = 97
      Height = 78
      Caption = 'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      OnClick = ClickEscolha
    end
    object SpeedButton1: TSpeedButton
      Left = 48
      Top = 232
      Width = 97
      Height = 78
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      OnClick = ClickEscolha
    end
  end
  object PGame: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 395
    Align = alClient
    Caption = 'PGame'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 1
    Visible = False
    object Pan_1_1: TPanel
      Tag = 11
      Left = 5
      Top = 5
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = PanelClick
    end
    object Pan_2_1: TPanel
      Tag = 21
      Left = 5
      Top = 135
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = PanelClick
    end
    object Pan_1_2: TPanel
      Tag = 12
      Left = 135
      Top = 5
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = PanelClick
    end
    object Pan_1_3: TPanel
      Tag = 13
      Left = 266
      Top = 4
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = PanelClick
    end
    object Pan_2_2: TPanel
      Tag = 22
      Left = 135
      Top = 135
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = PanelClick
    end
    object Pan_3_3: TPanel
      Tag = 33
      Left = 265
      Top = 265
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = PanelClick
    end
    object Pan_3_1: TPanel
      Tag = 31
      Left = 5
      Top = 265
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = PanelClick
    end
    object Pan_3_2: TPanel
      Tag = 32
      Left = 135
      Top = 265
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      OnClick = PanelClick
    end
    object Pan_2_3: TPanel
      Tag = 23
      Left = 265
      Top = 135
      Width = 125
      Height = 125
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
      OnClick = PanelClick
    end
  end
end
