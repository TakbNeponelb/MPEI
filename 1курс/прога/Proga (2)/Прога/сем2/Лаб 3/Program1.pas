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
//procedure SetPELem(ListC1, ListC2:PElem);
function GetInfo(ListC:PElem):Tinfo;
//procedure SetInfo(ListC:PElem; r:TInfo);
procedure CreateList(var ListN, ListK: PElem; r: TInfo);
procedure AddFirst(var ListN: PElem; ListK: PElem; r: TInfo);
procedure AddLast(ListN: PElem; var ListK: PElem; r: TInfo);
procedure AddMedium(ListN,ListC,ListK: PElem; r: TInfo);
procedure AddR(var ListN, ListK: PElem; r: TInfo);
implementation

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
  if ListN = nil then CreateList(ListN, ListK, r)
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
