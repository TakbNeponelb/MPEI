Unit Un19;
interface
Const
  Cifr : set of '0'.. '9' = ['0'.. '9'];
  BukvLats: set of char = ['a'..'z'];
  BukvLatZ: set of char = ['A'.. 'Z'];
function Prov1(const S:string):byte;
procedure Sort1(var s:string);
Implementation
function Prov1:byte;
var 
  Nom: byte;
  i,Len: integer;
begin
Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not ((S[i] in Cifr) or (S[i] in BukvLats) or (S[i] in BukvLatz)) then
        Nom:=2
        else
        Inc(i);
      end;
    End;
  Prov1:=Nom;
End;
procedure Sort1(var s:string);
Var 
  i, z, len: Word;
  flag: Boolean;
  ch: char;
Begin
  Z:=1;  len:=length(s);
  Repeat
    flag:=true;
    for i:=1 to len-z do
      if ((s[i] in BukvLatZ) and ((s[i+1] in Cifr) or (s[i+1] in BukvLats))) or
         ((s[i] in Cifr) and (s[i+1] in BukvLats)) or
         ((s[i] in Cifr) and (s[i+1] in Cifr) and (s[i]<s[i+1])) or
         ((s[i] in BukvLatZ) and (s[i+1] in BukvLatZ) and (s[i]>s[i+1]))
      then
      begin
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End;
end.