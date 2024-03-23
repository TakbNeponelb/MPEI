program Лаб_4;

const
  Nmax=20;
  
var
  n, i, num_triangle, error: integer;
  perimeter: real;  
  A, B, C: array [0..Nmax-1] of real;
  Inp, fout : Text;
  
begin
  Assign(Inp, '1.txt');
  Assign(fout, '2.txt');
  ReSet(Inp);
  ReWrite(fout);
  readln(Inp, n);
  
  if (n <= 0) or (n > 20) then
  begin
    write(fOut,'Ошибка! Кол-во элементов массива превышает 20, либо меньше 0');
   
    write('Press Enter…'); readln;
  end
  else
    begin	 
  i := 0;  
  error := 0;
  while i<n do
  begin
    read(Inp, A[i], B[i], C[i]);
    if (A[i]<=0) or (B[i]<=0) or (C[i]<=0) then
    error += 1;
    {обр2.2:ввод 3 элементов через пробел и переход на след. строку}
    i := i+1;
  end;
  if error <> 0 then
  begin
    write(fOut,'Ошибка!');
    
    write('Press Enter…'); readln;
  end
  else
    begin
  
  
  writeln(fout, 'Количество троек =', n:3); {обр4}
  
	      {вывод исходных массивов A, B, C}
  writeln(fout,'Стороны треугольника: ');
  i := 0;
  while i < n do {обр4,5}
  begin
    writeln(fout,' ':5, A[i]:3:1, ' ':8, B[i]:3:1, ' ':8, C[i]:3:1);  
    i := i + 1;
  end;
  num_triangle := 0;
  perimeter := 0;
  i := 0;
  while i < n do  // перебираем по-очереди все n точек
  begin
    if ((B[i] + C[i]) - A[i] > 0.01) and ((A[i] + C[i]) - B[i] > 0.01) and ((B[i] + A[i]) - C[i] > 0.01) then // Проверка усл на неравенство треугольника
    begin
      num_triangle := num_triangle + 1;  // и количество увеличиваем
      perimeter := perimeter + A[i] + B[i] + C[i];
    end; 
    i := i + 1; 
  end;
  if num_triangle = n then
  begin
    writeln(fout,'Из всех троек можно составить треугольник!');
    writeln(fout,'Периметр = ', perimeter:3);
  end
  else if num_triangle = 0 then
  begin
    writeln(fout,'Ни из одной тройки нельзя составить треугольник!');
    writeln(fout,'Вычислить периметр невозможно');
  end
       else
  begin
    writeln(fout,'Кол-во треугольников = ', num_triangle); {обр.7}
    writeln(fout,'Периметр = ', perimeter:3); {обр.8}
  end;
   
  end;
  end;
  Close(Inp);
  Close(fout);
  writeln('Press Enter...'); readln;
  
end.