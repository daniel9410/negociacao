unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentao1: TMenuItem;
    Negociao1: TMenuItem;
    Relatorio1: TMenuItem;
    Relatorio2: TMenuItem;
    Produtor1: TMenuItem;
    Distribuidor1: TMenuItem;
    Produtos1: TMenuItem;
    grpConexao: TGroupBox;
    edtServidor: TEdit;
    Label1: TLabel;
    edtusuario: TEdit;
    Label2: TLabel;
    edtsenha: TEdit;
    Label3: TLabel;
    btnok: TButton;
    Button2: TButton;
    Conexo1: TMenuItem;
    Configurar1: TMenuItem;
    Sair1: TMenuItem;
    procedure Produtor1Click(Sender: TObject);
    procedure Distribuidor1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure Configurar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Negociao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
   uses produtor,movimento,conexao, distribuidor, produtos, biblioteca;
{$R *.dfm}

procedure TfrmPrincipal.Produtor1Click(Sender: TObject);
begin
  if frmProdutor = nil then
    frmProdutor := TfrmProdutor.Create(Self);

  frmProdutor.Show;
end;

procedure TfrmPrincipal.Distribuidor1Click(Sender: TObject);
begin
  if frmDistribuidor = nil then
    frmDistribuidor := TfrmDistribuidor.Create(Self);

  frmDistribuidor.Show;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  if frmProdutos = nil then
    frmProdutos := TfrmProdutos.Create(Self);

  frmProdutos.Show;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  grpConexao.Visible := False;
  showmessage('Verifique a conexao antes de continuar!');
end;

procedure TfrmPrincipal.btnokClick(Sender: TObject);
begin
  try
    dmConexao.con.Close;
    dmConexao.con.ConnectionString := 'Provider=MSDAORA.1;User ID='+edtusuario.Text+';Data Source='+edtServidor.Text+';Password='+edtsenha.Text+';Persist Security Info=False;';
    dmConexao.con.Open;
  except
    on e: exception do begin
      showmessage('erro: '+ e.Message);
      abort;
    end;
  end;

  showmessage('Conexão realizada com sucesso!');
  grpConexao.Visible := False;
end;

procedure TfrmPrincipal.Configurar1Click(Sender: TObject);
begin
  grpConexao.Visible := True;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not Questionar('Deseja fechar o sistema?') then
    CanClose := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    dmConexao.con.Close;
    dmConexao.con.ConnectionString := 'Provider=MSDAORA.1;User ID='+edtusuario.Text+';Data Source='+edtServidor.Text+';Password='+edtsenha.Text+';Persist Security Info=False;';
    dmConexao.con.Open;
  except
    on e: exception do begin
      showmessage('erro: '+ e.Message);
      abort;
    end;
  end;
end;

procedure TfrmPrincipal.Negociao1Click(Sender: TObject);
begin

  if frmMovimento = nil then
    frmMovimento := TfrmMovimento.Create(Self);

  frmMovimento.Show;
end;

end.
