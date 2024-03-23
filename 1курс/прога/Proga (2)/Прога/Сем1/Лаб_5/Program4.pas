program Лаб_5;
const
Nmax=20;
Type
mas=array [1..Nmax] of real;
mass=array [1..Nmax] of real;
var
absSum:real;
flag, anomaly:boolean;
n,i:integer;
x: mas;
y: mass;
Inp,Out:text;
begin
  Assign(Inp,'Inp1.txt');
  Assign(Out,'Out.txt');
  ReSet(Inp);
  ReWrite(Out);
  read(Inp, n);
  if ((n>20) or (n<0)) then
    begin
     write(Out,'Ошибка! Кол-во элементов массива превышает 20, либо меньше 0');
     Close(Inp);
     Close(Out);
    end
   else
     begin
      for i:=1 to n do
        read(Inp, x[i]);
      for i:=1 to n do
        read(Inp, y[i]);
      for i:=1 to n do
        if abs(x[i])>10 then
          begin
          writeln(Out,'Элемент массива ', i, ' превышает заданный промежуток!');
            anomaly:=true;
          end;
      for i:=1 to n do
        if abs(y[i])>10 then
          begin
            writeln(Out,'Элемент массива ', i, ' превышает заданный промежуток!');
            anomaly:=true;
          end;
      if anomaly=true then
      else
      begin
        absSum:=abs(x[1]+y[1]);
        for i:=2 to n do
          if abs(x[i]+y[i])<absSum then
            absSum:=abs(x[i]+y[i]);      
        write(Out,'Наименьшая абсолютная величина суммы A[i]+ С[i] = ',absSum);
        Close(Inp);
        Close(Out);
      end;
    end;
end.    