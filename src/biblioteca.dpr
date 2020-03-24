program biblioteca;

uses
  Forms,
  principal in 'principal.pas' {frmPrincipal},
  cadastro_leitor in 'cadastro_leitor.pas' {frmCadastroLeitor},
  consulta_leitor in 'consulta_leitor.pas' {frmConsultaLeitor},
  cadastro_modelo in 'cadastro_modelo.pas' {frmCadastroModelo},
  cadastro_livro in 'cadastro_livro.pas' {frmCadastroLivro},
  consulta_livro in 'consulta_livro.pas' {frmConsultaLivro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroLeitor, frmCadastroLeitor);
  Application.CreateForm(TfrmConsultaLeitor, frmConsultaLeitor);
  Application.CreateForm(TfrmCadastroModelo, frmCadastroModelo);
  Application.CreateForm(TfrmCadastroLivro, frmCadastroLivro);
  Application.CreateForm(TfrmConsultaLivro, frmConsultaLivro);
  Application.Run;
end.
