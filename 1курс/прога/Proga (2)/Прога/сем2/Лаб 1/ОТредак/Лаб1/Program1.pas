﻿Program laba_ne_v_radost;
Uses Un, Ul;
var
S, S1, S2:string;
Nom:byte;
begin
//write('Введите строку:');
read(S);
S1:=copy(S,1,length(S));
S2:=copy(S,1,length(S));
//writeln('1-ый способ');
Nom:=Prov1(S1);
case Nom of 
1: writeln('Ну ты, это, хотя бы написал/ла бы что-то...');
2: writeln('Я просто так уточню, что нужно писать только цифры и буквы (Латинские только заглавные)',#13#10,'Ты это правильные символы напиши в следующий раз, ок? ;-)');
else
begin
Sort1(S1);
writeln({'Отсортированная строчка: ',#13#10,}S1);
end;
end;
//writeln('2-ой способ');
Nom:=Prov2(S2);
case Nom of 
1: writeln('Ну ты, это, хотя бы написал/ла бы что-то...');
2: writeln('Я просто так уточню, что нужно писать только цифры и буквы (Латинские только заглавные)',#13#10,'Ты это правильные символы напиши в следующий раз, ок? ;-)');
else
begin
Sort2(S2);
writeln({'Отсортированная строчка: ',#13#10,}S2);
end;
end;
end.