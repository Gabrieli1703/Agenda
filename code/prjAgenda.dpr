program prjAgenda;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {Form1},
  uTela in 'uTela.pas' {Form2},
  uBD in 'uBD.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Obsidian');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
