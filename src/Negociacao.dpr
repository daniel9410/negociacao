program Negociacao;

uses
  Forms,
  principal in 'principal.pas' {frmPrincipal},
  biblioteca in 'biblioteca.pas',
  conexao in 'conexao.pas' {dmConexao: TDataModule},
  produtor in 'produtor.pas' {frmProdutor},
  PesqDistribuidor in 'PesqDistribuidor.pas' {frmBuscaDistribuidor},
  PesqProdutor in 'PesqProdutor.pas' {frmBuscaProdutor},
  distribuidor in 'distribuidor.pas' {frmDistribuidor},
  produtos in 'produtos.pas' {frmProdutos},
  PesqProdutos in 'PesqProdutos.pas' {frmBuscaProdutos},
  movimento in 'movimento.pas' {frmMovimento},
  PesqMovimentacao in 'PesqMovimentacao.pas' {frmBuscaMovimento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
