object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Agenda'
  ClientHeight = 323
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
    99999999999999999999999999999CC00000000000000000000000000CC99CC0
    00000000B00000000B0000000CC99CC00000000040000800040008080CC99CC0
    0000000030000000030000000CC99CC008080000C00000000C0008080CC99CC0
    00000000C00008080C0000000CC99CC008080800C00000000C0000000CC99CC0
    00000000C0080C00CC0000000CC99CCCC00C0000C0000C00CC0000000CC99CCC
    C00C0000C0000C00CC00000CCCC99CCCC00C0000C0000CCCCC00000CCCC99CCC
    CCCC0000C0030CCCCC00000CCCC99CCCCCCC0300C0000CCCCC00000CCCC99CCC
    CC9C0000CC00CCCCCC00000CCCC99CCCCCCC0300CCCCCCCCCC00000CCCC99CCC
    CCCC0000CCCFCCCCCC00080CCCC99CCCFCCC0808CCCCCCCCCCCC000CCCC99CCC
    CCCC0000CCCCCCCCFCCC080CCCC99CCCCCCC0808CCCCCCCCCCCC000CCFC99CCC
    CCCC0000CCCCCCCCCCCCC0CCCCC99CCCCCCC0808CCCCCCCCCCCCC0CCCCC99CCC
    CCCC0000CCCCFCCCCCCCC0CCCCC99CCCCCCCC00CCCCCCCCCCCCCCCCCCCC99CCC
    FCCCC00CCCCCCCCCFCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCCCCCC9CCCC99CCC
    CCCCCCCCCCCCCFCCCCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCFCCCCCCCCC99CCC
    CCCC6FCCCCCCCCCCCCCCCCCCFCC99CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC99CCC
    CCCCCCCCCCCCCCCCCCCCCCCCCCC9999999999999999999999999999999990000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 323
    Align = alClient
    TabOrder = 0
    object Button2: TButton
      Left = 48
      Top = 270
      Width = 185
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 4
      OnClick = Button2Click
    end
    object LabeledEdit3: TLabeledEdit
      Left = 48
      Top = 37
      Width = 185
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Hint = 'Informe o Usu'#225'rio'
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Usu'#225'rio'
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentShowHint = False
      EditLabel.ShowHint = True
      EditLabel.Layout = tlCenter
      MaxLength = 10
      TabOrder = 0
    end
    object LabeledEdit4: TLabeledEdit
      Left = 48
      Top = 91
      Width = 185
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      MaxLength = 5
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 48
      Top = 166
      Width = 185
      Height = 83
      Caption = 'Idioma'
      ItemIndex = 0
      Items.Strings = (
        'PT'
        'EN')
      TabOrder = 3
    end
    object LabeledEdit5: TLabeledEdit
      Left = 48
      Top = 131
      Width = 185
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Repita Senha'
      MaxLength = 5
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 323
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 72
      Top = 212
      Width = 137
      Height = 13
      Caption = 'Ainda n'#227'o est'#225' cadastrado? '
    end
    object Button1: TButton
      Left = 80
      Top = 231
      Width = 121
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 80
      Top = 135
      Width = 121
      Height = 25
      Caption = 'Login'
      TabOrder = 0
      OnClick = Button3Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 80
      Top = 64
      Width = 121
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usu'#225'rio'
      TabOrder = 1
    end
    object LabeledEdit2: TLabeledEdit
      Left = 80
      Top = 104
      Width = 121
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      MaxLength = 8
      PasswordChar = '*'
      TabOrder = 2
    end
  end
end
