unit uChainOfResponsibilityPattern;

interface

type
  // Interface para manipuladores
  IHandler = interface
    ['{70F821D4-8BC8-4A53-B749-F76FCF2CFF29}']
    procedure SetNextHandler(AHandler: IHandler);
    procedure HandleRequest(ARequest: string);
  end;

  // Manipulador base
  THandler = class(TInterfacedObject, IHandler)
  private
    FNextHandler: IHandler;
  public
    procedure SetNextHandler(AHandler: IHandler);
    procedure HandleRequest(ARequest: string); virtual;
  end;

  // Manipulador de Suporte Técnico
  TTechSupportHandler = class(THandler)
    procedure HandleRequest(ARequest: string); override;
  end;

  // Manipulador de Suporte Financeiro
  TFinanceSupportHandler = class(THandler)
    procedure HandleRequest(ARequest: string); override;
  end;

implementation

uses
  Vcl.Dialogs;

{ THandler }

procedure THandler.SetNextHandler(AHandler: IHandler);
begin
  FNextHandler := AHandler;
end;

procedure THandler.HandleRequest(ARequest: string);
begin
  if Assigned(FNextHandler) then
    FNextHandler.HandleRequest(ARequest);
end;

{ TTechSupportHandler }

procedure TTechSupportHandler.HandleRequest(ARequest: string);
begin
  if ARequest = 'Técnico' then
    ShowMessage('Suporte Técnico lidando com a solicitação.')
  else
    inherited;
end;

{ TFinanceSupportHandler }

procedure TFinanceSupportHandler.HandleRequest(ARequest: string);
begin
  if ARequest = 'Financeiro' then
    ShowMessage('Suporte Financeiro lidando com a solicitação.')
  else
    inherited;
end;

end.

