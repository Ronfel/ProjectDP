unit uCommandPattern;

interface

type
  ICommand = interface
    ['{BD78E414-4D15-4D86-AF62-889B512FEBE1}']
    procedure Execute;
  end;

  // Comando para ligar a luz
  TLightOnCommand = class(TInterfacedObject, ICommand)
  public
    procedure Execute;
  end;

  // Comando para desligar a luz
  TLightOffCommand = class(TInterfacedObject, ICommand)
  public
    procedure Execute;
  end;

  // Controle remoto que pode executar comandos
  TRemoteControl = class
  private
    FCommand: ICommand;
  public
    procedure SetCommand(ACommand: ICommand);
    procedure PressButton;
  end;

implementation

uses
  Vcl.Dialogs;

{ TLightOnCommand }

procedure TLightOnCommand.Execute;
begin
  ShowMessage('Luz ligada!');
end;

{ TLightOffCommand }

procedure TLightOffCommand.Execute;
begin
  ShowMessage('Luz desligada!');
end;

{ TRemoteControl }

procedure TRemoteControl.SetCommand(ACommand: ICommand);
begin
  FCommand := ACommand;
end;

procedure TRemoteControl.PressButton;
begin
  FCommand.Execute;
end;

end.

