unit Libdate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,dateutils,Libstring;

function BulanTahun(tgl:TDateTime):string;
function AddMonth(dateNow:TDateTime;jml : integer):TDateTime;
Function CBulan(iBulan : integer) : string;
Function CHari(iDay:Integer) : string;
Function CHariTgl(tTgl:TDateTime) : string;
implementation

function BulanTahun(tgl:TDateTime):string;
begin
  Result:='';
  case MonthOf(tgl) of
  1:Result:='A'+FormatDateTime('yy',tgl);
  2:Result:='B'+FormatDateTime('yy',tgl);
  3:Result:='C'+FormatDateTime('yy',tgl);
  4:Result:='D'+FormatDateTime('yy',tgl);
  5:Result:='E'+FormatDateTime('yy',tgl);
  6:Result:='F'+FormatDateTime('yy',tgl);
  7:Result:='G'+FormatDateTime('yy',tgl);
  8:Result:='H'+FormatDateTime('yy',tgl);
  9:Result:='I'+FormatDateTime('yy',tgl);
  10:Result:='J'+FormatDateTime('yy',tgl);
  11:Result:='K'+FormatDateTime('yy',tgl);
  12:Result:='L'+FormatDateTime('yy',tgl);
  end;
end;

function AddMonth(dateNow:TDateTime;jml : integer):TDateTime;
var
  tanggal,bulan,tahun : string;
  temp1,temp2 :integer;

  begin

    tanggal := FormatDateTime('dd',dateNow) ;
    bulan   := FormatDateTime('mm',dateNow);
    tahun   := FormatDateTime('yyyy',dateNow);

    temp1 := StrToInt(bulan) + jml;
    temp2 := StrToInt(tahun);
    
    if temp1 > 12 then
      begin
        temp1:= temp1 - 12;
        temp2:= temp2 + 1;
      end;
    if temp1 < 1 then
      begin
        temp1 := temp1 + 12;
        temp2 := temp2-1;
      end;  

    bulan:=Rpad(IntToStr(temp1),2,'0');
    tahun:=Rpad(IntToStr(temp2),4,'0');

    Result:=StrToDate(tanggal+'/'+bulan+'/'+tahun,'dd/mm/yyyy');
  end;

Function CBulan(iBulan : integer) : string;
begin
  Result := trim(copy('Januari  Februari Maret    April    Mei      Juni     Juli     Agustus  SeptemberOktober  November Desember ',( iBulan * 9)-8,9 ));
end;

Function CTanggal(tTgl : tDateTime ; sLong : string = 'L'; sSpr : string = ' ') : string;
var sTgl:string;
    iBulan:integer;
begin
  sTgl   := formatdatetime('ddmmyyyy',tTgl);
  iBulan := strtoint(copy(sTgl,3,2));
  if sLong = 'L' then
     Result := leftstr(sTgl,2)+sSpr+trim(copy('Januari  Februari Maret    April    Mei      Juni     Juli     Agustus  SeptemberOktober  November Desember ',( iBulan * 9)-8,9 ))+sSpr+rightstr(sTgl,4)
  else
  begin
   if sLong = 'A' then
     Result := leftstr(sTgl,2)+sSpr+copy(sTgl,3,2)+sSpr+rightstr(sTgl,4)
   else
     Result := leftstr(sTgl,2)+sSpr+trim(copy('Jan Feb Mar Apr Mei Jun Jul Ags Sep Okt Nov Des',( iBulan * 4)-3,3 ))+sSpr+rightstr(sTgl,4);
  end;
end;

Function CHari(iDay:Integer) : string;
begin
  Result := trim(copy('MINGGU   SENIN    SELASA   RABU     KAMIS    JUMAT    SABTU    ',( iDay*9 )-8,9 ));
end;

Function CHariTgl(tTgl:TDateTime) : string;
var iDay:integer;
begin
  iDay := DayOfTheWeek(tTgl)+1;
  Result := trim(copy('MINGGU   SENIN    SELASA   RABU     KAMIS    JUMAT    SABTU    Minggu',( iDay*9 )-8,9 ));
end;

end.

