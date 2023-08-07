unit frame.Pesquisa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, View.Pesquisas;

type
  TfrmPesquisaEdt = class(TFrame)
    Label1: TLabel;
    cbloja: TComboBox;
    Label10: TLabel;
    cbTipo: TComboBox;
    Label5: TLabel;
    dtIni: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label6: TLabel;
    Label2: TLabel;
    btnPesquisaEv: TSpeedButton;
    edtCod: TEdit;
    procedure btnPesquisaEvClick(Sender: TObject);
  private
    { Private declarations }
  public
    var tabela : string;
  end;

implementation

{$R *.dfm}

procedure TfrmPesquisaEdt.btnPesquisaEvClick(Sender: TObject);
begin
      frmPesquisa := TfrmPesquisa.Create(self);
      try
          frmPesquisa.tabela := tabela;
        if frmPesquisa.ShowModal = mrOk then
        begin

        end;
      finally
         frmPesquisa.Free;
      end;


end;

end.
