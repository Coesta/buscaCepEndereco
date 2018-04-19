object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 489
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
    Top = 447
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
        OnExit = ed_ufConsultaExit
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
        OnExit = ed_cidadeConsultaExit
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
        OnExit = ed_logradouroConsultaExit
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
  object Memo_json: TMemo
    Left = 656
    Top = 71
    Width = 259
    Height = 234
    Lines.Strings = (
      'Memo_json')
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 320
    Width = 907
    Height = 120
    DataSource = ds_dados
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ds_dados: TDataSource
    DataSet = cds_dados
    Left = 728
    Top = 184
  end
  object cds_dados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 792
    Top = 184
    Data = {
      F70000009619E0BD010000001800000008000000000003000000F70003434550
      01004900000001000557494454480200020009000A4C6F677261646F75726F01
      00490000000100055749445448020002003C000B436F6D706C656D656E746F01
      00490000000100055749445448020002003C0002554601004900000001000557
      494454480200020002000642616972726F010049000000010005574944544802
      0002003C00044942474501004900000001000557494454480200020014000755
      6E69646164650100490000000100055749445448020002003C000A4C6F63616C
      69646164650100490000000100055749445448020002003C000000}
    object cds_dadosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cds_dadosLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 60
    end
    object cds_dadosComplemento: TStringField
      FieldName = 'Complemento'
      Size = 60
    end
    object cds_dadosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cds_dadosBairro: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object cds_dadosIBGE: TStringField
      FieldName = 'IBGE'
    end
    object cds_dadosUnidade: TStringField
      FieldName = 'Unidade'
      Size = 60
    end
    object cds_dadosLocalidade: TStringField
      FieldName = 'Localidade'
      Size = 60
    end
  end
end
