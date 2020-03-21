unit cadastro_leitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, StdCtrls, DBCtrls, Mask, Math;

type
  TfrmCadastroLeitor = class(TForm)
    TBLeitor: TTable;
    DSLeitor: TDataSource;
    PanelDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBCodigo: TDBText;
    DBNome: TDBEdit;
    DBEndereco: TDBEdit;
    DBTelefone: TDBEdit;
    DBNascimento: TDBEdit;
    DBCpf: TDBEdit;
    DBEstadoCivil: TDBRadioGroup;
    DBAtivo: TDBCheckBox;
    DBEscolaridade: TDBComboBox;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btConfirmar: TButton;
    btCancelar: TButton;
    btSair: TButton;
    TBLeitorCODIGO: TAutoIncField;
    TBLeitorNOME: TStringField;
    TBLeitorENDERECO: TStringField;
    TBLeitorTELEFONE: TStringField;
    TBLeitorCPF: TStringField;
    TBLeitorNASCIMENTO: TDateField;
    TBLeitorESTADOCIVIL: TStringField;
    TBLeitorATIVO: TBooleanField;
    TBLeitorESCOLARIDADE: TStringField;
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    procedure ControlaBotoes(Ativa : Boolean);
    function EstaCorreto:Boolean;
    function ValidarCpf(pCPF : string):Boolean;
  public

  end;

var
  frmCadastroLeitor: TfrmCadastroLeitor;

implementation

uses principal, consulta_leitor;

{$R *.dfm}

procedure TfrmCadastroLeitor.ControlaBotoes(Ativa: Boolean);
begin
  btIncluir.Enabled := Ativa;
  btAlterar.Enabled := Ativa;
  btExcluir.Enabled := Ativa;

  btConfirmar.Enabled := not Ativa;
  btCancelar.Enabled := not Ativa;
  DSLeitor.Enabled := not Ativa;
end;

procedure TfrmCadastroLeitor.btIncluirClick(Sender: TObject);
begin
  TBLeitor.Append();
  DBNome.SetFocus();
  ControlaBotoes(False);
end;

procedure TfrmCadastroLeitor.btAlterarClick(Sender: TObject);
begin
  if TBLeitor.RecordCount = 0 then
    Exit;

  CodLeitor := -1;

  frmConsultaLeitor.ShowModal();

  if CodLeitor > 0 then
  begin
    TBLeitor.FindKey([CodLeitor]);
    TBLeitor.Edit();
    DBNome.SetFocus();
    ControlaBotoes(False);
  end;
end;

procedure TfrmCadastroLeitor.btExcluirClick(Sender: TObject);
begin
  if TBLeitor.RecordCount = 0 then
    Exit;

  CodLeitor := -1;

  frmConsultaLeitor.ShowModal();

  if CodLeitor > 0 then
  begin
    PanelDados.Enabled := False;
    ControlaBotoes(False);
  end;
end;

procedure TfrmCadastroLeitor.btConfirmarClick(Sender: TObject);
begin
  if (TBLeitor.State = dsInsert) or (TBLeitor.State = dsEdit) then
  begin
    if EstaCorreto() then
    begin
      TBLeitor.Post();
      ControlaBotoes(True);
    end;
  end
  else
  begin
    TBLeitor.Delete();
    PanelDados.Enabled := True;
    ControlaBotoes(True);
  end;
end;

procedure TfrmCadastroLeitor.btCancelarClick(Sender: TObject);
begin
  if (TBLeitor.State = dsInsert) or (TBLeitor.State = dsEdit) then
    TBLeitor.Cancel()
  else
    PanelDados.Enabled := True;

  ControlaBotoes(True);
end;

procedure TfrmCadastroLeitor.FormCreate(Sender: TObject);
begin
  TBLeitor.Open();
end;

procedure TfrmCadastroLeitor.btSairClick(Sender: TObject);
begin
  Close();
end;

function TfrmCadastroLeitor.EstaCorreto: Boolean;
begin
  Result := True;

  if TBLeitor.FieldByName('NOME').AsString = '' then
  begin
    ShowMessage('O nome não pode ficar em branco.');
    DBNome.SetFocus();
    Result := False;
  end;

  if TBLeitor.FieldByName('NASCIMENTO').AsDateTime > Date() then
  begin
    ShowMessage('Data inválida.');
    DBNascimento.SetFocus();
    Result := False;
  end;

  if not ValidarCpf(TBLeitor.FieldByName('CPF').AsString) then
  begin
    ShowMessage('CPF inválido.');
    DBCPF.SetFocus();
    Result := False;
  end;
end;

function TfrmCadastroLeitor.ValidarCpf(pCPF: string): Boolean;
var
  v: array[0..1] of Word;
  cpf: array[0..10] of Byte;
  I: Byte;
begin
  try
    for I := 1 to 11 do
      cpf[i-1] := StrToInt(pCPF[i]);

    v[0] := 10*cpf[0] + 9*cpf[1] + 8*cpf[2];
    v[0] := v[0] + 7*cpf[3] + 6*cpf[4] + 5*cpf[5];
    v[0] := v[0] + 4*cpf[6] + 3*cpf[7] + 2*cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);

    v[1] := 11*cpf[0] + 10*cpf[1] + 9*cpf[2];
    v[1] := v[1] + 8*cpf[3] +  7*cpf[4] + 6*cpf[5];
    v[1] := v[1] + 5*cpf[6] +  4*cpf[7] + 3*cpf[8];
    v[1] := v[1] + 2*v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);

    Result :=  ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except on E: Exception do
    Result := False;
  end;
end;

end.
