object frmCadastroLeitor: TfrmCadastroLeitor
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Cadastro de leitores'
  ClientHeight = 296
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PanelDados: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 250
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 10
      Top = 70
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Endere'#231'o'
    end
    object Label3: TLabel
      Left = 10
      Top = 100
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Telefone'
    end
    object Label4: TLabel
      Left = 10
      Top = 130
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nascimento'
    end
    object Label5: TLabel
      Left = 10
      Top = 160
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CPF'
    end
    object Label6: TLabel
      Left = 10
      Top = 190
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Escolaridade'
    end
    object Label7: TLabel
      Left = 10
      Top = 40
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome'
    end
    object DBCodigo: TDBText
      Left = 100
      Top = 10
      Width = 65
      Height = 17
      DataField = 'CODIGO'
      DataSource = DSLeitor
    end
    object DBNome: TDBEdit
      Left = 100
      Top = 40
      Width = 500
      Height = 24
      DataField = 'NOME'
      DataSource = DSLeitor
      TabOrder = 0
    end
    object DBEndereco: TDBEdit
      Left = 100
      Top = 70
      Width = 500
      Height = 24
      DataField = 'ENDERECO'
      DataSource = DSLeitor
      TabOrder = 1
    end
    object DBTelefone: TDBEdit
      Left = 100
      Top = 100
      Width = 200
      Height = 24
      DataField = 'TELEFONE'
      DataSource = DSLeitor
      TabOrder = 2
    end
    object DBNascimento: TDBEdit
      Left = 100
      Top = 130
      Width = 200
      Height = 24
      DataField = 'NASCIMENTO'
      DataSource = DSLeitor
      TabOrder = 3
    end
    object DBCpf: TDBEdit
      Left = 100
      Top = 160
      Width = 200
      Height = 24
      DataField = 'CPF'
      DataSource = DSLeitor
      TabOrder = 4
    end
    object DBEstadoCivil: TDBRadioGroup
      Left = 310
      Top = 100
      Width = 200
      Height = 100
      Caption = 'Estado civil'
      DataField = 'ESTADOCIVIL'
      DataSource = DSLeitor
      Items.Strings = (
        'Solteiro'
        'Casado'
        'Desquitado'
        'Outros')
      TabOrder = 7
      TabStop = True
      Values.Strings = (
        'S'
        'C'
        'D'
        'O')
    end
    object DBAtivo: TDBCheckBox
      Left = 100
      Top = 220
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = DSLeitor
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEscolaridade: TDBComboBox
      Left = 100
      Top = 190
      Width = 200
      Height = 24
      DataField = 'ESCOLARIDADE'
      DataSource = DSLeitor
      ItemHeight = 16
      Items.Strings = (
        'Nenhuma'
        'Ginasial completo'
        '1'#186' grau completo'
        '2'#186' grau completo'
        '3'#186' grau completo'
        'Outra')
      TabOrder = 5
    end
  end
  object btIncluir: TButton
    Left = 10
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btIncluirClick
  end
  object btAlterar: TButton
    Left = 110
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btAlterarClick
  end
  object btExcluir: TButton
    Left = 210
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btExcluirClick
  end
  object btConfirmar: TButton
    Left = 310
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = btConfirmarClick
  end
  object btCancelar: TButton
    Left = 410
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btCancelarClick
  end
  object btSair: TButton
    Left = 510
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btSairClick
  end
  object TBLeitor: TTable
    DatabaseName = 'BIBLIO'
    TableName = 'LEITOR.DB'
    Left = 416
    Top = 120
    object TBLeitorCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object TBLeitorNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TBLeitorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TBLeitorTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object TBLeitorCPF: TStringField
      FieldName = 'CPF'
      EditMask = '000\.000\.000\-00;0; '
    end
    object TBLeitorNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
    end
    object TBLeitorESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 1
    end
    object TBLeitorATIVO: TBooleanField
      FieldName = 'ATIVO'
    end
    object TBLeitorESCOLARIDADE: TStringField
      FieldName = 'ESCOLARIDADE'
    end
  end
  object DSLeitor: TDataSource
    DataSet = TBLeitor
    Left = 456
    Top = 120
  end
end
