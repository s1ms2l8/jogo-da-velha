unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, math;

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
    procedure ClickEscolha(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelClick(Sender: TObject);
  private
    procedure Escolha_Simbolo(LSym : string);
    procedure DesenhaTela;
    procedure BotRound;
    function seekPanel(X,Y: integer): TPanel;
    function JogoCheio: boolean;
    function BotTravado: boolean;
    procedure LogicSuccess(X,Y: integer);
    procedure ClearGame;
    Function EndGame(PSequence : array of string): boolean;
    function CheckLines: boolean;
    function CheckCollumns: boolean;
    function CheckDiagonals: boolean;
    procedure WinCheck;
    function CheckDraw: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var Sym,ESym,Winner : string;
Turn : integer = 0;
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
  if Game[StrToInt(IntToStr(TPanel(Sender).Tag)[1]), StrToInt(IntToStr(TPanel(Sender).Tag)[2])] = '' then
    Game[StrToInt(IntToStr(TPanel(Sender).Tag)[1]), StrToInt(IntToStr(TPanel(Sender).Tag)[2])] := Sym
  else
  begin
    MessageDlg('Local inv�lido!' + #13 + #13 + 'Apenas espa�os vazios s�o v�lidos',mtError,[mbOk],0);
    exit;
  end;

  Turn := 1;
  BotRound;
  DesenhaTela;
  WinCheck;
end;

procedure TForm1.ClearGame;
var
  I,Y: Integer;
begin
  for I := 1 to 3 do
    for Y := 1 to 3 do
    begin
      Game[I, Y] := '';
    end;
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

procedure TForm1.BotRound;
var LSuccess : Boolean;
    I,Y,LTrys : integer;
begin
  LSuccess := False;
  LTrys := 0;

  while LSuccess = False do
  begin
    I := RandomRange(1,4);
    Y := RandomRange(1,4);

    if Game[I,Y] = '' then
    begin
      LogicSuccess(I,Y);
      LSuccess := True;
    end
    else
    LTrys := LTrys + 1;

    if LTrys > 10 then
    begin
      BotTravado;
      LSuccess := True;
    end;
  end;
end;

Procedure TForm1.LogicSuccess(X,Y : integer);
begin
  Game[x,y] := ESym;
  Turn := 0;
  DesenhaTela;
  WinCheck;
end;

function TForm1.BotTravado : boolean;
var
  I,Y: Integer;
begin
  for I := 1 to 3 do
    for Y := 1 to 3 do
      if Game[I,Y] = '' then
      begin
        LogicSuccess(I,Y);
      end;
end;

function TForm1.JogoCheio : boolean;
var
  LFullGame: boolean;
  I,Y : integer;
begin
 LFullGame := True;
   for I := 1 to 3 do
     for Y := 1 to 3 do
       begin
         if Game[I, Y] = '' then
           LFullGame := False;
       end;
 Result := LFullGame;
end;

Procedure TForm1.Wincheck;
begin
  CheckDraw;

  if CheckLines or CheckCollumns or CheckDiagonals then
   if MessageDlg(winner + ' � o vencedor!!' + #13 + #13 + 'Recome�ar?',mtInformation,[mbYes, mbNo],0) = mrYes then
   begin
      ClearGame;
      DesenhaTela;
      PEscolha.Visible := True;
      PGame.Visible := False;
    end
    else
    Form1.Close;
end;

function TForm1.CheckLines: boolean;
var
 I,Y : integer;
 LLine : array [1..3] of string;
begin
  Result := False;

  for I := 1 to 3 do
  begin
     for Y := 1 to 3 do
     begin
        LLine[Y] := Game[I, Y];
     end;

   if EndGame(LLine) then
   Result := True;
  end;
end;

function TForm1.CheckCollumns: boolean;
var
 I,Y : integer;
 LColumn : array [1..3] of string;
begin
  Result := False;

  for I := 1 to 3 do
  begin
     for Y := 1 to 3 do
     begin
        LColumn[Y] := Game[Y,I];
     end;

   if EndGame(LColumn) then
   Result := True;
  end;
end;

function TForm1.CheckDiagonals: boolean;
var
  I, Y: Integer;
  LDiagonal, LRevDiagonal : array[1..3] of string;
begin
  Result := False;
  Y := 3;

  for I := 1 to 3 do
  begin
    LDiagonal[I] := Game[I,I];

    LRevDiagonal[I] := Game[I,Y];
    Y := Y -1;
  end;


  if EndGame(LDiagonal) or EndGame(LRevDiagonal) then
  Result := True;
end;

Function TForm1.CheckDraw: boolean;
begin
  if JogoCheio then
    if MessageDlg('VELHA! Sem ganhadores Nesta Rodada' + #13 + #13 + 'Recome�ar?',mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      ClearGame;
      DesenhaTela;
      PEscolha.Visible := True;
      PGame.Visible := False;
    end
    else
    Form1.Close;
end;

Function TForm1.EndGame(PSequence : array of string): boolean;
var
  LSym : string;
  I: Integer;
begin
  Result := True;
  LSym := PSequence[0];

  for I := 0 to 2 do
  if (PSequence[I] <> LSym) or (PSequence[I] = '') then
  begin
    Result := False;
    Exit;
  end;

  if LSym = Sym then
  Winner := 'Player 1'
  else
  Winner := 'Player 2';
end;

end.
