unit produtor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,biblioteca, StdCtrls, conexao, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmProdutor = class(TForm)
    btnDeletar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnPesquisa: TButton;
    edtCgc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    edtcgcDistribuidor: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    btnInserir: TButton;
    btnExcluir: TButton;
    btnPesqDistribuidor: TButton;
    edtNomeDistribuidor: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCgcKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCgcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqDistribuidorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Modo (pvalor: Boolean);
  public
    { Public declarations }
  end;

var
  frmProdutor: TfrmProdutor;

implementation
    uses Math, PesqDistribuidor,PesqProdutor, DB;
{$R *.dfm}

procedure TfrmProdutor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmProdutor := nil;
  Action:= caFree;
end;

procedure TfrmProdutor.btnDeletarClick(Sender: TObject);
begin
  if Questionar('Deseja excluir o registro?')  then begin
    Apagar('PRODUTOR_limite',['cgc_produtor'],[edtCgc.Text]);
    Apagar('PRODUTOR',['cgc_produtor'],[edtCgc.Text]);
    Modo(False);
  end;
end;

procedure TfrmProdutor.btnGravarClick(Sender: TObject);
begin
  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from produtor '+
                               ' where cgc_produtor = '''+ edtCgc.Text +''' ';
  dmConexao.qryAux.Open;

  if dmConexao.qryAux.Eof then begin
    Inserir('produtor',
            ['cgc_produtor',
             'nome_produtor'],
            [edtCgc.Text,
            edtNome.Text]);
  end
  else begin
    Atualizar('produtor',
            ['cgc_produtor'],
            [edtCgc.Text],
            ['nome_produtor'],
            [edtNome.Text]);
  end;

  Apagar('PRODUTOR_limite',['cgc_produtor'],[edtCgc.Text]);

  dmConexao.cdsProdutorLimite.First;
  while not dmConexao.cdsProdutorLimite.Eof do begin
    Inserir('PRODUTOR_limite',
            ['cgc_produtor',
             'cgc_distribuidor',
             'valor_limite'],
            [edtCgc.Text,
            dmConexao.cdsProdutorLimiteCGC_DISTRIBUIDOR.AsString,
            dmConexao.cdsProdutorLimiteVALOR_LIMITE.AsCurrency]);

    dmConexao.cdsProdutorLimite.Next;
  end;
  Modo(False);
  ShowMessage('Registro gravado com sucesso!');
end;

procedure TfrmProdutor.edtCgcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmProdutor.btnCancelarClick(Sender: TObject);
begin
  if Questionar('Deseja cancelar a edi��o?') then
    Modo(False);
end;

procedure TfrmProdutor.Modo(pvalor: Boolean);
begin
  edtCgc.Enabled              := not pvalor;
  edtNome.Enabled             :=  pvalor;
  edtValor.Enabled            :=  pvalor;
  btnInserir.Enabled          :=  pvalor;
  btnExcluir.Enabled          :=  pvalor;
  btnPesqDistribuidor.Enabled :=  pvalor;
  btnPesquisa.Enabled         := not pvalor;
  btnDeletar.Enabled          := pvalor;
  btnGravar.Enabled           := pvalor;
  btnCancelar.Enabled         := pvalor;

  if pvalor then begin
    dmConexao.qryProdutorLimite.Close;
    dmConexao.qryProdutorLimite.Parameters.ParamByName('cgc_produtor').Value := edtCgc.Text;
    dmConexao.qryProdutorLimite.Open;

    dmConexao.cdsProdutorLimite.Close;
    dmConexao.cdsProdutorLimite.CreateDataSet;
    dmConexao.cdsProdutorLimite.Open;


    while not dmConexao.qryProdutorLimite.Eof do
    begin
      dmConexao.cdsProdutorLimite.Insert;
      dmConexao.cdsProdutorLimiteCGC_PRODUTOR.AsString     := dmConexao.qryProdutorLimiteCGC_PRODUTOR.AsString;
      dmConexao.cdsProdutorLimiteCGC_DISTRIBUIDOR.AsString := dmConexao.qryProdutorLimiteCGC_DISTRIBUIDOR.AsString;
      dmConexao.cdsProdutorLimiteNOME_DISTRIBUIDOR.AsString:= dmConexao.qryProdutorLimiteNOME_DISTRIBUIDOR.AsString;
      dmConexao.cdsProdutorLimiteVALOR_LIMITE.AsCurrency   := dmConexao.qryProdutorLimiteVALOR_LIMITE.AsCurrency;
      dmConexao.cdsProdutorLimite.Post;
      dmConexao.qryProdutorLimite.Next;
    end;
  end
  else begin
    dmConexao.qryProdutorLimite.Close;
    edtCgc.Text := '';
    edtNome.Text := '';
    edtNomeDistribuidor.Text := '';
    edtValor.Text := '';
    edtcgcDistribuidor.Text := '';
    dmConexao.cdsProdutorLimite.Close;
  end;
end;
procedure TfrmProdutor.edtCgcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    dmConexao.qryAux.Close;
    dmConexao.qryAux.SQL.Clear;
    dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from produtor '+
                               ' where cgc_produtor = '''+ edtCgc.Text +''' ';
    dmConexao.qryAux.Open;

    if not dmConexao.qryAux.Eof then
      edtNome.Text := dmConexao.qryAux.FieldValues['nome_produtor'];

    Modo(True);
    edtNome.SetFocus;
  end;
end;

procedure TfrmProdutor.btnInserirClick(Sender: TObject);
begin
  if dmConexao.cdsProdutorLimite.Locate('CGC_DISTRIBUIDOR',edtcgcDistribuidor.Text,[]) then
    dmConexao.cdsProdutorLimite.Edit
  else
    dmConexao.cdsProdutorLimite.Insert;
  dmConexao.cdsProdutorLimiteCGC_PRODUTOR.AsString     := edtCgc.Text;
  dmConexao.cdsProdutorLimiteCGC_DISTRIBUIDOR.AsString := edtcgcDistribuidor.Text;
  dmConexao.cdsProdutorLimiteNOME_DISTRIBUIDOR.AsString:= edtNomeDistribuidor.Text;
  dmConexao.cdsProdutorLimiteVALOR_LIMITE.AsCurrency   := StrToFloatDef(edtValor.Text,0);
  dmConexao.cdsProdutorLimite.Post;
end;

procedure TfrmProdutor.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',',',#8] then
  else
    key := #0;
end;

procedure TfrmProdutor.btnPesqDistribuidorClick(Sender: TObject);
begin
  if frmBuscaDistribuidor = nil then
    frmBuscaDistribuidor := TfrmBuscaDistribuidor.Create(Self);

  if frmBuscaDistribuidor.ShowModal = mrOk then begin
    edtcgcDistribuidor.Text  := frmBuscaDistribuidor._Cgc;
    edtNomeDistribuidor.Text := frmBuscaDistribuidor._Nome;
  end;
  frmBuscaDistribuidor := nil;
end;

procedure TfrmProdutor.FormShow(Sender: TObject);
begin
  Modo(False);
  edtCgc.SetFocus;
end;

procedure TfrmProdutor.btnPesquisaClick(Sender: TObject);
var vKey: Word;
      vShift: TShiftState;
begin
  if frmBuscaProdutor = nil then
    frmBuscaProdutor := TfrmBuscaProdutor.Create(Self);

  if frmBuscaProdutor.ShowModal = mrOk then begin
    edtCgc.Text  := frmBuscaProdutor._Cgc;
    vKey := 13;
    edtCgcKeyDown(Sender, vKey,VSHIFT);
  end;
  frmBuscaProdutor := nil;
end;

procedure TfrmProdutor.btnExcluirClick(Sender: TObject);
begin
  dmConexao.cdsProdutorLimite.Delete;  
end;                  

end.
