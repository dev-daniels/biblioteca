program biblioteca;

uses
  Forms,
  principal in 'principal.pas' {frmPrincipal},
  cadastro_leitor in 'cadastro_leitor.pas' {frmCadastroLeitor},
  consulta_leitor in 'consulta_leitor.pas' {frmConsultaLeitor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroLeitor, frmCadastroLeitor);
  Application.CreateForm(TfrmConsultaLeitor, frmConsultaLeitor);
  Application.Run;
end.
