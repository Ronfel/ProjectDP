unit uMementoPattern;

interface

type
  // Memento para armazenar o estado do Editor
  TMemento = class
  private
    FText: string;
  public
    constructor Create(AText: string);
    property Text: string read FText;
  end;

  // Editor que pode salvar e restaurar seu estado
  TEditor = class
  private
    FText: string;
  public
    procedure SetText(const AText: string);
    function CreateMemento: TMemento;
    procedure RestoreMemento(AMemento: TMemento);
    property Text: string read FText;
  end;

implementation

{ TMemento }

constructor TMemento.Create(AText: string);
begin
  FText := AText;
end;

{ TEditor }

procedure TEditor.SetText(const AText: string);
begin
  FText := AText;
end;

function TEditor.CreateMemento: TMemento;
begin
  Result := TMemento.Create(FText);
end;

procedure TEditor.RestoreMemento(AMemento: TMemento);
begin
  FText := AMemento.Text;
end;

end.

