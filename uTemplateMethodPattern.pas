unit uTemplateMethodPattern;

interface

type
  // Classe abstrata com o m�todo template
  TCaffeineBeverage = class
  public
    procedure PrepareRecipe;
    procedure BoilWater; virtual;
    procedure Brew; virtual; abstract;
    procedure PourInCup; virtual;
    procedure AddCondiments; virtual; abstract;
  end;

  // Classe concreta para preparar ch�
  TTea = class(TCaffeineBeverage)
  public
    procedure Brew; override;
    procedure AddCondiments; override;
  end;

  // Classe concreta para preparar caf�
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
  ShowMessage('Fervendo �gua...');
end;

procedure TCaffeineBeverage.PourInCup;
begin
  ShowMessage('Colocando na x�cara...');
end;

{ TTea }

procedure TTea.Brew;
begin
  ShowMessage('Infusando o ch�...');
end;

procedure TTea.AddCondiments;
begin
  ShowMessage('Adicionando lim�o...');
end;

{ TCoffee }

procedure TCoffee.Brew;
begin
  ShowMessage('Coando o caf�...');
end;

procedure TCoffee.AddCondiments;
begin
  ShowMessage('Adicionando a��car e leite...');
end;

end.

