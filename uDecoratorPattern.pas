unit uDecoratorPattern;

interface

type
  // Interface de bebida
  IBeverage = interface
    ['{AA52D0DA-1A39-4F1D-A8F5-F4C7955F091F}']
    function GetDescription: string;
    function GetCost: Double;
  end;

  // Implementação básica de uma bebida
  TBasicBeverage = class(TInterfacedObject, IBeverage)
  public
    function GetDescription: string;
    function GetCost: Double;
  end;

  // Decorador base
  TBeverageDecorator = class(TInterfacedObject, IBeverage)
  private
    FBeverage: IBeverage;
  public
    constructor Create(ABeverage: IBeverage);
    function GetDescription: string; virtual;
    function GetCost: Double; virtual;
  end;

  // Decorador de açúcar
  TSugarDecorator = class(TBeverageDecorator)
  public
    function GetDescription: string; override;
    function GetCost: Double; override;
  end;

  // Decorador de leite
  TMilkDecorator = class(TBeverageDecorator)
  public
    function GetDescription: string; override;
    function GetCost: Double; override;
  end;

implementation

{ TBasicBeverage }

function TBasicBeverage.GetDescription: string;
begin
  Result := 'Bebida básica';
end;

function TBasicBeverage.GetCost: Double;
begin
  Result := 5.0;  // Preço base
end;

{ TBeverageDecorator }

constructor TBeverageDecorator.Create(ABeverage: IBeverage);
begin
  FBeverage := ABeverage;
end;

function TBeverageDecorator.GetDescription: string;
begin
  Result := FBeverage.GetDescription;
end;

function TBeverageDecorator.GetCost: Double;
begin
  Result := FBeverage.GetCost;
end;

{ TSugarDecorator }

function TSugarDecorator.GetDescription: string;
begin
  Result := inherited GetDescription + ', com açúcar';
end;

function TSugarDecorator.GetCost: Double;
begin
  Result := inherited GetCost + 0.50;  // Preço do açúcar
end;

{ TMilkDecorator }

function TMilkDecorator.GetDescription: string;
begin
  Result := inherited GetDescription + ', com leite';
end;

function TMilkDecorator.GetCost: Double;
begin
  Result := inherited GetCost + 1.0;  // Preço do leite
end;

end.

