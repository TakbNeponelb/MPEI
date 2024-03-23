Unit Lab8;
interface
Uses IniFini;
 procedure Conditional(var fl:bool; x: matrix; xc: mas; nx: integer);
 function sigma(x: matrix; nx: integer): real;
 function maxf(a, b, c:real): char;
implementation
 procedure Conditional(var fl: bool; x: matrix; xc: mas; nx: integer);
  var
   i, j: integer;
   flag: boolean;
  begin
   for i:=1 to nx do
   begin
   flag:=true;
    for j:=1 to nx do
     if xc[i]<=x[i,j] then
       flag:=false;
    if flag then
     fl[i]:=true;
   end;
  end;
 function sigma(x: matrix; nx: integer): real;
  var
   i, j: integer;
   sum: real;
  begin
   for i:=1 to nx do
    for j:=1 to nx do
     sum:=sum+x[i,j];
   sigma:=sum;
  end;
 function maxf(a, b, c:real): char;
  type 
   ABC=array[1..3] of char;
   mass=array[1..3] of real;
  var
   letter:ABC;
   maxmas: mass;
   i, k: integer;
   max: real;
  begin
   letter[1]:='a';
   letter[2]:='b';
   letter[3]:='c';
   maxmas[1]:=a;
   maxmas[2]:=b;
   maxmas[3]:=c;
   max:=maxmas[1];
   k:=1;
   for i:=2 to 3 do
    if maxmas[2]>max then
    begin
     max:=maxmas[i];
     k:=i;
    end;
   maxf:=letter[k];
  // maxf:=max;
  end;
end.
   
  