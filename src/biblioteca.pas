unit biblioteca;

interface
  uses DB, ADODB,SysUtils,conexao, Variants,Windows, Controls, StdCtrls, Mask, Forms, Buttons, Graphics,
  DbCtrls, Classes, ComCtrls, FileCtrl, ExtCtrls,
  MaskUtils, Registry, ShDocVw, DBClient, CheckLst, ShellApi,
  DateUtils, IniFiles, msxmldom,
  xmldom, Messages, Math, SqlExpr, StrUtils, Printers;
  var _QExec: TADOQuery;

  procedure Atualizar(Tabela:string;Ch:array of string;VCh:array of variant;Par:array of string;Val:array of variant);
  procedure Apagar(Tabela:string;Ch:array of string;Val:array of variant);
  procedure Inserir(Tabela:string;Par:array of string;Val:array of variant);
  function Questionar(Mensagem:string;BotaoDefault:byte = 1):boolean;
implementation

function Questionar(Mensagem:string;BotaoDefault:byte = 1):boolean;
var vInt : Integer;
begin
  If (BotaoDefault=1) then
    vInt :=  MB_DEFBUTTON1
  else
    vInt := MB_DEFBUTTON2;
  Result:=(Application.MessageBox(Pchar(Mensagem),'Atenção', MB_YESNO +
            vInt +
            MB_ICONQUESTION + MB_TOPMOST) = MrYes);
end;

procedure Atualizar(Tabela:string;Ch:array of string;VCh:array of variant;Par:array of string;Val:array of variant);
var
  I: Integer;
  Primeiro: Boolean;
  SqlStr: String;
begin
  if High(Ch) > High(VCh) then
    raise Exception.Create('A quantidade de parâmetros chave está superior à de valores!')
  else if High(Ch) < High(VCh) then
    raise Exception.Create('A quantidade de parâmetros chave está inferior à de valores!')
  else if High(Par) > High(Val) then
    raise Exception.Create('A quantidade de parâmetros está superior à de valores!')
  else if High(Par) < High(Val) then
    raise Exception.Create('A quantidade de parâmetros está inferior à de valores!');

  // Colocando uma base de dados remota

  _QExec.Free;
  _QExec:=TADOQuery.Create(nil);
  _QExec.Connection:= dmConexao.con  ;
  _QExec.DisableControls;


  with _QExec do begin
    _QExec.Close;

    Sql.Clear;
    // Montando Sql de Update
    SqlStr:='UPDATE ' + Tabela+' SET ';
    Primeiro:=True;
    for I:=Low(Par) to High(Par) do begin
      if Par[I]<>'' then begin
        if Val[i]=Null then begin
          if Primeiro then begin
            SqlStr:=SqlStr + Par[I] + '= NULL';
            Primeiro:=False;
          end else
            SqlStr:=SqlStr + ',' + Par[I] + '= NULL';
          Par[i]:='';
        end else begin
          if Primeiro then begin
            SqlStr:=SqlStr + Par[I]+'=:'+Par[I];
            Primeiro:=False;
          end else
            SqlStr:=SqlStr + ',' + Par[I]+'=:'+Par[I];
        end;
      end;
    end;
    Sql.Add(SqlStr);

    // Montando o Where
    SqlStr:='';
    Primeiro:=True;
    for I:=Low(Ch) to High(Ch) do begin
      if Ch[I]<>'' then begin
        if Primeiro then begin
          SqlStr:='WHERE ' + Ch[I] + '=:y' + Ch[I];
          Primeiro:=False;
        end else
          SqlStr:=SqlStr + ' AND ' + Ch[I] + '=:y' + Ch[I];
      end;
    end;
    Sql.Add(SqlStr);

    // Passagem dos parâmetros


    for I := Low(Par) to High(Par) do begin
      if Par[I] <> '' then begin
        if VarType(Val[I]) = varByte then begin
          Parameters.ParamByName(Par[I]).DataType  :=ftInteger;
          Parameters.ParamByName(Par[I]).Value :=Val[I];
        end
        else
          Parameters.ParamByName(Par[I]).Value := Val[I];
      end;
    end;

    for I := Low(Ch) to High(Ch) do begin
      if Ch[I] <> '' then
        Parameters.ParamByName('y' + Ch[I]).Value := VCh[I];
    end;
    // Gravando dados
    ExecSql;
    Active := False;
    Sql.Clear;

  end;
end;

procedure Inserir(Tabela:string;Par:array of string;Val:array of variant);
var
  I: integer;
  Primeiro: boolean;
  SqlStr: string;
begin
  if High(Par) > High(Val) then
    raise Exception.Create('A quantidade de parâmetros está superior à de valores!')
  else if High(Par) < High(Val) then
    raise Exception.Create('A quantidade de parâmetros está inferior à de valores!');

  _QExec.Free;
  _QExec:=TADOQuery.Create(nil);
  _QExec.Connection:= dmConexao.con  ;
  _QExec.DisableControls;

  with _QExec do begin
    Active:=False;
    Sql.Clear;

    Connection:= dmConexao.con  ;

    // Montando Sql de Inserção
    Sql.Add('Insert Into ' + Tabela + '(');
    Primeiro:=True;
    SqlStr:='';
    for I:=Low(Par) to High(Par) do begin
      if Par[I]<>'' then begin
        if Primeiro then begin
          SqlStr:=SqlStr + Par[I];
          Primeiro:=False;
        end else
          SqlStr:=SqlStr + ',' + Par[I];
      end;
    end;

    Sql.Add(SqlStr + ')Values(');

    SqlStr:='';
    Primeiro:=True;
    for I:=Low(Par) to High(Par) do begin
      if Par[I]<>'' then begin
        if Val[i]= Null then begin
          if Primeiro then begin
            SqlStr:=SqlStr + 'NULL';
            Primeiro:=False;
          end
          else
            SqlStr:=SqlStr + ',NULL';
          Par[i]:='';
        end
        else begin
          if Primeiro then begin
            SqlStr:=SqlStr + ':' + Par[I];
            Primeiro:=False;
          end
          else
            SqlStr:=SqlStr + ',:' + Par[I];
        end;
      end;
    end;
    Sql.Add(SqlStr + ')');

    for I:=Low(Par) to High(Par) do begin
      if Par[I]<>'' then begin
        if VarType(Val[I]) = varByte then begin
          Parameters.ParamByName(Par[I]).DataType  :=ftInteger;
          Parameters.ParamByName(Par[I]).Value :=Val[I];
        end else
          Parameters.ParamByName(Par[I]).Value := Val[I];
      end;
    end;

    // Gravando dados
    ExecSql;

    Active:=False;
    Sql.Clear;
    // Voltando para a base de dados padrão

  end;
end;

procedure Apagar(Tabela:string;Ch:array of string;Val:array of variant);
var
  I: integer;
  Primeiro: boolean;
  SqlStr: string;
begin
  if High(Ch) > High(Val) then
    raise Exception.Create('A quantidade de parâmetros está superior à de valores!')
  else if High(Ch) < High(Val) then
    raise Exception.Create('A quantidade de parâmetros está inferior à de valores!');

  _QExec.Free;
  _QExec:=TADOQuery.Create(nil);
  _QExec.Connection:= dmConexao.con  ;
  _QExec.DisableControls;

  with _QExec do begin
    Active:=False;
    Sql.Clear;

    // Colocando uma base de dados remota
    Connection:= dmConexao.con  ;

    Sql.Clear;
    // Montando Sql de Delete
    SqlStr:='DELETE FROM ' + Tabela;
    Primeiro:=True;
    for I:=Low(Ch) to High(Ch) do begin
      if Ch[I]<>'' then begin
        if Primeiro then begin
          SqlStr:=SqlStr + ' WHERE ' + Ch[I] + '=:' + Ch[I];
          Primeiro:=False;
        end else
          SqlStr:=SqlStr + ' AND ' + Ch[I] + '=:' + Ch[I];
      end;
    end;
    Sql.Add(SqlStr);
    // Passagem dos parâmetros

    for I:=Low(Ch) to High(Ch) do begin
      if Ch[I]<>'' then
        Parameters.ParamByName(Ch[I]).Value:=Val[I];
    end;
    // Gravando dados
    ExecSql;

    Active:=False;
    Sql.Clear;
    // Voltando para a base de dados padrão


  end;
end;
end.
