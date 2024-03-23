Program Lab_6;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, kmin, kPositive, Nom:integer;
x:mas;
xmin:real;
Inp,Outp:text;
Procedure vvod(var x:mas; var n:integer; var fx:text);
 var  i:integer;
 begin
  Assign(Inp,'Inp1.txt');
  Assign(Outp,'Out.txt');
  ReSet(Inp);
  ReWrite(Outp);
  readln(Inp, n);
  for i:=1 to n do
   read(Inp, x[i]);
 end;
Procedure PoiskNom(x:mas; n:integer; var Nom:integer);
 var  i:integer;
 begin
  i:=1;
  while (Nom=0) and (i<=n) do
   begin
    if x[i]=0 then 
     Nom:=i;
    i:=i+1;
   end;
 end;
Procedure PoiskkPositive(x:mas; n, Nom:integer; var kPositive:integer);
 var  i:integer;
 begin
  i:=n;
  while (kPositive=0) and (i>Nom) do
   begin
    if x[i]>0 then
     kPositive:=i;
    i:=i-1;
   end;
 end;
Procedure MainCondition(x:mas; Nom, kPositive:integer; var kmin:integer; var xmin:real; var Outp:text);
 var i:integer;
 begin
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
  end;
begin
  vvod(x, n, Inp);
  PoiskNom(x, n, Nom);
  PoiskkPositive(x, n, Nom, kPositive); 
  MainCondition(x, Nom, kPositive, kmin, xmin, Outp)
end.