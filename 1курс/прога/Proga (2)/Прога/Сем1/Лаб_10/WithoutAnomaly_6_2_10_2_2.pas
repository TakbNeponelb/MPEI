Program Lab_62;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
Procedure vvod(var a:mas; var na:integer; var fx:text);
 var  i:integer;
 begin
  readln(fx, na);
  for i:=1 to na do
   read(fx, a[i]);
 end;
function fNom(a:mas; na:integer):integer;
 var  i, l:integer;
 flag:boolean;
 begin
  i:=1;
  while (flag=false) and (i<=na) do
   begin
    if a[i]=0 then 
    begin
     flag:=true;
     l:=i;
     end
    else
    i:=i+1;
   end;
   fNom:=l;
   end;
function fkPositive(a:mas; na, Noma:integer):integer;
 var  i, l:integer;
 flag:boolean;
 begin
  i:=na;
  flag:=true;
  while (flag) and (i>Noma) do
   begin
    if a[i]>0 then
    begin
     flag:=false;
     l:=i;
    end
    else
    i:=i-1;
   end;
   fkPositive:=l;
 end;
function MainCondition(a:mas; Noma, kPositivea, l:integer):integer;
 var i, kmina:integer;
 begin
  kmina:=kPositivea;
  for i:=Noma+1 to kPositivea-1 do
   if (a[i] < a[kmina]) and (a[i]>0) then
    kmina:=i;
  MainCondition:=kmina;
 end;
Procedure Vivod(a:mas; kmina:integer; var fx:text);
begin
 write(fx,'Наименьшее положительное число массива равно: ',a[kmina],#13#10,'Его номер в массиве равен: ',kmina);
end;
var
n, kmin, kPositive, l, Nom:integer;
flag:boolean;
x:mas;
Inp,Outp:text;
begin
  Assign(Inp,'Inp1.txt');
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
   Vivod(x, kmin, Outp);
   close(Inp);
   close(Outp);
  end;

end.