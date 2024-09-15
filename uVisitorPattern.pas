unit uVisitorPattern;

interface

type
  // Interface para Visitor
  IVisitor = interface
    ['{B0C1F5F2-7E9D-4C1F-A64F-8790C6758B08}']
    procedure VisitElementA;
    procedure VisitElementB;
  end;

  // Interface para Elementos
  IElement = interface
    ['{76EFA5A1-15CE-4C68-87F2-9C93A6C7A65E}']
    procedure Accept(Visitor: IVisitor);
  end;

  // Elemento concreto A
  TElementA = class(TInterfacedObject, IElement)
  public
    procedure Accept(Visitor: IVisitor);
  end;

  // Elemento concreto B
  TElementB = class(TInterfacedObject, IElement)
  public
    procedure Accept(Visitor: IVisitor);
  end;

  // Visitor concreto
  TVisitor = class(TInterfacedObject, IVisitor)
    procedure VisitElementA;
    procedure VisitElementB;
  end;

implementation

uses VCL.Dialogs;

{ TElementA }

procedure TElementA.Accept(Visitor: IVisitor);
begin
  Visitor.VisitElementA;
end;

{ TElementB }

procedure TElementB.Accept(Visitor: IVisitor);
begin
  Visitor.VisitElementB;
end;

{ TVisitor }

procedure TVisitor.VisitElementA;
begin
  ShowMessage('Visitando Elemento A');
end;

procedure TVisitor.VisitElementB;
begin
  ShowMessage('Visitando Elemento B');
end;

end.

