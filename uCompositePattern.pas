unit uCompositePattern;

interface

type
  // Componente base para Arquivo/Pasta
  IFileSystemComponent = interface
    ['{7CDAF472-6482-44B1-A19C-E1AC1A7E742C}']
    procedure Display;
  end;

  // Implementação de Arquivo
  TFile = class(TInterfacedObject, IFileSystemComponent)
  private
    FFileName: string;
  public
    constructor Create(AFileName: string);
    procedure Display;
  end;

  // Implementação de Pasta (pode conter arquivos ou outras pastas)
  TFolder = class(TInterfacedObject, IFileSystemComponent)
  private
    FFolderName: string;
    FChildren: array of IFileSystemComponent;
  public
    constructor Create(AFolderName: string);
    procedure Add(AComponent: IFileSystemComponent);
    procedure Display;
  end;

implementation

uses
  Vcl.Dialogs;

{ TFile }

constructor TFile.Create(AFileName: string);
begin
  FFileName := AFileName;
end;

procedure TFile.Display;
begin
  ShowMessage('Arquivo: ' + FFileName);
end;

{ TFolder }

constructor TFolder.Create(AFolderName: string);
begin
  FFolderName := AFolderName;
end;

procedure TFolder.Add(AComponent: IFileSystemComponent);
begin
  SetLength(FChildren, Length(FChildren) + 1);
  FChildren[High(FChildren)] := AComponent;
end;

procedure TFolder.Display;
var
  Child: IFileSystemComponent;
begin
  ShowMessage('Pasta: ' + FFolderName);
  for Child in FChildren do
    Child.Display;
end;

end.

