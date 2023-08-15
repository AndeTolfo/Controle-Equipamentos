unit View.Cadastro.Maquinas.Internas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, DATAMODULE, Data.DB, View.Pesquisas, View.Formatacoes;

type
  TfrmCadMaquinas = class(TForm)
    pnlCentro: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCod: TEdit;
    edtNomeMaq: TEdit;
    edtProcessador: TEdit;
    edtRam: TEdit;
    edtPlacaMae: TEdit;
    dtCadastro: TDateTimePicker;
    cbSetor: TComboBox;
    pnlContainer: TPanel;
    pnlRodape: TPanel;
    pnlTopo: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    edtIp: TEdit;
    edtArmazenamento: TEdit;
    edtWindows: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtLicensa: TEdit;
    btnsalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    dsWriteMaquinas: TDataSource;
    btnPesquisaMaq: TSpeedButton;
    Label13: TLabel;
    edtCodFunc: TEdit;
    btnPesquisaFuncionario: TSpeedButton;
    edtNomeFunc: TEdit;
    pnlFormat: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisaMaqClick(Sender: TObject);
    procedure edtCodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisaFuncionarioClick(Sender: TObject);
    procedure pnlFormatMouseEnter(Sender: TObject);
    procedure pnlFormatMouseLeave(Sender: TObject);
    procedure pnlFormatClick(Sender: TObject);
  private
    codigo : integer;
  public
    procedure SetBackgruondBotoes(iPanel: TPanel; iColor: TColor);
  end;

var
  frmCadMaquinas: TfrmCadMaquinas;

implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmCadMaquinas.btnExcluirClick(Sender: TObject);
begin
  // Verifica se o campo edtCod cont�m um valor inteiro v�lido
  if TryStrToInt(edtCod.Text, codigo) then
  begin
    if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Aqui voc� deve executar o c�digo para excluir o registro do banco de dados.
      // Por exemplo, usando o DM.WriteCompras para executar um comando SQL de exclus�o.
      // Substitua 'ColunaCodigo' pelo nome correto da coluna que cont�m o c�digo na tabela.
      DM.WriteEquipamentos.SQL.Clear;
      DM.WriteEquipamentos.SQL.Add('DELETE FROM equipamentos_internos WHERE COD_eqp = :codigo');
      DM.WriteEquipamentos.ParamByName('codigo').AsInteger := codigo;
      DM.WriteEquipamentos.ExecSQL;

      ShowMessage('Registro exclu�do com sucesso!');

      // Limpa os campos do formul�rio ap�s excluir o registro
         ClearControls([edtCod, edtNomeMaq, edtProcessador, edtRam, cbSetor, edtPlacaMae, edtIp, edtArmazenamento, edtWindows, edtLicensa, dtcadastro, edtCodFunc, edtNomeFunc]);
    end;
  end
  else
  begin
    ShowMessage('Informe um c�digo v�lido para excluir o registro.');
  end;
end;
procedure TfrmCadMaquinas.btnNovoClick(Sender: TObject);
begin
     ClearControls([edtCod, edtNomeMaq, edtProcessador, edtRam, cbSetor, edtPlacaMae, edtIp, edtArmazenamento, edtWindows, edtLicensa, dtcadastro, edtCodFunc, edtNomeFunc]);
end;

procedure TfrmCadMaquinas.btnPesquisaFuncionarioClick(Sender: TObject);
begin
frmPesquisa := TfrmPesquisa.Create(Self);
    try
    frmPesquisa.tabela := 'FuncionariosRel';
    if frmPesquisa.ShowModal = mrOk then
    begin

    end;
    finally
      frmPesquisa.Free;
    end;

end;

procedure TfrmCadMaquinas.btnPesquisaMaqClick(Sender: TObject);
begin
frmPesquisa := TfrmPesquisa.Create(Self);
    try
    frmPesquisa.tabela := 'EquipamentosInternos';
    if frmPesquisa.ShowModal = mrOk then
    begin

    end;
    finally
      frmPesquisa.Free;
    end;

end;

procedure TfrmCadMaquinas.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadMaquinas.btnsalvarClick(Sender: TObject);
var
  // Declara��o das vari�veis
  data_cadastro: TDate;
  data_atualizacao: TDateTime;
  nome_maq, ip, processador, ram, placamae, discorigido, windows, licensa, setor: string;
  codfunc, codEquipamento, codFuncAntigo: integer;
  valor: double;
begin
  // Verifica se a op��o foi selecionada no cbTipoCompra
  if cbSetor.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um setor.'); // Exibe mensagem de erro
    Exit; // Sai do procedimento sem executar o SQL
  end;

  try
    // Obten��o dos valores dos campos do formul�rio
    case cbSetor.ItemIndex of
      0: setor := 'Comercial';
      1: setor := 'Desenvolvimento';
      2: setor := 'Financeiro';
      3: setor := 'Medicon';
      4: setor := 'Siscomp';
      5: setor := 'Administra��o';
    end;
    data_atualizacao := Now;
    data_cadastro := dtCadastro.Date;
    nome_maq := edtNomeMaq.Text;
    ip := edtIp.Text;
    processador := edtProcessador.Text;
    ram := edtRam.Text;
    placamae := edtPlacaMae.Text;
    discorigido := edtArmazenamento.Text;
    windows := edtWindows.Text;
    licensa := edtLicensa.Text;
    codfunc := StrToIntDef(edtCodFunc.Text, 0); // Utiliza StrToIntDef para tratar caso o campo esteja em branco

    // Verifica se o campo edtCod cont�m um valor inteiro v�lido
    if Trim(edtCod.Text) = '' then
    begin
      // Inser��o de um novo registro
      DM.WriteEquipamentos.SQL.Clear;
      DM.WriteEquipamentos.SQL.Add('INSERT INTO EQUIPAMENTOS_INTERNOS(DATA_CADASTRO,DATA_ATUALIZACAO,NOME_MAQUINA,IP,PROCESSADOR,RAM,PLACA_MAE,HD_SSD,WINDOWS,LICENSA,SETOR, COD_FUNCIONARIO)');
      DM.WriteEquipamentos.SQL.Add('VALUES(:pDtCad,:pDtAtt,:pNomeMaq,:pIp,:pProcessador,:pRam,:pPlacaMae,:pArmazenamento,:pWindows,:pLicensa, :pSetor, :pCodFuncionario)');
      DM.WriteEquipamentos.ParamByName('pDtCad').AsDate := data_cadastro;
      DM.WriteEquipamentos.ParamByName('pNomeMaq').AsString := nome_maq;
      DM.WriteEquipamentos.ParamByName('pIp').AsString := ip;
      DM.WriteEquipamentos.ParamByName('pProcessador').AsString := processador;
      DM.WriteEquipamentos.ParamByName('pRam').AsString := ram;
      DM.WriteEquipamentos.ParamByName('pPlacaMae').AsString := placamae;
      DM.WriteEquipamentos.ParamByName('pArmazenamento').AsString := discorigido;
      DM.WriteEquipamentos.ParamByName('pWindows').AsString := windows;
      DM.WriteEquipamentos.ParamByName('pLicensa').AsString := licensa;
      DM.WriteEquipamentos.ParamByName('pSetor').AsString := setor;
      if codfunc = 0 then
        DM.WriteEquipamentos.ParamByName('pCodFuncionario').Clear  // Define como NULL se codfunc = 0
      else
        DM.WriteEquipamentos.ParamByName('pCodFuncionario').AsInteger := codfunc;

      DM.WriteEquipamentos.ExecSQL;

      // Obt�m o c�digo do equipamento rec�m-inserido usando LastInsertID
      DM.ReadEquipamentos.Close;
      DM.ReadEquipamentos.SQL.Text := 'SELECT GEN_ID(GEN_EQP, 0) FROM RDB$DATABASE';
      DM.ReadEquipamentos.Open;
      codEquipamento := DM.ReadEquipamentos.Fields[0].AsInteger;

      // Verifica se foi vinculado um funcion�rio ao equipamento e adiciona o registro no HIST_MAQUINAS
      if codfunc > 0 then
      begin
        DM.WriteHistMaquinas.SQL.Clear;
        DM.WriteHistMaquinas.SQL.Add('INSERT INTO HIST_MAQUINAS(COD_MAQUINA, COD_FUNCIONARIO, DT_HISTORICO, DT_ATRIBUICAO) VALUES (:pCodMaq, :pCodFuncionario, :pDtHistorico, :pDtAtribuicao)');
        DM.WriteHistMaquinas.ParamByName('pCodMaq').AsInteger := codEquipamento;
        DM.WriteHistMaquinas.ParamByName('pCodFuncionario').AsInteger := codfunc;
        DM.WriteHistMaquinas.ParamByName('pDtHistorico').AsDateTime := Now;
        DM.WriteHistMaquinas.ParamByName('pDtAtribuicao').AsDateTime := Now;
        DM.WriteHistMaquinas.ExecSQL;
      end;

      ShowMessage('Cadastro conclu�do com sucesso!');
    end
    else
    begin
      // Atualiza��o do registro
      DM.WriteEquipamentos.SQL.Clear;
      DM.WriteEquipamentos.SQL.Add('UPDATE EQUIPAMENTOS_INTERNOS SET DATA_CADASTRO = :pDtCad, DATA_ATUALIZACAO = CURRENT_TIMESTAMP,');
      DM.WriteEquipamentos.SQL.Add('NOME_MAQUINA = :pNomeMaq, IP = :pIP, PROCESSADOR = :pProcessador, RAM = :pRAM, PLACA_MAE = :pPlacaMae,');
      DM.WriteEquipamentos.SQL.Add('HD_SSD = :pArmazenamento, WINDOWS = :pWindows, LICENSA = :pLicensa, SETOR = :pSetor, COD_FUNCIONARIO = :pCodFuncionario');
      DM.WriteEquipamentos.SQL.Add('WHERE COD_EQP = :pCodigo');
      DM.WriteEquipamentos.ParamByName('pCodigo').AsInteger := StrToInt(edtCod.Text);
      DM.WriteEquipamentos.ParamByName('pDtCad').AsDate := data_cadastro;
      DM.WriteEquipamentos.ParamByName('pNomeMaq').AsString := nome_maq;
      DM.WriteEquipamentos.ParamByName('pIp').AsString := ip;
      DM.WriteEquipamentos.ParamByName('pProcessador').AsString := processador;
      DM.WriteEquipamentos.ParamByName('pRam').AsString := ram;
      DM.WriteEquipamentos.ParamByName('pPlacaMae').AsString := placamae;
      DM.WriteEquipamentos.ParamByName('pArmazenamento').AsString := discorigido;
      DM.WriteEquipamentos.ParamByName('pWindows').AsString := windows;
      DM.WriteEquipamentos.ParamByName('pLicensa').AsString := licensa;
      DM.WriteEquipamentos.ParamByName('pSetor').AsString := setor;
      if codfunc = 0 then
        DM.WriteEquipamentos.ParamByName('pCodFuncionario').Value := Null  // Define como NULL se codfunc = 0
      else
        DM.WriteEquipamentos.ParamByName('pCodFuncionario').AsInteger := codfunc;

      // Busca o c�digo do funcion�rio antigo antes do update no equipamento interno
      DM.ReadEquipamentos.Close;
      DM.ReadEquipamentos.SQL.Text := 'SELECT COD_FUNCIONARIO FROM EQUIPAMENTOS_INTERNOS WHERE COD_EQP = :pCodigo';
      DM.ReadEquipamentos.ParamByName('pCodigo').AsInteger := StrToInt(edtCod.Text);
      DM.ReadEquipamentos.Open;
      codFuncAntigo := DM.ReadEquipamentos.FieldByName('COD_FUNCIONARIO').AsInteger;

      DM.WriteEquipamentos.ExecSQL;

      // Verifica se foi vinculado um novo funcion�rio ao equipamento e adiciona o registro no HIST_MAQUINAS
      if codfunc <> codFuncAntigo then
      begin
        DM.WriteHistMaquinas.SQL.Clear;
        DM.WriteHistMaquinas.SQL.Add('UPDATE HIST_MAQUINAS SET DT_DEVOLUCAO = :pDtDevolucao WHERE COD_MAQUINA = :pCodMaq AND COD_FUNCIONARIO = :pCodFuncAntigo');
        DM.WriteHistMaquinas.ParamByName('pDtDevolucao').AsDateTime := Now;
        DM.WriteHistMaquinas.ParamByName('pCodMaq').AsInteger := StrToInt(edtCod.Text);
        DM.WriteHistMaquinas.ParamByName('pCodFuncAntigo').AsInteger := codFuncAntigo;
        DM.WriteHistMaquinas.ExecSQL;

        if codfunc > 0 then
        begin
          DM.WriteHistMaquinas.SQL.Clear;
          DM.WriteHistMaquinas.SQL.Add('INSERT INTO HIST_MAQUINAS(COD_MAQUINA, COD_FUNCIONARIO, DT_HISTORICO, DT_ATRIBUICAO) VALUES (:pCodMaq, :pCodFuncionario, :pDtHistorico, :pDtAtribuicao)');
          DM.WriteHistMaquinas.ParamByName('pCodMaq').AsInteger := StrToInt(edtCod.Text);
          DM.WriteHistMaquinas.ParamByName('pCodFuncionario').AsInteger := codfunc;
          DM.WriteHistMaquinas.ParamByName('pDtHistorico').AsDateTime := Now;
          DM.WriteHistMaquinas.ParamByName('pDtAtribuicao').AsDateTime := Now;
          DM.WriteHistMaquinas.ExecSQL;
        end;
      end;

      ShowMessage('Cadastro atualizado com sucesso!');
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar o registro: ' + E.Message);
  end;

  ClearControls([edtCod, edtNomeMaq, edtProcessador, edtRam, cbSetor, edtPlacaMae, edtIp, edtArmazenamento, edtWindows, edtLicensa, dtcadastro, edtCodFunc, edtNomeFunc]);
end;

procedure TfrmCadMaquinas.edtCodFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: Integer;
begin
  // Verifica se a tecla pressionada � a tecla "Enter" (c�digo 13)
  if Key = 13 then
  begin

    // Verifica se o texto digitado no edtcod � um valor inteiro v�lido
    if TryStrToInt(edtCodFunc.Text, codigo) then
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
        edtCodFunc.text := DM.ReadFuncionarios.FieldByName('cod_funcionario').AsString;
        edtNomeFunc.Text := DM.ReadFuncionarios.FieldByName('NOME_FUNCIONARIO').AsString;
      end
      else
      begin
        // Caso n�o encontre uma compra com o c�digo informado, limpa os campos
          ClearControls([edtCodFunc, edtNomeFunc]);
          ShowMessage('Funcion�rio n�o encontrado!');
          frmPesquisa := TfrmPesquisa.Create(Self);
          try
           frmPesquisa.tabela := 'FuncionariosRel';
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
      ClearControls([edtCodFunc, edtNomeFunc]);
      ShowMessage('Digite um c�digo de funcion�rio v�lido!');
    end;
  end;
    DM.ReadFuncionarios.Close;
end;

procedure TfrmCadMaquinas.edtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo,codfunc: Integer;

begin
  // Verifica se a tecla pressionada � a tecla "Enter" (c�digo 13)
  if Key = 13 then
  begin
    // Verifica se o texto digitado no edtcod � um valor inteiro v�lido
    if TryStrToInt(edtcod.Text, codigo) then
    begin
      // Realiza a pesquisa no banco de dados com o c�digo informado
      DM.ReadEquipamentos.SQL.Clear;
      DM.ReadEquipamentos.SQL.add ('SELECT * FROM equipamentos_internos WHERE COD_eqp = :Codigo');
      DM.ReadEquipamentos.ParamByName('Codigo').AsInteger := codigo;
      DM.ReadEquipamentos.Open;

      // Verifica se foi encontrada alguma compra com o c�digo informado
      if not DM.ReadEquipamentos.IsEmpty then
      begin
    // Preenche os campos do formul�rio "frmcadastro" com os dados do registro selecionado no dbGrid
        edtCod.Text := DM.ReadEquipamentos.FieldByName('COD_EQP').AsString;
        edtNomeMaq.Text := DM.ReadEquipamentos.FieldByName('nome_maquina').AsString;
        dtCadastro.Date := DM.ReadEquipamentos.FieldByName('data_cadastro').AsDateTime;
        edtIp.Text := DM.ReadEquipamentos.FieldByName('ip').AsString;
        edtProcessador.Text := DM.ReadEquipamentos.FieldByName('processador').AsString;
        edtRam.Text := DM.ReadEquipamentos.FieldByName('ram').AsString;
        edtPlacaMae.Text := DM.ReadEquipamentos.FieldByName('placa_mae').AsString;
        edtArmazenamento.Text := DM.ReadEquipamentos.FieldByName('hd_ssd').AsString;
        edtWindows.Text := DM.ReadEquipamentos.FieldByName('windows').AsString;
        edtLicensa.Text := DM.ReadEquipamentos.FieldByName('licensa').AsString;
        codfunc := DM.ReadEquipamentos.FieldByName('cod_funcionario').AsInteger;
        EdtCodFunc.Text := inttostr(codfunc);
       if codfunc <> null then
       begin
        DM.ReadFuncionarios.SQL.Text := 'SELECT * FROM funcionarios WHERE COD_Funcionario = :Codigo';
        DM.ReadFuncionarios.ParamByName('Codigo').AsInteger := codfunc;
        DM.ReadFuncionarios.Open;
        frmCadMaquinas.edtNomeFunc.Text := DM.ReadFuncionarios.FieldByName('nome_funcionario').AsString;
        DM.ReadFuncionarios.Close;
        end;
    // Define o valor do ComboBox cbSetor com base na coluna Setor do banco de dados
        if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Comercial' then
            cbSetor.ItemIndex := 0
        else if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Desenvolvimento' then
            cbSetor.ItemIndex := 1
        else if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Financeiro' then
            cbSetor.ItemIndex := 2
        else if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Medicon' then
            cbSetor.ItemIndex := 3
        else if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Siscomp' then
            cbSetor.ItemIndex := 4
        else if DM.ReadEquipamentos.FieldByName('setor').AsString = 'Administra��o' then
            cbSetor.ItemIndex := 5;

      end
      else
      begin
        // Caso n�o encontre uma compra com o c�digo informado, limpa os campos
            ClearControls([edtCod, edtNomeMaq, edtProcessador, edtRam, cbSetor, edtPlacaMae, edtIp, edtArmazenamento, edtWindows, edtLicensa, dtcadastro, edtCodFunc, edtNomeFunc]);
        ShowMessage('M�quina n�o encontrada!');
        frmPesquisa := TfrmPesquisa.Create(Self);
        try
          frmPesquisa.tabela := 'EquipamentosInternos';
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
        ClearControls([edtCod, edtNomeMaq, edtProcessador, edtRam, cbSetor, edtPlacaMae, edtIp, edtArmazenamento, edtWindows, edtLicensa, dtCadastro]);
        ShowMessage('Digite um c�digo de m�quina v�lido!');
    end;

  end;
    dm.ReadEquipamentos.Close;
end;

procedure TfrmCadMaquinas.edtCodKeyPress(Sender: TObject; var Key: Char);
begin
  // Verifica se a tecla pressionada � a tecla "Enter" (c�digo 13)
  if Key = #13 then
  begin
    // Evita que o som padr�o seja reproduzido
    Key := #0;
  end;
end;

procedure TfrmCadMaquinas.SetBackgruondBotoes(iPanel: TPanel; iColor: TColor);
begin
  iPanel.Color := iColor;
end;

procedure TfrmCadMaquinas.FormCreate(Sender: TObject);
begin
       dtCadastro.Date := now;
end;

procedure TfrmCadMaquinas.pnlFormatClick(Sender: TObject);
begin
  if edtCod.Text <> '' then
  begin
      frmFormatacoes := TfrmFormatacoes.Create(Self);
      frmFormatacoes.codMaquina := strtoint(edtCod.Text);
  try
    if frmFormatacoes.ShowModal = mrOk then
    begin

    end;
  finally
    frmFormatacoes.Free;
    end;
  end
  else
  begin
    ShowMessage('Primeire Selecione uma m�quina');
  end;

end;

procedure TfrmCadMaquinas.pnlFormatMouseEnter(Sender: TObject);
begin
      SetBackgruondBotoes(pnlFormat,clBtnHighlight)
end;

procedure TfrmCadMaquinas.pnlFormatMouseLeave(Sender: TObject);
begin
    SetBackgruondBotoes(TPanel(Sender), clBtnFace);
end;

end.
