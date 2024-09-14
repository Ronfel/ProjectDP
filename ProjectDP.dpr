program ProjectDP;

uses
  Vcl.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FormPrincipal},
  uSingletonExample in 'uSingletonExample.pas',
  uFactoryMethod in 'uFactoryMethod.pas',
  uObserverPattern in 'uObserverPattern.pas',
  uStrategyPattern in 'uStrategyPattern.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
