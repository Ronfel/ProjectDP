unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnSingleton: TButton;
    procedure btnSingletonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uSingletonExample;

{$R *.dfm}

procedure TForm1.btnSingletonClick(Sender: TObject);
begin
   TSingleton.GetInstance.TestMetodo;
end;

end.
