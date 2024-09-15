unit uBuilderPattern;

interface

type
  // Produto Carro
  TCar = class
  private
    FEngine: string;
    FColor: string;
    FWheels: string;
  public
    procedure SetEngine(AEngine: string);
    procedure SetColor(AColor: string);
    procedure SetWheels(AWheels: string);
    procedure ShowSpecifications;
  end;

  // Interface do Builder
  ICarBuilder = interface
    ['{B1A5DF86-FC67-45D8-A9C8-59652B9B69B2}']
    procedure BuildEngine;
    procedure BuildColor;
    procedure BuildWheels;
    function GetCar: TCar;
  end;

  // Builder concreto para um carro esportivo
  TSportCarBuilder = class(TInterfacedObject, ICarBuilder)
  private
    FCar: TCar;
  public
    constructor Create;
    procedure BuildEngine;
    procedure BuildColor;
    procedure BuildWheels;
    function GetCar: TCar;
  end;

  // Builder concreto para um carro familiar
  TFamilyCarBuilder = class(TInterfacedObject, ICarBuilder)
  private
    FCar: TCar;
  public
    constructor Create;
    procedure BuildEngine;
    procedure BuildColor;
    procedure BuildWheels;
    function GetCar: TCar;
  end;

  // Diretor que controla o processo de construção
  TCarDirector = class
  private
    FBuilder: ICarBuilder;
  public
    procedure SetBuilder(ABuilder: ICarBuilder);
    procedure ConstructCar;
  end;

implementation

uses
  Vcl.Dialogs;

{ TCar }

procedure TCar.SetEngine(AEngine: string);
begin
  FEngine := AEngine;
end;

procedure TCar.SetColor(AColor: string);
begin
  FColor := AColor;
end;

procedure TCar.SetWheels(AWheels: string);
begin
  FWheels := AWheels;
end;

procedure TCar.ShowSpecifications;
begin
  ShowMessage('Carro: ' + FEngine + ', ' + FColor + ', ' + FWheels);
end;

{ TSportCarBuilder }

constructor TSportCarBuilder.Create;
begin
  FCar := TCar.Create;
end;

procedure TSportCarBuilder.BuildEngine;
begin
  FCar.SetEngine('Motor V8');
end;

procedure TSportCarBuilder.BuildColor;
begin
  FCar.SetColor('Vermelho');
end;

procedure TSportCarBuilder.BuildWheels;
begin
  FCar.SetWheels('Rodas de liga leve');
end;

function TSportCarBuilder.GetCar: TCar;
begin
  Result := FCar;
end;

{ TFamilyCarBuilder }

constructor TFamilyCarBuilder.Create;
begin
  FCar := TCar.Create;
end;

procedure TFamilyCarBuilder.BuildEngine;
begin
  FCar.SetEngine('Motor 1.6');
end;

procedure TFamilyCarBuilder.BuildColor;
begin
  FCar.SetColor('Prata');
end;

procedure TFamilyCarBuilder.BuildWheels;
begin
  FCar.SetWheels('Rodas de aço');
end;

function TFamilyCarBuilder.GetCar: TCar;
begin
  Result := FCar;
end;

{ TCarDirector }

procedure TCarDirector.SetBuilder(ABuilder: ICarBuilder);
begin
  FBuilder := ABuilder;
end;

procedure TCarDirector.ConstructCar;
begin
  FBuilder.BuildEngine;
  FBuilder.BuildColor;
  FBuilder.BuildWheels;
end;

end.

