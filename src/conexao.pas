unit conexao;

interface

uses
  SysUtils, Classes, DB, ADODB;

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
    qryProdutorLimiteNOME_DISTRIBUIDOR: TStringField;
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
