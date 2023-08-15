object Form1: TForm1
  Left = 0
  Top = 0
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 387
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 185
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
      Top = 336
      Width = 455
      Height = 50
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 351
    end
    object pnlCentro: TPanel
      Left = 1
      Top = 42
      Width = 455
      Height = 294
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 185
      ExplicitHeight = 41
      object dblistagem: TDBGrid
        Left = 1
        Top = 1
        Width = 453
        Height = 292
        Align = alClient
        DataSource = ReadFormat
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object ReadFormat: TDataSource
    DataSet = dm.ReadFormat
    Left = 353
    Top = 73
  end
  object WriteFormat: TDataSource
    DataSet = dm.WriteFormat
    Left = 401
    Top = 73
  end
end
