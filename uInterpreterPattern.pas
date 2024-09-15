unit uInterpreterPattern;

interface

type
  // Interface para express�o
  IExpression = interface
    ['{A8E365D9-7B64-4BCB-89E7-CDBF3EC2F15C}']
    function Interpret: Integer;
  end;

  // Express�o que representa um n�mero
  TNumber = class(TInterfacedObject, IExpression)
  private
    FValue: Integer;
  public
    constructor Create(AValue: Integer);
    function Interpret: Integer;
  end;

  // Express�o que representa a adi��o
  TAddExpression = class(TInterfacedObject, IExpression)
  private
    FLeft, FRight: IExpression;
  public
    constructor Create(ALeft, ARight: IExpression);
    function Interpret: Integer;
  end;

implementation

{ TNumber }

constructor TNumber.Create(AValue: Integer);
begin
  FValue := AValue;
end;

function TNumber.Interpret: Integer;
begin
  Result := FValue;
end;

{ TAddExpression }

constructor TAddExpression.Create(ALeft, ARight: IExpression);
begin
  FLeft := ALeft;
  FRight := ARight;
end;

function TAddExpression.Interpret: Integer;
begin
  Result := FLeft.Interpret + FRight.Interpret;
end;

end.

