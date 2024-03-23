program Lab_8;
const
  Nmax = 20;
type
  matrix = array [1..Nmax, 1..Nmax] of real;
var
  n, i, j: integer;
  x: matrix;
  Nom:real;
  Inp, Outp: text;
begin
  Assign(Inp, 'Inp.txt');
  Assign(Outp, 'Out1.txt');
  try
  ReSet(Inp);
  try
  try
  ReWrite(Outp);
  try
  try
  readln(Inp, n);
  for i:=1 to n do
   begin
    for j:=1 to n do
     read(Inp, x[i,j]);
     readln(Inp);
   end;
   for j:=1 to n do
    Nom:=0; 
    i:=n;
    while (Nom=0) and (i>=n) do
      begin
        if x[i,j]=0 then 
         begin
          Nom:=i;
          write(Outp, Nom);
         end;
        dec(i);
      end; 
  Except writeln('Ошибка при считывании или записи в файл') 
  End;
  Finally closeFile(Outp)
  End;
  Except writeln ('Ошибка при создании выходного файла ', Outp); 
  End; 
  Finally closeFile(Inp)
  End;
  Except writeln('Ошибка приоткрытии файла с исходными данными', Inp)
  End;
end.