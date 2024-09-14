unit uFacadePattern;

interface

type
  // Subsistema 1: Televisão
  TTV = class
  public
    procedure TurnOn;
    procedure TurnOff;
  end;

  // Subsistema 2: Som
  TSoundSystem = class
  public
    procedure TurnOn;
    procedure TurnOff;
  end;

  // Fachada para o sistema de Home Theater
  THomeTheaterFacade = class
  private
    FTV: TTV;
    FSoundSystem: TSoundSystem;
  public
    constructor Create;
    procedure StartMovie;
    procedure EndMovie;
  end;

implementation

uses
  Vcl.Dialogs;

{ TTV }

procedure TTV.TurnOn;
begin
  ShowMessage('Ligando a TV...');
end;

procedure TTV.TurnOff;
begin
  ShowMessage('Desligando a TV...');
end;

{ TSoundSystem }

procedure TSoundSystem.TurnOn;
begin
  ShowMessage('Ligando o sistema de som...');
end;

procedure TSoundSystem.TurnOff;
begin
  ShowMessage('Desligando o sistema de som...');
end;

{ THomeTheaterFacade }

constructor THomeTheaterFacade.Create;
begin
  FTV := TTV.Create;
  FSoundSystem := TSoundSystem.Create;
end;

procedure THomeTheaterFacade.StartMovie;
begin
  FTV.TurnOn;
  FSoundSystem.TurnOn;
  ShowMessage('Pronto para assistir ao filme!');
end;

procedure THomeTheaterFacade.EndMovie;
begin
  FSoundSystem.TurnOff;
  FTV.TurnOff;
  ShowMessage('Filme finalizado!');
end;

end.

