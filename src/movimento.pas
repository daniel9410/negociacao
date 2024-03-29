unit movimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,biblioteca, StdCtrls, conexao, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmMovimento = class(TForm)
    btnDeletar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnPesquisa: TButton;
    edtCgc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    a: TDBGrid;
    edtcgcDistribuidor: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    btnInserir: TButton;
    btnExcluir: TButton;
    btnPesqDistribuidor: TButton;
    edtNomeDistribuidor: TEdit;
    edtPreco: TEdit;
    Label5: TLabel;
    edtcodproduto: TEdit;
    btnProdutos: TButton;
    edtnomeproduto: TEdit;
    btnprodutor: TButton;
    edtcodigo: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCgcKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqDistribuidorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnprodutorClick(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Modo (pvalor: Boolean);
    function ValidaLimite : Boolean;
  public
    { Public declarations }
  end;

var
  frmMovimento: TfrmMovimento;

implementation
    uses Math,PesqMovimentacao, PesqProdutos, PesqDistribuidor,PesqProdutor, DB;
{$R *.dfm}

procedure TfrmMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMovimento := nil;
  Action:= caFree;
end;

procedure TfrmMovimento.btnDeletarClick(Sender: TObject);
begin
  if Questionar('Deseja excluir o registro?')  then begin
    Apagar('itens_movimento',['movimento_id'],[edtcodigo.Text]);
    Apagar('movimento',['movimento_id'],[edtcodigo.Text]);
    Modo(False);
  end;
end;

function TfrmMovimento.ValidaLimite : Boolean;
var vTotUsado : Double;
    vValorCredto : Double;
    vTotalAUsar  : Double;
begin
  Result := True;

  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select NVL(sum(i.preco * i.quantidade),0) as valor '+
                               '  from itens_movimento i, '+
                               '       movimento m '+
                               '  where m.movimento_id = i.movimento_id '+
                               '     and m.movimento_id <> '+ edtcodigo.Text+
                               '     and m.status in (''PE'',''AP'') '+
                               '     and m.cgc_produtor = '''+ edtCgc.Text +''' '+
                               '     and m.cgc_distribuidor = '''+ edtcgcDistribuidor.Text +''' ';
  dmConexao.qryAux.Open;

  if not dmConexao.qryAux.Eof then
    vTotUsado := dmConexao.qryAux.FieldValues['valor']
  else
    vTotUsado := 0;

  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select valor_limite '+
                               '  from produtor_limite '+
                               '  where cgc_produtor = '''+ edtCgc.Text +''' '+
                               '     and cgc_distribuidor = '''+ edtcgcDistribuidor.Text +''' ';
  dmConexao.qryAux.Open;

  if not dmConexao.qryAux.Eof then
    vValorCredto := dmConexao.qryAux.FieldValues['valor_limite']
  else
    vValorCredto := 0;

  dmConexao.cdsItens_Movimento.First;
  while not dmConexao.cdsItens_Movimento.Eof do begin
    vTotalAUsar := vTotalAUsar + dmConexao.cdsItens_Movimentototal.AsCurrency;
    dmConexao.cdsItens_Movimento.Next
  end;

  if (vValorCredto < (vTotalAUsar + vTotUsado )) then begin
    Result := False;
  end;

end;

procedure TfrmMovimento.btnGravarClick(Sender: TObject);
var vStatus : string;
begin
  if not ValidaLimite then begin
    ShowMessage('O produtor n�o possue saldo para realizar esta negocia��o!');
    Abort;
  end;

  dmConexao.qryAux.Close;
  dmConexao.qryAux.SQL.Clear;
  dmConexao.qryAux.SQL.Text := 'select * '+
                               '  from movimento '+
                               ' where movimento_id = '''+ edtcodigo.Text +''' ';
  dmConexao.qryAux.Open;


  vStatus := 'PE';

  if dmConexao.qryAux.Eof then begin
    Inserir('movimento',
            ['cgc_produtor',
             'movimento_id',
             'cgc_distribuidor',
             'Status',
             'cadastro'],
            [edtCgc.Text,
            edtcodigo.Text,
            edtcgcDistribuidor.Text,
            vStatus,
            Now]);
  end
  else begin
    Atualizar('movimento',
            ['movimento_id'],
            [edtcodigo.Text],
            ['cgc_distribuidor',
            'cgc_produtor',
            'Status'],
            [edtcgcDistribuidor.Text,
            edtCgc.Text,
            vStatus]);
  end;

  Apagar('itens_movimento',['movimento_id'],[edtcodigo.Text]);

  dmConexao.cdsItens_Movimento.First;
  while not dmConexao.cdsItens_Movimento.Eof do begin
    Inserir('itens_movimento',
            ['produto_id',
             'movimento_id',
             'quantidade',
             'preco'],
            [dmConexao.cdsItens_Movimentoproduto_id.AsInteger,
             edtcodigo.Text,
            dmConexao.cdsItens_Movimentoquantidade.AsCurrency ,
            dmConexao.cdsItens_Movimentovalor.AsCurrency]);

    dmConexao.cdsItens_Movimento.Next;
  end;
  Modo(False);
  ShowMessage('Registro gravado com sucesso!');
end;

procedure TfrmMovimento.edtCgcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmMovimento.btnCancelarClick(Sender: TObject);
begin
  if Questionar('Deseja cancelar a edi��o?') then
    Modo(False);
end;

procedure TfrmMovimento.Modo(pvalor: Boolean);
begin
  edtcodigo.Enabled           := not pvalor;
  edtCgc.Enabled              :=  pvalor;
  edtNome.Enabled             :=  pvalor;
  edtValor.Enabled            :=  pvalor;
  btnInserir.Enabled          :=  pvalor;
  btnExcluir.Enabled          :=  pvalor;
  btnPesqDistribuidor.Enabled :=  pvalor;
  btnPesquisa.Enabled         := not pvalor;
  btnDeletar.Enabled          := pvalor;
  btnGravar.Enabled           := pvalor;
  btnCancelar.Enabled         := pvalor;
  btnprodutor.Enabled         := pvalor;
  btnProdutos.Enabled         := pvalor;

  if pvalor then begin
    dmConexao.qryItens_Movimento.Close;
    dmConexao.qryItens_Movimento.Parameters.ParamByName('movimento_id').Value := edtcodigo.Text;
    dmConexao.qryItens_Movimento.Open;

    dmConexao.cdsItens_Movimento.Close;
    dmConexao.cdsItens_Movimento.CreateDataSet;
    dmConexao.cdsItens_Movimento.Open;


    while not dmConexao.qryItens_Movimento.Eof do
    begin
      dmConexao.cdsItens_Movimento.Insert;
      dmConexao.cdsItens_Movimentomovimento_id.AsInteger     := dmConexao.qryItens_Movimentomovimento_id.AsInteger;
      dmConexao.cdsItens_Movimentoproduto_id.AsInteger  := dmConexao.qryItens_Movimentoproduto_id.AsInteger;
      dmConexao.cdsItens_Movimentovalor.AsCurrency      := dmConexao.qryItens_MovimentoPRECO.AsCurrency;
      dmConexao.cdsItens_Movimentoquantidade.AsCurrency := dmConexao.qryItens_Movimentoquantidade.AsCurrency;
      dmConexao.cdsItens_Movimentonome_produto.AsString := dmConexao.qryItens_MovimentoNOME_PRODUTO.AsString;
      dmConexao.cdsItens_Movimentototal.AsCurrency      := dmConexao.qryItens_MovimentoPRECO.AsCurrency * dmConexao.qryItens_Movimentoquantidade.AsCurrency;
      dmConexao.cdsItens_Movimento.Post;
      dmConexao.qryItens_Movimento.Next;
    end;
  end
  else begin
    dmConexao.qryProdutorLimite.Close;
    edtCgc.Text := '';
    edtcodigo.Text := '';
    edtNome.Text := '';
    edtNomeDistribuidor.Text := '';
    edtValor.Text := '';
    edtcgcDistribuidor.Text := '';
    dmConexao.cdsItens_Movimento.Close;
    edtcodproduto.Clear;
    edtnomeproduto.Clear;
    edtPreco.Clear;

  end;
end;
procedure TfrmMovimento.btnInserirClick(Sender: TObject);
begin
  if dmConexao.cdsItens_Movimento.Locate('produto_id',edtcodproduto.Text,[]) then
    dmConexao.cdsItens_Movimento.Edit
  else
    dmConexao.cdsItens_Movimento.Insert;
  dmConexao.cdsItens_Movimentomovimento_id.AsString    := edtcodigo.Text;
  dmConexao.cdsItens_Movimentoproduto_id.AsString := edtcodproduto.Text;
  dmConexao.cdsItens_Movimentovalor.AsCurrency    := StrToFloatDef(edtPreco.Text,0);
  dmConexao.cdsItens_Movimentoquantidade.AsCurrency := StrToFloatDef(edtValor.Text,0);
  dmConexao.cdsItens_Movimentonome_produto.AsString := edtnomeproduto.Text;
  dmConexao.cdsItens_Movimentototal.AsCurrency      := StrToFloatDef(edtPreco.Text,0) * StrToFloatDef(edtValor.Text,0);
  dmConexao.cdsItens_Movimento.Post;

  edtcodproduto.Clear;
  edtnomeproduto.Clear;
  edtPreco.Clear;
  edtValor.Text := '';
end;

procedure TfrmMovimento.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',',',#8] then
  else
    key := #0;
end;

procedure TfrmMovimento.btnPesqDistribuidorClick(Sender: TObject);
begin
  if frmBuscaDistribuidor = nil then
    frmBuscaDistribuidor := TfrmBuscaDistribuidor.Create(Self);

  if frmBuscaDistribuidor.ShowModal = mrOk then begin
    edtcgcDistribuidor.Text  := frmBuscaDistribuidor._Cgc;
    edtNomeDistribuidor.Text := frmBuscaDistribuidor._Nome;
  end;
  frmBuscaDistribuidor := nil;
end;

procedure TfrmMovimento.FormShow(Sender: TObject);
begin
  Modo(False);
  edtcodigo.SetFocus;
end;

procedure TfrmMovimento.btnExcluirClick(Sender: TObject);
begin
  dmConexao.cdsItens_Movimento.Delete;  
end;                  

procedure TfrmMovimento.btnprodutorClick(Sender: TObject);
begin
  if frmBuscaProdutor = nil then
    frmBuscaProdutor := TfrmBuscaProdutor.Create(Self);

  if frmBuscaProdutor.ShowModal = mrOk then begin
    edtCgc.Text  := frmBuscaProdutor._Cgc;
    edtNome.Text := frmBuscaProdutor._Nome;
  end;
  frmBuscaProdutor := nil;
end;

procedure TfrmMovimento.edtcodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then
  else
    Key := #0;
end;

procedure TfrmMovimento.edtcodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    if edtCodigo.Text = '' then begin
      dmConexao.qryAux.Close;
      dmConexao.qryAux.SQL.Clear;
      dmConexao.qryAux.SQL.Text := 'select NVL(Max(movimento_id),0) + 1 as Valor '+
                                   '  from movimento ';
      dmConexao.qryAux.Open;

      edtCodigo.Text  := dmConexao.qryAux.FieldValues['Valor'];

    end
    else begin

      dmConexao.qryAux.Close;
      dmConexao.qryAux.SQL.Clear;
      dmConexao.qryAux.SQL.Text := 'select m.*,  '+
                                   '    p.nome_produtor, '+
                                   '    d.nome_distribuidor '+
                                 '  from movimento m, '+
                                 '       produtor p, '+
                                 '       distribuidor d '+
                                 ' where d.cgc_distribuidor = m.cgc_distribuidor '+
                                 '   and p.cgc_produtor = m.cgc_produtor '+
                                 '   and movimento_id = '''+ edtCodigo.Text +''' ';
      dmConexao.qryAux.Open;

      if not dmConexao.qryAux.Eof then begin
        edtNome.Text  := dmConexao.qryAux.FieldValues['nome_produtor'];
        edtCgc.Text   := dmConexao.qryAux.FieldValues['cgc_produtor'];
        edtcgcDistribuidor.Text := dmConexao.qryAux.FieldValues['cgc_distribuidor'];
        edtNomeDistribuidor.Text  := dmConexao.qryAux.FieldValues['nome_distribuidor'];

        
      end;
    end;

    Modo(True);
    edtNome.SetFocus;
  end;
end;

procedure TfrmMovimento.btnProdutosClick(Sender: TObject);
begin
  if frmBuscaProdutos = nil then
    frmBuscaProdutos := TfrmBuscaProdutos.Create(Self);

  if frmBuscaProdutos.ShowModal = mrOk then begin
    edtcodproduto.Text := frmBuscaProdutos._Codigo;
    edtnomeproduto.Text   := frmBuscaProdutos._Nome;
    edtPreco.Text  := frmBuscaProdutos._Valor;
    Modo(True);
  end;
  frmBuscaProdutos := nil;
end;

procedure TfrmMovimento.btnPesquisaClick(Sender: TObject);
var vKey: Word;
  vShift: TShiftState;
begin
  if frmBuscaMovimento = nil then
    frmBuscaMovimento := TfrmBuscaMovimento.Create(Self);

  if frmBuscaMovimento.ShowModal = mrOk then begin
    edtcodigo.Text  := frmBuscaMovimento._Codigo;
    Vkey := 13;
    edtcodigoKeyDown(Sender,vkey,vShift);
  end;
  frmBuscaMovimento := nil;
end;

end.
