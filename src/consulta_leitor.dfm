object frmConsultaLeitor: TfrmConsultaLeitor
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Consulta de leitores'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 185
    Height = 16
    Caption = 'Digite o nome a ser pesquisado:'
  end
  object edtNome: TEdit
    Left = 10
    Top = 30
    Width = 400
    Height = 24
    TabOrder = 0
    OnChange = edtNomeChange
  end
  object DBGrid: TDBGrid
    Left = 10
    Top = 60
    Width = 400
    Height = 300
    DataSource = DSLeitores
    TabOrder = 1
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
    TabOrder = 2
    OnClick = btOkClick
    Kind = bkOK
  end
  object btCancelar: TBitBtn
    Left = 320
    Top = 370
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object TBLeitores: TTable
    DatabaseName = 'BIBLIO'
    IndexName = 'INDNOME'
    TableName = 'LEITOR.DB'
    Left = 112
    Top = 208
  end
  object DSLeitores: TDataSource
    DataSet = TBLeitores
    Left = 152
    Top = 208
  end
end
