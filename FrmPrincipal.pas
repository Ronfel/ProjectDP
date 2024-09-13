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
    procedure btnSingletonClick(Sender: TObject);
    procedure btnFactoryMethodClick(Sender: TObject);
    procedure btnNotifyObserversClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uSingletonExample, uFactoryMethod, uObserverPattern;

{$R *.dfm}

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

end.
