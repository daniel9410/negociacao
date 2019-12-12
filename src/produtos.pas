unit produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,biblioteca, StdCtrls, conexao, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmProdutos = class(TForm)
    btnDeletar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnPesquisa: TButton;
    edtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtPreco: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Modo (pvalor: Boolean);
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation
    uses Math, PesqProdutos, DB;
{$R *.dfm}

procedure TfrmProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmProdutos := nil;
  Action:= caFree;
end;

procedure TfrmProdutos.btnDeletarClick(Sender: TObject);
begin
  if Questionar('Deseja excluir o registro?')  then begin
    Apagar('produtos',['produto_id'],[edtCodigo.Text]);
    Modo(False);
  end;
end;

procedure TfrmProdutos.btnGravarClick(Sender: TObject);
begin
  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from produtos '+
                               ' where produto_id = '''+ edtCodigo.Text +''' ';
  dmConexao.qryAux.Open;

  if dmConexao.qryAux.Eof then begin
    Inserir('produtos',
            ['produto_id',
             'nome_produto',
             'preco'],
            [edtCodigo.Text,
            edtNome.Text,
            StrToFloat(edtPreco.Text)]);
  end
  else begin
    Atualizar('produtos',
            ['produto_id'],
            [edtCodigo.Text],
            ['nome_produto',
            'preco'],
            [edtNome.Text,
            StrToFloat(edtPreco.Text)]);
  end;

  Modo(False);
  ShowMessage('Registro gravado com sucesso!');
end;

procedure TfrmProdutos.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  if Questionar('Deseja cancelar a edição?') then
    Modo(False);
end;

procedure TfrmProdutos.Modo(pvalor: Boolean);
begin
  edtCodigo.Enabled           := not pvalor;
  edtNome.Enabled             := pvalor;
  edtPreco.Enabled            := pvalor;
  btnPesquisa.Enabled         := not pvalor;
  btnDeletar.Enabled          := pvalor;
  btnGravar.Enabled           := pvalor;
  btnCancelar.Enabled         := pvalor;

  if not pvalor then  begin
    edtCodigo.Text := '';
    edtNome.Text := '';
    edtPreco.Text := '0,00';
  end;
end;
procedure TfrmProdutos.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    if edtCodigo.Text = '' then begin
      dmConexao.qryAux.Close;
      dmConexao.qryAux.SQL.Clear;
      dmConexao.qryAux.SQL.Text := 'select NVL(Max(produto_id),0) + 1 as Valor '+
                                   '  from produtos ';

      dmConexao.qryAux.Open;

      edtCodigo.Text  := dmConexao.qryAux.FieldValues['Valor'];

    end
    else begin

      dmConexao.qryAux.Close;
      dmConexao.qryAux.SQL.Clear;
      dmConexao.qryAux.SQL.Text := 'select * '+
                                 '  from produtos '+
                                 ' where produto_id = '''+ edtCodigo.Text +''' ';
      dmConexao.qryAux.Open;

      if not dmConexao.qryAux.Eof then begin
        edtNome.Text  := dmConexao.qryAux.FieldValues['nome_produto'];
        edtPreco.Text := dmConexao.qryAux.FieldValues['preco'];
      end;
    end;

    Modo(True);
    edtNome.SetFocus;
  end;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  Modo(False);
  edtCodigo.SetFocus;
end;

procedure TfrmProdutos.btnPesquisaClick(Sender: TObject);
begin
  if frmBuscaProdutos = nil then
    frmBuscaProdutos := TfrmBuscaProdutos.Create(Self);

  if frmBuscaProdutos.ShowModal = mrOk then begin
    edtCodigo.Text := frmBuscaProdutos._Codigo;
    edtNome.Text   := frmBuscaProdutos._Nome;
    edtPreco.Text  := frmBuscaProdutos._Valor;
    Modo(True);
  end;
  frmBuscaProdutos := nil;
end;

procedure TfrmProdutos.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8,','] then
  else
    Key := #0;
end;

end.
