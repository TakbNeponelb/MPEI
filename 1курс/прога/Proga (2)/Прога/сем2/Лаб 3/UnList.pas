unit UnList;
interface
uses UnVar;

procedure Delete1(var ListN, ListK: PElem);
procedure DeleteList(var ListN, ListK: PElem);
procedure AddN(var ListN, ListK: PElem);
procedure AddTxt(var ListN, ListK: PElem);
procedure Add1(var ListN, ListK: PElem);
procedure FindIt(const ListN:PElem);
procedure ViewList(const ListN:PElem);

implementation

procedure Delete1(var ListN, ListK: PElem);
var
ch:Tinfo;
begin
  writeln('Введите букву, которую хотите удалить:');
  readln(ch);
  if GetInfo(ListN)=ch then
    deletefirst(ListN)
  else
    if GetInfo(Listk)=ch then 
      deletelast(ListN, ListK)
    else
      if (GetInfo(ListN)<ch) and (GetInfo(ListK)>ch) then
        deleteMedium(ListN, ListK, ch);
end;

procedure DeleteList(var ListN, ListK: PElem);
begin
  while not Voidness(ListN) do
    DeleteFirst(ListN);
  ListN:=nil;
  ListK:=nil;
end;

procedure AddN(var ListN, ListK: PElem);
var n,i: integer; s:string; r: TInfo;
begin
  write('Сколько букв=?'); readln(s);
  if not TryStrToInt(s,n) then n:=1;
  for i:=1 to n do
  begin
    r:= chr(97+Random(26));
    AddR(ListN, ListK, r);
  end;
end;

procedure AddTxt(var ListN, ListK: PElem);
var
  f: TextFile;
  r: TInfo;
begin
  Assign(f, ParamStr(1));
  Reset(f);
  while not eof(f) do
    begin
      readln(f, r);
      AddR(ListN, ListK, r);
    end;
  writeln('Список создан');
  Close(f);
end;

procedure Add1(var ListN, ListK: PElem);
var
  r: TInfo;
begin
  write('введите букву(лат. строчную): '); readln(r);
  AddR(ListN, ListK, r);
end;

procedure FindIt;
var
  ListC: PElem;
  flag: boolean;
begin
  ListC:=ListN;
  while (not voidness(ListC)) and (GetInfo(ListC)<='b') do
  begin
    if GetInfo(ListC)='b' then
      flag:=true;
    ListC:=GetNext(ListC);
  end;
  if flag and (not voidness(ListC)) then
    writeln(GetInfo(ListC))
  else
  writeln('Ошибка, элемент не найден!');
end;

procedure ViewList;
var
  ListC: PElem;
begin
  writeln('Список:');
  ListC:=ListN;
  if Voidness(ListC) then writeln('Пустой')
  else
  begin
    while not voidness(ListC) do
    begin
      writeln(GetInfo(ListC));
      ListC:=GetNext(ListC);
    end;
  end;
end;
end.
