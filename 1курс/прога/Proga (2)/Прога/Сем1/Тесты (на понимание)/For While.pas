program o;
var
n,i:integer;
begin
read(n);
for i:=1 to n do
  write(i);
writeln();
writeln(i);
i:=0;
while (i<n) do
  begin
    write(i);
    inc(i);
  end;
end.