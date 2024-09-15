unit uStatePattern;

interface

type
  // Interface de estado
  IState = interface
    ['{61A49DB7-A96D-44AC-8412-F31847DA9E37}']
    procedure InsertCoin;
    procedure EjectCoin;
    procedure Dispense;
  end;

  // Máquina de vendas que usa o State Pattern
  TVendingMachine = class
  private
    FState: IState;
  public
    procedure SetState(AState: IState);
    procedure InsertCoin;
    procedure EjectCoin;
    procedure Dispense;
  end;

  // Estados concretos
  TNoCoinState = class(TInterfacedObject, IState)
  private
    FVendingMachine: TVendingMachine;
  public
    constructor Create(AMachine: TVendingMachine);
    procedure InsertCoin;
    procedure EjectCoin;
    procedure Dispense;
  end;

  THasCoinState = class(TInterfacedObject, IState)
  private
    FVendingMachine: TVendingMachine;
  public
    constructor Create(AMachine: TVendingMachine);
    procedure InsertCoin;
    procedure EjectCoin;
    procedure Dispense;
  end;

implementation

uses
  Vcl.Dialogs;

{ TVendingMachine }

procedure TVendingMachine.SetState(AState: IState);
begin
  FState := AState;
end;

procedure TVendingMachine.InsertCoin;
begin
  FState.InsertCoin;
end;

procedure TVendingMachine.EjectCoin;
begin
  FState.EjectCoin;
end;

procedure TVendingMachine.Dispense;
begin
  FState.Dispense;
end;

{ TNoCoinState }

constructor TNoCoinState.Create(AMachine: TVendingMachine);
begin
  FVendingMachine := AMachine;
end;

procedure TNoCoinState.InsertCoin;
begin
  ShowMessage('Moeda inserida.');
  FVendingMachine.SetState(THasCoinState.Create(FVendingMachine));
end;

procedure TNoCoinState.EjectCoin;
begin
  ShowMessage('Nenhuma moeda para ejetar.');
end;

procedure TNoCoinState.Dispense;
begin
  ShowMessage('Insira uma moeda primeiro.');
end;

{ THasCoinState }

constructor THasCoinState.Create(AMachine: TVendingMachine);
begin
  FVendingMachine := AMachine;
end;

procedure THasCoinState.InsertCoin;
begin
  ShowMessage('Moeda já inserida.');
end;

procedure THasCoinState.EjectCoin;
begin
  ShowMessage('Moeda ejetada.');
  FVendingMachine.SetState(TNoCoinState.Create(FVendingMachine));
end;

procedure THasCoinState.Dispense;
begin
  ShowMessage('Produto dispensado.');
  FVendingMachine.SetState(TNoCoinState.Create(FVendingMachine));
end;

end.

