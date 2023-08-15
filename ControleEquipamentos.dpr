program ControleEquipamentos;

uses
  Vcl.Forms,
  View.Principal in 'Views\View.Principal.pas' {frmPrincipal},
  View.Cadastro.Equipamento in 'Views\View.Cadastro.Equipamento.pas' {frmCadastroCompras},
  View.Cadastro.Maquinas.Internas in 'Views\View.Cadastro.Maquinas.Internas.pas' {frmCadMaquinas},
  DATAMODULE in 'DATAMODULE.pas' {dm: TDataModule},
  View.Listagem in 'Views\View.Listagem.pas' {frmListagemMaquinas},
  Funcoes in 'Funcoes.pas',
  View.Pesquisas in 'Views\View.Pesquisas.pas' {frmPesquisa},
  View.Listagem.Compras in 'Views\View.Listagem.Compras.pas' {frmListagemCompras},
  frame.Pesquisa2 in 'Views\frame.Pesquisa2.pas' {frmPesquisaEdt: TFrame},
  frame.Buttons in 'Views\frame.Buttons.pas' {frmButtons: TFrame},
  view.Cadastro.Funcionarios in 'Views\view.Cadastro.Funcionarios.pas' {frmCadFuncionario},
  View.Formatacoes in 'Views\View.Formatacoes.pas' {frmFormatacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmCadFuncionario, frmCadFuncionario);
  Application.CreateForm(TfrmFormatacoes, frmFormatacoes);
  Application.Run;
end.
