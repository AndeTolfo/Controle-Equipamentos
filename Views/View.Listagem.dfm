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
  WindowState = wsMaximized
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
      ExplicitLeft = 17
      ExplicitTop = -4
      inline frmPesquisaEdt1: TfrmPesquisaEdt
        Left = 1
        Top = 5
        Width = 408
        Height = 62
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 5
        inherited btnPesquisaEv: TSpeedButton
          OnClick = frmPesquisaEdt1btnPesquisaEvClick
        end
      end
    end
    object pnlCentro: TPanel
      Left = 1
      Top = 73
      Width = 810
      Height = 349
      Align = alClient
      TabOrder = 1
      ExplicitTop = 34
      ExplicitHeight = 351
      object dbListagem: TDBGrid
        Left = 1
        Top = 1
        Width = 808
        Height = 347
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
      Top = 422
      Width = 810
      Height = 68
      Align = alBottom
      TabOrder = 2
      inline frmButtons1: TfrmButtons
        Left = 90
        Top = -3
        Width = 690
        Height = 63
        TabOrder = 0
        ExplicitLeft = 90
        ExplicitTop = -3
        ExplicitHeight = 63
        inherited btnAtualizar: TButton
          OnClick = frmButtons1btnAtualizarClick
        end
        inherited btnSair: TButton
          OnClick = frmButtons1btnSairClick
        end
      end
    end
  end
  object dsMaquinas: TDataSource
    DataSet = cdsMaquinas
    Left = 665
    Top = 432
  end
  object cdsMaquinas: TClientDataSet
    PersistDataPacket.Data = {
      620100009619E0BD01000000180000000C000000000003000000620106436F64
      4D61710100490000000100055749445448020002000F00074D617175696E6101
      0049000000010005574944544802000200C8000B46756E63696F6E6172696F01
      0049000000010005574944544802000200C80002495001004900000001000557
      494454480200020014000B50726F6365737361646F7201004900000001000557
      494454480200020064000352616D010049000000010005574944544802000200
      320009506C6163615F4D61650100490000000100055749445448020002006400
      0648445F53534401004900000001000557494454480200020064000757696E64
      6F77730100490000000100055749445448020002003200074C6963656E736101
      00490000000100055749445448020002006400055365746F7201004900000001
      000557494454480200020014000E436F6446756E63696F6E6172696F04000100
      000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodMaq'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Maquina'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Funcionario'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'IP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Processador'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Ram'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Placa_Mae'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'HD_SSD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Windows'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Licensa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Setor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CodFuncionario'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 593
    Top = 432
    object cdsMaquinasCodMaq: TStringField
      DisplayWidth = 8
      FieldName = 'CodMaq'
      Size = 15
    end
    object cdsMaquinasMaquina: TStringField
      DisplayWidth = 15
      FieldName = 'Maquina'
      Size = 200
    end
    object cdsMaquinasFuncionario: TStringField
      DisplayWidth = 19
      FieldName = 'Funcionario'
      Size = 200
    end
    object cdsMaquinasIP: TStringField
      DisplayWidth = 13
      FieldName = 'IP'
    end
    object cdsMaquinasProcessador: TStringField
      DisplayWidth = 34
      FieldName = 'Processador'
      Size = 100
    end
    object cdsMaquinasRam: TStringField
      DisplayWidth = 26
      FieldName = 'Ram'
      Size = 50
    end
    object cdsMaquinasPlaca_Mae: TStringField
      DisplayWidth = 25
      FieldName = 'Placa_Mae'
      Size = 100
    end
    object cdsMaquinasHD_SSD: TStringField
      DisplayWidth = 20
      FieldName = 'HD_SSD'
      Size = 100
    end
    object cdsMaquinasWindows: TStringField
      DisplayWidth = 27
      FieldName = 'Windows'
      Size = 50
    end
    object cdsMaquinasLicensa: TStringField
      DisplayWidth = 34
      FieldName = 'Licensa'
      Size = 100
    end
    object cdsMaquinasSetor: TStringField
      DisplayWidth = 15
      FieldName = 'Setor'
    end
    object cdsMaquinasCodFuncionario: TIntegerField
      DisplayWidth = 12
      FieldName = 'CodFuncionario'
    end
  end
end
