unit uBridgePattern;

interface

type
  // Interface para as cores
  IColor = interface
    ['{8B6D08AD-58FC-4C3D-9DB3-2D3F6A31F441}']
    function GetColorName: string;
  end;

  // Implementação concreta de cor Vermelha
  TRed = class(TInterfacedObject, IColor)
    function GetColorName: string;
  end;

  // Implementação concreta de cor Azul
  TBlue = class(TInterfacedObject, IColor)
    function GetColorName: string;
  end;

  // Abstração da Forma
  TShape = class
  protected
    FColor: IColor;
  public
    constructor Create(AColor: IColor);
    procedure Draw; virtual; abstract;
  end;

  // Forma concreta: Círculo
  TCircle = class(TShape)
    procedure Draw; override;
  end;

  // Forma concreta: Quadrado
  TSquare = class(TShape)
    procedure Draw; override;
  end;

implementation

uses
  Vcl.Dialogs;

{ TRed }

function TRed.GetColorName: string;
begin
  Result := 'Vermelho';
end;

{ TBlue }

function TBlue.GetColorName: string;
begin
  Result := 'Azul';
end;

{ TShape }

constructor TShape.Create(AColor: IColor);
begin
  FColor := AColor;
end;

{ TCircle }

procedure TCircle.Draw;
begin
  ShowMessage('Desenhando um círculo de cor ' + FColor.GetColorName);
end;

{ TSquare }

procedure TSquare.Draw;
begin
  ShowMessage('Desenhando um quadrado de cor ' + FColor.GetColorName);
end;

end.

