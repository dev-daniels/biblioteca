object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 114
  Width = 928
  Height = 421
  Caption = 'Controle de biblioteca'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 48
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Leitor1: TMenuItem
        Caption = 'Leitor'
        OnClick = Leitor1Click
      end
      object LivroExemplar1: TMenuItem
        Caption = 'Livro \ Exemplar'
      end
    end
    object Controle1: TMenuItem
      Caption = 'Controle'
      object EmprstimoDevoluo1: TMenuItem
        Caption = 'Empr'#233'stimo \ Devolu'#231#227'o'
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Leitores1: TMenuItem
        Caption = 'Leitores'
      end
      object Livros1: TMenuItem
        Caption = 'Livros'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object N1: TMenuItem
        Caption = '...'
      end
    end
  end
end
