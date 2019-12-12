unit conexao;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient;

type
  TdmConexao = class(TDataModule)
    con: TADOConnection;
    qryAux: TADOQuery;
    qryProdutor: TADOQuery;
    qryDistribuidor: TADOQuery;
    qryProdutorLimite: TADOQuery;
    qryProdutorCGC_PRODUTOR: TStringField;
    qryProdutorNOME_PRODUTOR: TStringField;
    qryDistribuidorCGC_DISTRIBUIDOR: TStringField;
    qryDistribuidorNOME_DISTRIBUIDOR: TStringField;
    dsoProdutorLimite: TDataSource;
    dsoProdutor: TDataSource;
    dsoDistribuidor: TDataSource;
    qryProdutorLimiteCGC_PRODUTOR: TStringField;
    qryProdutorLimiteCGC_DISTRIBUIDOR: TStringField;
    qryProdutorLimiteVALOR_LIMITE: TBCDField;
    dsoProdutos: TDataSource;
    qryProdutos: TADOQuery;
    qryProdutosPRODUTO_ID: TBCDField;
    qryProdutosNOME_PRODUTO: TStringField;
    qryProdutosPRECO: TBCDField;
    cdsProdutorLimite: TClientDataSet;
    cdsProdutorLimitecgc_produtor: TStringField;
    cdsProdutorLimitecgc_distribuidor: TStringField;
    cdsProdutorLimitenome_Distribuidor: TStringField;
    qryProdutorLimiteNOME_DISTRIBUIDOR: TStringField;
    cdsProdutorLimitevalor_limite: TFMTBCDField;
    cdsItens_Movimento: TClientDataSet;
    cdsItens_Movimentomovimento_id: TIntegerField;
    cdsItens_Movimentoproduto_id: TIntegerField;
    cdsItens_Movimentovalor: TFMTBCDField;
    cdsItens_Movimentoquantidade: TFMTBCDField;
    dsoItens_Movimento: TDataSource;
    cdsItens_Movimentonome_produto: TStringField;
    qryItens_Movimento: TADOQuery;
    qryItens_MovimentoMOVIMENTO_ID: TBCDField;
    qryItens_MovimentoPRODUTO_ID: TBCDField;
    qryItens_MovimentoQUANTIDADE: TBCDField;
    qryItens_MovimentoPRECO: TBCDField;
    qryItens_MovimentoNOME_PRODUTO: TStringField;
    qryMovimento: TADOQuery;
    qryMovimentoMOVIMENTO_ID: TBCDField;
    qryMovimentoCGC_PRODUTOR: TStringField;
    qryMovimentoCGC_DISTRIBUIDOR: TStringField;
    qryMovimentoSTATUS: TStringField;
    qryMovimentoNOME_PRODUTOR: TStringField;
    dsoMovimento: TDataSource;
    qryMovimentoNOME_DISTRIBUIDOR: TStringField;
    cdsItens_Movimentototal: TCurrencyField;
    qryMovimentoCADASTRO: TDateTimeField;
    qryMovimentoAPROVACAO: TDateTimeField;
    qryMovimentoCANCELAMENTO: TDateTimeField;
    qryMovimentoCONCLUSAO: TDateTimeField;
    dsoRelatorio: TDataSource;
    qryRelatorio: TADOQuery;
    BCDField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    qryRelatorioVALOR: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{$R *.dfm}

end.
