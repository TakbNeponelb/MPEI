program Lab5;  
    
const
 Nmax=100;
 
var
  n, i, dif, min, num: integer;
  A: array [0..Nmax - 1] of real;
  fin, fout: TextFile;
  
begin
  AssignFile(fin, '1.txt');
  AssignFile(fout, '2.txt');
  Reset(fin);
  Rewrite(fout);
  readln(fin, n); {обр 1}
  if (n <= 0) or (n > 20) then write(fout, 'Ошибка!') else 
  begin
    for i := 0 to n - 1 do
    begin
      read(fin, Numbers[i]);      
    end;
    
    num := 0;
    dif := 1;
    min := (A[1]) * (A[1]) - (A[0]) * (A[0]);
    for i := 1 to n-1 do  // перебираем по-очереди все n точек
    begin
      if ((A[i]) * (A[i]) - (A[i - 1]) * (A[i - 1]) < min) then
      begin
        min := (A[i]) * (A[i]) - (A[i - 1]) * (A[i - 1]);
        dif := i;
        num := num + 1;
      end;
    end;
  if num <> 0 then 
    writeln(fout, dif)
  else
    writeln(fout, 'Все разницы одинаковые')
  end;
   
  CloseFile(input);
  CloseFile(output);
  writeln('Press Enter... '); readln;
end.
