unit View.Formatacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    pnlContainer: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlCentro: TPanel;
    Label1: TLabel;
    dblistagem: TDBGrid;
    ReadFormat: TDataSource;
    WriteFormat: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DATAMODULE;

end.
