object frmMovimento: TfrmMovimento
  Left = 198
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimentacao de produtos'
  ClientHeight = 360
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
    Left = 152
    Top = 112
    Width = 40
    Height = 13
    Caption = 'Produtor'
  end
  object Label2: TLabel
    Left = 289
    Top = 112
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 152
    Top = 152
    Width = 52
    Height = 13
    Caption = 'Distribuidor'
  end
  object Label4: TLabel
    Left = 368
    Top = 192
    Width = 55
    Height = 13
    Caption = 'Quantidade'
  end
  object Label5: TLabel
    Left = 16
    Top = 190
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object Label6: TLabel
    Left = 16
    Top = 112
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label7: TLabel
    Left = 312
    Top = 192
    Width = 28
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label8: TLabel
    Left = 16
    Top = 152
    Width = 30
    Height = 13
    Caption = 'Status'
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
    Left = 152
    Top = 128
    Width = 113
    Height = 21
    Color = clBtnFace
    MaxLength = 14
    TabOrder = 5
    OnKeyPress = edtCgcKeyPress
  end
  object edtNome: TEdit
    Left = 288
    Top = 128
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 45
    ReadOnly = True
    TabOrder = 6
  end
  object a: TDBGrid
    Left = 16
    Top = 232
    Width = 409
    Height = 113
    DataSource = dmConexao.dsoItens_Movimento
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'produto_id'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_produto'
        Title.Caption = 'Produto'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Pre'#231'o'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 53
        Visible = True
      end>
  end
  object edtcgcDistribuidor: TEdit
    Left = 152
    Top = 168
    Width = 113
    Height = 21
    Color = clBtnFace
    MaxLength = 14
    ReadOnly = True
    TabOrder = 8
  end
  object edtValor: TEdit
    Left = 368
    Top = 206
    Width = 60
    Height = 21
    MaxLength = 15
    TabOrder = 9
    OnKeyPress = edtValorKeyPress
  end
  object btnInserir: TButton
    Left = 440
    Top = 232
    Width = 51
    Height = 25
    Caption = 'Inserir'
    TabOrder = 10
    OnClick = btnInserirClick
  end
  object btnExcluir: TButton
    Left = 440
    Top = 264
    Width = 51
    Height = 25
    Caption = 'Excluir'
    TabOrder = 11
    OnClick = btnExcluirClick
  end
  object btnPesqDistribuidor: TButton
    Left = 269
    Top = 168
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 12
    OnClick = btnPesqDistribuidorClick
  end
  object edtNomeDistribuidor: TEdit
    Left = 288
    Top = 168
    Width = 193
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edtPreco: TEdit
    Left = 312
    Top = 206
    Width = 49
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edtcodproduto: TEdit
    Left = 16
    Top = 206
    Width = 121
    Height = 21
    Color = clBtnFace
    MaxLength = 14
    ReadOnly = True
    TabOrder = 15
  end
  object btnProdutos: TButton
    Left = 141
    Top = 206
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 16
    OnClick = btnProdutosClick
  end
  object edtnomeproduto: TEdit
    Left = 168
    Top = 206
    Width = 137
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object btnprodutor: TButton
    Left = 267
    Top = 126
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 18
    OnClick = btnprodutorClick
  end
  object edtcodigo: TEdit
    Left = 16
    Top = 128
    Width = 129
    Height = 21
    TabOrder = 4
    OnKeyDown = edtcodigoKeyDown
    OnKeyPress = edtcodigoKeyPress
  end
  object cbxStatus: TComboBox
    Left = 16
    Top = 168
    Width = 129
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 19
    Text = 'Pendente'
    Items.Strings = (
      'Pendente'
      'Aprovada'
      'Concluir'
      'Cancelada')
  end
end
