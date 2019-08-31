unit F_calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TOperation = (adding, subtraction, multiplying, fission, none);
  TCalc = class(TForm)
    btn_7: TBitBtn;
    btn_8: TBitBtn;
    btn_9: TBitBtn;
    btn_4: TBitBtn;
    btn_5: TBitBtn;
    btn_6: TBitBtn;
    btn_1: TBitBtn;
    btn_2: TBitBtn;
    btn_3: TBitBtn;
    btn_0: TBitBtn;
    btn_00: TBitBtn;
    btn_float: TBitBtn;
    btn_m: TBitBtn;
    btn_mr: TBitBtn;
    btn_m_plus: TBitBtn;
    btn_m_minus: TBitBtn;
    btn_plus: TBitBtn;
    btn_minus: TBitBtn;
    btn_umnog: TBitBtn;
    btn_delen: TBitBtn;
    btn_znak: TBitBtn;
    btn_procent: TBitBtn;
    btn_1_div_x: TBitBtn;
    btn_result: TBitBtn;
    btn_c: TBitBtn;
    btn_ce: TBitBtn;
    btn_backscape: TBitBtn;
    btn_mc: TBitBtn;
    mem_status: TPanel;
    tablo: TEdit;

    procedure btn_NumberClick(Sender : TObject);
    procedure btn_ActionClick(Sender : TObject);
    procedure btn_floatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_resultClick(Sender: TObject);
    procedure btn_znakClick(Sender: TObject);
    procedure btn_backscapeClick(Sender: TObject);
    procedure btn_1_div_xClick(Sender: TObject);
    procedure btn_procentClick(Sender: TObject);
    procedure btn_ceClick(Sender: TObject);
    procedure btn_cClick(Sender: TObject);
    procedure btn_mcClick(Sender: TObject);
    procedure btn_mrClick(Sender: TObject);
    procedure btn_mClick(Sender: TObject);
    procedure btn_m_plusClick(Sender: TObject);
    procedure btn_m_minusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calc: TCalc;
  mem, first_numb, sec_numb, result : extended;
  operation : TOperation;
  clear_tablo : boolean;

  result_click, number : boolean;

implementation

{$R *.dfm}

procedure TCalc.btn_floatClick(Sender: TObject);
begin
     if length(tablo.Text)>=10 then
     begin
          beep;
          exit;
     end;


     if clear_tablo=true then
     begin
          tablo.Text:='';
          clear_tablo:=false;
     end;

     tablo.text:=tablo.text+',';

     number:=true;
end;

procedure TCalc.FormShow(Sender: TObject);
begin
     clear_tablo:=false;
     result_click:=false;
     tablo.Text:='0';
     first_numb:=0;
     sec_numb:=0;
     result:=0;
     operation:=none;
     number:=false;
     mem:=0;
     btn_c.SetFocus;

end;

procedure TCalc.btn_resultClick(Sender: TObject);
begin
     if operation=none then exit;
     try
        if sec_numb=0 then sec_numb:=StrToFloat(Tablo.Text);

        case operation of
               adding : result:=first_numb+sec_numb;
          subtraction : result:=first_numb-sec_numb;
          multiplying : result:=first_numb*sec_numb;
              fission : begin
                             if sec_numb=0 then
                             begin
                                  MessageDlg('Деление на ноль!',mtError,[mbOk],0);



                                  exit;
                             end;

                             result:=first_numb/sec_numb;
                        end;
        end;

        first_numb:=result;
        tablo.Text:=FloatToStr(result);
        number:=false;
     except
        beep;
     end;

end;

procedure TCalc.btn_znakClick(Sender: TObject);
var
   s : string;
begin
     if length(tablo.Text)=0 then
     begin
          beep;
          exit;
     end;

     s:=tablo.text;
     if tablo.Text[1]='-' then
        delete(s,1,1)
     else
        s:='-'+s;
     tablo.Text:=s;

end;

procedure TCalc.btn_backscapeClick(Sender: TObject);
begin
     if (length(tablo.text)=2) and (tablo.Text[1]='-') then
         tablo.Text:='0'
     else
         tablo.Text:=copy(tablo.Text,1,length(tablo.Text)-1);

     if length(tablo.Text)=0 then tablo.Text:='0';

end;

procedure TCalc.btn_1_div_xClick(Sender: TObject);
begin
     try
        tablo.Text:=FloatToStr(1/(StrToFloat(tablo.Text)));
     except
        beep;
     end;
end;

procedure TCalc.btn_procentClick(Sender: TObject);
begin
     try
        if sec_numb=0 then sec_numb:=StrToFloat(Tablo.Text);
        if operation<>none then result:=(first_numb*sec_numb)/100;
        first_numb:=result;
        tablo.Text:=FloatToStr(result);
        number:=false;
     except
        beep;
     end;
end;

procedure TCalc.btn_ceClick(Sender: TObject);
begin
     tablo.Text:='0';
end;

procedure TCalc.btn_cClick(Sender: TObject);
begin
     first_numb:=0;
     sec_numb:=0;
     result:=0;
     tablo.Text:='0';
     operation:=none;
end;

procedure TCalc.btn_mcClick(Sender: TObject);
begin
     mem:=0;
     mem_status.caption:='';
end;

procedure TCalc.btn_mrClick(Sender: TObject);
begin
     tablo.Text:=FloatToStr(mem);
end;

procedure TCalc.btn_mClick(Sender: TObject);
begin
     try
        mem:=StrToFloat(tablo.Text);
        mem_status.Caption:='M';
     except
        beep;
     end;

end;

procedure TCalc.btn_m_plusClick(Sender: TObject);
begin
     try
        mem:=mem+StrToFloat(tablo.Text);
     except
        beep;
     end;

end;

procedure TCalc.btn_m_minusClick(Sender: TObject);
begin
     try
        mem:=mem+StrToFloat(tablo.Text);
     except
        beep;
     end;

end;

procedure TCalc.btn_NumberClick(Sender: TObject);
begin
     if length(tablo.Text)>=10 then
     begin
          beep;
          exit;
     end;

     if (tablo.Text='0') and ((Sender as TButton).Caption='00') then exit;
     if (tablo.Text='0') then tablo.Text:='';


     if clear_tablo=true then
     begin
          tablo.Text:='';
          clear_tablo:=false;
     end;
     tablo.text:=tablo.text+(Sender as TButton).Caption;

     number:=true;
end;

procedure TCalc.btn_ActionClick(Sender: TObject);
begin
     try
        sec_numb:=0;
        if (first_numb<>0) and (number=true) then btn_result.Click;

        case (Sender as TButton).Caption[1] of
             '*' : operation:=multiplying;
             '-' : operation:=subtraction;
             '+' : operation:=adding;
             '/' : operation:=fission;
        end;

        first_numb:=StrToFloat(Tablo.Text);
        clear_tablo:=true;
        number:=false;
        sec_numb:=0;
     except
        beep;
     end;
end;

end.
