object frmCadastroModelo: TfrmCadastroModelo
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  ClientHeight = 292
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDados: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 250
    Align = alTop
    TabOrder = 0
  end
  object btIncluir: TButton
    Left = 10
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
  end
  object btAlterar: TButton
    Left = 110
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
  end
  object btExcluir: TButton
    Left = 210
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
  end
  object btConfirmar: TButton
    Left = 310
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
  end
  object btCancelar: TButton
    Left = 410
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object btSair: TButton
    Left = 510
    Top = 260
    Width = 90
    Height = 25
    Caption = 'Sair'
    TabOrder = 6
  end
  object TBRegistro: TTable
    DatabaseName = 'BIBLIO'
    Left = 416
    Top = 120
  end
  object DSRegistro: TDataSource
    DataSet = TBRegistro
    Left = 456
    Top = 120
  end
end
