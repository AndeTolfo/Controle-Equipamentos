object frmListagem: TfrmListagem
  Left = 0
  Top = 0
  Caption = 'frmListagem'
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
  OnCreate = FormCreate
  OnShow = FormShow
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
      ExplicitTop = 57
      ExplicitHeight = 367
      object dbListagem: TDBGrid
        Left = 1
        Top = 1
        Width = 808
        Height = 349
        Align = alClient
        DataSource = dsListagem
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
  object dsListagem: TDataSource
    DataSet = cdsDados
    Left = 665
    Top = 433
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 432
    object cdsDadosnome_maquina: TStringField
      FieldName = 'nome_maquina'
      Size = 100
    end
  end
end
