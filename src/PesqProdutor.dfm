object frmBuscaProdutor: TfrmBuscaProdutor
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Produtor'
  ClientHeight = 273
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 18
    Height = 13
    Caption = 'cgc'
  end
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 26
    Height = 13
    Caption = 'nome'
  end
  object edtCgc: TEdit
    Left = 16
    Top = 40
    Width = 137
    Height = 21
    MaxLength = 14
    TabOrder = 0
    OnChange = edtCgcChange
    OnKeyPress = edtCgcKeyPress
  end
  object edtNome: TEdit
    Left = 160
    Top = 40
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 45
    TabOrder = 1
    OnChange = edtCgcChange
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 377
    Height = 145
    DataSource = dmConexao.dsoProdutor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CGC_PRODUTOR'
        Title.Caption = 'Cgc'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTOR'
        Title.Caption = 'Nome'
        Width = 228
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 56
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
end
