object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 126
  Width = 820
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpConexao: TGroupBox
    Left = 16
    Top = 24
    Width = 225
    Height = 217
    Caption = 'Conex'#227'o'
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label2: TLabel
      Left = 32
      Top = 64
      Width = 34
      Height = 13
      Caption = 'usuario'
    end
    object Label3: TLabel
      Left = 32
      Top = 112
      Width = 29
      Height = 13
      Caption = 'senha'
    end
    object edtServidor: TEdit
      Left = 32
      Top = 32
      Width = 161
      Height = 21
      TabOrder = 0
      Text = 'servidor'
    end
    object edtusuario: TEdit
      Left = 32
      Top = 80
      Width = 161
      Height = 21
      TabOrder = 1
      Text = 'daniel'
    end
    object edtsenha: TEdit
      Left = 32
      Top = 128
      Width = 161
      Height = 21
      TabOrder = 2
      Text = 'manager'
    end
    object btnok: TButton
      Left = 16
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 3
      OnClick = btnokClick
    end
    object Button2: TButton
      Left = 120
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 96
    object Conexo1: TMenuItem
      Caption = 'Conex'#227'o'
      object Configurar1: TMenuItem
        Caption = 'Configurar'
        OnClick = Configurar1Click
      end
    end
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
        OnClick = Produtos1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Negociao1: TMenuItem
        Caption = 'Negocia'#231#227'o'
        OnClick = Negociao1Click
      end
    end
    object Relatorio1: TMenuItem
      Caption = 'Relatorio'
      object Relatorio2: TMenuItem
        Caption = 'Relatorio'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
