unit uAbstractFactoryPattern;

interface

type
  // Interfaces para os produtos
  IButton = interface
    ['{E3C3B3F8-4F53-4DBE-BF61-BFB8F7B36D39}']
    procedure Render;
  end;

  IWindow = interface
    ['{D5D8A5A8-7B8C-4CFC-AF0A-FC8B1A7F54C9}']
    procedure Render;
  end;

  // Factory abstrata para criar famílias de produtos
  IGUIFactory = interface
    ['{7CC0E2E8-9341-48A3-8965-82CE7E5C4EFC}']
    function CreateButton: IButton;
    function CreateWindow: IWindow;
  end;

  // Produtos concretos para a plataforma Windows
  TWindowsButton = class(TInterfacedObject, IButton)
    procedure Render;
  end;

  TWindowsWindow = class(TInterfacedObject, IWindow)
    procedure Render;
  end;

  // Produtos concretos para a plataforma Mac
  TMacButton = class(TInterfacedObject, IButton)
    procedure Render;
  end;

  TMacWindow = class(TInterfacedObject, IWindow)
    procedure Render;
  end;

  // Factory concreta para criar produtos Windows
  TWindowsFactory = class(TInterfacedObject, IGUIFactory)
    function CreateButton: IButton;
    function CreateWindow: IWindow;
  end;

  // Factory concreta para criar produtos Mac
  TMacFactory = class(TInterfacedObject, IGUIFactory)
    function CreateButton: IButton;
    function CreateWindow: IWindow;
  end;

implementation

uses
  Vcl.Dialogs;

{ TWindowsButton }

procedure TWindowsButton.Render;
begin
  ShowMessage('Renderizando botão do Windows');
end;

{ TWindowsWindow }

procedure TWindowsWindow.Render;
begin
  ShowMessage('Renderizando janela do Windows');
end;

{ TMacButton }

procedure TMacButton.Render;
begin
  ShowMessage('Renderizando botão do Mac');
end;

{ TMacWindow }

procedure TMacWindow.Render;
begin
  ShowMessage('Renderizando janela do Mac');
end;

{ TWindowsFactory }

function TWindowsFactory.CreateButton: IButton;
begin
  Result := TWindowsButton.Create;
end;

function TWindowsFactory.CreateWindow: IWindow;
begin
  Result := TWindowsWindow.Create;
end;

{ TMacFactory }

function TMacFactory.CreateButton: IButton;
begin
  Result := TMacButton.Create;
end;

function TMacFactory.CreateWindow: IWindow;
begin
  Result := TMacWindow.Create;
end;

end.

