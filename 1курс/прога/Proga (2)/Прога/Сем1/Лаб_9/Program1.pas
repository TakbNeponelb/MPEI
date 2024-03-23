program Lab_8;
const
  Nmax = 20;
  Mmax=20;
type
  matrix = array [1..Nmax, 1..Mmax] of real;
var
  n, m, i, j: integer;
  x: matrix;
  flag:boolean;
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
  read(Inp, n);
  read(Inp, m);
  for i:=1 to m do
   begin
    for j:=1 to n do
     read(Inp, x[i,j]);
   end;
  i:=n;
  while (i>=1)and(flag)do
   begin
    flag:=false;
    j:=1;
    while (j<=n)and(flag) do
      if x[j,i]=0 then 
       flag:=true
      else
       j:=j+1;
    if not(flag) then
     write(Outp, i);
    i:=i-1;
   end;
   if flag then 
   write(Outp,'Нету столбца с 0 ');
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