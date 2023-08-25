object frmListagemCompras: TfrmListagemCompras
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 385
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContainer: TPanel
    Left = 0
    Top = 57
    Width = 728
    Height = 269
    Align = alClient
    TabOrder = 0
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 326
    Width = 728
    Height = 59
    Align = alBottom
    TabOrder = 1
    inline frmButtons1: TfrmButtons
      Left = 1
      Top = 1
      Width = 726
      Height = 57
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 726
      ExplicitHeight = 57
      inherited btnRel: TButton
        Left = 170
        Top = 7
        ExplicitLeft = 170
        ExplicitTop = 7
      end
      inherited btnAtualizar: TButton
        Left = 266
        Top = 5
        OnClick = frmButtons1btnAtualizarClick
        ExplicitLeft = 266
        ExplicitTop = 5
      end
      inherited btnEditar: TButton
        Left = 347
        Top = 7
        ExplicitLeft = 347
        ExplicitTop = 7
      end
      inherited btnSair: TButton
        Left = 439
        Top = 7
        ExplicitLeft = 439
        ExplicitTop = 7
      end
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 57
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 255
      Top = 33
      Width = 76
      Height = 16
      Caption = 'Comprador:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline frmPesquisaEdt1: TfrmPesquisaEdt
      Left = 1
      Top = 1
      Width = 440
      Height = 55
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 440
      ExplicitHeight = 55
      inherited Label1: TLabel
        Left = 7
        Width = 32
        Caption = 'Loja:'
        ExplicitLeft = 7
        ExplicitWidth = 32
      end
      inherited Label10: TLabel
        Left = 8
        Width = 31
        Caption = 'Tipo:'
        ExplicitLeft = 8
        ExplicitWidth = 31
      end
      inherited Label5: TLabel
        Left = 121
        ExplicitLeft = 121
      end
      inherited Label6: TLabel
        Left = 135
        ExplicitLeft = 135
      end
      inherited Label2: TLabel
        Left = 262
        Top = 6
        Width = 35
        Caption = 'Item:'
        ExplicitLeft = 262
        ExplicitTop = 6
        ExplicitWidth = 35
      end
      inherited btnPesquisaEv: TSpeedButton
        Top = 4
        OnClick = frmPesquisaEdt1btnPesquisaEvClick
        ExplicitTop = 4
      end
      inherited cbloja: TComboBox
        Left = 44
        Width = 71
        ItemIndex = -1
        Text = ''
        Items.Strings = (
          'Kabum'
          'Jonnes '
          'Pichau'
          'Dism'#225'quinas'
          'Magazine')
        ExplicitLeft = 44
        ExplicitWidth = 71
      end
      inherited cbTipo: TComboBox
        Left = 45
        Top = 31
        Width = 70
        ItemIndex = -1
        Text = ''
        Items.Strings = (
          'Online'
          'Presencial')
        ExplicitLeft = 45
        ExplicitTop = 31
        ExplicitWidth = 70
      end
      inherited dtIni: TDateTimePicker
        Left = 166
        ExplicitLeft = 166
      end
      inherited dtFim: TDateTimePicker
        Left = 166
        ExplicitLeft = 166
      end
      inherited edtCod: TEdit
        Left = 303
        Width = 69
        OnChange = frmPesquisaEdt1edtCodChange
        ExplicitLeft = 303
        ExplicitWidth = 69
      end
    end
    object edtcomprador: TEdit
      Left = 337
      Top = 31
      Width = 115
      Height = 21
      TabOrder = 1
      OnChange = frmPesquisaEdt1edtCodChange
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 57
    Width = 728
    Height = 269
    Align = alClient
    TabOrder = 3
    object dbListagem: TDBGrid
      Left = 1
      Top = 1
      Width = 726
      Height = 267
      Align = alClient
      DataSource = dsCompras
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsCompras: TDataSource
    DataSet = cdsCompras
    Left = 624
    Top = 193
  end
  object cdsCompras: TClientDataSet
    PersistDataPacket.Data = {
      170100009619E0BD01000000180000000A00000000000300000017010A636F64
      5F636F6D70726104000100000000000B646174615F636F6D7072610400060000
      000000096E6F6D655F6974656D01004900000001000557494454480200020064
      000B6C6F6A615F636F6D70726101004900000001000557494454480200020014
      00084E5F70656469646F01004900000001000557494454480200020014000E6E
      6F6D655F636F6D707261646F7201004900000001000557494454480200020014
      000A76616C6F725F6974656D08000400000000000D6F726967656D5F636F6D70
      726101004900000001000557494454480200020014000C7174645F636F6D7072
      616461080004000000000005746F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cod_compra'
        DataType = ftInteger
      end
      item
        Name = 'data_compra'
        DataType = ftDate
      end
      item
        Name = 'nome_item'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'loja_compra'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'N_pedido'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nome_comprador'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'valor_item'
        DataType = ftFloat
      end
      item
        Name = 'origem_compra'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'qtd_comprada'
        DataType = ftFloat
      end
      item
        Name = 'total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 193
    object cdsComprascod_compra: TIntegerField
      DisplayLabel = 'Cod'
      DisplayWidth = 10
      FieldName = 'cod_compra'
    end
    object cdsComprasdata_compra: TDateField
      DisplayLabel = 'Data Compra'
      DisplayWidth = 10
      FieldName = 'data_compra'
    end
    object cdsComprasnote_item: TStringField
      DisplayLabel = 'Nome '
      DisplayWidth = 30
      FieldName = 'nome_item'
      Size = 100
    end
    object cdsComprasloja_compra: TStringField
      DisplayLabel = 'Loja'
      DisplayWidth = 20
      FieldName = 'loja_compra'
    end
    object cdsComprasN_pedido: TStringField
      DisplayLabel = 'Pedido'
      DisplayWidth = 20
      FieldName = 'N_pedido'
    end
    object cdsComprasnome_comprador: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 17
      FieldName = 'nome_comprador'
    end
    object cdsComprasvalor_item: TFloatField
      DisplayLabel = 'R$Unit'
      DisplayWidth = 10
      FieldName = 'valor_item'
    end
    object cdsComprasqtd_comprada: TFloatField
      DisplayLabel = 'QTD'
      DisplayWidth = 10
      FieldName = 'qtd_comprada'
    end
    object cdsComprastotal: TFloatField
      DisplayLabel = 'R$Total'
      DisplayWidth = 10
      FieldName = 'total'
    end
    object cdsComprasorigem_compra: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 20
      FieldName = 'origem_compra'
    end
  end
end
