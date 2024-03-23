program Lab4;
uses
  UnList, UnVar;
var
  ch: char;
  NachaloSpiska, KonecSpiska:PElem;
begin
  Randomize();
  repeat
    writeln('--------------------------------------');
    writeln('T - добавить в список из текстового файла; ');
    writeln('G - сгенерировать и добавить в список; ');
    writeln('J - добавить в список; ');
    writeln('S - найти в списке;');
    writeln('D - удалить(очистить) список;');
    writeln('M - удалить запись (с определенной буквой);');
    writeln('V - просмотр;');
    writeln('E - конец.');
    writeln('Ваш выбор?'); readln(ch);
    writeln('--------------------------------------');

    ch:= UpCase(ch);
    case ch of
    'T': AddTxt(NachaloSpiska, KonecSpiska);
    'G': AddN(NachaloSpiska, KonecSpiska);
    'J': Add1(NachaloSpiska, KonecSpiska);
    'S': FindIt(NachaloSpiska);
    'D': DeleteList(NachaloSpiska, KonecSpiska);
    'M': Delete1(NachaloSpiska, KonecSpiska);
    'V': ViewList(NachaloSpiska);
    'E': DeleteList(NachaloSpiska, KonecSpiska);
      else
        begin
          writeln('Нет такой команды');
          write('Press ENTER'); readln;
        end;
    end;

  until ch='E';
end.
