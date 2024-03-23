repeat
      i:=i+1;
      flag:=false;
         for j:=n-1 downto i do
            if a[j] > a[j+1] then
              begin
                c:=a[j]; a[j]:=a[j+1]; a[j+1]:=c;
                flag:=true
              end;
     until not flag;
     
     
     
repeat
 i:=i+1;
 flag:=false;
  temp:=a[i];
  for j:=i+1 to n do
   if a[j]>temp then
    temp:=a[j];
 a[i]:=temp;
until not flag;
     
     