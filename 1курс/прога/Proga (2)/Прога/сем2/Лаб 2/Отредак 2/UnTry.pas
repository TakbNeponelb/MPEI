unit UnTry;
interface
type
Predm = (Физика,Инжа,МатАн,ЛинАлАналГем,Программирование,Физра,Англ); 
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
  n, kol: integer;
  ch: char;
begin
  if ParamCount<1 then
  begin
    writeln('Мало параметров '#13#10'Press enter');
    readln;
  end
  else
  begin
    Assign(fr, ParamStr(1));
    Try ReWrite(fr);    
      repeat
        with Grupsx do
        begin
          write('Введите группу: '); readln(grup);
          write('Введите код предмета:'); readln(n); Predmets:=Predm(n-1);
          write('Введите оценку : '); readln(n); Mark:=Marks(n-2);
          write('Введите Количество студентов (из указанной Группы с указанной Оценкой по Предмету): '); readln(NumStud);
        end;
        write(fr, Grupsx);
        inc(kol);
        write('Ещё? (y/n)');
        readln(ch);
      until Upcase(ch)='N';
      CloseFile(fr);
      writeln('Создан типизированный файл из ',kol,' записей');
      Except
        writeln('Error: не удалось создать типизированный файл ',ParamStr(1));
        write('Press ENTER'); readln;
      end;
  end;
end;
Procedure CreateFile2;
var
  Grupsx:Grups;
  Inp:text;
  fr: file of Grups;
  n, m, kol: integer;
  FileName:string[40];
begin
  if ParamCount<2 then
  begin
    writeln('Мало параметров '#13#10'Press enter');
    readln;
  end
  else
  begin
    Assign(Inp, Paramstr(2));
    Try  Reset(Inp);
      Assign(fr, Paramstr(1));
      Try  ReWrite(fr);
        while not(eof(Inp)) do
        begin
          with Grupsx do
          begin
            read(Inp, FileName); grup:=FileName;
            read(Inp,n); Predmets:=Predm(n-1);
            read(Inp,m); Mark:=Marks(m-2);
            readln(Inp,NumStud);
          end;
          write(fr, Grupsx);
          inc(kol);
        end;
        writeln('Была создан файл из ', kol,' записей');
        close(fr);
        Close(Inp);
      Except
        writeln('Error: не удалось создать типизированный файл ',ParamStr(1));
        write('Press ENTER'); readln;
      end;
    Except
      writeln('Error: не удалось открыть текстовый файл ',Paramstr(2));
      write('Press ENTER'); readln;
    end;
  end;
end;
Procedure Findsmth;
var
  Grupsx,temp:Grups;
  fr: file of Grups;
  n, m, l, kol: integer;
begin
if ParamCount<1 then
  begin
    writeln('Мало параметров '#13#10'Press enter');
    readln;
  end
  else
  begin
  Assign(fr, paramstr(1));
  Try  reset(fr);
  writeln('Выберите значение оценки:');
  readln(n);
  kol:=0;
  while(m=0)and(not(eof(fr))) do
  begin
    read(fr,Grupsx);
    if Grupsx.Mark=Marks(n-2) then
    begin
      m:=Grupsx.NumStud;
      l:=kol;
    end;
    inc(kol);
  end;
  while not(eof(fr)) do begin
    read(fr,Grupsx);
    if (Grupsx.Mark=Marks(n-2))and(m<Grupsx.NumStud) then 
    begin
      m:=Grupsx.NumStud;
      l:=kol;
    end;
    inc(kol);
    end;
  if not(l=0) then
  begin
    seek(fr,(l-1));
    read(fr, Grupsx);
    read(fr, temp);
    seek(fr,(l-1));
    writeln(temp);
    write(fr, temp);
    write(fr, Grupsx);
    close(fr);
  end
  else
    writeln('Обмен не был осуществлен из-за ошибки');
    Except
        writeln('Error: не удалось создать типизированный файл ',ParamStr(1));
        write('Press ENTER'); readln;
    end;
 end;
end;
Procedure ViewFile;
var
  Grupsx:Grups;
  fr: file of Grups;
begin
  if ParamCount<1 then
    begin
      writeln('Мало параметров '#13#10'Press enter');
      readln;
    end
    else
    begin
    Assign(fr, Paramstr(1));
    Try  reset(fr);
    while not(eof(fr)) do begin
      read(fr,Grupsx);
      write(Grupsx);
      writeln();
    end;
    close(fr);
    Except
        writeln('Error: не удалось создать типизированный файл ',ParamStr(1));
        write('Press ENTER'); readln;
    end;
  end;
end;
end.
