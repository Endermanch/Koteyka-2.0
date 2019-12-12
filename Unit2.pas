unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TSecretReveal = class(TForm)
    Kitty: TImage;
    PopupTimer: TTimer;
    SpeedTimer: TTimer;
    procedure PopupTimerTimer(Sender: TObject);
    procedure SpeedTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecretReveal: TSecretReveal;
  i, x, y, dx, dy: Integer;

implementation

{$R *.dfm}

procedure TSecretReveal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := false;
end;

procedure TSecretReveal.FormCreate(Sender: TObject);
begin
  x := 1920;
  y := 1080;
  dx := 106;
  dy := 123;
end;

procedure TSecretReveal.PopupTimerTimer(Sender: TObject);
begin
  while (i < 0) do
      begin
        i := i + 1;
        TSecretReveal.Create(self).Show;
      end;
  PopupTimer.Enabled := false;
end;

procedure TSecretReveal.SpeedTimerTimer(Sender: TObject);
begin
  if random(10) = 1 then
    begin
      dx := dx + random(3) - 1;
      dy := dy + random(3) - 1;
      SpeedTimer.Interval := SpeedTimer.Interval + cardinal(random(11) - 5);
      if SpeedTimer.Interval < 100 then SpeedTimer.Interval := 150;
    end;

Left := Left + dx;
Top := Top + dy;

if Left + Width > x then dx := - dx;
if Left < 0 then dx := -dx;
if Top + Height > y then dy := -dy;
if Top < 0 then dy := -dy;
end;

end.

