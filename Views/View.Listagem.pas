unit View.Listagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DATAMODULE, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls,
  frame.Pesquisa2;

type
  TfrmListagemMaquinas = class(TForm)
    pnlContainer: TPanel;
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    dbListagem: TDBGrid;
    Button1: TButton;
    cdsMaquinas: TClientDataSet;
    dsMaquinas: TDataSource;
    cdsMaquinascod_maq: TIntegerField;
    cdsMaquinasNOME_MAQUINA: TStringField;
    cdsMaquinasIP: TStringField;
    cdsMaquinasPROCESSADOR: TStringField;
    cdsMaquinasRAM: TStringField;
    cdsMaquinasPLACA_MAE: TStringField;
    cdsMaquinasHD_SSD: TStringField;
    cdsMaquinasWINDOWS: TStringField;
    cdsMaquinasLICENSA: TStringField;
    cdsMaquinasSETOR: TStringField;
    cdsMaquinasCODFUNCIONARIO: TIntegerField;

  private
     // Declarar o TSaveDialog como private para ser acessível apenas internamente
    procedure CarregarDados;
  public

  end;

var
  frmListagemMaquinas: TfrmListagemMaquinas;

implementation

{$R *.dfm}

procedure TfrmListagemMaquinas.CarregarDados;
begin

end;

end.
