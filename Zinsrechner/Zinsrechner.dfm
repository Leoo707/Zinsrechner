object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 461
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Titel: TLabel
    Left = 120
    Top = 0
    Width = 124
    Height = 30
    Caption = ' Zinsrechner'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Kapital: TLabel
    Left = 8
    Top = 68
    Width = 103
    Height = 21
    Caption = 'Anfangskapital'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Zinssatz: TLabel
    Left = 8
    Top = 112
    Width = 83
    Height = 21
    Caption = 'Zinssatz (%)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Laufzeit: TLabel
    Left = 8
    Top = 156
    Width = 54
    Height = 21
    Caption = 'Laufzeit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Zeichen_EUR: TLabel
    Left = 320
    Top = 73
    Width = 10
    Height = 25
    Caption = #8364
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Zeichen_Prozent: TLabel
    Left = 221
    Top = 117
    Width = 16
    Height = 25
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Verzinsung: TLabel
    Left = 8
    Top = 204
    Width = 77
    Height = 21
    Caption = 'Verzinsung'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Eingabe_Kapital: TEdit
    Left = 136
    Top = 70
    Width = 178
    Height = 33
    Hint = 
      'Folgendes Format wird unterst'#252'tzt:'#13#10#13#10'100,00 '#13#10#13#10'Komma MUSS vor ' +
      'beiden Nachkommastellen enthalten sein!'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = Eingabe_KapitalChange
    OnKeyPress = Eingabe_KapitalKeyPress
  end
  object Eingabe_Zinssatz: TEdit
    Left = 136
    Top = 115
    Width = 67
    Height = 33
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    OnChange = Eingabe_KapitalChange
    OnKeyPress = Eingabe_KapitalKeyPress
  end
  object EIngabe_Laufzeit: TEdit
    Left = 136
    Top = 154
    Width = 67
    Height = 33
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    OnChange = Eingabe_KapitalChange
    OnKeyPress = Eingabe_KapitalKeyPress
  end
  object Panel1: TPanel
    Left = 136
    Top = 200
    Width = 166
    Height = 33
    BevelOuter = bvNone
    TabOrder = 3
    object Button_Einfach: TRadioButton
      Left = 0
      Top = 8
      Width = 75
      Height = 17
      Caption = 'EInfach'
      TabOrder = 0
    end
    object Button_ZInseszins: TRadioButton
      Left = 81
      Top = 8
      Width = 114
      Height = 17
      Caption = 'Zinseszins'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 209
    Top = 153
    Width = 150
    Height = 41
    BevelOuter = bvNone
    TabOrder = 4
    object Button_Jahre: TRadioButton
      Left = 8
      Top = 8
      Width = 57
      Height = 17
      Caption = 'Jahre'
      TabOrder = 0
    end
    object Button_Monate: TRadioButton
      Left = 71
      Top = 8
      Width = 64
      Height = 17
      Caption = 'Monate'
      TabOrder = 1
    end
  end
  object Button_Berechnen: TButton
    Left = 251
    Top = 408
    Width = 108
    Height = 33
    Caption = 'Berechnen'
    TabOrder = 5
    OnClick = Button_BerechnenClick
  end
  object Lb_Results: TListBox
    Left = 8
    Top = 256
    Width = 223
    Height = 185
    ItemHeight = 15
    TabOrder = 6
  end
  object Btn_Del: TButton
    Left = 251
    Top = 352
    Width = 108
    Height = 33
    Hint = 'Item aus der Box links anklicken, um zu l'#246'schen!'
    Caption = 'L'#246'schen'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Btn_DelClick
  end
  object Btn_Clear: TButton
    Left = 251
    Top = 296
    Width = 108
    Height = 33
    Caption = 'Felder leeren'
    TabOrder = 8
    OnClick = Btn_ClearClick
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 8
    object Info: TMenuItem
      Caption = '&Hilfe'
      object Creator1: TMenuItem
        Caption = '&Info'
        OnClick = Creator1Click
      end
    end
  end
end
