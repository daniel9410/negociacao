unit PesqProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,conexao, Grids, DBGrids, StdCtrls;

type
  TfrmBuscaProdutos = class(TForm)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    FCodigo : String;
    FNome   : String;
    FValor  : String;

  public
    { Public declarations }
    property _Codigo : String read FCodigo write FCodigo;
    property _Nome   : String read FNome write FNome;
    property _Valor  : String read FValor write FValor;
  end;

var
  frmBuscaProdutos: TfrmBuscaProdutos;

implementation

{$R *.dfm}

procedure TfrmBuscaProdutos.edtCodigoChange(Sender: TObject);
begin
  dmConexao.qryProdutos.Close;
  dmConexao.qryProdutos.SQL.Clear;
  dmConexao.qryProdutos.SQL.Add('select * ' );
  dmConexao.qryProdutos.SQL.Add('  from produtos ');
  dmConexao.qryProdutos.SQL.Add(' where 1 = 1 ');

  if Trim(edtCodigo.Text) <> '' then
    dmConexao.qryProdutos.SQL.Add('   and produto_id like '''+ edtCodigo.Text +'%' +''' ');

  if Trim(edtNome.Text) <> '' then
    dmConexao.qryProdutos.SQL.Add('   and nome_produto like '''+ edtNome.Text +'%' +''' ');

  dmConexao.qryProdutos.SQL.Add('  order by nome_produto ');
  dmConexao.qryProdutos.Open;
end;

procedure TfrmBuscaProdutos.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmBuscaProdutos.FormShow(Sender: TObject);
begin
  edtCodigoChange(Sender);
end;

procedure TfrmBuscaProdutos.Button1Click(Sender: TObject);
begin
  FCodigo  := dmConexao.qryProdutosPRODUTO_ID.AsString;
  FNome    := dmConexao.qryProdutosNOME_produto.AsString;
  FValor   := dmConexao.qryProdutospreco.AsString;
end;

end.
