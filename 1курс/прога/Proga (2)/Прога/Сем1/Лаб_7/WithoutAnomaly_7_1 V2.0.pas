Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, j, kmax, Ntrue:integer;
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
 i:=1;
 while i<=n do
  begin
   for j:=2 to n do
    if a[j-1]>a[j] then
     inc(Ntrue);
   if Ntrue=(n-1) then
    i:=n
   else
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
    inc(i);
   end;
 for i:=1 to n do
  write(Outp, a[i], ' ');
 close(Inp);
 close(Outp);
end.
  