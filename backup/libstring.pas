unit Libstring;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Types,Variants,StrUtils,DateUtils,LCLType;

function Lpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
function Rpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
function Cpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
Function str_rp(nilai : int64) : string;
Function str_koma(nilai : double) : string;
Function str_koma_1(nilai : double) : string;
Function nilai_rp(nilai : string) : Int64;
Function nilai_koma(nilai : string) : double;
Function dalam_str (nilai : double; smatauang:string='RUPIAH') : string ;
Function posisi_str(teks, kt : string ; posisi : integer = 1 ) : integer ;


implementation

function Lpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
var
   vHasil : string;
   vLoop:integer;
begin
  vHasil:='';
  for vLoop :=1 to vJumlah do vHasil:=vHasil + vString2;
  vHasil :=LeftStr(vString1 + vHasil,vJumlah);
  Result :=vHasil;
end; 

function Rpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
var
   vHasil : string;
   vLoop:integer;
begin
  vHasil:='';
  for vLoop :=1 to vJumlah do vHasil:=vHasil + vString2;
  vHasil :=RightStr(vHasil + vString1,vJumlah);
  Result :=vHasil;
end;

function Cpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
var
   vHasil : string;
   vLoop:integer;
begin
  vHasil:='';
  for vLoop :=1 to trunc((vJumlah-length(vString1))/2) do vHasil:=vHasil + vString2;
  vHasil :=vHasil + vString1;
  
  for vLoop:=1 to vJumlah do vHasil:= vHasil + vString2;
  vHasil:=LeftStr(vHasil,vJumlah);

  Result:=vHasil;

end;

Function str_rp(nilai : int64) : string;
var
  v_hasil : string ;
Begin
  if nilai = null then
    v_hasil := '0'
  else
    v_hasil := formatfloat('###,###,###,###',nilai) ;

  if length(v_hasil) = 0 then v_hasil := '0' ;

  result := v_hasil ;
End ;

Function str_koma(nilai : double) : string;
var
  v_hasil : string ;
Begin
  if nilai = null then
    v_hasil := '0'
  else
    v_hasil := formatfloat('###,###,###,###.###',nilai) ;

  result := v_hasil ;
End ;

 //Menghilangkan angka di belakang koma
Function str_koma_1(nilai : double) : string;
var
  v_hasil : string ;
Begin
  if nilai = null then
    v_hasil := '0'
  else
    v_hasil := formatfloat('###,###,###,##0',nilai) ;

  result := v_hasil ;
End ;

Function nilai_rp(nilai : string) : Int64;
var
  v_hasil : int64 ;
  v_temp  : string ;
Begin
  nilai   := trim(nilai) ;
  if nilai = '' then nilai := '0' ;
  v_temp  := stringreplace(nilai,' ','',[rfReplaceAll]) ;
  v_hasil := StrToInt(stringreplace(v_temp,',','',[rfReplaceAll])) ;

  result := v_hasil ;
End ;

Function nilai_koma(nilai : string) : double;
var
  v_hasil : double ;
  v_temp  : string ;
Begin
  nilai  := trim(nilai) ;
  if nilai = '' then nilai := '0' ;
  v_temp  := stringreplace(nilai,' ','',[rfReplaceAll]) ;
  v_hasil := StrTofloat(stringreplace(v_temp,',','',[rfReplaceAll])) ;

  result := v_hasil ;
End;

Function dalam_str (nilai : double; smatauang:string='RUPIAH') : string ;
var
  sMinus,hasil, h1, h2, h3, nil_str, tiga_digit : string ;
  a1, a2, a3, ke, angka, p_str : integer ;


begin
  if nilai < 0 then sMinus := 'MINUS ' else sMinus := '';
  nilai   := abs(nilai);
  nilai   := trunc(nilai) ;
  nil_str := floattostr(nilai) ;
  p_str   := length( nil_str ) ;
  ke      := 1 ;
  hasil   := '' ;

  while p_str > 0 do
  begin
    if p_str > 3 then
      tiga_digit := copy( nil_str, p_str - 2, 3)
    else
      tiga_digit := copy( nil_str, 1, p_str) ;

    angka := strtoint(tiga_digit) ;
    if angka <> 0 then
    begin
      h1 := '' ;
      h2 := '' ;
      h3 := '' ;

      a3 := angka mod 10 ;
      angka := trunc(angka / 10) ;
      a2 := angka mod 10 ;
      a1 := trunc(angka / 10) ;

      if a1 > 0 then
      begin
        h1 := trim( copy('SE      DUA     TIGA    EMPAT   LIMA    ENAM    TUJUH   DELAPAN SEMBILAN', ((a1 - 1) * 8) + 1, 8) ) ;
        if a1 = 1 then h1 := h1 + 'RATUS ' else h1 := h1 + ' RATUS ' ;
      end ;

      if a3 > 0 then
      begin
        h3 := trim( copy('SATU    DUA     TIGA    EMPAT   LIMA    ENAM    TUJUH   DELAPAN SEMBILAN', ((a3 - 1) * 8) + 1, 8) ) + ' ' ;
        if (a1 = 0) and (a2 = 0) and (a3 = 1) and (ke = 2)  then h3 := 'SE' ;
      End ;

      if a2 > 0 then
      begin
        if (a2 = 1) and (a3 <> 0) then
        begin
          h3 := '' ;
          h2 := trim( copy('SE      DUA     TIGA    EMPAT   LIMA    ENAM    TUJUH   DELAPAN SEMBILAN', ((a3 - 1) * 8) + 1, 8) ) ;
          if a3 = 1 then h2 := h2 + 'BELAS ' else h2 := h2 + ' BELAS ' ;
        end
        else
        begin
          h2 := trim( copy('SE      DUA     TIGA    EMPAT   LIMA    ENAM    TUJUH   DELAPAN SEMBILAN', ((a2 - 1) * 8) + 1, 8) ) ;
          if a2 = 1 then h2 := h2 + 'PULUH ' else h2 := h2 + ' PULUH ' ;
        end ;
      end ;

      hasil := h1 + h2 + h3 + trim( copy('       RIBU   JUTA   MILYAR TRILYUNBILYUN ',((ke-1) * 7) + 1,7) ) + ' ' + hasil ;
    end ;

    p_str := p_str - 3 ;
    ke    := ke + 1 ;
  end ;

  result := trim(sMinus)+' '+trim(hasil)+' '+smatauang ;
end ;

function posisi_str(teks, kt: string; posisi: integer): integer;
var
  hasil, aposisi, p : integer ;

begin
  hasil        := 0 ;
  teks         := trim(teks) ;
  plenteks     := length(kt) ;

  for aposisi := posisi to length(teks) do
  begin
    if ( copy(teks,aposisi,plenteks) = kt ) and (hasil = 0) then hasil := aposisi ;
  end ;
  result := hasil ;
end;


end.

