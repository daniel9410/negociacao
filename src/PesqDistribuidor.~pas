unit PesqDistribuidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,conexao, Grids, DBGrids, StdCtrls;

type
  TfrmBuscaDistribuidor = class(TForm)
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
  frmBuscaDistribuidor: TfrmBuscaDistribuidor;

implementation

{$R *.dfm}

procedure TfrmBuscaDistribuidor.edtCgcChange(Sender: TObject);
begin
  dmConexao.qryDistribuidor.Close;
  dmConexao.qryDistribuidor.SQL.Clear;
  dmConexao.qryDistribuidor.SQL.Add('select * ' );
  dmConexao.qryDistribuidor.SQL.Add('  from distribuidor ');
  dmConexao.qryDistribuidor.SQL.Add(' where 1 = 1 ');

  if Trim(edtCgc.Text) <> '' then
    dmConexao.qryDistribuidor.SQL.Add('   and cgc_distribuidor like '''+ edtCgc.Text +'%' +''' ');

  if Trim(edtNome.Text) <> '' then
    dmConexao.qryDistribuidor.SQL.Add('   and nome_distribuidor like '''+ edtNome.Text +'%' +''' ');

  dmConexao.qryDistribuidor.SQL.Add('  order by nome_distribuidor ');
  dmConexao.qryDistribuidor.Open;
end;

procedure TfrmBuscaDistribuidor.edtCgcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmBuscaDistribuidor.FormShow(Sender: TObject);
begin
  edtCgcChange(Sender);
end;

procedure TfrmBuscaDistribuidor.Button1Click(Sender: TObject);
begin
  FCgc  := dmConexao.qryDistribuidorCGC_DISTRIBUIDOR.AsString;
  FNome := dmConexao.qryDistribuidorNOME_DISTRIBUIDOR.AsString;
end;

end.
