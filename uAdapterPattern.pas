unit uAdapterPattern;

interface

type
  // Interface de destino que o cliente espera
  ITarget = interface
    ['{E4418C29-5A39-4824-A291-845799F249A9}']
    function GetData: string;
  end;

  // Classe existente com uma interface incompatível
  TAdaptee = class
  public
    function SpecificRequest: string;
  end;

  // Adaptador que converte a interface
  TAdapter = class(TInterfacedObject, ITarget)
  private
    FAdaptee: TAdaptee;
  public
    constructor Create(AAdaptee: TAdaptee);
    function GetData: string;
  end;

implementation

{ TAdaptee }

function TAdaptee.SpecificRequest: string;
begin
  Result := 'Dados do Adaptee';
end;

{ TAdapter }

constructor TAdapter.Create(AAdaptee: TAdaptee);
begin
  FAdaptee := AAdaptee;
end;

function TAdapter.GetData: string;
begin
  Result := FAdaptee.SpecificRequest;
end;

end.

