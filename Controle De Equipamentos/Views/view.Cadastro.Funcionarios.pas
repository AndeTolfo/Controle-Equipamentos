unit view.Cadastro.Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, frame.Buttons,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, DATAMODULE, Data.DB, View.Pesquisas;

type
  TfrmCadFuncionario = class(TForm)
    pnContainer: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlCentro: TPanel;
    btnsalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtCod: TEdit;
    btnPesquisaFuncionario: TSpeedButton;
    Label3: TLabel;
    edtNome: TEdit;
    Label9: TLabel;
    cbContrato: TComboBox;
    Label4: TLabel;
    cbSetor: TComboBox;
    dtCadastro: TDateTimePicker;
    Label7: TLabel;
    dsFuncionarios: TDataSource;
    procedure btnsalvarClick(Sender: TObject);
    procedure edtCodKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisaFuncionarioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmCadFuncionario.btnExcluirClick(Sender: TObject);
var codigo : integer;
begin
 // Verifica se o campo edtCod cont�m um valor inteiro v�lido
  if TryStrToInt(edtCod.Text, codigo) then
  begin
    if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Aqui voc� deve executar o c�digo para excluir o registro do banco de dados.
      // Por exemplo, usando o DM.WriteCompras para executar um comando SQL de exclus�o.
      // Substitua 'ColunaCodigo' pelo nome correto da coluna que cont�m o c�digo na tabela.
      DM.WriteFuncionarios.SQL.Clear;
      DM.WriteFuncionarios.SQL.Add('DELETE FROM funcionarios WHERE COD_funcionario = :codigo');
      DM.WriteFuncionarios.ParamByName('codigo').AsInteger := codigo;
      DM.WriteFuncionarios.ExecSQL;

      ShowMessage('Registro exclu�do com sucesso!');

      // Limpa os campos do formul�rio ap�s excluir o registro
         ClearControls([edtCod, edtNome, cbContrato, cbSetor]);
    end;
  end
  else
  begin
    ShowMessage('Informe um c�digo v�lido para excluir o registro.');
  end;
end;

procedure TfrmCadFuncionario.btnNovoClick(Sender: TObject);
begin
   ClearControls([edtCod, edtNome, cbContrato, cbSetor]);
end;

procedure TfrmCadFuncionario.btnPesquisaFuncionarioClick(Sender: TObject);
begin
  frmPesquisa := TfrmPesquisa.Create(Self);
    try
    frmPesquisa.tabela := 'Funcionarios';
    if frmPesquisa.ShowModal = mrOk then
    begin

    end;
    finally
      frmPesquisa.Free;
    end;

end;

procedure TfrmCadFuncionario.btnSairClick(Sender: TObject);
begin
    close;
end;

procedure TfrmCadFuncionario.btnsalvarClick(Sender: TObject);
var
  data_cadastro: TDate;
  nome, setor, contrato : string;
begin
  // Verifica se a op��o foi selecionada no cbTipoCompra
  if cbSetor.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um setor.'); // Exibe mensagem de erro
    Exit; // Sai do procedimento sem executar o SQL
  end;

  if cbContrato.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um status.'); // Exibe mensagem de erro
    Exit; // Sai do procedimento sem executar o SQL
  end;

  try

   case cbSetor.ItemIndex of
      0: setor := 'Comercial';
      1: setor := 'Desenvolvimento';
      2: setor := 'Financeiro';
      3: setor := 'Medicon';
      4: setor := 'Siscomp';
      5: setor := 'Administra��o';
   end;

   case cbContrato.ItemIndex of
      0: contrato := 'Ativo';
      1: contrato := 'Inativo';
   end;

   data_cadastro := dtCadastro.Date;
   nome := edtNome.Text;

   // Verifica se o campo edtCod cont�m um valor inteiro v�lido
    if Trim(edtCod.Text) = '' then
    begin
      // Inser��o de um novo registro
    DM.WriteFuncionarios.SQL.Clear;
    DM.WriteFuncionarios.SQL.Add('INSERT INTO Funcionarios(nome_funcionario, setor,data_cadastro,status)');
    DM.WriteFuncionarios.SQL.Add('Values(:pNome,:pSetor,:pData,:pStatus)');
    end
    else
    begin
        DM.WriteFuncionarios.SQL.Clear;
        DM.WriteFuncionarios.SQL.Add('UPDATE Funcionarios SET nome_funcionario = :pNome, setor = :pSetor, data_cadastro = :pData, status = :pStatus');
        DM.WriteFuncionarios.SQL.Add('WHERE COD_Funcionario = :pCodigo');
        DM.WriteFuncionarios.ParamByName('pCodigo').AsInteger := StrToInt(edtCod.Text);
    end;

   DM.WriteFuncionarios.ParamByName('pData').AsDate := data_cadastro;
   DM.WriteFuncionarios.ParamByName('pNome').AsString := nome;
   DM.WriteFuncionarios.ParamByName('pSetor').AsString := setor;
   DM.WriteFuncionarios.ParamByName('pStatus').AsString := contrato;
   DM.WriteFuncionarios.ExecSQL;
   DM.WriteFuncionarios.Close;

 if Trim(edtCod.Text) = '' then
      ShowMessage('Cadastro conclu�do com sucesso!')
    else
      ShowMessage('Cadastro atualizado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao salvar o registro: ' + E.Message);
  end;

  ClearControls([edtCod, edtNome, cbContrato, cbSetor]);
end;



procedure TfrmCadFuncionario.edtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: Integer;
begin
  // Verifica se a tecla pressionada � a tecla "Enter" (c�digo 13)
  if Key = 13 then
  begin

    // Verifica se o texto digitado no edtcod � um valor inteiro v�lido
    if TryStrToInt(edtcod.Text, codigo) then
    begin
      // Realiza a pesquisa no banco de dados com o c�digo informado
      DM.ReadFuncionarios.SQL.Clear;
      DM.ReadFuncionarios.SQL.add ('SELECT * FROM Funcionarios WHERE COD_funcionario = :Codigo');
      DM.ReadFuncionarios.ParamByName('Codigo').AsInteger := codigo;
      DM.ReadFuncionarios.Open;

      // Verifica se foi encontrada alguma compra com o c�digo informado
      if not DM.ReadFuncionarios.IsEmpty then
      begin
        // Preenche os outros campos do formul�rio com os dados da compra encontrada
        dtCadastro.Date := DM.ReadFuncionarios.FieldByName('DATA_Cadastro').AsDateTime;
        edtNome.Text := DM.ReadFuncionarios.FieldByName('NOME_FUNCIONARIO').AsString;
    // Define o valor do ComboBox cbSetor com base na coluna Setor do banco de dados
        if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Comercial' then
            cbSetor.ItemIndex := 0
        else if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Desenvolvimento' then
            cbSetor.ItemIndex := 1
        else if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Financeiro' then
            cbSetor.ItemIndex := 2
        else if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Medicon' then
            cbSetor.ItemIndex := 3
        else if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Siscomp' then
            cbSetor.ItemIndex := 4
        else if DM.ReadFuncionarios.FieldByName('setor').AsString = 'Administra��o' then
            cbSetor.ItemIndex := 5;

          if DM.ReadFuncionarios.FieldByName('status').AsString = 'Ativo' then
            cbcontrato.ItemIndex := 0
        else if DM.ReadFuncionarios.FieldByName('status').AsString = 'Inativo' then
            cbcontrato.ItemIndex := 1
      end
      else
      begin
        // Caso n�o encontre uma compra com o c�digo informado, limpa os campos
          ClearControls([edtCod, edtNome, cbContrato, cbSetor]);
          ShowMessage('Funcion�rio n�o encontrado!');
          frmPesquisa := TfrmPesquisa.Create(Self);
          try
           frmPesquisa.tabela := 'Funcionarios';
           frmPesquisa.edtNome.Text := inttostr(codigo);
          if frmPesquisa.ShowModal = mrOk then
          begin

          end;
        finally
          frmPesquisa.Free;
        end;
      end;
    end
    else
    begin
      // Caso o texto digitado n�o seja um valor inteiro v�lido, limpa os campos e exibe uma mensagem de erro
      ClearControls([edtCod, edtNome,cbSetor, cbContrato]);
      ShowMessage('Digite um c�digo de funcion�rio v�lido!');
    end;
  end;
    DM.ReadFuncionarios.Close;
end;

procedure TfrmCadFuncionario.edtCodKeyPress(Sender: TObject; var Key: Char);
begin
  // Verifica se a tecla pressionada � a tecla "Enter" (c�digo 13)
  if Key = #13 then
  begin
    // Evita que o som padr�o seja reproduzido
    Key := #0;
  end;
end;

end.
