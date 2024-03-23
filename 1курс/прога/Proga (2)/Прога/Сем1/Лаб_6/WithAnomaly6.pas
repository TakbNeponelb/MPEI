Program Lab_6;
Const
Nmax=20;
type
mas=array [1..Nmax] of real;
var
n, i, k0, kmin:integer;
x:mas;
xmin:real;
flag,anomaly:boolean;
Inp,Out:text;
begin
  Assign(Inp,'Inp1.txt');
  Assign(Out,'Out.txt');
  ReSet(Inp);
  ReWrite(Out);
  readln(Inp, n);
  if ((n>20) or (n<0)) then
    begin
     write(Out,'Ошибка! Кол-во элементов массива превышает 20, либо меньше 0');
     Close(Inp);
     Close(Out);
    end
  else
   begin
    for i:=1 to n do
     read(Inp, x[i]); 
    for i:=1 to n do
     if abs(x[i])>10 then
      begin
       writeln(Out,'Элемент массива ', i, ' превышает заданный промежуток!');
       anomaly:=true;
      end;
     if anomaly=true then
     else
      begin
        k0:=1;
        for i:=1 to n do
         if (x[i]=0) and (k0>1) then
          k0:=i;
        flag:=false;
        for i:=k0 to n do
         if x[i]>0 then
          if flag=false then
           begin
            kmin:=i;
            xmin:=x[i];
            flag:=true;
           end
          else 
           if x[i]<xmin then
            begin
             xmin:=x[i];
             kmin:=i;
            end;
        if flag=false then
         write(Out,'Ошибка! В массиве не найдены положительные числа!')
        else
         write(Out,'Наименьшее положительное число массива равно: ',xmin,#13#10,'Его номер в массиве равен: ',kmin);
         close(Inp);
         close(Out);
      end;
   end;
end.