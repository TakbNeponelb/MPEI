Program Lab_62;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, kmin, kPositive, l, Nom:integer;
flag:boolean;
x:mas;
Inp,Outp:text;
Procedure vvod(var x:mas; var n:integer; var fx:text);
 var  i:integer;
 begin
  readln(fx, n);
  for i:=1 to n do
   read(fx, x[i]);
 end;
function fNom(x:mas; n:integer):integer;
 var  i, l:integer; 
 begin
  i:=1;
  while (flag=false) and (i<=n) do
   begin
    if x[i]=0 then 
    begin
     flag:=true;
     l:=i;
     end
    else
    i:=i+1;
   end;
   fNom:=l;
   end;
function fkPositive(x:mas; n, Nom:integer):integer;
 var  i, l:integer;
 begin
  i:=n;
  flag:=true;
  while (flag) and (i>Nom) do
   begin
    if x[i]>0 then
    begin
     flag:=false;
     l:=i;
    end
    else
    i:=i-1;
   end;
   fkPositive:=l;
 end;
function MainCondition(x:mas; Nom, kPositive, l:integer):integer;
 var i:integer;
 begin
  kmin:=kPositive;
  for i:=Nom+1 to kPositive-1 do
   if (x[i] < x[kmin]) and (x[i]>0) then
    kmin:=i;
    l:=kmin;
  MainCondition:=l;
 end;
Procedure Vivod(kmin:integer; var Outp:text);
begin
 write(Outp,'Наименьшее положительное число массива равно: ',x[kmin],#13#10,'Его номер в массиве равен: ',kmin);
 close(Inp);
 close(Outp);
end;
begin
  Assign(Inp,'Inp4.txt');
  Assign(Outp,'Out.txt');
  ReSet(Inp);
  ReWrite(Outp);
  vvod(x, n, Inp);
  Nom:=fNom(x, n);
  kPositive:=fkPositive(x, n, Nom);
  if kPositive=0 then
   begin
    write(Outp,'Ошибка! В массиве после 0 (или при его отсутсвии во всем массиве) не найдены положительные числа!');
    close(Inp);
    close(Outp);
   end
  else
  begin
   kmin:=MainCondition(x, Nom, kPositive, l);
   Vivod(kmin, Outp);
  end;

end.