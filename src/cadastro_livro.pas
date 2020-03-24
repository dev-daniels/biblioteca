unit cadastro_livro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, ExtCtrls, Mask, Grids, DBGrids;

type
  TfrmCadastroLivro = class(TForm)
    PanelDados: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btConfirmar: TButton;
    btCancelar: TButton;
    btSair: TButton;
    TBLivro: TTable;
    DSLivro: TDataSource;
    Label1: TLabel;
    DBCodigo: TDBText;
    Label7: TLabel;
    DBTitulo: TDBEdit;
    Label2: TLabel;
    DBAutor: TDBEdit;
    Label3: TLabel;
    DBEditora: TDBEdit;
    TBExemplar: TTable;
    DSExemplar: TDataSource;
    GridExemplar: TDBGrid;
    btnIncluirExemplar: TButton;
    btnExcluirExemplar: TButton;
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnIncluirExemplarClick(Sender: TObject);
    procedure btnExcluirExemplarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure TBExemplarNewRecord(DataSet: TDataSet);
    procedure TBExemplarBeforeCancel(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
  private
    procedure ControlaBotoes(Ativa : Boolean);
  public

  end;

var
  frmCadastroLivro: TfrmCadastroLivro;
  Opcao : string;
  Codigo : Integer;
  NumeroSerie : Integer;

implementation

uses consulta_livro;

{$R *.dfm}

procedure TfrmCadastroLivro.btIncluirClick(Sender: TObject);
begin
  Opcao := 'I';
  TBLivro.Append();
  NumeroSerie := 0;
  DBTitulo.SetFocus();
  ControlaBotoes(False);
end;

procedure TfrmCadastroLivro.ControlaBotoes(Ativa: Boolean);
begin
  btIncluir.Enabled := Ativa;
  btAlterar.Enabled := Ativa;
  btExcluir.Enabled := Ativa;

  btConfirmar.Enabled := not Ativa;
  btCancelar.Enabled := not Ativa;
  DSLivro.Enabled := not Ativa;
end;

procedure TfrmCadastroLivro.btAlterarClick(Sender: TObject);
begin
  Codigo := -1;
  frmConsultaLivro.ShowModal();

  if Codigo > 0 then
  begin
    Opcao := 'A';
    ControlaBotoes(False);
    TBLivro.FindKey([Codigo]);
    TBLivro.Edit();
    DBTitulo.SetFocus();

    if TBExemplar.RecordCount > 0 then
    begin
      TBExemplar.Last();
      NumeroSerie := TBExemplar.FieldByName('SERIE').AsInteger;
    end
    else
    begin
      NumeroSerie := 0;
    end;
  end;
end;

procedure TfrmCadastroLivro.btConfirmarClick(Sender: TObject);
begin
  if ((Opcao = 'I') or (Opcao = 'A')) and
    ((TBLivro.State = dsInsert) or (TBLivro.State = dsEdit)) then
  begin
    TBLivro.Post();
  end
  else if Opcao = 'E' then
  begin
    while not TBExemplar.Eof do
    begin
      TBExemplar.Delete();
    end;

    TBLivro.Delete();
  end;

  ControlaBotoes(True);
end;

procedure TfrmCadastroLivro.btCancelarClick(Sender: TObject);
begin
  if Opcao = 'I' then
  begin
    TBExemplar.Last();

    while not TBExemplar.Eof do
    begin
      TBExemplar.Delete();
    end;
  end;

  TBLivro.Cancel();
  ControlaBotoes(True);
end;

procedure TfrmCadastroLivro.btnIncluirExemplarClick(Sender: TObject);
begin
  TBExemplar.Append();
  TBExemplar.FieldByName('datacompra').AsDateTime := Now();
  GridExemplar.SetFocus();
end;

procedure TfrmCadastroLivro.btnExcluirExemplarClick(Sender: TObject);
begin
  TBExemplar.Delete();
end;

procedure TfrmCadastroLivro.btExcluirClick(Sender: TObject);
begin
  if TBLivro.RecordCount = 0 then
    Exit;

  Codigo := -1;

  frmConsultaLivro.ShowModal();

  if Codigo > 0 then
  begin
    Opcao := 'E';
    PanelDados.Enabled := False;
    ControlaBotoes(False);
  end;
end;

procedure TfrmCadastroLivro.TBExemplarNewRecord(DataSet: TDataSet);
begin
  NumeroSerie := NumeroSerie + 1;
  TBExemplar.FieldByName('SERIE').AsInteger := NumeroSerie;
end;

procedure TfrmCadastroLivro.TBExemplarBeforeCancel(DataSet: TDataSet);
begin
  if TBExemplar.State = dsInsert then
  begin
    NumeroSerie := NumeroSerie - 1;
  end;
end;

procedure TfrmCadastroLivro.FormShow(Sender: TObject);
begin
  TBLivro.Open();
  TBExemplar.Open();
end;

procedure TfrmCadastroLivro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TBLivro.Close();
  TBExemplar.Close();
end;

procedure TfrmCadastroLivro.btSairClick(Sender: TObject);
begin
  Close();
end;

end.
