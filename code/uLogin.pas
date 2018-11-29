unit uLogin;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uBD;

var BD: TuBD;
var ID: Integer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    LabeledEdit5: TLabeledEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses uTela;

procedure TForm1.Button1Click(Sender: TObject);
begin
   panel1.Visible := True;
 panel2.Visible := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  if (length(LabeledEdit4.Text) <= 5) and (length(LabeledEdit5.Text) <= 5) then
  begin

    if(LabeledEdit4.Text = LabeledEdit5.Text) then
    begin

          if(BD.verificaUsuario(LabeledEdit3.Text) = false) then
          begin

              BD.fazCadastro(LabeledEdit3.Text,LabeledEdit4.Text,RadioGroup1.ItemIndex);
              showmessage('Usuário '+LabeledEdit3.Text+' cadastrado com sucesso!');
              panel1.Visible := False;
              panel2.Visible := True;

          end
          else
          begin

              ShowMessage('Usuário'+LabeledEdit3.Text+' já existe');
          end;


    end
    else
    begin

        ShowMessage('As senhas não são iguais!');

    end;
  end
  else
  begin

    showmessage('Senha deve ser menor ou igual a 5!');

  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var x:integer;
begin

  if BD.verificaUsuario(LabeledEdit1.Text) = true then
  begin

      if((length(LabeledEdit4.Text) <= 5)) then
      begin
        if BD.FazLogin(LabeledEdit1.Text, LabeledEdit2.Text) = true then
        begin

         ID := BD.atualizaLogin(LabeledEdit1.Text,LabeledEdit2.Text);
         showmessage('Login Realizado com sucesso!');

         BD.modificaTelaIdioma(BD.consultaIdioma(ID));

         form1.Visible := False;
         form2.Show;
        end
        else
        begin
        ShowMessage('Senha inválida');
        end;
      end
      else
      begin
         showmessage('Senha deve ser menor ou igual a 5!');
      end;
  end
  else
  begin
    ShowMessage('Usuário '+LabeledEdit1.Text+' não encontrada');
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  BD := TuBD.create();
  panel1.Visible := False;
  panel2.Visible := True;

end;

end.
