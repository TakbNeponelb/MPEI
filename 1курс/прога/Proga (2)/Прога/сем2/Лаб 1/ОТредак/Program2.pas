Program laba_ne_v_radost;
Uses Un19, Ul19;
var
S, S1, S2:string;
Nom:byte;
begin
read(S);
S1:=copy(S,1,length(S));
S2:=copy(S,1,length(S));
Nom:=Prov1(S1);
case Nom of 
1: writeln('Ну ты, это, хотя бы написал/ла бы что-то...');
2: writeln('Я просто так уточню, что нужно писать только цифры и буквы (Латинские)',#13#10,'Ты это правильные символы напиши в следующий раз, ок? ;-)');
else
begin
Sort1(S1);
writeln(S1);
end;
end;
Nom:=Prov2(S2);
case Nom of 
1: writeln('Ну ты, это, хотя бы написал/ла бы что-то...');
2: writeln('Я просто так уточню, что нужно писать только цифры и буквы (Латинские)',#13#10,'Ты это правильные символы напиши в следующий раз, ок? ;-)');
else
begin
Sort2(S2);
writeln(S2);
end;
end;
end.