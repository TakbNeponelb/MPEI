Program Lab11;

var
 a, b, c:matrix;
 ca, cb, cc:mas;
 na, nb, nc:integer;
 fa, out:text;
 fla, flb, flc:bool;
 sumA, sumB, sumC:real;
Procedure VvodMasMatrix(var x:matrix; var xc:mas; var nx:integer; var fx1:text);
  var 
   i, j:integer;
  begin
   for i:=1 to nx do
    read(fx1, xc[i]); 
   for i:=1 to nx do
    for j:=1 to nx do
     read(fx1, x[i,j]);
  end;

begin