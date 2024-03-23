Program Lab_7;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, j:integer;
a:mas;
temp:real;
Inp,Outp:text;
begin 
 Assign(Inp,'Inp4.txt');
 Assign(Outp,'Out.txt');
 ReSet(Inp);
 ReWrite(Outp);
 readln(Inp, n);
 for i:=1 to n do
  read(Inp, a[i]);
 for i:=1 to n do
  for j:=2 to n do
   if a[j-1]>a[j] then
   begin
    temp:=a[j-1];
    a[j-1]:=a[j];
    a[j]:=temp;
   end;
 for i:=1 to n do
  write(Outp, a[i], ' ');
 close(Inp);
 close(Outp);
end.