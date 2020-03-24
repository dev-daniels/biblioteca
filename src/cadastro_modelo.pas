unit cadastro_modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, ExtCtrls, Mask;

type
  TfrmCadastroModelo = class(TForm)
    PanelDados: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btConfirmar: TButton;
    btCancelar: TButton;
    btSair: TButton;
    TBRegistro: TTable;
    DSRegistro: TDataSource;
  private
    procedure ControlaBotoes(Ativa : Boolean);
  public

  end;

var
  frmCadastroModelo: TfrmCadastroModelo;

implementation

{$R *.dfm}

procedure TfrmCadastroModelo.ControlaBotoes(Ativa: Boolean);
begin
  btIncluir.Enabled := Ativa;
  btAlterar.Enabled := Ativa;
  btExcluir.Enabled := Ativa;

  btConfirmar.Enabled := not Ativa;
  btCancelar.Enabled := not Ativa;
  DSRegistro.Enabled := not Ativa;
end;

end.
