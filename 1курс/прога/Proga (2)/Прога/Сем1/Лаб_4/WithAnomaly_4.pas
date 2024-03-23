program Лаб_4;
const
Nmax=20;
Type
mas=array [1..Nmax] of real;
var
n,i, NumberOfNeg:integer;
x: mas;
Inp, Out:text;
anomaly:boolean;
begin
  Assign(Inp,'Inp1.txt');
  Assign(Out,'Out.txt');
  ReSet(Inp);
  ReWrite(Out);
  read(Inp, n);
  if ((n>20) or (n<0)) then
  begin
    
  end
  else
  begin
  for i:=1 to n do
    read(Inp, x[i]);
  for i:=1 to n do
    if abs(x[i])>10 then
    begin
     writeln(Out,'Элемент массива ', i, ' превышает заданный промежуток!');
     anomaly:=true;
    end;
  if anomaly=true then
  begin
    Close(Inp);
    Close(Out);
  end
  else
  begin
    for i:=1 to n do
    if x[i]>0 then
      x[i]:=x[i]/i;
  for i:=1 to n do
    if x[i]<0 then
      NumberOfNeg:=NumberOfNeg+1;
  for i:=1 to n do
    write(out,x[i]:4);
  writeln(Out);
  write(Out,'Кол-во отрицательных чисел: ',NumberOfNeg);
  Close(Inp);
  Close(Out);
  end;
  end;
end.