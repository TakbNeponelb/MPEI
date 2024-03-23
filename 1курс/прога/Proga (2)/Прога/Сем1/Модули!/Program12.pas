program a1;
uses IniFini, VvodVivod, Lab8;
var
a, b, c:matrix;
ca, cb, cc:mas;
na, nb, nc:integer;
Suma, sumb, sumc:real;
Cona, Conb, Conc:bool;
begin
VvodMasMatrix(a, ca, na, Inp);
VvodMasMatrix(b, cb, nb, Inp);
VvodMasMatrix(c, cc, nc, Inp);
Conditional(Cona, a, ca, na);
Conditional(Conb, b, cb, nb);
Conditional(Conc, c, cc, nc);
Suma:=sigma(a, na);
Sumb:=sigma(b, nb);
Sumc:=sigma(c, nc);
writeln(Outp, 'Максимальная сумма элементов в матрице "',maxf(Suma, Sumb, Sumc),'"');
vivodMas(Cona, ca, na, 'A', Suma, Outp);
vivodMas(Conb, cb, nb, 'B', Sumb, Outp);
vivodMas(Conc, cc, nc, 'C', Sumc, Outp);
end.