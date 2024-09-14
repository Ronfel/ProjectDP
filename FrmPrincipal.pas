unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    btnSingleton: TButton;
    btnFactoryMethod: TButton;
    btnNotifyObservers: TButton;
    btnStrategy: TButton;
    btnAdapter: TButton;
    btnDecorator: TButton;
    btnFacade: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure btnSingletonClick(Sender: TObject);
    procedure btnFactoryMethodClick(Sender: TObject);
    procedure btnNotifyObserversClick(Sender: TObject);
    procedure btnStrategyClick(Sender: TObject);
    procedure btnAdapterClick(Sender: TObject);
    procedure btnDecoratorClick(Sender: TObject);
    procedure btnFacadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uSingletonExample, uFactoryMethod, uObserverPattern,
  uStrategyPattern, uAdapterPattern, uDecoratorPattern,
  uFacadePattern;

{$R *.dfm}

procedure TFormPrincipal.btnAdapterClick(Sender: TObject);
var
  Adaptee: TAdaptee;
  Adapter: ITarget;
begin
  Adaptee := TAdaptee.Create;
  Adapter := TAdapter.Create(Adaptee);

  ShowMessage('Adaptado: ' + Adapter.GetData);
end;

procedure TFormPrincipal.btnDecoratorClick(Sender: TObject);
var
  Beverage: IBeverage;
begin
  Beverage := TBasicBeverage.Create;
  Beverage := TSugarDecorator.Create(Beverage);
  Beverage := TMilkDecorator.Create(Beverage);

  ShowMessage(Beverage.GetDescription + ' custa: ' + FloatToStr(Beverage.GetCost));
end;

procedure TFormPrincipal.btnFacadeClick(Sender: TObject);
var
  HomeTheater: THomeTheaterFacade;
begin
  HomeTheater := THomeTheaterFacade.Create;

  HomeTheater.StartMovie;

  HomeTheater.EndMovie;
end;

procedure TFormPrincipal.btnFactoryMethodClick(Sender: TObject);
var
  Vehicle: IVehicle;
  Factory: TVehicleFactory;
begin
  Factory := TVehicleFactory.Create;
  try
    Vehicle := Factory.CreateVehicle('Carro');
    Vehicle.Drive;

    Vehicle := Factory.CreateVehicle('Moto');
    Vehicle.Drive;
  finally
    Factory.Free;
  end;
end;

procedure TFormPrincipal.btnNotifyObserversClick(Sender: TObject);
var
  Product: TProduct;
  Customer1, Customer2: TCustomer;
begin
  Product := TProduct.Create;
  Customer1 := TCustomer.Create;
  Customer2 := TCustomer.Create;

  // Registra os observadores
  Product.RegisterObserver(Customer1);
  Product.RegisterObserver(Customer2);

  // Altera o preço e notifica os observadores
  Product.SetPrice(99.99);
end;

procedure TFormPrincipal.btnSingletonClick(Sender: TObject);
begin
   TSingleton.GetInstance.TestMetodo;
end;

procedure TFormPrincipal.btnStrategyClick(Sender: TObject);
var
  Cart: TShoppingCart;
  Amount: Double;
begin
  Amount := 500;  // Valor original

  Cart := TShoppingCart.Create(TPercentageDiscount.Create);
  ShowMessage('Total com desconto percentual: ' + FloatToStr(Cart.GetTotalWithDiscount(Amount)));

  Cart.SetDiscountStrategy(TFixedDiscount.Create);
  ShowMessage('Total com desconto fixo: ' + FloatToStr(Cart.GetTotalWithDiscount(Amount)));
end;

end.
