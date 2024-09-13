unit uSingletonExample;

interface

type
  TSingleton = class
  private
    class var FInstance: TSingleton;
    constructor Create;
  public
    class function GetInstance: TSingleton;
    procedure TestMetodo;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TSingleton }

constructor TSingleton.Create;
begin
  inherited Create;
end;

class function TSingleton.GetInstance: TSingleton;
begin
  if FInstance = nil then
    FInstance := TSingleton.Create;
  Result := FInstance;
end;

procedure TSingleton.TestMetodo;
begin
  ShowMessage('Exemplo do padrão Singleton em Delphi!');
end;

initialization
  TSingleton.FInstance := nil;

finalization
  if TSingleton.FInstance <> nil then
    FreeAndNil(TSingleton.FInstance);
end.

