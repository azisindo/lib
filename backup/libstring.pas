unit Libstring;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function Lpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
function Rpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;
function Cpad(vString1 : string; vJumlah:integer; vString2 :string=' '):string;

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
  vHasil :=RightStrtrStr(vString1 + vHasil,vJumlah);
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



end.

