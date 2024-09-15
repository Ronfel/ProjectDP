unit uMediatorPattern;

interface

type
  // Interface para o Mediador
  IMediator = interface
    ['{D9300BD0-F5D8-42B5-9C0F-F58B3F6E5D32}']
    procedure Notify(Sender: TObject; AEvent: string);
  end;

  // Classe base para componentes que interagem com o Mediador
  TComponent = class
  private
    FMediator: IMediator;
  protected
    procedure SetMediator(AMediator: IMediator);
  public
    property Mediator: IMediator read FMediator write SetMediator;
  end;

  // Componente específico (Caixa de Texto)
  TTextBox = class(TComponent)
  private
    FText: string;
    procedure SetText(const Value: string);
  public
    property Text: string read FText write SetText;
  end;

  // Componente específico (Botão)
  TButton = class(TComponent)
  private
    procedure Click;
  public
    procedure SimulateClick;
  end;

  // Mediador concreto
  TConcreteMediator = class(TInterfacedObject, IMediator)
  private
    FTextBox: TTextBox;
    FButton: TButton;
  public
    constructor Create(ATextBox: TTextBox; AButton: TButton);
    procedure Notify(Sender: TObject; AEvent: string);
  end;

implementation

uses Vcl.Dialogs;

{ TComponent }

procedure TComponent.SetMediator(AMediator: IMediator);
begin
  FMediator := AMediator;
end;

{ TTextBox }

procedure TTextBox.SetText(const Value: string);
begin
  FText := Value;
  if Assigned(Mediator) then
    Mediator.Notify(Self, 'TextChanged');
end;

{ TButton }

procedure TButton.Click;
begin
  if Assigned(Mediator) then
    Mediator.Notify(Self, 'ButtonClicked');
end;

procedure TButton.SimulateClick;
begin
  Click;
end;

{ TConcreteMediator }

constructor TConcreteMediator.Create(ATextBox: TTextBox; AButton: TButton);
begin
  FTextBox := ATextBox;
  FButton := AButton;
  FTextBox.SetMediator(Self);
  FButton.SetMediator(Self);
end;

procedure TConcreteMediator.Notify(Sender: TObject; AEvent: string);
begin
  if (Sender is TTextBox) and (AEvent = 'TextChanged') then
    ShowMessage('Texto alterado: ' + TTextBox(Sender).Text)
  else if (Sender is TButton) and (AEvent = 'ButtonClicked') then
    ShowMessage('Botão clicado');
end;

end.

