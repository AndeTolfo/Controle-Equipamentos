unit View.Listagem.Compras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, DATAMODULE, Datasnap.DBClient,System.StrUtils, frame.Pesquisa2,
  frame.Buttons, Vcl.StdCtrls,DateUtils;

type
  TfrmListagemCompras = class(TForm)
    pnlContainer: TPanel;
    pnlRodape: TPanel;
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    dbListagem: TDBGrid;
    dsCompras: TDataSource;
    cdsCompras: TClientDataSet;
    cdsComprascod_compra: TIntegerField;
    cdsComprasdata_compra: TDateField;
    cdsComprasnote_item: TStringField;
    cdsComprasloja_compra: TStringField;
    cdsComprasN_pedido: TStringField;
    cdsComprasnome_comprador: TStringField;
    cdsComprasvalor_item: TFloatField;
    cdsComprasorigem_compra: TStringField;
    cdsComprasqtd_comprada: TFloatField;
    cdsComprastotal: TFloatField;
    frmPesquisaEdt1: TfrmPesquisaEdt;
    frmButtons1: TfrmButtons;
    Label2: TLabel;
    edtcomprador: TEdit;
    procedure FormShow(Sender: TObject);
    procedure frmPesquisaEdt1btnPesquisaEvClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frmPesquisaEdt1edtCodChange(Sender: TObject);
    procedure frmButtons1btnAtualizarClick(Sender: TObject);
    procedure frmButtons1btnSairClick(Sender: TObject);

  private
   procedure CarregarDados;
   var FSelectedCodes : TStringList;
   var where : string;

  public
    { Public declarations }
  end;

var
  frmListagemCompras: TfrmListagemCompras;

implementation

{$R *.dfm}

uses View.Pesquisas;

procedure TfrmListagemCompras.CarregarDados;
begin
  // Copiar os dados do TQuery para o CDS
  dm.ReadRelCompras.DisableControls; // Desativar a atualiza��o visual temporariamente
  try
    dm.ReadRelCompras.First;
    while not dm.ReadRelCompras.Eof do
    begin
      cdsCompras.Append;
      cdsCompras.FieldByName('COD_Compra').AsInteger := dm.ReadRelCompras.FieldByName('COD_Compra').AsInteger;
      cdsCompras.FieldByName('DATA_COMPRA').AsDateTime := dm.ReadRelCompras.FieldByName('DATA_COMPRA').AsDateTime;
      cdsCompras.FieldByName('NOME_ITEM').AsString := dm.ReadRelCompras.FieldByName('NOME_ITEM').AsString;
      cdsCompras.FieldByName('LOJA_COMPRA').AsString := dm.ReadRelCompras.FieldByName('LOJA_COMPRA').AsString;
      cdsCompras.FieldByName('N_PEDIDO').AsString := dm.ReadRelCompras.FieldByName('N_PEDIDO').AsString;
      cdsCompras.FieldByName('NOME_COMPRADOR').AsString := dm.ReadRelCompras.FieldByName('NOME_COMPRADOR').AsString;
      cdsCompras.FieldByName('VALOR_ITEM').AsFloat := dm.ReadRelCompras.FieldByName('VALOR_ITEM').AsFloat;
      cdsCompras.FieldByName('ORIGEM_COMPRA').AsString := dm.ReadRelCompras.FieldByName('ORIGEM_COMPRA').AsString;
      cdsCompras.FieldByName('QTD_COMPRADA').AsFloat := dm.ReadRelCompras.FieldByName('QTD_COMPRADA').AsFloat;
      cdsCompras.FieldByName('TOTAL').AsFloat := dm.ReadRelCompras.FieldByName('TOTAL').AsFloat;
      cdsCompras.Post;
      dm.ReadRelCompras.Next;
    end;
  finally
    dm.ReadRelCompras.EnableControls; // Reativar a atualiza��o visual
  end;
end;



procedure TfrmListagemCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FSelectedCodes.Free;
end;

procedure TfrmListagemCompras.FormShow(Sender: TObject);
begin
  FSelectedCodes := TStringList.Create;
  frmPesquisaEdt1.dtIni.Date := StartOfTheMonth(Date);
  frmPesquisaEdt1.dtFim.Date := EndOfTheMonth(Date);
  frmButtons1btnAtualizarClick(frmListagemCompras);
end;

procedure TfrmListagemCompras.frmButtons1btnAtualizarClick(Sender: TObject);
var dataini,datafim : Tdate;
loja, origem : string;
begin
 where := '';
  case frmPesquisaEdt1.cbTipo.ItemIndex of
      0: origem := 'I';//internet
      1: origem := 'P'; //presencial
    end;

  if origem <> '' then
  begin
    if where <> '' then
    begin
      where := where + ' AND ';
      where := where + 'C.origem_compra = ' + QuotedStr(origem);
    end
    else
    begin
      where := where + 'WHERE C.origem_compra = ' + QuotedStr(origem);
    end;
  end;



  if frmPesquisaEdt1.edtCod.Text <> '' then
  begin
    if where <> '' then
    begin
      where := where + ' AND ';
      where := where + 'C.cod_compra IN (' + frmPesquisaEdt1.edtCod.Text + ')';
    end
    else if where = '' then
    begin
      where := where + 'WHERE C.cod_compra IN (' + frmPesquisaEdt1.edtCod.Text + ')';
    end;
  end;

  if edtcomprador.Text <> '' then
  begin
    if where <> '' then
    begin
      where := where + ' AND ';
      where := where + 'UPPER(c.nome_comprador) LIKE ' + QuotedStr('%' + UpperCase(edtcomprador.Text) + '%');
    end
    else if where = '' then
    begin
      where := where + ' WHERE UPPER(c.nome_comprador) LIKE ' + QuotedStr('%' + UpperCase(edtcomprador.Text) + '%');
    end;
  end;

    if (frmPesquisaEdt1.dtIni.Date <> 0) and (frmPesquisaEdt1.dtFim.Date <> 0) then
    begin
       DataIni := frmPesquisaEdt1.dtIni.Date;
       DataFim := frmPesquisaEdt1.dtFim.Date;
     if Where <> '' then
      begin
        Where := Where + ' AND ';
        Where := Where + 'C.data_compra >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataIni)) +
         ' AND C.data_compra <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataFim));
      end
      else if where = '' then
      begin
         Where := Where + 'where C.data_compra >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataIni)) +
         ' AND C.data_compra <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataFim));
      end;
    end;


  cdsCompras.EmptyDataSet; // Limpar os registros existentes
  DM.ReadRelCompras.SQL.Clear;
  DM.ReadRelCompras.SQL.Add('SELECT * FROM Compras c ' + where);
  DM.ReadRelCompras.Open;
  CarregarDados; // Carregar os dados filtrados no TClientDataSet
  DM.ReadRelCompras.Close;
end;

procedure TfrmListagemCompras.frmButtons1btnSairClick(Sender: TObject);
begin
    close;
end;

procedure TfrmListagemCompras.frmPesquisaEdt1btnPesquisaEvClick(
  Sender: TObject);
  var codselect : integer;
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

procedure TfrmListagemCompras.frmPesquisaEdt1edtCodChange(Sender: TObject);
var
    CodEvento: Integer;
  begin
    if TryStrToInt(frmPesquisaEdt1.edtCod.Text, CodEvento) then
    begin
      if FSelectedCodes.IndexOf(IntToStr(CodEvento)) = -1 then
      begin
        // Adicionar o c�digo na lista
        FSelectedCodes.Add(IntToStr(CodEvento));
      end;
    end
    else
    begin
      // Remover todos os itens da lista
      FSelectedCodes.Clear;

      // Percorrer o campo edtCodEvento para adicionar os c�digos novamente na lista
      if frmPesquisaEdt1.edtCod.Text <> '' then
      begin
        // Separar os c�digos por v�rgula
        FSelectedCodes.Delimiter := ',';
        FSelectedCodes.StrictDelimiter := True;
        FSelectedCodes.DelimitedText := frmPesquisaEdt1.edtCod.Text;
      end;
    end;
  end;

end.
