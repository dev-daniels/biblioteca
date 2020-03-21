unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Leitor1: TMenuItem;
    LivroExemplar1: TMenuItem;
    Controle1: TMenuItem;
    EmprstimoDevoluo1: TMenuItem;
    Consultas1: TMenuItem;
    Leitores1: TMenuItem;
    Livros1: TMenuItem;
    Relatrios1: TMenuItem;
    N1: TMenuItem;
    procedure Leitor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  CodLeitor : Integer;

implementation

uses cadastro_leitor;

{$R *.dfm}

procedure TfrmPrincipal.Leitor1Click(Sender: TObject);
begin
  frmCadastroLeitor.ShowModal();
end;

end.
