unit Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,conexao, Grids, DBGrids, StdCtrls,
  RpRave, RpDefine, RpCon, RpConDS, RpConBDE;

type
  TfrmRelatorio = class(TForm)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtCgc: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtcgcDistribuidor: TEdit;
    edtNomeDistribuidor: TEdit;
    Label5: TLabel;
    Button1: TButton;
    RvDataSetConnection1: TRvDataSetConnection;
    rvProjeto: TRvProject;
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    FCodigo    : String;
  public
    { Public declarations }
    property _Codigo    : String read FCodigo write FCodigo;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.edtCodigoChange(Sender: TObject);
begin
  dmConexao.qryRelatorio.Close;
  dmConexao.qryRelatorio.SQL.Clear;
  dmConexao.qryRelatorio.SQL.Add('select m.movimento_id, ');
  dmConexao.qryRelatorio.SQL.Add('       m.cgc_produtor,                              ');
  dmConexao.qryRelatorio.SQL.Add('       m.cgc_distribuidor,                          ');
  dmConexao.qryRelatorio.SQL.Add('       m.Status,                                    ');
  dmConexao.qryRelatorio.SQL.Add('       m.cadastro,                                  ');
  dmConexao.qryRelatorio.SQL.Add('       m.aprovacao,                                 ');
  dmConexao.qryRelatorio.SQL.Add('       m.cancelamento,                              ');
  dmConexao.qryRelatorio.SQL.Add('       m.Conclusao, p.nome_produtor, d.nome_distribuidor, ');
  dmConexao.qryRelatorio.SQL.Add('       sum(i.preco * i.quantidade) as Valor         ');
  dmConexao.qryRelatorio.SQL.Add('  from movimento m,                                 ');
  dmConexao.qryRelatorio.SQL.Add('       itens_movimento i,                           ');
  dmConexao.qryRelatorio.SQL.Add('       produtor p,                                  ');
  dmConexao.qryRelatorio.SQL.Add('       distribuidor d                               ');
  dmConexao.qryRelatorio.SQL.Add(' where i.movimento_id = m.movimento_id              ');
  dmConexao.qryRelatorio.SQL.Add('   and p.cgc_produtor = m.cgc_produtor              ');
  dmConexao.qryRelatorio.SQL.Add('   and d.cgc_distribuidor = m.cgc_distribuidor      ');


  if Trim(edtCodigo.Text) <> '' then
    dmConexao.qryRelatorio.SQL.Add('   and m.movimento_id like '''+ edtCodigo.Text +'%'+''' ');

  if Trim(edtCgc.Text) <> '' then
    dmConexao.qryRelatorio.SQL.Add('   and p.cgc_produtor like '''+ edtCgc.Text +'%'+''' ');

  if Trim(edtNome.Text) <> '' then
    dmConexao.qryRelatorio.SQL.Add('   and p.nome_produtor = '''+ edtNome.Text +'%'+''' ');

  if Trim(edtcgcDistribuidor.Text) <> '' then
    dmConexao.qryRelatorio.SQL.Add('   and d.cgc_distribuidor like '''+ edtcgcDistribuidor.Text +'%'+''' ');

  if Trim(edtNomeDistribuidor.Text) <> '' then
    dmConexao.qryRelatorio.SQL.Add('   and d.nome_distribuidor = '''+ edtNomeDistribuidor.Text +'%'+''' ');

  dmConexao.qryRelatorio.SQL.Add(' group by m.movimento_id,                           ');
  dmConexao.qryRelatorio.SQL.Add('          m.cgc_produtor,                           ');
  dmConexao.qryRelatorio.SQL.Add('          m.cgc_distribuidor,                       ');
  dmConexao.qryRelatorio.SQL.Add('          m.Status,                                 ');
  dmConexao.qryRelatorio.SQL.Add('          m.cadastro,                               ');
  dmConexao.qryRelatorio.SQL.Add('          m.aprovacao,                              ');
  dmConexao.qryRelatorio.SQL.Add('          m.cancelamento,                           ');
  dmConexao.qryRelatorio.SQL.Add('  m.Conclusao, p.nome_produtor, d.nome_distribuidor ');
  dmConexao.qryRelatorio.SQL.Add('  order by p.nome_produtor ');
  dmConexao.qryRelatorio.Open;
end;

procedure TfrmRelatorio.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  edtCodigoChange(Sender);
end;

procedure TfrmRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmRelatorio := nil;
end;

procedure TfrmRelatorio.Button1Click(Sender: TObject);
begin
  rvProjeto.ProjectFile := ExtractFilePath(Application.ExeName)+'\Movimentacao.rav';
  rvProjeto.Execute;
end;

end.
