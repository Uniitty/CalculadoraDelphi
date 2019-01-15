unit Calc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Limpar: TButton;
    Um: TButton;
    Zero: TButton;
    Mais: TButton;
    Menos: TButton;
    Dividir: TButton;
    Multiplicar: TButton;
    Maismenos: TButton;
    Virgula: TButton;
    Igual: TButton;
    Dois: TButton;
    Tres: TButton;
    Quatro: TButton;
    Cinco: TButton;
    Seis: TButton;
    Sete: TButton;
    Oito: TButton;
    Nove: TButton;
    Visor: TEdit;
    procedure DividirClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  //  procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IgualClick(Sender: TObject);
    procedure LimparClick(Sender: TObject);
    procedure MaisClick(Sender: TObject);
    procedure MaismenosClick(Sender: TObject);
    procedure MenosClick(Sender: TObject);
    procedure MultiplicarClick(Sender: TObject);
    procedure UmClick(Sender: TObject);
  //  procedure UmKeyPress(Sender: TObject; var Key: char);
    procedure VirgulaClick(Sender: TObject);
  private

  public
  end;

var
  Form2: TForm2;
  Valor1 : real;
  Valor2 : real;
  funcao : integer;
  erro: string;
  contadormaismenos: boolean;
  visorf : string;

implementation

{$R *.lfm}

{ TForm2 }
//CONFIGURAÇÃO DO EVENTO DOS BOTOES NUMERICOS, INSERE NUMERO NO VISOR AO CLICKAR (EVENT ONCLICK)
procedure TForm2.UmClick(Sender: TObject);
begin
  Visor.Text := Visor.Text + (Sender as TButton).Caption;

end;


//FUNCAOI DO BOTAO 'virugula'
procedure TForm2.VirgulaClick(Sender: TObject);
begin

Visor.Text := Visor.Text + ',';


end;

//FUNCAO DO BOTAO '+' EVENT ONCLICK
procedure TForm2.MaisClick(Sender: TObject);
begin
   valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 1;
end;
//FUNCAO DO BOTAO '+/-'
procedure TForm2.MaismenosClick(Sender: TObject);
begin
  if (visor.Text = '0') then
     begin
     showmessage ('Zero não pode ser número negativo!')
     end
  else
  begin
  if (contadormaismenos = false) then
      begin
      visorf := visor.Text;
       visor.Text := '-' +visor.Text;
       contadormaismenos := true;
      end
  else
      begin
      visor.Text := visorf;
      contadormaismenos := false;
      end;
    end;
  end;


//FUNCAO DO BOTAO '-'
procedure TForm2.MenosClick(Sender: TObject);
begin
valor1 := StrToFloat(Visor.Text);
   visor.Text := '';
   funcao :=2;

end;

//FUNCAO DO BOTAO MULTIPLICAR
procedure TForm2.MultiplicarClick(Sender: TObject);
begin
valor1 := StrToFloat(visor.Text);
visor.Text:= '';
funcao := 3;
end;

//FUNCAO DO BOTAO dividir
procedure TForm2.DividirClick(Sender: TObject);
begin
valor1 := StrToFloat(visor.Text);
visor.Text := '';
funcao :=4;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin

end;
//INICIA VARIAVEL DO IF DO BOTÃO "+/-"
procedure TForm2.FormCreate(Sender: TObject);
begin
  contadormaismenos := false;
end;





//BOTÃO 'C' LIMPAR
procedure TForm2.LimparClick(Sender: TObject);
begin
  visor.Text :='';
  visorf := '';
end;


procedure TForm2.IgualClick(Sender: TObject);
var
  soma: real;


begin
    valor2:=StrToFloat(visor.Text);
  case (funcao) of
  1:
  begin
    soma:=valor1+valor2;
    visor.text:=FloatToStr(soma);
  end;
  2:
  begin
    soma:=valor1-valor2;
    visor.text:=FloatToStr(soma);
  end;
  3:
  begin
    soma:=valor1*valor2;
    visor.text:=FloatToStr(soma);
  end;
  4:
  begin
    if(valor2<>0)then
      begin
        soma:=valor1/valor2;
        visor.text:=FloatToStr(soma);
      end
    else
      begin
      erro := 'ERRO - NÃO É POSSÍVEL DIVIDIR POR ZERO';
        visor.Text:= erro;
        end;
      end;
     end;
     erro := 'ERRO - NÃO É POSSÍVEL DIVIDIR POR ZERO';
     if (visor.Text = erro) then
        begin
        Edit1.Text:= erro;
        end
     else
         begin
         Edit1.Text:= FloatToStr(soma);
         end;
   end;


end.
