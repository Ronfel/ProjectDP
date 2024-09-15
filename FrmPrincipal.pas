unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
    btnCommand: TButton;
    btnPrototype: TButton;
    btnState: TButton;
    btnTemplate: TButton;
    btnAbstractFactory: TButton;
    btnBuilder: TButton;
    btnBridge: TButton;
    btnComposite: TButton;
    btnProxy: TButton;
    btnFlyweight: TButton;
    btnChain: TButton;
    btnInterpreter: TButton;
    btnIterator: TButton;
    btnMediator: TButton;
    btnMemento: TButton;
    btnVisitor: TButton;
    btnFechar: TButton;
    procedure btnSingletonClick(Sender: TObject);
    procedure btnFactoryMethodClick(Sender: TObject);
    procedure btnNotifyObserversClick(Sender: TObject);
    procedure btnStrategyClick(Sender: TObject);
    procedure btnAdapterClick(Sender: TObject);
    procedure btnDecoratorClick(Sender: TObject);
    procedure btnFacadeClick(Sender: TObject);
    procedure btnCommandClick(Sender: TObject);
    procedure btnPrototypeClick(Sender: TObject);
    procedure btnStateClick(Sender: TObject);
    procedure btnTemplateClick(Sender: TObject);
    procedure btnAbstractFactoryClick(Sender: TObject);
    procedure btnBuilderClick(Sender: TObject);
    procedure btnBridgeClick(Sender: TObject);
    procedure btnCompositeClick(Sender: TObject);
    procedure btnFlyweightClick(Sender: TObject);
    procedure btnInterpreterClick(Sender: TObject);
    procedure btnChainClick(Sender: TObject);
    procedure btnProxyClick(Sender: TObject);
    procedure btnVisitorClick(Sender: TObject);
    procedure btnMediatorClick(Sender: TObject);
    procedure btnMementoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIteratorClick(Sender: TObject);
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
  uFacadePattern, uCommandPattern, uPrototypePattern,
  uStatePattern, uTemplateMethodPattern, uAbstractFactoryPattern,
  uBuilderPattern, uBridgePattern, uCompositePattern, uFlyweightPattern,
  uInterpreterPattern, uChainOfResponsibilityPattern, uProxyPattern,
  uVisitorPattern, uMementoPattern, uIteratorPattern, uMediatorPattern;

{$R *.dfm}

procedure TFormPrincipal.btnAbstractFactoryClick(Sender: TObject);
var
  Factory: IGUIFactory;
  Button: IButton;
  Window: IWindow;
begin
  // Escolher a fábrica de acordo com a plataforma
  Factory := TWindowsFactory.Create; // ou TMacFactory.Create para Mac

  // Criar produtos
  Button := Factory.CreateButton;
  Window := Factory.CreateWindow;

  // Renderizar os produtos
  Button.Render;
  Window.Render;
end;

procedure TFormPrincipal.btnAdapterClick(Sender: TObject);
var
  Adaptee: TAdaptee;
  Adapter: ITarget;
begin
  Adaptee := TAdaptee.Create;
  Adapter := TAdapter.Create(Adaptee);

  ShowMessage('Adaptado: ' + Adapter.GetData);
end;

procedure TFormPrincipal.btnBridgeClick(Sender: TObject);
var
  Shape: TShape;
begin
  Shape := TCircle.Create(TRed.Create); // Círculo vermelho
  Shape.Draw;

  Shape := TSquare.Create(TBlue.Create); // Quadrado azul
  Shape.Draw;
end;

procedure TFormPrincipal.btnBuilderClick(Sender: TObject);
var
  Director: TCarDirector;
  SportCarBuilder: ICarBuilder;
  FamilyCarBuilder: ICarBuilder;
  Car: TCar;
begin
  Director := TCarDirector.Create;

  // Construindo um carro esportivo
  SportCarBuilder := TSportCarBuilder.Create;
  Director.SetBuilder(SportCarBuilder);
  Director.ConstructCar;
  Car := SportCarBuilder.GetCar;
  Car.ShowSpecifications;

  // Construindo um carro familiar
  FamilyCarBuilder := TFamilyCarBuilder.Create;
  Director.SetBuilder(FamilyCarBuilder);
  Director.ConstructCar;
  Car := FamilyCarBuilder.GetCar;
  Car.ShowSpecifications;
end;

procedure TFormPrincipal.btnChainClick(Sender: TObject);
var
  TechSupport, FinanceSupport: IHandler;
begin
  TechSupport := TTechSupportHandler.Create;
  FinanceSupport := TFinanceSupportHandler.Create;

  TechSupport.SetNextHandler(FinanceSupport);

  TechSupport.HandleRequest('Técnico');
  TechSupport.HandleRequest('Financeiro');
end;

procedure TFormPrincipal.btnCommandClick(Sender: TObject);
var
  Remote: TRemoteControl;
  LightOn, LightOff: ICommand;
begin
  Remote := TRemoteControl.Create;
  LightOn := TLightOnCommand.Create;
  LightOff := TLightOffCommand.Create;

  Remote.SetCommand(LightOn);
  Remote.PressButton;

  Remote.SetCommand(LightOff);
  Remote.PressButton;
end;

procedure TFormPrincipal.btnCompositeClick(Sender: TObject);
var
  RootFolder, SubFolder: IFileSystemComponent;
  File1, File2: IFileSystemComponent;
begin
  RootFolder := TFolder.Create('Pasta Raiz');
  SubFolder := TFolder.Create('Subpasta 1');
  File1 := TFile.Create('Arquivo 1.txt');
  File2 := TFile.Create('Arquivo 2.txt');

  (RootFolder as TFolder).Add(SubFolder);
  (SubFolder as TFolder).Add(File1);
  (RootFolder as TFolder).Add(File2);

  RootFolder.Display;
end;

procedure TFormPrincipal.btnDecoratorClick(Sender: TObject);
var
  Beverage: IBeverage;
begin
  Beverage := TBasicBeverage.Create;
  Beverage := TSugarDecorator.Create(Beverage);
  Beverage := TMilkDecorator.Create(Beverage);

  ShowMessage(Beverage.GetDescription + ' custa: ' +
    FloatToStr(Beverage.GetCost));
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

procedure TFormPrincipal.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormPrincipal.btnFlyweightClick(Sender: TObject);
var
  Factory: TTreeFactory;
  Tree: ITree;
begin
  Factory := TTreeFactory.Create;

  // Reutilizando objetos de árvores
  Tree := Factory.GetTree('Pinheiro');
  Tree.Render(10, 20);

  Tree := Factory.GetTree('Carvalho');
  Tree.Render(30, 40);

  Tree := Factory.GetTree('Pinheiro');
  Tree.Render(50, 60);
end;

procedure TFormPrincipal.btnInterpreterClick(Sender: TObject);
var
  Expression: IExpression;
begin
  Expression := TAddExpression.Create(TNumber.Create(10), TNumber.Create(20));
  ShowMessage('Resultado: ' + IntToStr(Expression.Interpret));
end;

procedure TFormPrincipal.btnIteratorClick(Sender: TObject);
var
  Aggregate: IAggregate;
  Iterator: IIterator;
begin
  // Criando a coleção
  Aggregate := TListAggregate.Create;
  Aggregate.AddItem('Item 1');
  Aggregate.AddItem('Item 2');
  Aggregate.AddItem('Item 3');

  // Criando o iterador
  Iterator := Aggregate.CreateIterator;

  // Percorrendo a coleção
  while Iterator.HasNext do
  begin
    ShowMessage(Iterator.Next);
  end;

end;

procedure TFormPrincipal.btnMediatorClick(Sender: TObject);
var
  TextBox: TTextBox;
  Button: TButton;
  Mediator: IMediator;
begin
  TextBox := TTextBox.Create;
  Button := TButton.Create;
  Mediator := TConcreteMediator.Create(TextBox, Button);

  TextBox.Text := 'Novo Texto';  // Mediador irá notificar sobre a mudança de texto
  Button.SimulateClick;          // Mediador irá notificar sobre o clique do botão
end;

procedure TFormPrincipal.btnMementoClick(Sender: TObject);
var
  Editor: TEditor;
  Memento: TMemento;
begin
  Editor := TEditor.Create;
  Editor.SetText('Texto Inicial');
  Memento := Editor.CreateMemento;

  Editor.SetText('Texto Alterado');
  ShowMessage('Texto Atual: ' + Editor.Text);

  Editor.RestoreMemento(Memento);
  ShowMessage('Texto Restaurado: ' + Editor.Text);
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

procedure TFormPrincipal.btnPrototypeClick(Sender: TObject);
var
  Prototype1, Prototype2: IPrototype;
begin
  Prototype1 := TConcretePrototype.Create('Objeto Original');
  Prototype2 := Prototype1.Clone;

  ShowMessage('Valor do Protótipo Original: ' +
    (Prototype1 as TConcretePrototype).GetValue);
  ShowMessage('Valor do Protótipo Clonado: ' +
    (Prototype2 as TConcretePrototype).GetValue);
end;

procedure TFormPrincipal.btnProxyClick(Sender: TObject);
var
  Image: IImage;
begin
  Image := TImageProxy.Create('foto.jpg');
  Image.Display;  // A imagem será carregada aqui
  Image.Display;  // Aqui, a imagem já está carregada e só é exibida
end;

procedure TFormPrincipal.btnSingletonClick(Sender: TObject);
begin
  TSingleton.GetInstance.TestMetodo;
end;

procedure TFormPrincipal.btnStateClick(Sender: TObject);
var
  VendingMachine: TVendingMachine;
begin
  VendingMachine := TVendingMachine.Create;
  VendingMachine.SetState(TNoCoinState.Create(VendingMachine));

  VendingMachine.InsertCoin;
  VendingMachine.Dispense;
  VendingMachine.EjectCoin;
end;

procedure TFormPrincipal.btnStrategyClick(Sender: TObject);
var
  Cart: TShoppingCart;
  Amount: Double;
begin
  Amount := 500; // Valor original

  Cart := TShoppingCart.Create(TPercentageDiscount.Create);
  ShowMessage('Total com desconto percentual: ' +
    FloatToStr(Cart.GetTotalWithDiscount(Amount)));

  Cart.SetDiscountStrategy(TFixedDiscount.Create);
  ShowMessage('Total com desconto fixo: ' +
    FloatToStr(Cart.GetTotalWithDiscount(Amount)));
end;

procedure TFormPrincipal.btnTemplateClick(Sender: TObject);
var
  Tea: TCaffeineBeverage;
  Coffee: TCaffeineBeverage;
begin
  Tea := TTea.Create;
  Coffee := TCoffee.Create;

  ShowMessage('Preparando chá:');
  Tea.PrepareRecipe;

  ShowMessage('Preparando café:');
  Coffee.PrepareRecipe;
end;

procedure TFormPrincipal.btnVisitorClick(Sender: TObject);
var
  Visitor: IVisitor;
  ElementA: IElement;
  ElementB: IElement;
begin
  Visitor := TVisitor.Create;
  ElementA := TElementA.Create;
  ElementB := TElementB.Create;

  // Visitar Elemento A
  ElementA.Accept(Visitor);

  // Visitar Elemento B
  ElementB.Accept(Visitor);
end;

end.
