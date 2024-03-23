Program Lab_7;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, j, Ntrue:integer;
a:mas;
temp:real;
flag:boolean;
Inp,Outp:text;
begin 
 Assign(Inp,'Inp4.txt');
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
  for j:=n-1 downto i do
   if a[j] > a[j+1] then
    begin
     temp:=a[j]; a[j]:=a[j+1]; a[j+1]:=temp;
     flag:=true
    end;
 until not flag;
 for i:=1 to n do
  write(Outp, a[i], ' ');
 close(Inp);
 close(Outp);
end.