unit uStrategyPattern;

interface

type
  IDiscountStrategy = interface
    ['{96A59EC5-1548-4B43-A74E-A7D6CB1E14B4}']
    function CalculateDiscount(Amount: Double): Double;
  end;

  TPercentageDiscount = class(TInterfacedObject, IDiscountStrategy)
  public
    function CalculateDiscount(Amount: Double): Double;
  end;

  TFixedDiscount = class(TInterfacedObject, IDiscountStrategy)
  public
    function CalculateDiscount(Amount: Double): Double;
  end;

  TShoppingCart = class
  private
    FDiscountStrategy: IDiscountStrategy;
  public
    constructor Create(ADiscountStrategy: IDiscountStrategy);
    procedure SetDiscountStrategy(ADiscountStrategy: IDiscountStrategy);
    function GetTotalWithDiscount(Amount: Double): Double;
  end;

implementation

{ TPercentageDiscount }

function TPercentageDiscount.CalculateDiscount(Amount: Double): Double;
begin
  Result := Amount * 0.95; // 5% de desconto
end;

{ TFixedDiscount }

function TFixedDiscount.CalculateDiscount(Amount: Double): Double;
begin
  Result := Amount - 50;  // Desconto fixo de 50 reais
end;

{ TShoppingCart }

constructor TShoppingCart.Create(ADiscountStrategy: IDiscountStrategy);
begin
  FDiscountStrategy := ADiscountStrategy;
end;

procedure TShoppingCart.SetDiscountStrategy(ADiscountStrategy: IDiscountStrategy);
begin
  FDiscountStrategy := ADiscountStrategy;
end;

function TShoppingCart.GetTotalWithDiscount(Amount: Double): Double;
begin
  Result := FDiscountStrategy.CalculateDiscount(Amount);
end;

end.

