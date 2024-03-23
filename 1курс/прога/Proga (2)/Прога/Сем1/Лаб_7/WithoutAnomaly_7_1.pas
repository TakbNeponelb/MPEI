Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, j, kmax:integer;
a:mas;
temp:real;
Inp,Outp:text;
begin 
 Assign(Inp,'Inp2.txt');
 Assign(Outp,'Out.txt');
 ReSet(Inp);
 ReWrite(Outp);
 readln(Inp, n);
 for i:=1 to n do
  read(Inp, a[i]);
 for i:=1 to n do
 begin
  kmax:=i;
  temp:=a[i];
  j:=i;
  for j:=i+1 to n do
   if a[j]>temp then
    begin
     kmax:=j;
     temp:=a[j];
    end;
   a[kmax]:=a[i];
   a[i]:=temp;
 end;
 for i:=1 to n do
  write(Outp, a[i], ' ');
 close(Inp);
 close(Outp);
end.
  