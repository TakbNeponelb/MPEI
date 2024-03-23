Program Lab11;
type 
  matrix=array[1..100,1..100] of real;
  mas=array[1..100] of real;
  bool=array[1..100] of boolean;
var
 a, b, c:matrix;
 ca, cb, cc:mas;
 na, nb, nc:integer;
 fa, OutA:text;
 fla, flb, flc:bool;
 sumA, sumB, sumC:real;
 ch:char;
Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  var 
   i, j:integer;
  begin
   readln(fx1 ,nx);
   for i:=1 to nx do
    read(fx1, xc[i]); 
   for i:=1 to nx do
    for j:=1 to nx do
     read(fx1, x[i,j]);
  end;
procedure Conditional(var fl: bool; x: matrix; xc: mas; nx: integer);
  var
   i, j: integer;
   flag: boolean;
  begin
   for i:=1 to nx do
   begin
    flag:=true;
    for j:=1 to nx do
     if xc[i]<=x[i,j] then
       flag:=false;
    if flag then
     fl[i]:=true;
   end;
  end;
function sigma(x: matrix; nx: integer): real;
  var
   i, j: integer;
   sum: real;
  begin
   for i:=1 to nx do
    for j:=1 to nx do
     sum:=sum+x[i,j];
   sigma:=sum;
  end;
function maxf(a, b, c:real): char;
  type 
   ABC=array[1..3] of char;
   mass=array[1..3] of real;
  var
   letter:ABC;
   maxmas: mass;
   i, k: integer;
   max: real;
  begin
   letter[1]:='A';
   letter[2]:='B';
   letter[3]:='C';
   maxmas[1]:=a;
   maxmas[2]:=b;
   maxmas[3]:=c;
   max:=maxmas[1];
   k:=1;
   for i:=2 to 3 do
    if maxmas[2]>max then
    begin
     max:=maxmas[i];
     k:=i;
    end;
   maxf:=letter[k];
  // maxf:=max;
  end;
Procedure VivodMas(fl:bool; xc:mas; nx:integer; a:char; var fx2:text);
  var
   i, j: integer;
   flag: boolean;
  begin
   flag:=true;
   write(fx2, 'Ответ для матрицы ', a, ' и строки С', a,':');
   for i:=1 to nx do
    if fl[i] then
    begin
     write(fx2, xc[i], ' ');
     flag:=false;
    end;
   if flag then
    write(fx2, 'Не выведено ни одного элемента');
   writeln(fx2);
  end;
begin   
 assign(fa, 'Inp.txt'); 
 reset(fa);
 assign(OutA, 'Out1.txt');
 ReWrite(OutA);
 VvodMasMatrix(a, ca, na, fa);
 VvodMasMatrix(b, cb, nb, fa);
 VvodMasMatrix(c, cc, nc, fa);
 Conditional(fla, a, ca, na);
 Conditional(flb, b, cb, nb);
 Conditional(flc, c, cc, nc);
 sumA:=sigma(a, na);
 sumB:=sigma(b, nb);
 sumC:=sigma(c, nc);
 ch:=maxf(sumA, sumB, sumC);
 VivodMas(fla, ca, na, 'A', outA);
 VivodMas(flb, cb, nb, 'B', outA);
 VivodMas(flc, cc, nc, 'C', outA);
 write(OutA, 'В матрице "', ch, '" сумма элементов максимальна'); 
 close(OutA);
end.