Program Lab_6;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, kmin, kPositive, Nom:integer;
x:mas;
xmin:real;
anomaly:boolean;
Inp,Outp:text;
begin
  Assign(Inp,'Inp1.txt');
  Assign(Outp,'Out.txt');
  ReSet(Inp);
  ReWrite(Outp);
  readln(Inp, n);
  if ((n>20) or (n<0)) then
    begin
     write(Outp,'Ошибка! Кол-во элементов массива превышает 20, либо меньше 0');
     Close(Inp);
     Close(Outp);
    end
  else
   begin
    for i:=1 to n do
     read(Inp, x[i]); 
    for i:=1 to n do
     if abs(x[i])>10 then
      begin
       writeln(Outp,'Элемент массива ', i, ' превышает заданный промежуток!');
       anomaly:=true;
      end;
     if anomaly=true then
     else
      begin
      i:=1;
      while (Nom=0) and (i<=n) do
       begin
        if x[i]=0 then 
         Nom:=i;
        inc(i);
       end;
       if Nom=0 then
        i:=1;
       while (kPositive=0) and (i<=n) do
        begin
         if x[i]>0 then
          kPositive:=i;
         inc(i);
        end;
      if kPositive=0 then
       begin
        write(Outp,'Ошибка! В массиве не найдены положительные числа!');
        close(Inp);
        close(Outp);
       end
      else
       begin
        kmin:=kPositive;
        xmin:=x[kPositive];
        for i:=Nom+1 to n do
         if (x[i] < xmin) and (x[i]>0) then
          begin
           xmin:=x[i];
           kmin:=i;
          end;
        write(Outp,'Наименьшее положительное число массива равно: ',xmin,#13#10,'Его номер в массиве равен: ',kmin);
        close(Inp);
        close(Outp);
       end;
      end;
   end;
end.