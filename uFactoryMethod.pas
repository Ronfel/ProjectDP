unit uFactoryMethod;

interface

type
  IVehicle = interface
    ['{D8A9B167-2A73-4F54-B8D4-F58C44648F39}']
    procedure Drive;
  end;

  TCar = class(TInterfacedObject, IVehicle)
  public
    procedure Drive;
  end;

  TBike = class(TInterfacedObject, IVehicle)
  public
    procedure Drive;
  end;

  TVehicleFactory = class
  public
    function CreateVehicle(AType: string): IVehicle;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TCar }

procedure TCar.Drive;
begin
  ShowMessage('Dirigindo um carro!');
end;

{ TBike }

procedure TBike.Drive;
begin
  ShowMessage('Pilotando uma moto!');
end;

{ TVehicleFactory }

function TVehicleFactory.CreateVehicle(AType: string): IVehicle;
begin
  if AType = 'Carro' then
    Result := TCar.Create
  else if AType = 'Moto' then
    Result := TBike.Create
  else
    raise Exception.Create('Tipo de veículo desconhecido.');
end;

end.
