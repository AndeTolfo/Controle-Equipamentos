unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  View.Cadastro.Maquinas.Internas, View.Cadastro.Equipamento, Vcl.Menus,
  View.Listagem, Vcl.Imaging.pngimage, View.Listagem.Compras,MidasLib,
  view.Cadastro.Funcionarios;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    pnlTopo: TPanel;
    btnExit: TBitBtn;
    btnCadMaquinas: TBitBtn;
    btnCadCompras: TBitBtn;
    MainMenu1: TMainMenu;
    Listagem1: TMenuItem;
    EquipamentosInternos1: TMenuItem;
    Image1: TImage;
    Compras1: TMenuItem;
    btnCadFuncionario: TBitBtn;
    procedure btnCadMaquinasClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCadComprasClick(Sender: TObject);
    procedure EquipamentosInternos1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure btnCadFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCadComprasClick(Sender: TObject);
begin
  frmCadastroCompras := TfrmCadastroCompras.Create(Self);
  try
    if frmCadastroCompras.ShowModal = mrOk then
    begin

    end;
  finally
    frmCadastroCompras.Free;
  end;
end;

procedure TfrmPrincipal.btnCadFuncionarioClick(Sender: TObject);
begin
     frmCadFuncionario := TfrmCadFuncionario.Create(Self);
    try
      if frmCadFuncionario.ShowModal = mrOk then
      begin

      end;
    finally
      frmCadFuncionario.Free;
    end;
end;

procedure TfrmPrincipal.btnCadMaquinasClick(Sender: TObject);
begin
  frmCadMaquinas := TfrmCadMaquinas.Create(Self);
    try
      if frmCadMaquinas.ShowModal = mrOk then
      begin

      end;
    finally
      frmCadMaquinas.Free;
    end;
end;

procedure TfrmPrincipal.btnExitClick(Sender: TObject);
begin
close;
end;

procedure TfrmPrincipal.Compras1Click(Sender: TObject);
begin
    frmListagemCompras := TfrmListagemCompras.Create(Self);
    try
     if frmListagemCompras.ShowModal = mrOk then
     begin

     end;
    finally

    end;
end;

procedure TfrmPrincipal.EquipamentosInternos1Click(Sender: TObject);
begin
    frmListagem := TfrmListagem.Create(self);
    try
     if frmListagem.ShowModal = mrOk then
      begin

      end;
    finally
       frmListagem.Free;
    end;
end;

end.
