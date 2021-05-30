unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PEscolha: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PGame: TPanel;
    Pan_1_1: TPanel;
    Pan_2_1: TPanel;
    Pan_1_2: TPanel;
    Pan_1_3: TPanel;
    Pan_2_2: TPanel;
    Pan_3_3: TPanel;
    Pan_3_1: TPanel;
    Pan_3_2: TPanel;
    Pan_2_3: TPanel;
    Timer: TTimer;
    procedure ClickEscolha(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure Escolha_Simbolo(LSym : string);
    procedure DesenhaTela;
    function seekPanel(x, y: integer): TPanel;
    procedure BotRound;
    function JogoCheio: boolean;
    function BotTravado: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var Sym,ESym : string;
Turn : integer = 0;
Time : integer = 0;

Game : array [1..3] of array [1..3] of string;


procedure TForm1.ClickEscolha(Sender: TObject);
begin
  Escolha_Simbolo(TButton(Sender).Caption);
end;

procedure TForm1.Escolha_Simbolo(LSym : string);
begin
  Sym := LSym;

  if LSym = 'X' then
  ESym := 'O'
  else
  ESym := 'X';

  DesenhaTela;

  PEscolha.Visible := False;
  PGame.Visible := True;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I,Y: Integer;
begin
  Sym:= '';

  for I := 1 to 3 do
    for Y := 1 to 3 do
    begin
      Game[I, Y] := '';
    end;

end;

procedure TForm1.PanelClick(Sender: TObject);
begin
  Game[StrToInt(IntToStr(TPanel(Sender).Tag)[1]), StrToInt(IntToStr(TPanel(Sender).Tag)[2])] := Sym;
  Turn := 1;
  DesenhaTela;

  BotRound;
end;

procedure TForm1.DesenhaTela;
var
  I,Y: Integer;
  LPanel : TPanel;
begin

 for I := 1 to 3 do
    for Y := 1 to 3 do
    begin
      LPanel := seekPanel(I,y);
      LPanel.Caption := Game[I, Y];
    end;


end;

function TForm1.seekPanel(x,y : integer): TPanel;
var I : integer;
begin
  for i := 0 to Form1.ComponentCount - 1 do
  if (Form1.Components[i] is TPanel) and (StrToInt(Concat(IntToStr(x), IntToStr(y))) = TPanel(Form1.Components[i]).Tag) then
    begin
      Result := Form1.Components[i] as TPanel;
      exit;
    end;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  if Turn = 1 then
    Time := Time + 1;
end;

procedure TForm1.BotRound;
var LSuccess : Boolean;
    I,Y : integer;
begin
  LSuccess := False;

  while LSuccess = False do
  begin
    if JogoCheio then
    exit;

    if BotTravado then



    I := Random(3);
    Y := Random(3);

    if Game[I,Y] = '' then
    begin
      Game[I,Y] := ESym;

      LSuccess := True;
      Turn := 0;
      DesenhaTela;
    end;
  end;
end;

function TForm1.BotTravado : boolean;
begin
  if Time > 5 then
  begin

  end;
end;

function TForm1.JogoCheio : boolean;
var
  LGameFull: boolean;
  I,Y : integer;
begin
 LGameFull := True;
   for I := 1 to 3 do
     for Y := 1 to 3 do
       begin
         if Game[I, Y] = '' then
           LGameFull := False;
       end;
 Result := LGameFull;
end;

end.
