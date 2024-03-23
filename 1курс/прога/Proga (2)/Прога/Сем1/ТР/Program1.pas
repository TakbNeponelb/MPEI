Program Lab_12;
uses IniFini, VvodVivod, Conditional;
var 
 a:matrix;
 ca:mas;
 srA:real;
 n:integer;
 flag:boolean;
begin
read(n);
if (n<5) or (n>10) then
writeln('Error')
else
begin
VvodMasMatrix(a, ca, n, Inp);
flag:=ProvMat(a, n);
if (flag) then
write(Outp, 'Неккоретно введены данные матрицы!')
else begin
flag:=ProvMass(ca, n);
if (flag) then
write(Outp, 'Неккоретно введены данные массива!')
else begin
srA:=SrArif(a, n);
flag:=check(srA, ca, n);
writeln(Outp, 'Вывод конечных данных:');
if flag then
begin
izm(a, n, srA);
VivodMatrix(a, n, Outp);
end
else
begin
writeln(Outp, 'Матрица А не изменена');
VivodMatrix(a, n, Outp);
end;
end;
end;
end;
end. 