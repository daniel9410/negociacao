object frmBuscaMovimento: TfrmBuscaMovimento
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de movimento'
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
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 216
    Top = 8
    Width = 68
    Height = 13
    Caption = 'nome produtor'
  end
  object Label3: TLabel
    Left = 104
    Top = 8
    Width = 60
    Height = 13
    Caption = 'cgc produtor'
  end
  object Label4: TLabel
    Left = 16
    Top = 56
    Width = 71
    Height = 13
    Caption = 'cgc distribuidor'
  end
  object Label5: TLabel
    Left = 128
    Top = 56
    Width = 79
    Height = 13
    Caption = 'nome distribuidor'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 24
    Width = 81
    Height = 21
    MaxLength = 14
    TabOrder = 0
    OnChange = edtCodigoChange
    OnKeyPress = edtCodigoKeyPress
  end
  object edtNome: TEdit
    Left = 216
    Top = 24
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 45
    TabOrder = 2
    OnChange = edtCodigoChange
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 104
    Width = 377
    Height = 121
    DataSource = dmConexao.dsoMovimento
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'MOVIMENTO_ID'
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC_PRODUTOR'
        Title.Caption = 'Cgc produtor'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTOR'
        Title.Caption = 'Nome produtor'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC_DISTRIBUIDOR'
        Title.Caption = 'cgc Distribuidor'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_DISTRIBUIDOR'
        Title.Caption = 'Nome distribuidor'
        Width = 143
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
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object edtCgc: TEdit
    Left = 104
    Top = 24
    Width = 105
    Height = 21
    TabOrder = 1
    OnChange = edtCodigoChange
    OnKeyPress = edtCodigoKeyPress
  end
  object edtcgcDistribuidor: TEdit
    Left = 16
    Top = 72
    Width = 105
    Height = 21
    TabOrder = 3
    OnChange = edtCodigoChange
    OnKeyPress = edtCodigoKeyPress
  end
  object edtNomeDistribuidor: TEdit
    Left = 128
    Top = 72
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 45
    TabOrder = 4
    OnChange = edtCodigoChange
  end
end
