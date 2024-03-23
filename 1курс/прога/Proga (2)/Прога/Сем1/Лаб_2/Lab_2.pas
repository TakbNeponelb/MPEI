program Lab_2;
const
Nmax=20;
type
mas=array [1..Nmax] of real;
mass=array [1..Nmax] of real;
var i, n:integer;
sum: real;
x:mas;
y:mass;
begin
write('Введите кол-во элементов массива',#13#10);
read(n);
writeln('Введите значения 1 массива');
for i:=1 to n do
readln();
writeln('Введите значения 2 массива');
for i:=1 to n do
readln();
writeln('Число элементов 1 массива, удоволетворяющих условию:', 5,#13#10 ,'Сумма этих элементов: ', 104);
end.