unit distribuidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,biblioteca, StdCtrls, conexao, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmDistribuidor = class(TForm)
    btnDeletar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnPesquisa: TButton;
    edtCgc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCgcKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCgcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Modo (pvalor: Boolean);
  public
    { Public declarations }
  end;

var
  frmDistribuidor: TfrmDistribuidor;

implementation
    uses Math, PesqDistribuidor, DB;
{$R *.dfm}

procedure TfrmDistribuidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmDistribuidor := nil;
  Action:= caFree;
end;

procedure TfrmDistribuidor.btnDeletarClick(Sender: TObject);
begin
  if Questionar('Deseja excluir o registro?')  then begin
    Apagar('distribuidor',['cgc_distribuidor'],[edtCgc.Text]);
    Modo(False);
  end;
end;

procedure TfrmDistribuidor.btnGravarClick(Sender: TObject);
begin
  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from distribuidor '+
                               ' where cgc_distribuidor = '''+ edtCgc.Text +''' ';
  dmConexao.qryAux.Open;

  if dmConexao.qryAux.Eof then begin
    Inserir('distribuidor',
            ['cgc_distribuidor',
             'nome_distribuidor'],
            [edtCgc.Text,
            edtNome.Text]);
  end
  else begin
    Atualizar('distribuidor',
            ['cgc_distribuidor'],
            [edtCgc.Text],
            ['nome_distribuidor'],
            [edtNome.Text]);
  end;
  
  Modo(False);
  ShowMessage('Registro gravado com sucesso!');
end;

procedure TfrmDistribuidor.edtCgcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmDistribuidor.btnCancelarClick(Sender: TObject);
begin
  if Questionar('Deseja cancelar a edi��o?') then
    Modo(False);
end;

procedure TfrmDistribuidor.Modo(pvalor: Boolean);
begin
  edtCgc.Enabled              := not pvalor;
  edtNome.Enabled             := pvalor;
  btnPesquisa.Enabled         := not pvalor;
  btnDeletar.Enabled          := pvalor;
  btnGravar.Enabled           := pvalor;
  btnCancelar.Enabled         := pvalor;

  if not pvalor then  begin
    edtCgc.Text := '';
    edtNome.Text := '';
  end;
end;
procedure TfrmDistribuidor.edtCgcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    dmConexao.qryAux.Close;
    dmConexao.qryAux.SQL.Clear;
    dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from distribuidor '+
                               ' where cgc_distribuidor = '''+ edtCgc.Text +''' ';
    dmConexao.qryAux.Open;

    if not dmConexao.qryAux.Eof then
      edtNome.Text := dmConexao.qryAux.FieldValues['nome_distribuidor'];

    Modo(True);
    edtNome.SetFocus;
  end;
end;

procedure TfrmDistribuidor.FormShow(Sender: TObject);
begin
  Modo(False);
  edtCgc.SetFocus;
end;

procedure TfrmDistribuidor.btnPesquisaClick(Sender: TObject);
begin
  if frmBuscaDistribuidor = nil then
    frmBuscaDistribuidor := TfrmBuscaDistribuidor.Create(Self);
  frmBuscaDistribuidor.Caption := 'Pesquisa de Distribuidor';
  
  if frmBuscaDistribuidor.ShowModal = mrOk then begin
    edtCgc.Text  := frmBuscaDistribuidor._Cgc;
    edtNome.Text := frmBuscaDistribuidor._Nome;
    Modo(True);
  end;
  frmBuscaDistribuidor := nil;
end;

end.
