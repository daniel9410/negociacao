object frmProdutor: TfrmProdutor
  Left = 196
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de produtor'
  ClientHeight = 334
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
  object Label3: TLabel
    Left = 16
    Top = 168
    Width = 72
    Height = 13
    Caption = 'Cgc distribuidor'
  end
  object Label4: TLabel
    Left = 307
    Top = 168
    Width = 24
    Height = 13
    Caption = 'Valor'
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 208
    Width = 409
    Height = 113
    DataSource = dmConexao.dsoProdutorLimite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CGC_DISTRIBUIDOR'
        Title.Caption = 'Cgc Distribuidor'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_DISTRIBUIDOR'
        Title.Caption = 'Distribuidor'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_LIMITE'
        Title.Caption = 'Valor'
        Width = 83
        Visible = True
      end>
  end
  object edtcgcDistribuidor: TEdit
    Left = 16
    Top = 184
    Width = 121
    Height = 21
    Color = clBtnFace
    MaxLength = 14
    ReadOnly = True
    TabOrder = 7
  end
  object edtValor: TEdit
    Left = 307
    Top = 184
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 8
    OnKeyPress = edtValorKeyPress
  end
  object btnInserir: TButton
    Left = 440
    Top = 208
    Width = 51
    Height = 25
    Caption = 'Inserir'
    TabOrder = 9
    OnClick = btnInserirClick
  end
  object btnExcluir: TButton
    Left = 440
    Top = 240
    Width = 51
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btnExcluirClick
  end
  object btnPesqDistribuidor: TButton
    Left = 141
    Top = 184
    Width = 25
    Height = 20
    Caption = '...'
    TabOrder = 11
    OnClick = btnPesqDistribuidorClick
  end
  object edtNomeDistribuidor: TEdit
    Left = 168
    Top = 184
    Width = 137
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
end
