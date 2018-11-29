unit uBD;
     //https://raw.githubusercontent.com/RaffaelSchemmer/A3/master/Docs/SQL.txt
interface

uses   Vcl.Forms,Dialogs, System.SysUtils, Data.SqlExpr , DBxMysQL;

type

  TuBD = class

  private

  MySQLConnection: TSQLConnection;
  MySQLQuery: TSQLQuery;

  public

  constructor Create();
  function FazLogin(user:string; pass:string): boolean;
  function verificaUsuario(user:string): boolean;
  procedure fazCadastro(user:string; pass:string;idioma:integer);
  function atualizaLogin(user:string; pass:string):integer;
  function consultaIdioma(ID:integer):integer;
  procedure modificaTelaIdioma(Idioma:integer);
  PROCEDURE ATUALIZA_GRID;
  PROCEDURE REMOVE_CONTATO(i:string);
  PROCEDURE ATUALIZA_CADASTRO(Idioma:integer);
  procedure CADASTRAR_USER;
  procedure EDITAR_USER;
  function VERIFICAUSER_CONTATO(user:string):integer;
  end;

implementation
  uses uTela, uLogin;

{ TuBD }

function TuBD.atualizaLogin(user, pass: string): integer;
var
  query: string;
  cont: Integer;
begin

  MySQLQuery.SQL.Clear;

  query := 'SELECT * FROM USUARIO;';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  cont := 0;
  Result := -1;
  while not MySQLQuery.Eof do
  begin

    if ((UpperCase(MySQLQuery.FieldByName('USER').AsString) = UpperCase(user)))  AND
     ((UpperCase(MySQLQuery.FieldByName('PASSWORD').AsString) = UpperCase(pass))) then
    begin
      Result := MySQLQuery.FieldByName('ID').AsInteger;
      break;
    end;
    Inc(cont);
    MySQLQuery.Next;
  end;
  MySQLQuery.Close;

end;

procedure TuBD.ATUALIZA_CADASTRO(Idioma: integer);
var query : string;

begin

  MySQLQuery.SQL.Clear;
  //showmessage(inttostr(Idioma));
  query := 'SELECT * FROM IDIOMA WHERE ID='+Inttostr(Idioma)+';';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  form2.Caption := MySQLQuery.FieldByName('NOMEFORM').AsString;
  form2.TabSheet1.Caption := MySQLQuery.FieldByName('SHEETCADASTRO').AsString;
  form2.lbNome.Caption :=  MySQLQuery.FieldByName('NOMECADASTRO').AsString;
  form2.ldIdade.Caption :=  MySQLQuery.FieldByName('IDADECADASTRO').AsString;
  form2.lbFone.Caption :=  MySQLQuery.FieldByName('TELEFONECADASTRO').AsString;
  form2.RadioGroup1.Caption :=  MySQLQuery.FieldByName('ESTADOCADASTRO').AsString;
  form2.TabSheet2.Caption := MySQLQuery.FieldByName('SHEETVIEW').AsString;
  form2.RGsEXO.Caption :=  MySQLQuery.FieldByName('SEXOCADASTRO').AsString;
  form2.RGsEXO.items[0] :=  MySQLQuery.FieldByName('SEXOCADASTRO0').AsString;
  form2.RGsEXO.items[1] :=  MySQLQuery.FieldByName('SEXOCADASTRO1').AsString;
  form2.RGsEXO.items[2] :=  MySQLQuery.FieldByName('SEXOCADASTRO2').AsString;

  form2.RadioGroup1.items[0] :=  MySQLQuery.FieldByName('ESTADOCADASTRO0').AsString;
  form2.RadioGroup1.items[1] :=  MySQLQuery.FieldByName('ESTADOCADASTRO1').AsString;
  form2.RadioGroup1.items[2] :=  MySQLQuery.FieldByName('ESTADOCADASTRO2').AsString;

  form2.BitBtn2.Caption :=  MySQLQuery.FieldByName('BEDIT').AsString;
  form2.BitBtn1.Caption :=  MySQLQuery.FieldByName('BREMOVE').AsString;
  form2.btcadastrar.Caption :=  MySQLQuery.FieldByName('BCADASTRO').AsString;

  MySQLQuery.Close;


end;

procedure TuBD.ATUALIZA_GRID;
VAR A : INTEGER;
QUERY : STRING;
  IDIOMA: Integer;
begin


     FORM2.StrUser.RowCount :=   1;

     MySQLQuery.SQL.Clear;


     query := 'SELECT IDIOMA FROM USUARIO WHERE ID = '+ INTTOSTR(ID) + ';';
     MySQLQuery.SQL.Text := query;
     MySQLQuery.ExecSQL;
     MySQLQuery.Open;
     MySQLQuery.First;

     IDIOMA := MySQLQuery.FieldByName('IDIOMA').AsInteger;


     if IDIOMA = 0 then
     BEGIN
        FORM2.StrUser.Cells[0,0] := '   ID';
        FORM2.StrUser.Cells[1,0] := '  NOME';
        FORM2.StrUser.Cells[2,0] := 'SEXC';
        FORM2.StrUser.Cells[3,0] := 'IDADE';
        FORM2.StrUser.Cells[4,0] := 'CEP';
        FORM2.StrUser.Cells[5,0] := 'TELEFONE';
        FORM2.StrUser.Cells[6,0] := 'ESTADOCIVIL';

     END
     ELSE
     BEGIN
       FORM2.StrUser.Cells[0,0] := '   ID';
        FORM2.StrUser.Cells[1,0] := '   NAME';
        FORM2.StrUser.Cells[2,0] := '   SEX';
        FORM2.StrUser.Cells[3,0] := '   AGE';
        FORM2.StrUser.Cells[4,0] := '   CEP';
        FORM2.StrUser.Cells[5,0] := '   PHONE';
        FORM2.StrUser.Cells[6,0] := '   CIVILSTATE';
     END;

     MySQLQuery.SQL.Clear;
     query := 'SELECT * From CONTATO WHERE ID_USUARIO = ' + inttostr(ID) + ';';
     MySQLQuery.SQL.Text := query;
     MySQLQuery.ExecSQL;

     MySQLQuery.Open;
     MySQLQuery.First;
     A := 1;



     while not MySQLQuery.Eof do
	begin
      FORM2.StrUser.RowCount :=   FORM2.StrUser.RowCount +1;
      FORM2.StrUser.Cells[0,A] := MySQLQuery.FieldByName('ID').AsString;
      FORM2.StrUser.Cells[1,A] := MySQLQuery.FieldByName('NOME').AsString;
       FORM2.StrUser.Cells[2,A] := MySQLQuery.FieldByName('SEXO').AsString;
       FORM2.StrUser.Cells[3,A] := MySQLQuery.FieldByName('IDADE').AsString;
       FORM2.StrUser.Cells[4,A] := MySQLQuery.FieldByName('CEP').AsString;
       FORM2.StrUser.Cells[5,A] := MySQLQuery.FieldByName('TELEFONE').AsString;
       FORM2.StrUser.Cells[6,A] := MySQLQuery.FieldByName('ESTADOCIVIL').AsString;


	    MySQLQuery.Next;
      A :=  A + 1;



	end;

end;

procedure TuBD.CADASTRAR_USER;
var
  query: string;
begin

    MySQLQuery.SQL.Clear;
    MySQLQuery.SQL.Add('INSERT INTO CONTATO (NOME,SEXO,IDADE,CEP, TELEFONE,ESTADOCIVIL,ID_USUARIO)');
    MySQLQuery.SQL.Add('VALUES (:NOME,:SEXO,:IDADE,:CEP,:TELEFONE,:ESTADOCIVIL,:ID_USUARIO)');
    MySQLQuery.Params[0].AsString := form2.maskedit1.text;
    MySQLQuery.Params[1].AsString := FORM2.rgSexo.Items[form2.rgSexo.ItemIndex];
    MySQLQuery.Params[2].AsString := FORM2.ednasci.Text;
    MySQLQuery.Params[3].AsString := FORM2.maskedit2.Text;
    MySQLQuery.Params[4].AsString := FORM2.edfone.Text;
    MySQLQuery.Params[5].AsString := FORM2.radiogroup1.items[form2.rgSexo.ItemIndex];
    MySQLQuery.Params[6].AsInteger := ID;
    MySQLQuery.ExecSQL;
    MySQLQuery.Close;
    showmessage('Contato '+form2.maskedit1.text+ ' cadastrado com sucesso!');
    ATUALIZA_GRID();
    FORM2.TabSheet2.Show;
    MySQLQuery.Close;

end;

function TuBD.consultaIdioma(ID: integer): integer;
var
  query: string;
  cont: Integer;
begin

  MySQLQuery.SQL.Clear;

  query := 'SELECT IDIOMA FROM USUARIO WHERE ID='+inttostr(ID)+';';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  Result := MySQLQuery.FieldByName('IDIOMA').AsInteger;

  MySQLQuery.Close;

end;

constructor TuBD.Create();
begin
  MySQLConnection := TSQLConnection.Create(MySQLConnection);
  MySQLConnection.DriverName := 'MySQL';
  MySQLConnection.GetDriverFunc := 'getSQLDriverMYSQL';
  MySQLConnection.LibraryName := 'dbxmys.dll';
  MySQLConnection.VendorLib := 'LIBMYSQL.dll';
  MySQLConnection.Params.Values['HostName'] := '35.199.122.71';
  MySQLConnection.Params.Values['User_Name'] := 'gabrielileonardo';
  MySQLConnection.Params.Values['Password'] := '!3nJsE';
  MySQLConnection.Params.Values['Database'] := 'gabrielileonardo';
  MySQLConnection.Params.Values['ServerCharSet'] := 'utf8';
  MySQLConnection.LoginPrompt := False;
  try
  begin

    MySQLConnection.Connected := True;
    MySQLQuery := TSQLQuery.Create(MySQLQuery);
    MySQLQuery.SQLConnection := MySQLConnection;
    showmessage('Banco de Dados Google Ok!');

  end;
  except on E: Exception do
  begin

  end;

  end;
end;

procedure TuBD.EDITAR_USER;
var
    query: string;
begin

    MySQLQuery.SQL.Clear;
    // MySQLQuery.SQL.Add('UPDATE CONTATO SET (NOME,SEXO,IDADE,CEP, TELEFONE,ESTADOCIVIL,ID_USUARIO)');
    // MySQLQuery.SQL.Add('VALUES (:NOME,:SEXO,:IDADE,:CEP,:TELEFONE,:ESTADOCIVIL,:ID)WHERE ID = :ID_USUARIO');
    showmessage(inttostr(ID) + ' ' + FORM2.StrUser.cells[0,Form2.StrUser.Row]);
    MySQLQuery.SQL.Add('UPDATE CONTATO SET NOME = :NOME , SEXO = :SEXO , IDADE = :IDADE , CEP = :CEP , TELEFONE = :TELEFONE , ESTADOCIVIL = :ESTADOCIVIL , ID_USUARIO = :A WHERE ID = :B AND ID_USUARIO = :C');

    MySQLQuery.Params[0].AsString := form2.maskedit1.text;
    MySQLQuery.Params[1].AsString := FORM2.rgSexo.Items[form2.rgSexo.ItemIndex];
    MySQLQuery.Params[2].AsInteger := strtoint(FORM2.ednasci.Text);
    MySQLQuery.Params[3].AsString := FORM2.maskedit2.Text;
    MySQLQuery.Params[4].AsInteger := strtoint(FORM2.edfone.Text);
    MySQLQuery.Params[5].AsString := FORM2.radiogroup1.items[form2.radiogroup1.ItemIndex];
    MySQLQuery.Params[6].AsInteger := ID;
    MySQLQuery.Params[7].AsInteger := strtoint(FORM2.StrUser.Cells[0,Form2.StrUser.Row]);
    MySQLQuery.Params[8].AsInteger := ID;

    MySQLQuery.ExecSQL;
    MySQLQuery.Close;
    showmessage('Contato '+form2.maskedit1.text+ ' editado com sucesso!');
    ATUALIZA_GRID();
    FORM2.TabSheet2.Show;


end;

procedure TuBD.fazCadastro(user, pass: string;idioma:integer);
var
  query: string;
begin

  MySQLQuery.SQL.Clear;

  MySQLQuery.SQL.Add('INSERT INTO USUARIO (USER,PASSWORD,IDIOMA)');
  MySQLQuery.SQL.Add('VALUES (:USER, :PASSWORD, :IDIOMA)');
	MySQLQuery.Params[0].AsString := user;
  MySQLQuery.Params[1].AsString := pass;
  MySQLQuery.Params[2].AsInteger := idioma;
  MySQLQuery.ExecSQL;
  MySQLQuery.Close;

end;

function TuBD.FazLogin(user, pass: string): boolean;
var
  query: string;
  cont: Integer;
begin

  MySQLQuery.SQL.Clear;

  query := 'SELECT * FROM USUARIO;';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;
  cont := 0;
  Result := false;
  while not MySQLQuery.Eof do
  begin

    if ((UpperCase(MySQLQuery.FieldByName('USER').AsString) = UpperCase(user)))  AND
     ((UpperCase(MySQLQuery.FieldByName('PASSWORD').AsString) = UpperCase(pass))) then
    begin
      Result := true;
      break;
    end;
    Inc(cont);
    MySQLQuery.Next;
  end;
  MySQLQuery.Close;

end;

procedure TuBD.modificaTelaIdioma( Idioma: integer);
var
  query: string;
begin

  MySQLQuery.SQL.Clear;

  query := 'SELECT * FROM IDIOMA WHERE ID='+Inttostr(Idioma)+';';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  form2.Caption := MySQLQuery.FieldByName('NOMEFORM').AsString;
  form2.TabSheet1.Caption := MySQLQuery.FieldByName('SHEETCADASTRO').AsString;
  MySQLQuery.Close;

end;

procedure TuBD.REMOVE_CONTATO(i:string);
var
  query: string;
begin
   MySQLQuery.SQL.Clear;

   query := 'DELETE FROM CONTATO WHERE ID = '+i+';';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;
  MySQLQuery.close;

end;

function TuBD.VERIFICAUSER_CONTATO(user:string): integer;
var
  query: string;
  cont: Integer;
begin

   MySQLQuery.SQL.Clear;
   query := 'SELECT * FROM CONTATO WHERE ID = ' + inttostr(ID) + ';';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  cont := 0;
  while not MySQLQuery.Eof do
  begin

    if ((UpperCase(MySQLQuery.FieldByName('NOME').AsString)) = UpperCase(user))  then
    begin
      Result := 1;
      exit;
    end;
    Inc(cont);
    MySQLQuery.Next;
  end;

  MySQLQuery.Close;
  Result := 0;

end;

function TuBD.verificaUsuario(user: string): boolean;
var
  query: string;
  cont: Integer;
begin

   MySQLQuery.SQL.Clear;
   query := 'SELECT * FROM USUARIO;';

  MySQLQuery.SQL.Text := query;
  MySQLQuery.ExecSQL;

  MySQLQuery.Open;
  MySQLQuery.First;

  cont := 0;
  Result := false;
  while not MySQLQuery.Eof do
  begin

    if ((UpperCase(MySQLQuery.FieldByName('USER').AsString)) = UpperCase(user))  then
    begin
      Result := true;
      break;
    end;
    Inc(cont);
    MySQLQuery.Next;
  end;

  MySQLQuery.Close;


end;

end.
