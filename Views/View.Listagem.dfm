object frmListagemMaquinas: TfrmListagemMaquinas
  Left = 0
  Top = 0
  Caption = 'Listagem M'#225'quinas'
  ClientHeight = 491
  ClientWidth = 812
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
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 491
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 810
      Height = 72
      Align = alTop
      TabOrder = 0
    end
    object pnlCentro: TPanel
      Left = 1
      Top = 73
      Width = 810
      Height = 351
      Align = alClient
      TabOrder = 1
      object dbListagem: TDBGrid
        Left = 1
        Top = 1
        Width = 808
        Height = 349
        Align = alClient
        DataSource = dsMaquinas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 424
      Width = 810
      Height = 66
      Align = alBottom
      TabOrder = 2
      object Button1: TButton
        Left = 176
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
      end
    end
  end
  object cdsMaquinas: TClientDataSet
    PersistDataPacket.Data = {
      3B0100009619E0BD01000000180000000B0000000000030000003B0106436F64
      4D617104000100000000000C4E4F4D455F4D415155494E410100490000000100
      0557494454480200020014000249500100490000000100055749445448020002
      0014000B50524F4345535341444F520100490000000100055749445448020002
      0014000352414D010049000000010005574944544802000200140009504C4143
      415F4D414501004900000001000557494454480200020014000648445F535344
      01004900000001000557494454480200020014000757494E444F575301004900
      00000100055749445448020002001400074C4943454E53410100490000000100
      055749445448020002001400055345544F520100490000000100055749445448
      0200020014000E434F4446554E43494F4E4152494F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodMaq'
        DataType = ftInteger
      end
      item
        Name = 'NOME_MAQUINA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PROCESSADOR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RAM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PLACA_MAE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'HD_SSD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'WINDOWS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LICENSA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SETOR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODFUNCIONARIO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 601
    Top = 432
    object cdsMaquinascod_maq: TIntegerField
      FieldName = 'CodMaq'
    end
    object cdsMaquinasNOME_MAQUINA: TStringField
      FieldName = 'NOME_MAQUINA'
    end
    object cdsMaquinasIP: TStringField
      FieldName = 'IP'
    end
    object cdsMaquinasPROCESSADOR: TStringField
      FieldName = 'PROCESSADOR'
    end
    object cdsMaquinasRAM: TStringField
      FieldName = 'RAM'
    end
    object cdsMaquinasPLACA_MAE: TStringField
      FieldName = 'PLACA_MAE'
    end
    object cdsMaquinasHD_SSD: TStringField
      FieldName = 'HD_SSD'
    end
    object cdsMaquinasWINDOWS: TStringField
      FieldName = 'WINDOWS'
    end
    object cdsMaquinasLICENSA: TStringField
      FieldName = 'LICENSA'
    end
    object cdsMaquinasSETOR: TStringField
      FieldName = 'SETOR'
    end
    object cdsMaquinasCODFUNCIONARIO: TIntegerField
      FieldName = 'CODFUNCIONARIO'
    end
  end
  object dsMaquinas: TDataSource
    DataSet = cdsMaquinas
    Left = 665
    Top = 432
  end
end
