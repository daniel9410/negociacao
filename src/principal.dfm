object Form1: TForm1
  Left = 192
  Top = 126
  Width = 928
  Height = 421
  Caption = 'Negocia'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 80
    Top = 72
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Produtor1: TMenuItem
        Caption = 'Produtor'
        OnClick = Produtor1Click
      end
      object Distribuidor1: TMenuItem
        Caption = 'Distribuidor'
        OnClick = Distribuidor1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Negociao1: TMenuItem
        Caption = 'Negocia'#231#227'o'
      end
      object Movimento1: TMenuItem
        Caption = 'Movimento'
      end
    end
    object Relatorio1: TMenuItem
      Caption = 'Relatorio'
      object Relatorio2: TMenuItem
        Caption = 'Relatorio'
      end
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 256
    Top = 136
  end
end