unit uIteratorPattern;

interface

type
  // Interface para o iterador
  IIterator = interface
    ['{A2D2BDE2-5365-48DA-B233-0BD03A8307C1}']
    function HasNext: Boolean;
    function Next: string;
  end;

  // Interface para a coleção
  IAggregate = interface
    ['{A56545DB-799A-4FA7-BFA3-34888C72D258}']
    function CreateIterator: IIterator;
    procedure AddItem(const AItem: string);
  end;

  // Implementação concreta do iterador
  TListIterator = class(TInterfacedObject, IIterator)
  private
    FItems: TArray<string>;
    FPosition: Integer;
  public
    constructor Create(const AItems: TArray<string>);
    function HasNext: Boolean;
    function Next: string;
  end;

  // Implementação concreta da coleção
  TListAggregate = class(TInterfacedObject, IAggregate)
  private
    FItems: TArray<string>;
  public
    function CreateIterator: IIterator;
    procedure AddItem(const AItem: string);
  end;

implementation

{ TListIterator }

constructor TListIterator.Create(const AItems: TArray<string>);
begin
  FItems := Copy(AItems, 0, Length(AItems));
  FPosition := 0;
end;

function TListIterator.HasNext: Boolean;
begin
  Result := FPosition < Length(FItems);
end;

function TListIterator.Next: string;
begin
  Result := FItems[FPosition];
  Inc(FPosition);
end;

{ TListAggregate }

procedure TListAggregate.AddItem(const AItem: string);
begin
  SetLength(FItems, Length(FItems) + 1);
  FItems[High(FItems)] := AItem;
end;

function TListAggregate.CreateIterator: IIterator;
begin
  Result := TListIterator.Create(FItems);
end;

end.

