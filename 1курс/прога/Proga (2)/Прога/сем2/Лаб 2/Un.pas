unit Un;
interface
type
Predm = (Физика,Инжа,МатАн,ЛинАлАналГем,Программирование,Фиpра,Англ); 
Marks=(Неудовл,Удовл,Хор,Отл);
{Predm = (Fizika,Inja, Matan, Linal, Proga, Fizra, Angl); 
Marks=(neudovl,udovl,horosho, otlichno);}
Grups=record
  grup:string[40];
  Predmets:Predm;
  Mark:Marks;
  NumStud:integer;
end;
Procedure CreateFile1();
Procedure CreateFile2();
Procedure Findsmth();
Procedure ViewFile();
Implementation
Procedure CreateFile1;
var
  Grupsx:Grups;
  fr:file of Grups;
  n, m, kol: integer;
  ch: char;
  FileName:string[40];
begin
  writeln('Введите имя типизированного файла (без .txt)');
  readln(FileName);
  Assign(fr, FileName+'.txt');
  ReWrite(fr);
  repeat
    write('Введите группу: '); readln(Grupsx.grup);
    write('Введите код предмета:'); readln(n); Grupsx.Predmets:=Predm(n-1);
    write('Введите оценку : '); readln(m); Grupsx.Mark:=Marks(m-2);
    write('Введите Количество студентов (из указанной Группы с указанной Оценкой по Предмету): '); readln(Grupsx.NumStud);
    write(fr, Grupsx);
    inc(kol);
    write('Ещё? (y/n)');
    readln(ch);
  until Upcase(ch)='N';
  CloseFile(fr);
  writeln('Создан типизированный файл из ',kol,' записей');
end;
Procedure CreateFile2;
var
  Grupsx:Grups;
  Inp:text;
  fr: file of Grups;
  n, m, kol: integer;
  FileName:string[40];
begin
  writeln('Введите имя файла для считывания (без .txt)');
  readln(FileName);
  Assign(Inp, FileName+'.txt');
  Reset(Inp);
  writeln('Введите имя типизированного файла (без .txt)');
  readln(FileName);
  Assign(fr, FileName+'.txt');
  ReWrite(fr);
  while not(eof(Inp)) do
  begin
    read(Inp, FileName); Grupsx.grup:=FileName;
    read(Inp,n); Grupsx.Predmets:=Predm(n-1);
    read(Inp,m); Grupsx.Mark:=Marks(m-2);
    readln(Inp,Grupsx.NumStud);
    write(fr, Grupsx);
    inc(kol);
  end;
  write('Была создан файл из ', kol,' записей');
  close(fr);
  Close(Inp);
end;
Procedure Findsmth;
var
  Grupsx,temp:Grups;
  fr, outp: file of Grups;
  n, m, l, i, kol: integer;
  FileName:string[40];
begin
  writeln('Введите имя типизированного файла (без .txt)');
  readln(FileName);
  Assign(fr, FileName+'.txt');
  reset(fr);
  writeln('Введите имя отредактированного файла (без .txt)');
  readln(FileName);
  Assign(Outp, FileName+'.txt');
  rewrite(outp);
  writeln('Выберите значение оценки:');
  read(n);
  kol:=0;
  m:=0;
  while not(eof(fr)) do begin
    read(fr,Grupsx);
    if (Grupsx.Mark=Marks(n-2))and(m<Grupsx.NumStud) then 
    begin
      m:=Grupsx.NumStud;
      l:=kol;
      temp:=Grupsx;
    end;
    inc(kol);
    end;
  close(fr);
  reset(fr);
  if kol=1 then
  begin
    Grupsx:=temp;
    write(Outp,Grupsx);
  end
  else 
  begin
  i:=1;
  while i<=(kol) do
  begin
    if i=l then
    begin
      Grupsx:=temp;
      write(Outp,Grupsx);
      read(fr, Grupsx);
      write(Outp,Grupsx);
      read(fr,Grupsx);
      inc(i);
    end
    else 
    begin
      read(fr, Grupsx);
      write(Outp,Grupsx);
    end;
    inc(i);
  end;
  end;
  close(fr);
  close(Outp);
  readln;
end;
Procedure ViewFile;
var
  Grupsx:Grups;
  fr: file of Grups;
  FileName:string[40];
begin
  writeln('Введите имя типизированного файла (без .txt)');
  readln(FileName);
  Assign(fr, FileName+'.txt');
  reset(fr);
  while not(eof(fr)) do begin
    read(fr,Grupsx);
    write(Grupsx);
  end;
  close(fr);
end;
end.