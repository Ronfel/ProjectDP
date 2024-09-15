unit uFlyweightPattern;

interface

type
  // Interface para �rvore
  ITree = interface
    ['{E1A77E92-9774-4E7D-9B7D-0AC71AA46524}']
    procedure Render(X, Y: Integer);
  end;

  // Implementa��o concreta de uma �rvore
  TTree = class(TInterfacedObject, ITree)
  private
    FTreeType: string;
  public
    constructor Create(ATreeType: string);
    procedure Render(X, Y: Integer);
  end;

  // Flyweight Factory que reutiliza as �rvores
  TTreeFactory = class
  private
    FTreeCache: array of ITree;
  public
    function GetTree(ATreeType: string): ITree;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TTree }

constructor TTree.Create(ATreeType: string);
begin
  FTreeType := ATreeType;
end;

procedure TTree.Render(X, Y: Integer);
begin
  ShowMessage(Format('Renderizando %s na posi��o (%d, %d)', [FTreeType, X, Y]));
end;

{ TTreeFactory }

function TTreeFactory.GetTree(ATreeType: string): ITree;
var
  Tree: ITree;
  I: Integer;
begin
  for I := 0 to High(FTreeCache) do
    if FTreeCache[I] is TTree then
      if (FTreeCache[I] as TTree).FTreeType = ATreeType then
        Exit(FTreeCache[I]);

  Tree := TTree.Create(ATreeType);
  SetLength(FTreeCache, Length(FTreeCache) + 1);
  FTreeCache[High(FTreeCache)] := Tree;

  Result := Tree;
end;

end.

