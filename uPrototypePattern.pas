unit uPrototypePattern;

interface

type
  // Interface de protótipo que declara o método Clone
  IPrototype = interface
    ['{21C333BE-77F9-4D58-8A33-ABB3A36D4ACB}']
    function Clone: IPrototype;
  end;

  // Classe concreta que implementa a interface IPrototype
  TConcretePrototype = class(TInterfacedObject, IPrototype)
  private
    FValue: string;
  public
    constructor Create(AValue: string);
    function Clone: IPrototype;
    function GetValue: string;
  end;

implementation

{ TConcretePrototype }

constructor TConcretePrototype.Create(AValue: string);
begin
  FValue := AValue;
end;

function TConcretePrototype.Clone: IPrototype;
begin
  Result := TConcretePrototype.Create(FValue);
end;

function TConcretePrototype.GetValue: string;
begin
  Result := FValue;
end;

end.

