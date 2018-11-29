object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Agenda'
  ClientHeight = 404
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object pc1: TPageControl
    Left = 0
    Top = 0
    Width = 770
    Height = 404
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cadastro de Usu'#225'rios'
      OnShow = TabSheet1Show
      object lbNome: TLabel
        Left = 82
        Top = 67
        Width = 32
        Height = 14
        Caption = 'Nome'
      end
      object lbCPF: TLabel
        Left = 82
        Top = 115
        Width = 21
        Height = 14
        Caption = 'CEP'
      end
      object ldIdade: TLabel
        Left = 83
        Top = 163
        Width = 31
        Height = 14
        Caption = 'Idade'
      end
      object lbFone: TLabel
        Left = 82
        Top = 214
        Width = 49
        Height = 14
        Caption = 'Telefone'
      end
      object edNasci: TEdit
        Left = 137
        Top = 160
        Width = 121
        Height = 22
        NumbersOnly = True
        TabOrder = 2
        OnChange = edNasciChange
      end
      object edFone: TEdit
        Left = 137
        Top = 211
        Width = 121
        Height = 22
        NumbersOnly = True
        TabOrder = 3
      end
      object rgSexo: TRadioGroup
        Left = 297
        Top = 51
        Width = 185
        Height = 105
        Caption = 'Sexo'
        ItemIndex = 0
        Items.Strings = (
          'Feminino'
          'Masculino'
          'Outro')
        TabOrder = 5
      end
      object btCadastrar: TButton
        Left = 447
        Top = 193
        Width = 106
        Height = 58
        Caption = 'Cadastrar'
        TabOrder = 6
        OnClick = btCadastrarClick
      end
      object MaskEdit1: TMaskEdit
        Left = 137
        Top = 64
        Width = 121
        Height = 22
        MaxLength = 15
        TabOrder = 0
        Text = ''
      end
      object MaskEdit2: TMaskEdit
        Left = 137
        Top = 112
        Width = 121
        Height = 22
        EditMask = '!99.000-000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  .   -   '
      end
      object RadioGroup1: TRadioGroup
        Left = 520
        Top = 51
        Width = 185
        Height = 105
        Caption = 'EstadoCivil'
        ItemIndex = 0
        Items.Strings = (
          'Casado'
          'Solteiro'
          'Vi'#250'vo')
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Lista de Usu'#225'rios'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Panel1: TPanel
        Left = 0
        Top = 345
        Width = 762
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alBottom
        TabOrder = 0
        object BitBtn2: TBitBtn
          Left = 1
          Top = 1
          Width = 288
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Caption = 'Editar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = BitBtn2Click
        end
        object BitBtn1: TBitBtn
          Left = 517
          Top = 1
          Width = 244
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alRight
          Caption = 'Deletar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = BitBtn1Click
        end
      end
      object StrUser: TStringGrid
        Left = 0
        Top = 0
        Width = 762
        Height = 345
        Cursor = crArrow
        Align = alClient
        Color = clCream
        ColCount = 7
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
        OnClick = StrUserClick
        ColWidths = (
          109
          104
          98
          71
          92
          115
          162)
      end
    end
  end
end
