program t;

uses Un;

var
  ch: char;

begin
  repeat
    writeln('=======================================');
    writeln('D - создать новый тип.файл в диалоге; ');
    writeln('N - создать из текстового файла; ');
    writeln('F - поиск и изменение; ');
    writeln('V - просмотр;');
    writeln('E - выход');
    write('Ваш выбор? '); readln(ch);
    writeln('=======================================');
    ch := UpCase(ch);
    case ch of
      'D': CreateFile1;
      'N': CreateFile2;
      'F': Findsmth;
      'V': ViewFile;
      'E':;
    else
      begin
        writeln('Нет такой команды');
        write('Press ENTER'); readln;
      end;
    end;
  until ch = 'E';
end.

