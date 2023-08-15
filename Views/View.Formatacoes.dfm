object frmFormatacoes: TfrmFormatacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Formata'#231#245'es'
  ClientHeight = 387
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 387
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 41
      Align = alTop
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 149
        Top = 9
        Width = 104
        Height = 19
        Caption = 'Formata'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 328
      Width = 455
      Height = 58
      Align = alBottom
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 333
      object Label2: TLabel
        Left = 13
        Top = 6
        Width = 146
        Height = 16
        Caption = 'Registrar Formata'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 28
        Width = 78
        Height = 16
        Caption = 'Funcion'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPesquisaFuncionario: TSpeedButton
        Left = 245
        Top = 27
        Width = 27
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
      object dtFormat: TDateTimePicker
        Left = 184
        Top = 5
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
        TabOrder = 0
      end
      object pnlConfirmar: TPanel
        Left = 283
        Top = 8
        Width = 78
        Height = 43
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Confirmar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = pnlConfirmarClick
        OnMouseEnter = pnlConfirmarMouseEnter
        OnMouseLeave = pnlConfirmarMouseLeave
      end
      object pnlSair: TPanel
        Left = 367
        Top = 9
        Width = 74
        Height = 43
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = pnlSairClick
        OnMouseEnter = pnlSairMouseEnter
        OnMouseLeave = pnlSairMouseLeave
      end
      object edtCodFunc: TEdit
        Left = 97
        Top = 28
        Width = 40
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtNomeFunc: TEdit
        Left = 143
        Top = 28
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object pnlCentro: TPanel
      Left = 1
      Top = 42
      Width = 455
      Height = 286
      Align = alClient
      TabOrder = 2
      ExplicitHeight = 310
      object dblistagem: TDBGrid
        Left = 1
        Top = 1
        Width = 453
        Height = 284
        Align = alClient
        DataSource = ReadFormat
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_FORMAT'
            Title.Caption = 'CodFormat'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_MAQUINA'
            Title.Caption = 'CodMaquina'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_FUNCIONARIO'
            Title.Caption = 'CodFunc'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FORMAT'
            Title.Caption = 'DataFormata'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 213
            Visible = True
          end>
      end
    end
  end
  object ReadFormat: TDataSource
    DataSet = dm.ReadFormat
    Left = 337
    Top = 73
  end
  object WriteFormat: TDataSource
    DataSet = dm.WriteFormat
    Left = 393
    Top = 73
  end
end
