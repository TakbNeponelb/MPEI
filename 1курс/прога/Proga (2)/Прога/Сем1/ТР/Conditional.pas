Unit conditional;
interface
uses IniFini;
  function ProvMat(x:matrix; nx:integer):boolean;
  function ProvMass(xc:mas; nx:integer):boolean;
  function SrArif(x:matrix; nx:integer):real;
  function check(srX:real; xc:mas; nx:integer):boolean;
  procedure izm(var x:matrix; nx:integer; srX:real); 
implementation
function ProvMat(x:matrix; nx:integer):boolean;
var
i, j:integer;
fl:boolean;
begin
fl:=true;
i:=1;
j:=1;
while (i<=nx)and(fl) do begin
while (j<=nx)and(fl) do begin
if abs(x[i,j])>100 then
fl:=false
else
j:=j+1;
end;
i:=i+1;
end;
ProvMat:=not(fl);
end;
function ProvMass(xc:mas; nx:integer):boolean;
var
i:integer;
fl:boolean;
begin
fl:=true;
i:=1;
while (i<=nx)and(fl) do begin
if abs(xc[i])>100 then
fl:=false
else
i:=i+1;
end;
ProvMass:=not(fl);
end;
function SrArif(x:matrix; nx:integer):real;
var
i:integer;
l:real;
begin
 for i:=1 to nx do
  l:=l+x[i,i];
 fsrX:=l/nx;
end;
function check(srX:real; xc:mas; nx:integer):boolean;
var
i:integer;
fl:boolean;
begin
fl:=true;
i:=1;
while (i<=nx) and fl do
if (srX>=xc[i]) then
fl:=false
else
i:=i+1;
check:=fl;
end;
procedure izm(var x:matrix; nx:integer; srX:real);
var
i, j:integer;
begin
for i:=1 to nx do
  for j:=1 to nx do
  begin
  if x[i,j]>0 then
    x[i,j]:=X[i,j]+srX;
  if x[i,j]<0 then
    x[i,j]:=x[i,j]-srX;
  end;
end;
end.