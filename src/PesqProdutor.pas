unit PesqProdutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,conexao, Grids, DBGrids, StdCtrls;

type
  TfrmBuscaProdutor = class(TForm)
    edtCgc: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure edtCgcChange(Sender: TObject);
    procedure edtCgcKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    FCgc    : String;
    FNome   : String;
    FTabela : String;
    FCampos : String;
  public
    { Public declarations }
    property _Cgc    : String read FCgc write FCgc;
    property _Nome   : String read FNome write FNome;
  end;

var
  frmBuscaProdutor: TfrmBuscaProdutor;

implementation

{$R *.dfm}

procedure TfrmBuscaProdutor.edtCgcChange(Sender: TObject);
begin
  dmConexao.qryProdutor.Close;
  dmConexao.qryProdutor.SQL.Clear;
  dmConexao.qryProdutor.SQL.Add('select * ' );
  dmConexao.qryProdutor.SQL.Add('  from produtor ');
  dmConexao.qryProdutor.SQL.Add(' where 1 = 1 ');

  if Trim(edtCgc.Text) <> '' then
    dmConexao.qryProdutor.SQL.Add('   and cgc_produtor like '''+ edtCgc.Text +'%'+''' ');

  if Trim(edtNome.Text) <> '' then
    dmConexao.qryProdutor.SQL.Add('   and nome_produtor = '''+ edtNome.Text +'%'+''' ');

  dmConexao.qryProdutor.SQL.Add('  order by nome_produtor ');
  dmConexao.qryProdutor.Open;
end;

procedure TfrmBuscaProdutor.edtCgcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmBuscaProdutor.FormShow(Sender: TObject);
begin
  edtCgcChange(Sender);
end;

procedure TfrmBuscaProdutor.Button1Click(Sender: TObject);
begin
  FCgc  := dmConexao.qryProdutorCGC_PRODUTOR.AsString;
  FNome := dmConexao.qryProdutorNOME_PRODUTOR.AsString;
end;

end.
