unit uObserverPattern;

interface

type
  IObserver = interface
    ['{A2C76F1A-BB5A-4F3A-AF58-16D5D8C8E414}']
    procedure Update(ANewPrice: Double);
  end;

  ISubject = interface
    ['{9D2F2BCB-9F5D-4CE5-9E0D-4420BEEA665E}']
    procedure RegisterObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObservers;
  end;

  TProduct = class(TInterfacedObject, ISubject)
  private
    FObservers: array of IObserver;
    FPrice: Double;
  public
    procedure RegisterObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObservers;
    procedure SetPrice(ANewPrice: Double);
  end;

  TCustomer = class(TInterfacedObject, IObserver)
  public
    procedure Update(ANewPrice: Double);
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TProduct }

procedure TProduct.RegisterObserver(AObserver: IObserver);
begin
  SetLength(FObservers, Length(FObservers) + 1);
  FObservers[High(FObservers)] := AObserver;
end;

procedure TProduct.RemoveObserver(AObserver: IObserver);
var
  i: Integer;
begin
  for i := 0 to High(FObservers) do
  begin
    if FObservers[i] = AObserver then
    begin
      FObservers[i] := FObservers[High(FObservers)];
      SetLength(FObservers, Length(FObservers) - 1);
      Break;
    end;
  end;
end;

procedure TProduct.NotifyObservers;
var
  i: Integer;
begin
  for i := 0 to High(FObservers) do
    FObservers[i].Update(FPrice);
end;

procedure TProduct.SetPrice(ANewPrice: Double);
begin
  FPrice := ANewPrice;
  NotifyObservers;
end;

{ TCustomer }

procedure TCustomer.Update(ANewPrice: Double);
begin
  ShowMessage('O novo preço do produto é: ' + FloatToStr(ANewPrice));
end;

end.

