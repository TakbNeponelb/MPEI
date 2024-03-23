unit VvodVivod;
interface
uses IniFini;
  Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  Procedure VivodMas(fl:bool; xc:mas; nx:integer; a:char; re:real; var fx2:text);
implementation
  Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  var 
   i, j:integer;
  begin
   read(fx1, nx);
   for i:=1 to nx do
    read(fx1, xc[i]); 
   for i:=1 to nx do
    for j:=1 to nx do
     read(fx1, x[i,j]);
  end;
  Procedure VivodMas(fl:bool; xc:mas; nx:integer; a:char; re:real; var fx2:text);
  var
   i, j: integer;
   flag: boolean;
  begin 
   flag:=true;
   writeln(fx2, 'Ответ для матрицы ', a, ' и строки С', a,':');
   writeln(fx2, 'Сумма элементов равна: ', re);
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
end.