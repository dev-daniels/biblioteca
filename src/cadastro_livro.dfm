object frmCadastroLivro: TfrmCadastroLivro
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Cadastro de Livros'
  ClientHeight = 292
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PanelDados: TPanel
    Left = 0
    Top = 0
    Width = 610
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
    object DBCodigo: TDBText
      Left = 100
      Top = 10
      Width = 65
      Height = 17
      DataField = 'CODIGO'
      DataSource = DSLivro
    end
    object Label7: TLabel
      Left = 10
      Top = 40
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'T'#237'tulo'
    end
    object Label2: TLabel
      Left = 10
      Top = 70
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Autor'
    end
    object Label3: TLabel
      Left = 10
      Top = 100
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Editora'
    end
    object DBTitulo: TDBEdit
      Left = 100
      Top = 40
      Width = 300
      Height = 24
      DataField = 'TITULO'
      DataSource = DSLivro
      TabOrder = 0
    end
    object DBAutor: TDBEdit
      Left = 100
      Top = 70
      Width = 300
      Height = 24
      DataField = 'AUTOR'
      DataSource = DSLivro
      TabOrder = 1
    end
    object DBEditora: TDBEdit
      Left = 100
      Top = 100
      Width = 300
      Height = 24
      DataField = 'EDITORA'
      DataSource = DSLivro
      TabOrder = 2
    end
    object GridExemplar: TDBGrid
      Left = 10
      Top = 130
      Width = 590
      Height = 80
      DataSource = DSExemplar
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODLIVRO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Title.Caption = 'S'#233'rie'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATACOMPRA'
          Title.Caption = 'Data de Compra'
          Visible = True
        end>
    end
    object btnIncluirExemplar: TButton
      Left = 350
      Top = 215
      Width = 120
      Height = 25
      Caption = 'Incluir exemplar'
      TabOrder = 4
      OnClick = btnIncluirExemplarClick
    end
    object btnExcluirExemplar: TButton
      Left = 480
      Top = 215
      Width = 120
      Height = 25
      Caption = 'Excluir exemplar'
      TabOrder = 5
      OnClick = btnExcluirExemplarClick
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
  object TBLivro: TTable
    DatabaseName = 'BIBLIO'
    TableName = 'LIVRO.DB'
    Left = 448
    Top = 16
  end
  object DSLivro: TDataSource
    DataSet = TBLivro
    Left = 488
    Top = 16
  end
  object TBExemplar: TTable
    Active = True
    BeforeCancel = TBExemplarBeforeCancel
    OnNewRecord = TBExemplarNewRecord
    DatabaseName = 'BIBLIO'
    IndexFieldNames = 'CODLIVRO'
    MasterFields = 'CODIGO'
    MasterSource = DSLivro
    TableName = 'EXEMPLAR.db'
    Left = 448
    Top = 64
  end
  object DSExemplar: TDataSource
    DataSet = TBExemplar
    Left = 488
    Top = 64
  end
end
