object frmDistribuidor: TfrmDistribuidor
  Left = 196
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de distribuidor'
  ClientHeight = 215
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 112
    Width = 19
    Height = 13
    Caption = 'Cgc'
  end
  object Label2: TLabel
    Left = 153
    Top = 112
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object btnDeletar: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 73
    Caption = 'Deletar'
    TabOrder = 0
    OnClick = btnDeletarClick
  end
  object btnGravar: TButton
    Left = 136
    Top = 8
    Width = 81
    Height = 73
    Caption = 'Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 256
    Top = 8
    Width = 81
    Height = 73
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnPesquisa: TButton
    Left = 376
    Top = 8
    Width = 81
    Height = 73
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = btnPesquisaClick
  end
  object edtCgc: TEdit
    Left = 16
    Top = 128
    Width = 121
    Height = 21
    MaxLength = 14
    TabOrder = 4
    OnKeyDown = edtCgcKeyDown
    OnKeyPress = edtCgcKeyPress
  end
  object edtNome: TEdit
    Left = 152
    Top = 128
    Width = 289
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 45
    TabOrder = 5
  end
end
