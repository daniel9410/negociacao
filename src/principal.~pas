unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentao1: TMenuItem;
    Negociao1: TMenuItem;
    Relatorio1: TMenuItem;
    Relatorio2: TMenuItem;
    Produtor1: TMenuItem;
    Distribuidor1: TMenuItem;
    Produtos1: TMenuItem;
    Movimento1: TMenuItem;
    ADOQuery1: TADOQuery;
    procedure Produtor1Click(Sender: TObject);
    procedure Distribuidor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
   uses produtor, distribuidor;
{$R *.dfm}

procedure TForm1.Produtor1Click(Sender: TObject);
begin
  if frmProdutor = nil then
    frmProdutor := TfrmProdutor.Create(Self);

  frmProdutor.Show;
end;

procedure TForm1.Distribuidor1Click(Sender: TObject);
begin
  if frmDistribuidor = nil then
    frmDistribuidor := TfrmDistribuidor.Create(Self);

  frmDistribuidor.Show;
end;

end.
