unit View.Listagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DATAMODULE, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls,
  frame.Pesquisa2, frame.Buttons, View.Pesquisas;

type
  TfrmListagemMaquinas = class(TForm)
    pnlContainer: TPanel;
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    dbListagem: TDBGrid;
    dsMaquinas: TDataSource;
    cdsMaquinas: TClientDataSet;
    cdsMaquinasCodMaq: TStringField;
    cdsMaquinasMaquina: TStringField;
    cdsMaquinasFuncionario: TStringField;
    cdsMaquinasIP: TStringField;
    cdsMaquinasProcessador: TStringField;
    cdsMaquinasRam: TStringField;
    cdsMaquinasPlaca_Mae: TStringField;
    cdsMaquinasHD_SSD: TStringField;
    cdsMaquinasWindows: TStringField;
    cdsMaquinasLicensa: TStringField;
    cdsMaquinasSetor: TStringField;
    cdsMaquinasCodFuncionario: TIntegerField;
    frmPesquisaEdt1: TfrmPesquisaEdt;
    frmButtons1: TfrmButtons;
    procedure frmButtons1btnAtualizarClick(Sender: TObject);
    procedure frmButtons1btnSairClick(Sender: TObject);
    procedure frmPesquisaEdt1btnPesquisaEvClick(Sender: TObject);

  private
     // Declarar o TSaveDialog como private para ser acess�vel apenas internamente
    procedure CarregarDados;
    var FSelectedCodes : TStringList;
   var where : string;
  public

  end;

var
  frmListagemMaquinas: TfrmListagemMaquinas;

implementation

{$R *.dfm}

procedure TfrmListagemMaquinas.CarregarDados;
begin
   // Copiar os dados do TQuery para o CDS
  dm.ReadRelEquipamentos.DisableControls; // Desativar a atualiza��o visual temporariamente
  try
    dm.ReadRelEquipamentos.First;
    while not dm.ReadRelEquipamentos.Eof do
    begin
      cdsMaquinas.Append;
      cdsMaquinas.FieldByName('CodMaq').AsInteger := dm.ReadRelEquipamentos.FieldByName('COD_EQP').AsInteger;
      cdsMaquinas.FieldByName('Maquina').AsString := dm.ReadRelEquipamentos.FieldByName('NOME_MAQUINA').AsString;
      cdsMaquinas.FieldByName('Funcionario').AsString := dm.ReadRelEquipamentos.FieldByName('NOME_FUNCIONARIO').AsString;
      cdsMaquinas.FieldByName('IP').AsString := dm.ReadRelEquipamentos.FieldByName('IP').AsString;
      cdsMaquinas.FieldByName('Processador').AsString := dm.ReadRelEquipamentos.FieldByName('Processador').AsString;
      cdsMaquinas.FieldByName('RAM').AsString := dm.ReadRelEquipamentos.FieldByName('RAM').AsString;
      cdsMaquinas.FieldByName('Placa_Mae').AsString := dm.ReadRelEquipamentos.FieldByName('Placa_Mae').AsString;
      cdsMaquinas.FieldByName('HD_SSD').AsString := dm.ReadRelEquipamentos.FieldByName('HD_SSD').AsString;
      cdsMaquinas.FieldByName('Windows').AsString := dm.ReadRelEquipamentos.FieldByName('Windows').AsString;
      cdsMaquinas.FieldByName('Licensa').AsString := dm.ReadRelEquipamentos.FieldByName('Licensa').AsString;
      cdsMaquinas.FieldByName('Setor').AsString := dm.ReadRelEquipamentos.FieldByName('Setor').AsString;
      cdsMaquinas.FieldByName('CodFuncionario').AsInteger := dm.ReadRelEquipamentos.FieldByName('COD_FUNCIONARIO').AsInteger;
      cdsMaquinas.Post;
      dm.ReadRelEquipamentos.Next;
    end;
  finally
    dm.ReadRelEquipamentos.EnableControls; // Reativar a atualiza��o visual
  end;
end;

procedure TfrmListagemMaquinas.frmButtons1btnAtualizarClick(Sender: TObject);
begin
  cdsMaquinas.EmptyDataSet; // Limpar os registros existentes
  DM.ReadRelEquipamentos.SQL.Clear;
  DM.ReadRelEquipamentos.SQL.Add('select maq.cod_eqp, maq.nome_maquina, f.nome_funcionario, maq.ip, maq.processador, maq.ram, maq.placa_mae, maq.hd_ssd, maq.windows, maq.licensa, maq.setor, maq.cod_funcionario from equipamentos_internos maq');
  DM.ReadRelEquipamentos.SQL.Add('left join funcionarios f on f.cod_funcionario = maq.cod_funcionario');
  DM.ReadRelEquipamentos.Open;
  CarregarDados; // Carregar os dados filtrados no TClientDataSet
  DM.ReadRelEquipamentos.Close;
end;

procedure TfrmListagemMaquinas.frmButtons1btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmListagemMaquinas.frmPesquisaEdt1btnPesquisaEvClick(
  Sender: TObject);
  var codSelect : integer;
begin
  frmPesquisaEdt1.tabela := 'ComprasRel';
  frmPesquisaEdt1.btnPesquisaEvClick(Sender);
   CodSelect := frmPesquisa.Codigo;
  if(CodSelect <> 0) and (FSelectedCodes.IndexOf(IntToStr(CodSelect)) = -1)then
    begin
      if frmPesquisaEdt1.edtCod.Text <> '' then
        begin
          frmPesquisaEdt1.edtCod.Text := frmPesquisaEdt1.edtCod.Text + ',';
          frmPesquisaEdt1.edtCod.Text := frmPesquisaEdt1.edtCod.Text + IntToStr(CodSelect);
          FSelectedCodes.Add(IntToStr(CodSelect));
        end
      else if (frmPesquisaEdt1.edtCod.Text = '') then
        begin
          frmPesquisaEdt1.edtCod.Text := frmPesquisaEdt1.edtCod.Text + inttostr(codselect);
          FSelectedCodes.Add(IntToStr(CodSelect));
        end
        else
        begin
          ShowMessage('C�digo j� adicionado');
        end;
    end;

end;

end.
