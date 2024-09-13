program ProjectDP;

uses
  Vcl.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {Form1},
  uSingletonExample in 'uSingletonExample.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
