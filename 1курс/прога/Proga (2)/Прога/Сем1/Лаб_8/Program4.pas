program Lab_8;
const
  Nmax = 20;
type
  matrix = array [1..Nmax, 1..Nmax] of real;
  mas = array [1..Nmax] of real;
var
  n, i, j, k: integer;
  x: matrix;
  c:mas;
  sum, Max:real;
  Inp, Outp: text;
  flag:boolean;
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
  readln(Inp);
  for i:=1 to n do
   read(Inp, c[i]);
  for i:=1 to n do
    for j:=1 to n do
      sum:=sum+x[i,j];
  write(Outp ,{'sum=',}sum);
  writeln(Outp);
  for i:=1 to n do      //i - индекс строки в матрице
   begin
    for j:=1 to n do   //j - индекс элемента массива С[j]
     begin
      k:=n;
      flag:=True;
      while (flag=True) and (k<=n) do //k - номер элемента в матрице x[i,k] при строке [i]
       begin
        if x[i,k]>=C[j] then
         flag:=False; 
        inc(k);
       end;
      if flag then
       begin
        write(Outp,{'C[', j ,']=',}C[j],' ');
       end;
     end;
     writeln(Outp); 
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
  