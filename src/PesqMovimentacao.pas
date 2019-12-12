unit PesqMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,conexao, Grids, DBGrids, StdCtrls;

type
  TfrmBuscaMovimento = class(TForm)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    edtCgc: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtcgcDistribuidor: TEdit;
    edtNomeDistribuidor: TEdit;
    Label5: TLabel;
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    FCodigo    : String;
  public
    { Public declarations }
    property _Codigo    : String read FCodigo write FCodigo;
  end;

var
  frmBuscaMovimento: TfrmBuscaMovimento;

implementation

{$R *.dfm}

procedure TfrmBuscaMovimento.edtCodigoChange(Sender: TObject);
begin
  dmConexao.qryMovimento.Close;
  dmConexao.qryMovimento.SQL.Clear;
  dmConexao.qryMovimento.SQL.Add('select m.*, p.nome_produtor, d.nome_distribuidor ' );
  dmConexao.qryMovimento.SQL.Add('  from movimento m, ');
  dmConexao.qryMovimento.SQL.Add('       produtor p, ');
  dmConexao.qryMovimento.SQL.Add('       distribuidor d ');
  dmConexao.qryMovimento.SQL.Add(' where 1 = 1 ');
  dmConexao.qryMovimento.SQL.Add('   and p.cgc_produtor = m.cgc_produtor ');
  dmConexao.qryMovimento.SQL.Add('   and d.cgc_distribuidor = m.cgc_distribuidor ');

  if Trim(edtCodigo.Text) <> '' then
    dmConexao.qryMovimento.SQL.Add('   and m.movimento_id like '''+ edtCodigo.Text +'%'+''' ');

  if Trim(edtCgc.Text) <> '' then
    dmConexao.qryMovimento.SQL.Add('   and p.cgc_produtor like '''+ edtCgc.Text +'%'+''' ');

  if Trim(edtNome.Text) <> '' then
    dmConexao.qryMovimento.SQL.Add('   and p.nome_produtor = '''+ edtNome.Text +'%'+''' ');

  if Trim(edtcgcDistribuidor.Text) <> '' then
    dmConexao.qryMovimento.SQL.Add('   and d.cgc_distribuidor like '''+ edtcgcDistribuidor.Text +'%'+''' ');

  if Trim(edtNomeDistribuidor.Text) <> '' then
    dmConexao.qryMovimento.SQL.Add('   and d.nome_distribuidor = '''+ edtNomeDistribuidor.Text +'%'+''' ');

  dmConexao.qryMovimento.SQL.Add('  order by p.nome_produtor ');
  dmConexao.qryMovimento.Open;
end;

procedure TfrmBuscaMovimento.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmBuscaMovimento.FormShow(Sender: TObject);
begin
  edtCodigoChange(Sender);
end;

procedure TfrmBuscaMovimento.Button1Click(Sender: TObject);
begin
  FCodigo  := dmConexao.qryMovimentoMOVIMENTO_ID.AsString;

end;

end.
