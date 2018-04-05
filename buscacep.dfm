object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 353
  ClientWidth = 923
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 13
    Top = 176
    Width = 109
    Height = 13
    Caption = 'Logradouro / Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 43
    Top = 213
    Width = 79
    Height = 13
    Caption = 'Complemento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 401
    Top = 213
    Width = 46
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 34
    Top = 248
    Width = 88
    Height = 13
    Caption = 'Bairro / Distrito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 421
    Top = 248
    Width = 26
    Height = 13
    Caption = 'IBGE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 62
    Top = 280
    Width = 60
    Height = 13
    Caption = 'Localidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 433
    Top = 280
    Width = 14
    Height = 13
    Caption = 'UF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 427
    Top = 176
    Width = 20
    Height = 13
    Caption = 'CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 655
    Top = 55
    Width = 108
    Height = 13
    Caption = 'Retorno do Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 311
    Width = 923
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object bt_limparCampos: TButton
      Left = 617
      Top = 7
      Width = 152
      Height = 30
      Caption = 'Limpar Campos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bt_limparCamposClick
    end
    object bt_close: TButton
      Left = 775
      Top = 7
      Width = 144
      Height = 29
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bt_closeClick
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 50
    Width = 649
    Height = 112
    ActivePage = aba_consultaPorEndereco
    TabHeight = 30
    TabOrder = 0
    object aba_consultaPorCEP: TTabSheet
      Caption = '     Consulta por CEP     '
      object Label1: TLabel
        Left = 21
        Top = 16
        Width = 81
        Height = 16
        Caption = 'Insira o CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_cepConsulta: TEdit
        Left = 21
        Top = 35
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object bt_consultarCEP: TButton
        Left = 148
        Top = 33
        Width = 151
        Height = 25
        Caption = 'Consultar CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bt_consultarCEPClick
      end
    end
    object aba_consultaPorEndereco: TTabSheet
      Caption = '    Consulta por Endere'#231'o    '
      ImageIndex = 1
      object Label10: TLabel
        Left = 21
        Top = 16
        Width = 72
        Height = 16
        Caption = 'Insira a UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 114
        Top = 16
        Width = 101
        Height = 16
        Caption = 'Insira a Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 260
        Top = 16
        Width = 133
        Height = 16
        Caption = 'Insira o Logradouro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_ufConsulta: TEdit
        Left = 21
        Top = 35
        Width = 72
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object bt_consultarEndereco: TButton
        Left = 496
        Top = 33
        Width = 138
        Height = 25
        Caption = 'Consultar Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bt_consultarEnderecoClick
      end
      object ed_cidadeConsulta: TEdit
        Left = 114
        Top = 35
        Width = 128
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object ed_logradouroConsulta: TEdit
        Left = 260
        Top = 35
        Width = 214
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 923
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 9783808
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 21
      Top = 13
      Width = 252
      Height = 24
      Caption = 'Consulta - Endere'#231'o/CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ed_logradouro: TEdit
    Left = 128
    Top = 173
    Width = 261
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ed_complemento: TEdit
    Left = 128
    Top = 210
    Width = 261
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ed_unidade: TEdit
    Left = 457
    Top = 210
    Width = 181
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object ed_bairro: TEdit
    Left = 128
    Top = 245
    Width = 261
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object ed_ibge: TEdit
    Left = 457
    Top = 245
    Width = 181
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object ed_localidade: TEdit
    Left = 128
    Top = 277
    Width = 261
    Height = 21
    TabOrder = 9
  end
  object ed_uf: TEdit
    Left = 457
    Top = 277
    Width = 181
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object ed_cep: TEdit
    Left = 457
    Top = 173
    Width = 181
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object memo_json: TMemo
    Left = 656
    Top = 71
    Width = 259
    Height = 234
    Lines.Strings = (
      'memo_json')
    ScrollBars = ssVertical
    TabOrder = 11
  end
end
