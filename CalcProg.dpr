program CalcProg;

uses
  Forms,
  F_calc in 'F_calc.pas' {Calc};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�����������';
  Application.CreateForm(TCalc, Calc);
  Application.Run;
end.
