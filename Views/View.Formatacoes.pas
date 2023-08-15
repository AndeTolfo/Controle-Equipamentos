unit View.Formatacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, View.Pesquisas;

type
  TfrmFormatacoes = class(TForm)
    pnlContainer: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlCentro: TPanel;
    Label1: TLabel;
    dblistagem: TDBGrid;
    ReadFormat: TDataSource;
    WriteFormat: TDataSource;
    Label2: TLabel;
    dtFormat: TDateTimePicker;
    pnlConfirmar: TPanel;
    pnlSair: TPanel;
    Label3: TLabel;
    edtCodFunc: TEdit;
    edtNomeFunc: TEdit;
    btnPesquisaFuncionario: TSpeedButton;
    procedure pnlConfirmarMouseEnter(Sender: TObject);
    procedure pnlConfirmarMouseLeave(Sender: TObject);
    procedure pnlSairMouseLeave(Sender: TObject);
    procedure pnlSairMouseEnter(Sender: TObject);
    procedure pnlSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlConfirmarClick(Sender: TObject);
    procedure btnPesquisaFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
     procedure SetBackgruondBotoes(iPanel: TPanel; iColor: TColor);
    var codMaquina : integer;
  end;

var
  frmFormatacoes: TfrmFormatacoes;

implementation

{$R *.dfm}

uses DATAMODULE;

procedure TfrmFormatacoes.btnPesquisaFuncionarioClick(Sender: TObject);
begin
frmPesquisa := TfrmPesquisa.Create(Self);
    try
    frmPesquisa.tabela := 'FuncionariosRelFormat';
    if frmPesquisa.ShowModal = mrOk then
    begin

    end;
    finally
      frmPesquisa.Free;
    end;

end;

procedure TfrmFormatacoes.FormShow(Sender: TObject);
begin
    DM.ReadFormat.SQL.Clear;
    DM.ReadFormat.SQL.Add('SELECT * FROM hist_formatacao H WHERE H.cod_maquina = :pCodMaq');
    DM.ReadFormat.ParamByName('pCodMaq').AsInteger := codMaquina;
    DM.ReadFormat.Open;
    dtFormat.Date := Date;
end;

procedure TfrmFormatacoes.pnlConfirmarClick(Sender: TObject);
begin
    if dtFormat.Date <> null then
    begin
       DM.WriteFormat.SQL.Clear;
       DM.WriteFormat.SQL.Add('INSERT INTO HIST_FORMATACAO (COD_MAQUINA, COD_FUNCIONARIO, DT_FORMAT)');
       DM.WriteFormat.SQL.Add('VALUES(:pCodMaq, :pCodFunc, :pDtFormat)');
       DM.WriteFormat.ParamByName('pCodMaq').AsInteger := codMaquina;
       DM.WriteFormat.ParamByName('pCodFunc').AsInteger := StrToInt(edtcodfunc.Text);
       DM.WriteFormat.ParamByName('pDtFormat').AsDateTime := dtFormat.DateTime;
       DM.WriteFormat.ExecSQL;
       DM.WriteFormat.Close;
       DM.ReadFormat.Refresh;
    end;

end;

procedure TfrmFormatacoes.pnlConfirmarMouseEnter(Sender: TObject);
begin
    SetBackgruondBotoes(pnlConfirmar, clBtnHighlight);
end;


procedure TfrmFormatacoes.SetBackgruondBotoes(iPanel: TPanel; iColor: TColor);
begin
  iPanel.Color := iColor;
end;

procedure TfrmFormatacoes.pnlConfirmarMouseLeave(Sender: TObject);
begin
  SetBackgruondBotoes(pnlConfirmar, clBtnFace);
end;

procedure TfrmFormatacoes.pnlSairClick(Sender: TObject);
begin
    close;
end;

procedure TfrmFormatacoes.pnlSairMouseEnter(Sender: TObject);
begin
    SetBackgruondBotoes(pnlSair, clBtnHighlight);
end;

procedure TfrmFormatacoes.pnlSairMouseLeave(Sender: TObject);
begin
    SetBackgruondBotoes(pnlSair, clBtnFace);
end;

end.
