Unit IniFini;
interface
type 
  matrix=array[1..100,1..100] of real;
  mas=array[1..100] of real;
  bool=array[1..100] of boolean;
var
 Inp, Outp:text;
 name:string;

implementation

initialization
write('Введтите имя файла для считывания: ');
readln(name);
assign(Inp, name+'.txt');
reset(Inp);
assign(Outp,'Out.txt');
rewrite(Outp);
finalization
close(Inp);
close(Outp);
end.
