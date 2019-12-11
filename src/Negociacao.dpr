program Negociacao;

uses
  Forms,
  principal in 'principal.pas' {Form1},
  biblioteca in 'biblioteca.pas',
  conexao in 'conexao.pas' {dmConexao: TDataModule},
  produtor in 'produtor.pas' {frmProdutor},
  PesqDistribuidor in 'PesqDistribuidor.pas' {frmBuscaDistribuidor},
  PesqProdutor in 'PesqProdutor.pas' {frmBuscaProdutor},
  distribuidor in 'distribuidor.pas' {frmDistribuidor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
