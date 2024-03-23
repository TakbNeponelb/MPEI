Unit Ul19;
interface
uses Un19;
Const
  SymbTable = 'abcdefghijklmnopqrstuvwxyz9876543210ABCDEFGHIJKLMNOPQRSTUVWXYZ';
function Prov2(const S:string):byte;
Procedure Sort2(var s:string);
Implementation
Function Prov2:byte;
Var
  Nom: byte;
  i,Len: integer;
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not (Pos(S[i], SymbTable)>0) then Nom:=2;
        Inc(i);
      end;
    End;
  Prov2:=Nom; 
End;
Procedure Sort2;
Var 
  i, z, len: Integer;
  flag: Boolean;
  ch: char;
Begin
  
  z:=1;  len:=length(s);
  Repeat
    flag:=true;
    for i:=1 to len-z do
      if (Pos(s[i], SymbTable) > Pos(s[i+1], SymbTable))and((pos(s[i],SymbTable)>pos('z',SymbTable))or(pos(s[i],SymbTable)<pos('a',SymbTable)))
      then
      begin
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End; 
end.