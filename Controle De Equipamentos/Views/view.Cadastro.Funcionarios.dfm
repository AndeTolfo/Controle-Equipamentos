object frmCadFuncionario: TfrmCadFuncionario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro Funcion'#225'rios'
  ClientHeight = 301
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnContainer: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 301
    Align = alClient
    TabOrder = 0
    object pnlCentro: TPanel
      Left = 1
      Top = 57
      Width = 337
      Height = 184
      Align = alClient
      TabOrder = 0
      object Label2: TLabel
        Left = 29
        Top = 14
        Width = 48
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPesquisaFuncionario: TSpeedButton
        Left = 144
        Top = 13
        Width = 25
        Height = 23
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E6E6E6CBCBCBA5A5
          A57D7D7D797979F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7E1E1E1CACACAB7B7B7A8A8A8A0A0A03030302D2D2D9D9D9EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9F8F8F8FBFBFBF3F3F34F4E
          4E2D2C2D797979F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF3F3F35150502D2C2D797979F3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F45150502D2C2D7979
          79F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF9D98964A4848797979F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D5D5D5979695969594969694939392BBBBBABCB9B8908A88B1ADACF4F4F4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDA6A6A3C7C7C5C5C5C4C5C4C3C6C6C5B6
          B6B3787574C7C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5999997
          B9B9B7B4B4B2B2B2AFB2B2AFB4B4B1B7B7B4ADADAABDBDBCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA6A6A6A9A9A6A7A7A4A7A7A4A7A7A4A7A7A4A7A8A4A8
          A8A4A9A9A691918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292919F9F9C
          9FA09DA0A09DA0A09DA0A09DA0A19EA1A19EA1A19E848583FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF939492A0A19EA3A3A1A4A5A2A5A5A3A5A6A3A5A6A3A5
          A5A3A5A5A2838482FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0ABABA9
          B9B9B8B9B9B8B9BAB8B9BAB8B9BAB8B9BAB8B6B6B5929291FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF4F4F4868786CCCDCCD3D3D3D3D4D3D3D4D3D3D4D3D3
          D3D2989998D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC
          898A89CCCDCCEEEEEEF1F2F2D9D9D9999A99BDBDBDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4B1B1B1959595929392A7A7A7E4
          E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btnPesquisaFuncionarioClick
      end
      object Label3: TLabel
        Left = 37
        Top = 53
        Width = 40
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 19
        Top = 127
        Width = 63
        Height = 16
        Caption = 'Contrato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 36
        Top = 91
        Width = 41
        Height = 16
        Caption = 'Setor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 46
        Top = 157
        Width = 36
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCod: TEdit
        Left = 88
        Top = 14
        Width = 54
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edtCodKeyDown
        OnKeyPress = edtCodKeyPress
      end
      object edtNome: TEdit
        Left = 88
        Top = 52
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cbContrato: TComboBox
        Left = 88
        Top = 126
        Width = 113
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          'Ativo'
          'Inativo')
      end
      object cbSetor: TComboBox
        Left = 87
        Top = 89
        Width = 114
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Comercial'
          'Desenvolvimento'
          'Financeiro'
          'Medicon'
          'Siscomp'
          'Administra'#231#227'o')
      end
      object dtCadastro: TDateTimePicker
        Left = 88
        Top = 157
        Width = 88
        Height = 21
        Date = 45133.000000000000000000
        Time = 0.705006967589724800
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 241
      Width = 337
      Height = 59
      Align = alBottom
      TabOrder = 1
      object btnsalvar: TBitBtn
        Left = 19
        Top = 7
        Width = 65
        Height = 43
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnsalvarClick
      end
      object btnNovo: TBitBtn
        Left = 103
        Top = 7
        Width = 65
        Height = 43
        Caption = 'Novo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnNovoClick
      end
      object btnExcluir: TBitBtn
        Left = 182
        Top = 7
        Width = 65
        Height = 43
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnExcluirClick
      end
      object btnSair: TBitBtn
        Left = 261
        Top = 7
        Width = 65
        Height = 43
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnSairClick
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 337
      Height = 56
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 82
        Top = 22
        Width = 180
        Height = 19
        Caption = 'Cadastro Funcion'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = dm.WriteFuncionarios
    Left = 289
    Top = 113
  end
end
