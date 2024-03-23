program Lab2;  
 	
const
  Nmax = 20;{верхняя граница индексов массива – максимальное количество точек}

	   {раздел описания переменных:}
var
  n, i, num_triangle: integer;
  perimeter: real;
  A, B, C: array [0..Nmax] of real;

	   {раздел операторов:}
begin
	   
  
   //вывод заголовка в выходной документ:
  writeln('Лаб.2':40); {вывод c переходом на следующую строку}
	     {ввод исходных данных: }
  writeln('Количество троек n (0<n<=20):'); readln(n); {обр 1.1,1.2}
	     {ввод массивов A, B, C:}
  if (n <= 0) or (n > 20) then
  begin
    writeln('Ошибка задания условия');
    exit;
  end;
  
  writeln('Стороны треугольника:'); {обр2.1} 	 
  i := 0;    
  while i<n do
  begin
    readln(A[i], B[i], C[i]);
    if (A[i]<=0) or (B[i]<=0) or (C[i]<=0) or (A[i]>20) or (B[i]>20) or (C[i]>20)  then
    begin
    writeln('Ошибка задания условия');
    exit;
    end;  
    {обр2.2:ввод 3 элементов через пробел и переход на след. строку}
    i := i+1;
  end;
	     {вывод входных данных в выходной документ для подтверждения: }
  for i := 1 to 80 do write('='); { отделим визуально чертой и строкой введенные и выводимые значения }
  writeln;
  
  
  writeln('Количество троек =', n:3); {обр4}
  
	      {вывод исходных массивов A, B, C}
  writeln('Стороны треугольника: ');
  i := 0;
  while i < n do {обр4,5}
  begin
    writeln(' ':5, A[i]:3:1, ' ':8, B[i]:3:1, ' ':8, C[i]:3:1);  
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
    writeln('Из всех троек можно составить треугольник!':45);
    writeln('	Периметр = ', perimeter:3);
  end
  else if num_triangle = 0 then
  begin
    writeln('Ни из одной тройки нельзя составить треугольник!');
    writeln('Вычислить периметр невозможно');
  end
       else
  begin
    writeln('	Кол-во треугольников = ', num_triangle:2); {обр.7}
    writeln('	Периметр = ', perimeter:3); {обр.8}
  end;
  write('Press Enter…'); readln; {задерживаем экран до нажатия ENTER}
end.


