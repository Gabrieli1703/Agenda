unit uTela;
//https://raw.githubusercontent.com/RaffaelSchemmer/A3/master/Docs/SQL.txt//
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.StdCtrls, Data.SqlExpr , DBxMysQL,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TForm2 = class(TForm)
    pc1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    StrUser: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    lbNome: TLabel;
    lbCPF: TLabel;
    ldIdade: TLabel;
    lbFone: TLabel;
    edNasci: TEdit;
    edFone: TEdit;
    rgSexo: TRadioGroup;
    btCadastrar: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet2Show(Sender: TObject);
    procedure StrUserClick(Sender: TObject);
    procedure edNasciChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure btCadastrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    MySQLConnection: TSQLConnection;
  MySQLQuery: TSQLQuery;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Editar : Integer;
implementation
uses uLogin;

{$R *.dfm}


procedure TForm2.BitBtn1Click(Sender: TObject);
begin

   if (StrUser.Row = 0) and (StrUser.col = 0) then
   begin
      ShowMessage('Selecione um contato a ser removido!');
   end
   else
   begin

      if ( MessageDlg('Você tem certeza que deseja excluir o contato '+StrUser.Cells[1,StrUser.row]+' ?',mtConfirmation,[mbyes,mbno],0) = mryes) then
      begin

        uLogin.BD.REMOVE_CONTATO(StrUser.Cells[0,StrUser.row]);
        showmessage('Usuário '+StrUser.Cells[1,StrUser.row]+' removido com sucesso!');
        uLogin.BD.ATUALIZA_GRID;

      end;

   end;



 end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin

  if (StrUser.Row = 0) and (StrUser.col = 0) then
   begin
      ShowMessage('Selecione um contato a ser editado!');
   end
   else
   begin

      if ( MessageDlg('Você tem certeza que deseja editar o contato '+StrUser.Cells[1,StrUser.row]+' ?',mtConfirmation,[mbyes,mbno],0) = mryes) then
      begin

        Editar := 1;
        // Popular o Cadastro para Edição
       MaskEdit1.Text := StrUser.Cells[1,StrUser.Row];
       eDNasci.Text := StrUser.Cells[3,struser.row];
       maskedit2.text := StrUser.Cells[4,struser.row];
       edfone.Text := struser.Cells[5,struser.row];

       if (struser.Cells[2,struser.row] = 'Feminino') OR (struser.Cells[2,struser.row] = 'Woman') then
       begin
        rgsexo.ItemIndex := 0;
       end
       else if (struser.Cells[2,struser.row] = 'Masculino') OR (struser.Cells[2,struser.row] = 'Man') then
       begin
        rgsexo.ItemIndex := 1;
       end
       else
       begin
        rgsexo.ItemIndex := 2;
       end;

         if (struser.Cells[6,struser.row] = 'Casado') OR (struser.Cells[6,struser.row] = 'Married') then
       begin
        radiogroup1.ItemIndex := 0;
       end
       else if (struser.Cells[6,struser.row] = 'Solteiro') OR (struser.Cells[6,struser.row] = 'Single') then
       begin
        radiogroup1.ItemIndex := 1;
       end
       else
       begin
        radiogroup1.ItemIndex := 2;
       end;

       TabSheet1.Show;

      end;

   end;

end;

procedure TForm2.btCadastrarClick(Sender: TObject);
var   Fone, Idade : integer;
        cep : real;
         query: string;
begin



 if Editar = 1 then
  begin

    // BLOCO DA EDIÇÃO
    if   (MaskEdit1.Text <> '') then
       begin
            if (ednasci.Text <> '') then
             begin

               if ((strtoint(ednasci.text) > 0) AND (strtoint(ednasci.text) < 150)) then
               begin

                 if (Length(edfone.Text) > 8) AND (Length(edfone.Text) < 12) then
                 begin

                    if (MaskEdit2.Text <> '.-') then
                    begin

                      if uLogin.BD.VERIFICAUSER_CONTATO(MaskEdit1.Text) = 0 then
                      begin
                          uLogin.BD.EDITAR_USER;
                          showmessage('Usuário editado com sucesso!');
                      end
                      else
                      begin
                        showmessage(MaskEdit1.Text + ' já existe e não pode ser cadastrado!');
                      end;
                    end
                    else
                    begin
                       ShowMessage('CEP INVALIDO!');
                    end;

                 end
                 else
                 begin
                    ShowMessage('TEL INVALIDO!');
                 end;

             end
             else
             begin
               ShowMessage('IDADE INVÁLIDA!');
             end;

            end

          else
          begin
            ShowMessage('IDADE NÃO INFORMADA!');
          end;
       end;

  end
  else
  begin
       // BLOCO DE CADASTRADO
       if   (MaskEdit1.Text <> '') then
       begin
            if (ednasci.Text <> '') then
             begin

               if ((strtoint(ednasci.text) > 0) AND (strtoint(ednasci.text) < 150)) then
               begin

                 if (Length(edfone.Text) > 8) AND (Length(edfone.Text) < 12) then
                 begin

                    if (MaskEdit2.Text <> '.-') then
                    begin

                      if uLogin.BD.VERIFICAUSER_CONTATO(MaskEdit1.Text) = 0 then
                      begin
                          uLogin.BD.CADASTRAR_USER;
                      end
                      else
                      begin
                        showmessage(MaskEdit1.Text + ' já existe e não pode ser cadastrado!');
                      end;
                    end
                    else
                    begin
                       ShowMessage('CEP INVALIDO!');
                    end;

                 end
                 else
                 begin
                    ShowMessage('TEL INVALIDO!');
                 end;

             end
             else
             begin
               ShowMessage('IDADE INVÁLIDA!');
             end;

            end

          else
          begin
            ShowMessage('IDADE NÃO INFORMADA!');
          end;

      end
      else
      begin
        ShowMessage('NOME INVALIDO!');
      end;

  end;
  Editar := 0;

end;

procedure TForm2.edNasciChange(Sender: TObject);
var id: integer;
begin

         if Length(ednasci.Text) > 0 then
         begin
           id := strtoint(ednasci.Text);
           if (id < 1) and (id > 100)  then
           begin

              showmessage(inttostr(id) + 'A idade está fora do padrão!');

            end;
         end;

  end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Editar := 0;
  TabSheet2.Show;

end;

procedure TForm2.StrUserClick(Sender: TObject);
 var string1 : string;
begin


end;

procedure TForm2.TabSheet1Show(Sender: TObject);
begin
uLogin.BD.ATUALIZA_CADASTRO(BD.consultaIdioma(ID));
end;

procedure TForm2.TabSheet2Show(Sender: TObject);
begin
uLogin.BD.ATUALIZA_GRID
end;

end.
