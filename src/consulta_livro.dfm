object frmConsultaLivro: TfrmConsultaLivro
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Consulta de livros'
  ClientHeight = 406
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 227
    Height = 16
    Caption = 'Digite o t'#237'tulo do livro a ser pesquisado:'
  end
  object edtTitulo: TEdit
    Left = 10
    Top = 30
    Width = 300
    Height = 24
    TabOrder = 0
  end
  object DBGrid: TDBGrid
    Left = 10
    Top = 60
    Width = 400
    Height = 300
    DataSource = DSLeitores
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btOk: TBitBtn
    Left = 220
    Top = 370
    Width = 90
    Height = 25
    TabOrder = 3
    OnClick = btOkClick
    Kind = bkOK
  end
  object btCancelar: TBitBtn
    Left = 320
    Top = 370
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  object btnPesquisar: TBitBtn
    Left = 320
    Top = 30
    Width = 90
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
  object DSLeitores: TDataSource
    DataSet = qryLivro
    Left = 152
    Top = 208
  end
  object qryLivro: TQuery
    DatabaseName = 'BIBLIO'
    SQL.Strings = (
      'SELECT *'
      '   FROM LIVRO'
      'WHERE TITULO LIKE :P_TITULO')
    Left = 112
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_TITULO'
        ParamType = ptUnknown
      end>
  end
end
