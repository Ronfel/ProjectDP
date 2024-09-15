unit uTemplateMethodPattern;

interface

type
  // Classe abstrata com o método template
  TCaffeineBeverage = class
  public
    procedure PrepareRecipe;
    procedure BoilWater; virtual;
    procedure Brew; virtual; abstract;
    procedure PourInCup; virtual;
    procedure AddCondiments; virtual; abstract;
  end;

  // Classe concreta para preparar chá
  TTea = class(TCaffeineBeverage)
  public
    procedure Brew; override;
    procedure AddCondiments; override;
  end;

  // Classe concreta para preparar café
  TCoffee = class(TCaffeineBeverage)
  public
    procedure Brew; override;
    procedure AddCondiments; override;
  end;

implementation

uses
  Vcl.Dialogs;

{ TCaffeineBeverage }

procedure TCaffeineBeverage.PrepareRecipe;
begin
  BoilWater;
  Brew;
  PourInCup;
  AddCondiments;
end;

procedure TCaffeineBeverage.BoilWater;
begin
  ShowMessage('Fervendo água...');
end;

procedure TCaffeineBeverage.PourInCup;
begin
  ShowMessage('Colocando na xícara...');
end;

{ TTea }

procedure TTea.Brew;
begin
  ShowMessage('Infusando o chá...');
end;

procedure TTea.AddCondiments;
begin
  ShowMessage('Adicionando limão...');
end;

{ TCoffee }

procedure TCoffee.Brew;
begin
  ShowMessage('Coando o café...');
end;

procedure TCoffee.AddCondiments;
begin
  ShowMessage('Adicionando açúcar e leite...');
end;

end.

