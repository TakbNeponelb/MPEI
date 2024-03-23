program Лаб_4;

var
  fin, fout : Textfile;
  
begin;
  Assign(fin, '1.txt');
  Assign(fout, '2.txt');
  ReSet(fin);
  ReWrite(fout);
  close(fin);
  close(fout);
  end.