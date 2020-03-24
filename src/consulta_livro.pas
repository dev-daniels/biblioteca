unit consulta_livro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmConsultaLivro = class(TForm)
    Label1: TLabel;
    edtTitulo: TEdit;
    DBGrid: TDBGrid;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    DSLeitores: TDataSource;
    qryLivro: TQuery;
    btnPesquisar: TBitBtn;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaLivro: TfrmConsultaLivro;

implementation

uses cadastro_livro;

{$R *.dfm}

procedure TfrmConsultaLivro.btnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  qryLivro.Close();
  qryLivro.ParamByName('P_TITULO').AsString := '%' + edtTitulo.Text + '%';
  qryLivro.Open();
  Screen.Cursor := crDefault;
end;

procedure TfrmConsultaLivro.FormShow(Sender: TObject);
begin
  edtTitulo.Clear();
  edtTitulo.SetFocus();
end;

procedure TfrmConsultaLivro.btOkClick(Sender: TObject);
begin
  if not qryLivro.IsEmpty then
  begin
    Codigo := qryLivro.FieldByName('CODIGO').AsInteger;
    Close();
  end;
end;

end.
