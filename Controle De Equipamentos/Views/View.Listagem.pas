unit View.Listagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DATAMODULE, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls,
  frame.Pesquisa2;

type
  TfrmListagem = class(TForm)
    pnlContainer: TPanel;
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    dsListagem: TDataSource;
    dbListagem: TDBGrid;
    cdsDados: TClientDataSet;
    Button1: TButton;
    cdsDadosnome_maquina: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
     // Declarar o TSaveDialog como private para ser acess�vel apenas internamente
    procedure CarregarDados;
  public

  end;

var
  frmListagem: TfrmListagem;

implementation

{$R *.dfm}

procedure TfrmListagem.FormCreate(Sender: TObject);
begin

 cdsDados.FieldDefs.Clear;
  cdsDados.FieldDefs.Add('COD_EQP', ftInteger);
  cdsDados.FieldDefs.Add('DATA_CADASTRO', ftDate);
  cdsDados.FieldDefs.Add('DATA_ATUALIZACAO', ftDateTime);
  cdsDados.FieldDefs.Add('NOME_MAQUINA', ftString, 100);
  cdsDados.FieldDefs.Add('IP', ftString, 20);
  cdsDados.FieldDefs.Add('PROCESSADOR', ftString, 100);
  cdsDados.FieldDefs.Add('RAM', ftString, 10);
  cdsDados.FieldDefs.Add('PLACA_MAE', ftString, 100);
  cdsDados.FieldDefs.Add('HD_SSD', ftString, 100);
  cdsDados.FieldDefs.Add('WINDOWS', ftString, 50);
  cdsDados.FieldDefs.Add('LICENSA', ftString, 100);
  cdsDados.FieldDefs.Add('SETOR', ftString, 50);

  // Criar a estrutura do CDS
  cdsDados.CreateDataSet;

    // Definir os nomes das colunas a serem exibidos no DBGrid
  cdsDados.FieldByName('COD_EQP').DisplayLabel := 'C�digo';
  cdsDados.FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de Cadastro';
  cdsDados.FieldByName('DATA_ATUALIZACAO').DisplayLabel := 'Data de Atualiza��o';
  cdsDados.FieldByName('NOME_MAQUINA').DisplayLabel := 'Nome da M�quina';
  cdsDados.FieldByName('IP').DisplayLabel := 'IP';
  cdsDados.FieldByName('PROCESSADOR').DisplayLabel := 'Processador';
  cdsDados.FieldByName('RAM').DisplayLabel := 'RAM';
  cdsDados.FieldByName('PLACA_MAE').DisplayLabel := 'Placa M�e';
  cdsDados.FieldByName('HD_SSD').DisplayLabel := 'HD/SSD';
  cdsDados.FieldByName('WINDOWS').DisplayLabel := 'Windows';
  cdsDados.FieldByName('LICENSA').DisplayLabel := 'Licen�a';
  cdsDados.FieldByName('SETOR').DisplayLabel := 'Setor';
end;


procedure TfrmListagem.CarregarDados;
begin
  // Verificar se o CDS est� aberto antes de carregar os dados
  if not cdsDados.Active then
    cdsDados.CreateDataSet
  else
    cdsDados.EmptyDataSet; // Limpar os dados existentes

  // Copiar os dados do TQuery para o CDS
  dm.ReadEquipamentos.DisableControls; // Desativar a atualiza��o visual temporariamente
  try
    dm.ReadEquipamentos.First;
    while not dm.ReadEquipamentos.Eof do
    begin
      cdsDados.Append;
      cdsDados.FieldByName('COD_EQP').AsInteger := dm.ReadEquipamentos.FieldByName('COD_EQP').AsInteger;
      cdsDados.FieldByName('DATA_CADASTRO').AsDateTime := dm.ReadEquipamentos.FieldByName('DATA_CADASTRO').AsDateTime;
      cdsDados.FieldByName('DATA_ATUALIZACAO').AsDateTime := dm.ReadEquipamentos.FieldByName('DATA_ATUALIZACAO').AsDateTime;
      cdsDados.FieldByName('NOME_MAQUINA').AsString := dm.ReadEquipamentos.FieldByName('NOME_MAQUINA').AsString;
      cdsDados.FieldByName('IP').AsString := dm.ReadEquipamentos.FieldByName('IP').AsString;
      cdsDados.FieldByName('PROCESSADOR').AsString := dm.ReadEquipamentos.FieldByName('PROCESSADOR').AsString;
      cdsDados.FieldByName('RAM').AsString := dm.ReadEquipamentos.FieldByName('RAM').AsString;
      cdsDados.FieldByName('PLACA_MAE').AsString := dm.ReadEquipamentos.FieldByName('PLACA_MAE').AsString;
      cdsDados.FieldByName('HD_SSD').AsString := dm.ReadEquipamentos.FieldByName('HD_SSD').AsString;
      cdsDados.FieldByName('WINDOWS').AsString := dm.ReadEquipamentos.FieldByName('WINDOWS').AsString;
      cdsDados.FieldByName('LICENSA').AsString := dm.ReadEquipamentos.FieldByName('LICENSA').AsString;
      cdsDados.FieldByName('SETOR').AsString := dm.ReadEquipamentos.FieldByName('SETOR').AsString;
      cdsDados.Post;

      dm.ReadEquipamentos.Next;
    end;
  finally
    dm.ReadEquipamentos.EnableControls; // Reativar a atualiza��o visual
  end;
end;

procedure TfrmListagem.FormShow(Sender: TObject);
begin
  DM.ReadEquipamentos.SQL.Text := 'SELECT * FROM EQUIPAMENTOS_INTERNOS';
  DM.ReadEquipamentos.Open;
  CarregarDados; // Carregar os dados no TClientDataSet
  DM.ReadEquipamentos.Close; // Fechar a conex�o com a base de dados ap�s o carregamento
end;

end.
