unit VvodVivod;
interface
uses IniFini;
  //function reading(nx:integer):integer;
  Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  Procedure VivodMas(xc:mas; nx:integer; var fx2:text);
  Procedure VivodMatrix(x:matrix; nx:integer; var fx2:text);
implementation
  {function reading(nx:integer):integer;
  var
  fl:boolean;
  begin
   fl:=true;
   while fl do
   begin
    writeln('Введите размерность матрицы от 5 до 100 (5)');
    read(nx);
    if (nx<101) and (nx>4) then
     fl:=false;
   end;
   reading:=nx;
  end;}
  Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  var 
   i, j:integer;
  begin
   //nx:=reading(nx);
   for i:=1 to nx do
    read(fx1, xc[i]); 
   for i:=1 to nx do
    for j:=1 to nx do
     read(fx1, x[i,j]);
  end;
  Procedure VivodMas(xc:mas; nx:integer; var fx2:text);
  var
   i: integer;
  begin 
  write(fx2, nx, #13#10, #13#10);
  for i:=1 to nx do
   write(fx2, xc[i]:5,' ');
  end;
  Procedure VivodMatrix(x:matrix; nx:integer; var fx2:text);
  var
  i, j:integer;
  begin
  writeln(fx2, #13#10);
  for i:=1 to nx do
  begin
  for j:=1 to nx do
   write (fx2, x[i,j]:5, ' ');
  writeln(fx2);
  end;
  end;
end.