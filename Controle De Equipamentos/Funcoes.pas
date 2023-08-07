unit Funcoes;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

  procedure ClearControls(const Controls: array of TWinControl);

implementation

  procedure ClearControls(const Controls: array of TWinControl);
var
  I: Integer;
  Control: TWinControl;
begin
  for I := Low(Controls) to High(Controls) do
  begin
    Control := Controls[I];

    if Control is TEdit then
      TEdit(Control).Clear
    else if Control is TComboBox then
      TComboBox(Control).ItemIndex := -1
    else if Control is TCustomEdit then
      TCustomEdit(Control).Clear
    else if Control is TDateTimePicker then
      TDateTimePicker(Control).Date := now;
    // Adicione outras condições aqui para lidar com outros tipos de controles, se necessário
  end;
end;



end.
