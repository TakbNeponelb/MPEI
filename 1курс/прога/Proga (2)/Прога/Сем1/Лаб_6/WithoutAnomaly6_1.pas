Program Lab_6;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, kmin, kPositive, j, Nom:integer;
x:mas;
xmin:real;
Inp,Outp:text;
begin
  Assign(Inp,'Inp4.txt');
  Assign(Outp,'Out.txt');
  ReSet(Inp);
  ReWrite(Outp);
  readln(Inp, n);
  for i:=1 to n do
   read(Inp, x[i]); 
  i:=1;
  while (Nom=0) and (i<=n) do
   begin
    if x[i]=0 then 
     Nom:=i;
    inc(i);
   end;
   if Nom=0 then
    Nom:=1;
    i:=n;
   while (kPositive=0) and (i>=Nom) do
    begin
     if x[i]>0 then
      kPositive:=i;
     dec(i);
    end;
  if kPositive=0 then
   begin
    write(Outp,'Ошибка! В массиве после 0 (или при его отсутсвии во всем массиве) не найдены положительные числа!');
    close(Inp);
    close(Outp);
   end
  else
   begin
    kmin:=kPositive;
    xmin:=x[kPositive];
    for i:=Nom+1 to kPositive do
     if (x[i] < xmin) and (x[i]>0) then
      begin
       xmin:=x[i];
       kmin:=i;
      end;
    write(Outp,'Наименьшее положительное число массива равно: ',xmin,#13#10,'Его номер в массиве равен: ',kmin);
    close(Inp);
    close(Outp);
   end;
end.