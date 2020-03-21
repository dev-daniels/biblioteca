unit consulta_leitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, DBTables;

type
  TfrmConsultaLeitor = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid: TDBGrid;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    TBLeitores: TTable;
    DSLeitores: TDataSource;
    procedure edtNomeChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaLeitor: TfrmConsultaLeitor;

implementation

uses principal;

{$R *.dfm}

procedure TfrmConsultaLeitor.edtNomeChange(Sender: TObject);
begin
  TBLeitores.FindNearest([edtNome.Text]);
end;

procedure TfrmConsultaLeitor.btOkClick(Sender: TObject);
begin
  CodLeitor := TBLeitores.FieldByName('CODIGO').AsInteger;
  Close();
end;

procedure TfrmConsultaLeitor.FormShow(Sender: TObject);
begin
  TBLeitores.Open();
end;

procedure TfrmConsultaLeitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TBLeitores.Close();
end;

end.
