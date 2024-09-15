unit uProxyPattern;

interface

type
  // Interface para imagem
  IImage = interface
    ['{C1A9B4F6-CC5C-4B7D-896D-957AC9EAF3A1}']
    procedure Display;
  end;

  // Classe concreta que carrega a imagem real
  TRealImage = class(TInterfacedObject, IImage)
  private
    FFileName: string;
    procedure LoadImage;
  public
    constructor Create(AFileName: string);
    procedure Display;
  end;

  // Proxy que controla o acesso à imagem
  TImageProxy = class(TInterfacedObject, IImage)
  private
    FRealImage: IImage;
    FFileName: string;
  public
    constructor Create(AFileName: string);
    procedure Display;
  end;

implementation

uses
  Vcl.Dialogs;

{ TRealImage }

constructor TRealImage.Create(AFileName: string);
begin
  FFileName := AFileName;
  LoadImage;
end;

procedure TRealImage.LoadImage;
begin
  ShowMessage('Carregando imagem de ' + FFileName);
end;

procedure TRealImage.Display;
begin
  ShowMessage('Exibindo imagem de ' + FFileName);
end;

{ TImageProxy }

constructor TImageProxy.Create(AFileName: string);
begin
  FFileName := AFileName;
end;

procedure TImageProxy.Display;
begin
  if FRealImage = nil then
    FRealImage := TRealImage.Create(FFileName);
  FRealImage.Display;
end;

end.

