Program Lab_6;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, k0, kmin:integer;
x:mas;
xmin:real;
flag:boolean;
Inp,Outp:text;
begin
  Assign(Inp,'Inp2.txt');
  Assign(Outp,'Out.txt');
  ReSet(Inp);
  ReWrite(Outp);
  readln(Inp, n);
  for i:=1 to n do
     read(Inp, x[i]); 
     k0:=1;
        for i:=1 to n do
         if (x[i]=0) and (k0>1) then
          k0:=i;
        flag:=false;
        for i:=k0 to n do
         if x[i]>0 then
          if flag=false then
           begin
            kmin:=i;
            xmin:=x[i];
            flag:=true;
           end
          else 
           if x[i]<xmin then
            begin
             xmin:=x[i];
             kmin:=i;
            end;
        if flag=false then
         write(Outp,'������! � ������� �� ������� ������������� �����!')
        else
         write(Outp,'���������� ������������� ����� ������� �����: ',xmin,#13#10,'��� ����� � ������� �����: ',kmin);
         close(Inp);
         close(Outp);
         end.