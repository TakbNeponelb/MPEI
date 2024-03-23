Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, j:integer;
a:mas;
temp:real;
flag:boolean;
Inp,Outp:text;
begin 
 Assign(Inp,'Inp2.txt');
 Assign(Outp,'Out.txt');
 ReSet(Inp);
 ReWrite(Outp);
 readln(Inp, n);
 for i:=1 to n do
  read(Inp, a[i]);
 i:=1;
 repeat
 i:=i+1;
 flag:=false;
  temp:=a[i];
  for j:=i+1 to n do
   if a[j]>temp then
   begin
    temp:=a[j];
    flag:=true;
    a[i]:=temp;
   end;
until not flag;
 for i:=1 to n do
  write(Outp, a[i], ' ');
 close(Inp);
 close(Outp);
end.
  