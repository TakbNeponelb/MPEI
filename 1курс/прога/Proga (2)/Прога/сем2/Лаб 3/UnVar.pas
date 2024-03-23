unit UnVar;

interface
type

  TInfo = char;

  PElem = ^TElem;
  TElem = record
      info: TInfo;
      next: PElem;
  end;
function Voidness(ListC:PElem):Boolean;  
function GetNext(ListC:PElem):PElem;
//procedure SetNext(var ListC1, ListC2:PElem);
function GetInfo(ListC:PElem):Tinfo;
//procedure SetInfo(ListC:PElem; r:TInfo);
procedure DeleteFirst(var ListN: PElem);
procedure DeleteLast(var ListN, ListK: PElem);
procedure DeleteMedium(var ListN, ListK: PElem; ch:TInfo);
procedure CreateList(var ListN, ListK: PElem; r: TInfo);
procedure AddFirst(var ListN: PElem; ListK: PElem; r: TInfo);
procedure AddLast(ListN: PElem; var ListK: PElem; r: TInfo);
procedure AddMedium(ListN,ListC,ListK: PElem; r: TInfo);
procedure AddR(var ListN, ListK: PElem; r: TInfo);

implementation

{procedure SetNext(var ListC1, ListC2:PElem);
begin
  ListC1^.next:=ListC2;
end;}

function Voidness(ListC:PElem):Boolean;
begin
if ListC=nil then
Voidness:=true
else
Voidness:=false;
end;

Function GetNext(ListC:PElem):PElem;
begin
  GetNext:=ListC^.next;
end;

{
Procedure SetPELem(ListC1, ListC2:PElem);
begin
  ListC1:=ListC2;
end;
}

Function GetInfo(ListC:PElem):Tinfo;
begin
  GetInfo:=ListC^.info;
end;

{
Procedure SetInfo(ListC:PElem; r:TInfo);
begin
  ListC^.info:=r;
end;
}

procedure DeleteFirst(var ListN: PElem);
var
  ListC: PElem;
begin
  ListC:=ListN;
  ListN:=GetNext(ListN);
  Dispose(ListC);
  ListC:=nil;
end;
procedure DeleteLast(var ListN, ListK: PElem);
var
  ListC: PElem;
begin
  ListC:=ListN;
  while not(GetNext(GetNext(ListC))=nil) do
  begin
    ListC:=GetNext(ListC);
  end;
  ListK:=ListC;
  ListK^.next:=nil;
  ListC:=GetNext(ListC);
  Dispose(ListC);
  ListC:=nil;
end;
procedure DeleteMedium(var ListN, ListK: PElem; ch:TInfo);
var
  ListC1,ListC3:PElem;
begin
ListC1:=ListN;
while (GetInfo(GetNext(ListC1))<ch)and(not(GetNext(ListC1)=ListK)) do
  begin
    ListC1:=GetNext(ListC1);    
  end;
if (GetInfo(GetNext(ListC1))=ch) then
  begin
    ListC3:=GetNext(GetNext(ListC1));
    dispose(ListC1^.next);
    ListC1^.next:=ListC3;
  end;
end;

procedure CreateList(var ListN, ListK: PElem; r: TInfo);
begin
  New(ListN);
  ListK:=ListN;
  ListN^.info:=r;
  ListN^.next:=nil;
end;

procedure AddFirst(var ListN: PElem; ListK: PElem; r: TInfo);
var Elem: PElem;
begin
  new(Elem);
  Elem^.info:=r;
  Elem^.next:=ListN;
  ListN:=Elem;
end;


procedure AddLast(ListN: PElem; var ListK: PElem; r: TInfo);
var
ListB:PElem;
begin
  ListB:=GetNext(ListK);
  new(ListB);
  ListB^.info:=r;
  ListB^.next:=nil;
  ListK^.next:=ListB;
  ListK:= ListB; 
end;

procedure AddMedium(ListN, ListC, ListK: PElem; r: TInfo);
var Elem: PElem;
begin
  new(Elem);
  Elem^.info:=r;
  Elem^.next:=GetNext(ListC);
  ListC^.next:=Elem;
end;

procedure AddR(var ListN, ListK: PElem; r: TInfo); 
var ListC: PElem;
begin
  if voidness(ListN) then CreateList(ListN, ListK, r)
  else
    if r <= (GetInfo(ListN)) then AddFirst(ListN, ListK, r)
    else
       if r >= (GetInfo(ListK)) then AddLast(ListN, ListK, r)
       else
         begin
           ListC:=ListN;
           while GetInfo(GetNext(ListC)) <= r do
             ListC:=GetNext(ListC);
           AddMedium(ListN, ListC, ListK, r)
         end;
end;

end.
