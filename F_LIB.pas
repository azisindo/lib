unit F_LIB;

interface

uses
  Qt,SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls, StrUtils, IdTrivialFTPBase, QExtCtrls, QDBCtrls,
  DBXpress, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Math, Libc,
  MyAccess, DateUtils;

type
  Tlib = class(TForm)
    koma_detik: TTimer;
    Timer1: TTimer;
    procedure koma_detikTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    { variable }
    x_uu_code : string ;
    x_me_code : string ;
    x_micro : integer ;

    { Function }
    function TagProduk(sType:string;sSparator:string=';'): string;
    function bulantahun(tgl: tdatetime): string;
    function ToChar(s: string): string;
    Function posisi_str(teks, kt : string ; posisi : integer = 1 ) : integer ;
    Function cpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
    Function lpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
    Function rpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
    Function key_angka(key : variant) : boolean ;
    Function key_koma(key : variant) : boolean ;
    Function str_rp(nilai : int64) : string;
    Function str_koma(nilai : double) : string;
    Function str_koma_1(nilai : double) : string;
    Function nilai_rp(nilai : string) : Int64;
    Function nilai_koma(nilai : string) : double;
    Function Cek_no_afc(no : string) : string ;
    Function keluar : boolean ;
    Function simpan : boolean ;
    Function simpancetak : boolean ;
    Function hapus : boolean ;
    Function batal : boolean ;
    Function add_month (tgl : tdatetime; jml : integer) : tdatetime ;
    Function ulang (teks : string=' ' ; jml : integer=0) : string ;
    Function ShellCommand(command: string;PWait:boolean=true): string;

    Function acak_str(txt : string ; jenis : string = 'R') : string ;
    Function baca_acak_str(txt : string ; jenis : string = 'R') : string ;
    Function acak_int(nilai : integer ; jenis : string = 'R') : string ;
    Function acak_koma(nilai : single ; jenis : string = 'R') : string ;
    Function baca_acak_int(txt : string ; jenis : string = 'R') : integer ;
    Function baca_acak_koma(txt : string ; jenis : string = 'R') : single ;
    Function y_n(pesan : variant) : string ;
    Function n_y(pesan : variant) : string ;

    Function pilihan(pesan : variant;pesan2 : variant) : string ;


    Function cek_nilai (nilai : double) : boolean ;
    Function dalam_str (nilai : double; smatauang:string='RUPIAH') : string ;
    Function CBulan(iBulan : integer) : string;
    Function CTanggal(tTgl : tDateTime ; sLong : string = 'L'; sSpr : string = ' ') : string;
    Function CHari(iDay:Integer) : string;
    Function CHariTgl(tTgl:TDateTime) : string;
    Function Check_Digit(sUPC  : string) : string;
//  Function cetak(sKet : string = '';baru : string = 'poerwantono@gmail.com;' ):boolean ;
    Function cetak(sKet : string = ''; baru : string = 'poerwantono@gmail.com;' ;aflag : string = '0' ):boolean ;


// procedure tulis(teks : string ; baru : string = 'N' ;sInitPrn:string='Y');

    function gantitglkomp(str: string): string;

    Function cetak_email(sKet : string = '' ):boolean ;
    function StatusProses(sProses : string=' '; sKey:string = ''):boolean ;
    function TypeToko(dType:integer=1):boolean ;
    function rightpos(teks:string;kt:string):integer;

    Function cek_printer: boolean;

    Function wiplocal(x:integer=1):string;
    Function hwwiplocal(x:integer=1):string;

    Function iplocal(x:integer=1):string;
    Function hwiplocal(x:integer=1):string;

    Function cekservermysql(sKey: string = '' ):boolean;



    Function ping_server(ip: string): boolean;
    Function ExpiredProgram: boolean;
    function UkuranFile(pSize: int64): string;
    function IIf(AValue: Boolean; const ATrue: string; const AFalse: string=''): string;
    function ambil_isi_field(scds: TMyQuery): string;
    function ganti_isi_field_saja(scds: TMyQuery) : string ;

    function ganti_isi_field(scds: TMyQuery;init : string) : string ;

    function ambil_nama_field(scds: TMyQuery): string;
    function kasihkutip(str: string): string;
    function cek_kutip(str:string;bmsg:boolean=true):boolean;
    Function cek_registrasi(sKey: string = '' ;sNomor : string = '' ;sValid:string=''):boolean ;

    function sandibulantahun(tgl:tdatetime):string;
    function sandibulan(tgl:tdatetime):string;

    function decodebulan(str: string):string;

    

    Function cariprinter(x:integer=1):string;


//    function sinkronjamkomp(str: string): string;

    { Procedure }
    Procedure PecahStock(iConv1 : integer ; iConv2 : integer ; dNilai : double ; out dEkor0 : double; out dEkor1 : double; out dEkor2 : double);
    Procedure KeEkor2(iEkor:integer ; iConv1 : integer ; iConv2 : integer ; dNilai : double ; out dEkor2 : double ; sCurah : string = '');
    Procedure KeEkorLain(iEkorDari:integer ; iConv1 : integer ; iConv2 : integer ; dNilaiAsal : double ; iEkorKe : Integer ; out dNilaiHasil : double);
    Procedure bunyi(sts : boolean) ;
    Procedure msgbox(pesan : variant) ;

    procedure tulis(teks : string ; baru : string = 'N' ;sInitPrn:string='Y');
    procedure prin(s : string) ;
    Procedure Potong_kertas ;

    procedure bagini(kata:string;out  str1: string);


    procedure bagi2(kata:string;panjang:integer;out str1:string;out str2:string);

    procedure bagi3(kata:string;panjang:integer;out str1:string;out str2:string;out str3:string);

    procedure cetaksisabarcode(baris:integer;flag:boolean;ijml:integer;
                           isisa:integer;xkd:string;cket:string;
                           cdepkes:string;cdepkes2:string;
                           btgl:boolean;stgl:string;
                           bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);



    procedure cetakbarcode(baris:integer;flag:boolean;ijml:integer;
                           isisa:integer;xkd:string;cket:string;
                           cdepkes:string;cdepkes2:string;
                           btgl:boolean;stgl:string;
                           bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);

    procedure tcetakbarcode(baris:integer;flag:boolean;ijml:integer;
                           isisa:integer;xkd:string;cket:string;
                           cdepkes:string;cdepkes2:string;
                           btgl:boolean;stgl:string;
                           bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);

    procedure cetakpricecard(baris:integer;flag:boolean;ijml:integer;
                           isisa:integer;xkd:string;cket:string;
                           cdepkes:string;cdepkes2:string;
                           btgl:boolean;stgl:string;
                           bnama:boolean;bharga:boolean;sharga:string);

  end;

var
  lib: Tlib;

implementation

uses Umain , TF_CETAKAN;
{$R *.xfm}


Function Tlib.cpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
var
  v_hasil : string ;
  a : integer ;
Begin

 // kg_uu_set :=concat(g_uu_set,'_ms');
 // ifthen(dimana=kg_uu_set, '  PRIMARY KEY  (MKT_KODE) ',


  v_hasil := '' ;
  for a := 1 to trunc((v_jml - length(v_str1)) / 2) do v_hasil := v_hasil + v_str2 ;
  v_hasil := v_hasil + v_str1 ;
  for a := 1 to v_jml do v_hasil := v_hasil + v_str2 ;
  v_hasil := leftstr(v_hasil, v_jml) ;

  result := v_hasil ;
End ;

Function Tlib.lpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
var
  v_hasil : string ;
  a : integer ;
Begin
  v_hasil := '' ;
  for a := 1 to v_jml do v_hasil := v_hasil + v_str2 ;
  v_hasil := leftstr(v_str1 + v_hasil, v_jml) ;
  result := v_hasil ;
End ;

Function Tlib.rpad(v_str1 : string ; v_jml : integer ; v_str2 : string=' ') : string ;
var
  v_hasil : string ;
  a : integer ;
Begin
  v_hasil := '' ;
  for a := 1 to v_jml do v_hasil := v_hasil + v_str2 ;
  v_hasil := rightstr(v_hasil + v_str1, v_jml) ;
  result := v_hasil ;
End ;

Function Tlib.key_angka(key : variant) : boolean ;
var
  v_hasil : boolean ;
begin
  v_hasil := TRUE ;
  if key <= 255 then
  begin
    v_hasil := FALSE ;
    if (key >= 48) and (key <= 57) then
      v_hasil := TRUE ;
    if key = key_minus then
      v_hasil := TRUE ;
  End ;

  result := v_hasil ;
end ;

Function Tlib.key_koma(key : variant) : boolean ;
var
  v_hasil : boolean ;
begin
  v_hasil := TRUE ;
  if key <= 255 then
  begin
    v_hasil := FALSE ;
    if (key >= 48) and (key <= 57) then
      v_hasil := TRUE ;
    if key = 46 then
      v_hasil := TRUE ;
    if key = 45 then
      v_hasil := TRUE ;
  End ;

  result := v_hasil ;
end ;

Procedure Tlib.msgbox(pesan : variant) ;
Begin
  Application.MessageBox(pesan, 'Informasi', [smbOK],smsInformation);
End;

Function Tlib.pilihan(pesan : variant;pesan2 : variant) : string ;
var  posisi : integer; ket1,ket2 : string;
     ket3 : TMessageButton;
Begin
  posisi := length(trim(pesan2));
  ket1:='';ket2:='';

  case posisi of
        1 : begin ket1:='Divisi';ket2:='Departemen'; end;
        2 : begin ket1:='Departemen';ket2:='Sub-Departemen'; end;
        3 : begin ket1:='Sub-Departemen';ket2:='Kategori'; end;
        4 : begin ket1:='Kategori';ket2:='Sub-Kategori'; end;
        5 : begin ket1:='Sub-Kategori';ket2:='Sub-Kategori'; end;
  end ;

  ket3 := Application.MessageBox('Tambah/Rubah/Hapus Struktur merchandise' + #10 +
                              '' + #10 +
                              '[Yes] Menambah '+ket1 + #10 +
                              '[No]  Menambah '+ket2 + #10 +
                              '[Cancel] Batal','Konfirmasi',[smbYes,smbNo,smbCancel],smsinformation,smbCancel); //= smbYes then
  if ket3 = smbYes then
    result := 'Y'
  else
  if ket3 = smbYes then
    result := 'N'
  else
  if ket3 = smbCancel then
    result := 'C';
End ;


Function Tlib.y_n(pesan : variant) : string ;
Begin
  if Application.MessageBox(pesan,'Konfirmasi',[smbYes,smbNo],smsinformation,smbYes,smbNo)= smbYes then
    result := 'Y'
  else
    result := 'N' ;
End ;

Function Tlib.n_y(pesan : variant) : string ;
Begin
  if Application.MessageBox(pesan,'Konfirmasi',[smbYes,smbNo],smsinformation,smbNo,smbNo)= smbYes then
    result := 'Y'
  else
    result := 'N' ;
End ;

Function Tlib.str_rp(nilai : int64) : string;
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

Function Tlib.str_koma(nilai : double) : string;
var
  v_hasil : string ;
Begin
  if nilai = null then
    v_hasil := '0'
  else
    v_hasil := formatfloat('###,###,###,###.###',nilai) ;

  result := v_hasil ;
End ;

Function Tlib.str_koma_1(nilai : double) : string;
var
  v_hasil : string ;
Begin
  if nilai = null then
    v_hasil := '0'
  else
    v_hasil := formatfloat('###,###,###,##0',nilai) ;

  result := v_hasil ;
End ;

Function Tlib.nilai_rp(nilai : string) : Int64;
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

Function Tlib.nilai_koma(nilai : string) : double;
var
  v_hasil : double ;
  v_temp  : string ;
Begin
  nilai  := trim(nilai) ;
  if nilai = '' then nilai := '0' ;
  v_temp  := stringreplace(nilai,' ','',[rfReplaceAll]) ;
  v_hasil := StrTofloat(stringreplace(v_temp,',','',[rfReplaceAll])) ;

  result := v_hasil ;
End ;

Function Tlib.Cek_no_afc(no : string) : string ;
Var
  a, v_temp, v_genap, v_ganjil : integer ;
  hasil : string ;
Begin
  if (copy(no,1,3) = '234') and (copy(no,8,3) = '234') and
     (length(no) = 10) then
    Begin
      result := 'Y' ;
      exit ;
    End ;

  if (length(no) = 9) or (length(no) = 10) then
    Begin
      v_genap  := 0 ;
      v_ganjil := 0 ;
      for a := 1 to 8 do
        Begin
          if a mod 2 = 0 then
            v_genap  := v_genap  + StrToInt(copy(no,a,1))
          else
            v_ganjil := v_ganjil + StrToInt(copy(no,a,1)) ;
        End ;

      v_temp := (10 - (((v_ganjil * 3) + v_genap) mod 10)) mod 10 ;
      if copy(no,9,1) <> IntToStr(v_temp) then
        Begin
          msgbox('Nomor '+no+' bukan no AFC / Ilegal !!!') ;
          hasil := 'N' ;
        End
      else
        hasil := 'Y' ;

    End
  else
    hasil := 'N' ;

  result := hasil ;
End ;

function tlib.posisi_str(teks, kt : string ; posisi : integer = 1 ) : integer ;
var
  hasil, a, p : integer ;
begin
  hasil := 0 ;
  teks  := trim(teks) ;
  p     := length(kt) ;
  for a := posisi to length(teks) do
  begin
    if ( copy(teks,a,p) = kt ) and (hasil = 0) then hasil := a ;
  end ;

  result := hasil ;
end ;

Function tlib.acak_str(txt : string ; jenis : string = 'R') : string ;
var
  v_hasil, v_sementara : string ;
  key_code : string ;
  a, temp, panjang : integer ;
begin
  if jenis = 'R' then
    key_code := '89624379024563864571128679534625849631872456299516'
  else
    key_code := '46521896753105637899652135896474365424987432154658' ;
  panjang := length( trim(txt) ) ;

  v_sementara := '' ;
  for a := 1 to panjang do
  begin
    temp := StrToWord( copy(txt,a,1) ) ;
    if a > 50 then
      temp := strtoint( copy(key_code,a - 50,1) ) + temp
    else
      temp := strtoint( copy(key_code,a,1) ) + temp ;

    v_sementara := v_sementara + chr(temp) ;
  end ;

  v_hasil := '' ;
  for a := 1 to trunc(panjang/2) do
  begin
    v_hasil := v_hasil + copy(v_sementara,a,1) + copy(v_sementara,trunc(panjang/2)+a,1) ;
  end ;
  if panjang mod 2 = 1 then
    v_hasil := v_hasil + copy(v_sementara,panjang,1) ;

  result := v_hasil ;
end ;

Function tlib.baca_acak_str(txt : string ; jenis : string = 'R') : string ;
var
  v_hasil, v_temp, v_temp1, v_temp2 : string ;
  key_code : string ;
  a, temp, panjang : integer ;
begin
  if jenis = 'R' then
    key_code := '89624379024563864571128679534625849631872456299516'
  else
    key_code := '46521896753105637899652135896474365424987432154658' ;

  panjang := length( trim(txt) ) ;

  for a := 1 to trunc(panjang/2) do
  begin
    v_temp1 := v_temp1 + copy(txt, ((a-1)*2)+1, 1) ;
    v_temp2 := v_temp2 + copy(txt, ((a-1)*2)+2, 1) ;
  end ;
  v_temp := v_temp1 + v_temp2 ;
  if panjang mod 2 = 1 then v_temp := v_Temp + copy(txt,panjang,1) ;

  v_hasil := '' ;
  for a := 1 to panjang do
  begin
    temp := strtoword( copy(v_temp,a,1) ) ;
    if a > 50 then
      temp := temp - strtoint( copy(key_code,a - 50,1) )
    else
      temp := temp - strtoint( copy(key_code,a ,1) ) ;

    v_hasil := v_hasil + chr(temp) ;
  end ;

  result := v_hasil ;
end ;

Function tlib.acak_int(nilai : integer ; jenis : string = 'R') : string ;
begin
  result := acak_str(inttostr(nilai), jenis) ;
end ;

Function tlib.baca_acak_int(txt : string ; jenis : string = 'R') : integer ;
begin
  result := strtoint( baca_acak_str(txt, jenis) ) ;
end ;

Function tlib.acak_koma(nilai : single ; jenis : string = 'R') : string ;
begin
  result := acak_str(floattostr(nilai), jenis) ;
end ;

Function tlib.baca_acak_koma(txt : string ; jenis : string = 'R') : single ;
begin
  result := strtofloat( baca_acak_str(txt, jenis) ) ;
end ;

Procedure tlib.bunyi(sts : boolean) ;
begin
  koma_detik.Enabled := sts ;
end ;

procedure Tlib.koma_detikTimer(Sender: TObject);
begin
  beep ;
end;

procedure Tlib.tulis(teks : string ; baru : string = 'N';sInitPrn:string='Y');
Var
  f : textfile ;
  cPInit:string;
  CDefault:string;
Begin
  assignfile(f,g_nama_rpt) ;


  if baru = 'Y' then
  begin
    rewrite(f);

//    lib.msgbox(copy(g_nama_rpt,length(trim(g_nama_rpt))-2,3));

    if copy(g_nama_rpt,length(trim(g_nama_rpt))-2,3)='eml' then
       teks := ifthen(sInitPrn='Y','','') + teks
    else
      //teks := ifthen(sInitPrn='Y',cPInit+CDefault,'') + teks;
    teks := ifthen(sInitPrn='Y',cPInit+CDefault,'') + teks;
  end
  else
    append(f) ;

  if uppercase(teks) = 'EJECT' then
     writeln(f,#12)
  else
     writeln(f,teks);
  closefile(f) ;
End ;




//function Tlib.cetak(sKet : string = '' ):boolean ;
Function   Tlib.cetak(sKet : string = ''; baru : string = 'poerwantono@gmail.com;' ;aflag : string = '0' ):boolean ;

Var
//  f : textfile ;
  sflag,semail : string ;
Begin
//  Result := FALSE;
 // lib.msgbox('1 cek_printer ');

  if sKet = '*' then
  begin
//     lib.msgbox('2 not cek_printer ');

     if aflag='0' then
        sflag:='0'
     else
        sflag:='1' ;

     semail:='*';
     sKet := 'Apakah Data ingin dikirim ke email???'+#10+#13+'[File:'+g_nama_rpt+']'+#10+#13;
  end
  else
  if sKet = '' then
     sKet := 'Apakah Data ingin dicetak ???'+#10+#13+'[File:'+g_nama_rpt+']'+#10+#13
  else
     sKet := sKet+#10+#13+'Apakah Data ingin dicetak ???'+#10+#13+'[File:'+g_nama_rpt+']'+#10+#13;

  //lib.msgbox('3 cek_printer ');

  Result := FALSE;
  if sKet = 'EJECT' then
  Begin
    //  lib.msgbox('4 cek_printer ');

      Result := TRUE;
      if FileExists(g_nama_rpt) then LibC.system(PChar('lp '+g_nama_rpt))
  end
  else

  begin
  //  lib.msgbox('5 cek_printer ');

{  if semail='*' then
  begin
      if FileExists(g_nama_rpt) then LibC.system(PChar('ssmtp '+ baru  +' < '+g_nama_rpt))
  end
  else
  begin
}

  if lib.y_n(sKet) = 'Y' then
  begin
  //  lib.msgbox('6 cek_printer ');

    Result := TRUE;

    if semail='*' then
    begin
   //       lib.msgbox('7 cek_printer ');

        //   lib.msgbox('ssmtp '+ baru  +' < '+g_nama_rpt);

        if sflag='0' then
        begin
        if FileExists(g_nama_rpt) then LibC.system(PChar('ssmtp '+baru+'<'+g_nama_rpt));
        end
        else
        begin
   lib.msgbox('mpack -s '+g_nama_rpt+' '+g_nama_rpt+' '+baru);

        if FileExists(g_nama_rpt) then LibC.system(PChar('mpack -s '+g_nama_rpt+' '+g_nama_rpt+' '+baru));
        end;

    end
    else
    BEGIN
     // lib.msgbox('9 cek_printer ');


    if not cek_printer then
    begin
     // lib.msgbox('not cek_printer ');
      exit;
    end;
//     lib.msgbox('sampai cetak ');//    msgbox('cat '+g_nama_rpt+' > '+g_printer);

     if g_type_print = 'Y' then
     begin
       // lib.msgbox('cat '+g_nama_rpt+' > '+g_printer);
        if FileExists(g_nama_rpt) then LibC.system(PChar('cat '+g_nama_rpt+' > '+g_printer))
     end
      else
     begin
       // lib.msgbox('lp '+g_nama_rpt);
        if FileExists(g_nama_rpt) then LibC.system(PChar('lp '+g_nama_rpt));
     end ;
     // lib.msgbox('10 cek_printer ');

    END;
    //  lib.msgbox('11 cek_printer ');



    {
    assignfile(f,g_nama_rpt) ;
    reset(f);

    while not eof(f) do
    begin
      ReadLn(f,s);
      prin(s);
    end;
    closefile(f);
    }
  end;
  end;
//  end;
end ;

function Tlib.cetak_email(sKet : string = '' ):boolean ;
Begin
  if sKet = '' then
     sKet := 'Apakah Data ingin dikirim ke email???'+#10+#13+'[File:'+g_nama_rpt+']'+#10+#13
  else
     sKet := sKet+#10+#13+'Apakah Data ingin dicetak ???'+#10+#13+'[File:'+g_nama_rpt+']'+#10+#13;
  Result := FALSE;
  if sKet = 'EJECT' then
  Begin
      Result := TRUE;
//      if FileExists(g_nama_rpt) then LibC.system(PChar('lp '+g_nama_rpt))
  end
  else
  begin
  if lib.y_n(sKet) = 'Y' then
  begin
    Result := TRUE;
    if not cek_printer then
    begin
      exit;
    end;

    if FileExists(g_nama_rpt) then
  end;
  end;
end ;



procedure Tlib.prin(s : string) ;
Var
  f : textfile ;
Begin
  assignfile(f,g_printer) ;
  rewrite(f);
  writeln(f,s);
  closefile(f);
End;

Function Tlib.keluar : boolean ;
begin
  if messagedlg('Ingin keluar form ?',mtconfirmation,[MbYes,MbNo],0,MbNo) = MrYes then
    result := TRUE
  else
    result := FALSE ;
end ;

Function Tlib.simpan : boolean ;
begin
  if messagedlg('Data ingin disimpan ?',mtconfirmation,[MbYes,MbNo],0,MbNo) = MrYes then
    result := TRUE
  else
    result := FALSE ;
end ;

Function Tlib.simpancetak : boolean ;
begin
  if messagedlg('PO sudah final dan submit ke suplier ?',mtconfirmation,[MbYes,MbNo],0,MbNo) = MrYes then
    result := TRUE
  else
    result := FALSE ;
end ;




Function Tlib.hapus : boolean ;
begin
  if messagedlg('Data akan dihapus ?',mtconfirmation,[MbYes,MbNo],0,MbNo) = MrYes then
    result := TRUE
  else
    result := FALSE ;
end ;

Function Tlib.batal : boolean ;
begin
  if messagedlg('Membatalkan semua perubahan data ?',mtconfirmation,[MbYes,MbNo],0,MbNo) = MrYes then
    result := TRUE
  else
    result := FALSE ;
end ;

Function Tlib.add_month (tgl : tdatetime; jml : integer) : tdatetime ;
var
  tg, bl, th : string ;
  tmp1, tmp2 : integer ;
begin
  tg := formatdatetime('dd',tgl) ;
  bl := formatdatetime('mm',tgl) ;
  th := formatdatetime('yyyy',tgl) ;

  tmp1 := strtoint(bl) + jml ;
  tmp2 := strtoint(th) ;

  if tmp1 > 12 then
  begin
    tmp1 := tmp1 - 12 ;
    tmp2 := tmp2 + 1 ;
  end ;

  if tmp1 < 1 then
  begin
    tmp1 := tmp1 + 12 ;
    tmp2 := tmp2 - 1 ;
  end ;

  bl := rpad(inttostr(tmp1),2,'0') ;
  th := rpad(inttostr(tmp2),4,'0') ;

  result := strtodate(tg+'-'+bl+'-'+th) ;
end ;

Function TLib.cek_nilai (nilai : double) : boolean ;
begin
  if nilai < 0 then
  begin
    lib.msgbox('Nilai tidak boleh minus');
    result := FALSE
  end
  else
    result := TRUE ;
end ;

Function TLib.dalam_str (nilai : double; smatauang:string='RUPIAH') : string ;
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

Function tlib.ulang(teks : string=' '; jml : integer=0) : string ;
var
  v_hasil : string ;
  a : integer ;
begin
  v_hasil := '' ;
  for a := 1 to jml do v_hasil := v_hasil + teks ;
  result := v_hasil ;
end ;

Procedure tlib.Potong_kertas ;
begin
  tulis(chr(29)+chr(86)+chr(1)+chr(21)) ;
end;

Function tlib.CBulan(iBulan : integer) : string;
begin
  Result := trim(copy('Januari  Februari Maret    April    Mei      Juni     Juli     Agustus  SeptemberOktober  November Desember ',( iBulan * 9)-8,9 ));
end;

Function tlib.CTanggal(tTgl : tDateTime ; sLong : string = 'L'; sSpr : string = ' ') : string;
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

Function tlib.CHari(iDay:Integer) : string;
begin
  Result := trim(copy('MINGGU   SENIN    SELASA   RABU     KAMIS    JUMAT    SABTU    ',( iDay*9 )-8,9 ));
end;

Function tlib.CHariTgl(tTgl:TDateTime) : string;
var iDay:integer;
begin
  iDay := DayOfTheWeek(tTgl)+1;
  Result := trim(copy('MINGGU   SENIN    SELASA   RABU     KAMIS    JUMAT    SABTU    Minggu',( iDay*9 )-8,9 ));
end;



Function Tlib.Check_Digit(sUPC  : string) : string;
var sBarcode : string ;
    iCount, iGnj, iGnp, iPjg, iCode     : integer;
begin
  sUPC  := trim(sUPC);
  iPjg  := length(sUPC);
  Result:= sUPC;
  if iPjg in [10,11,12,6,7]  then
  begin
    sBarcode := lpad(sUpc,iPjg,'0');
    iGnp     := 0;
    iGnj     := 0;
    for iCount := 1 to iPjg do
    begin
      iCode := strtoint(copy(sBarcode,iCount,1));
      if (iPjg = 12) or (iPjg = 6) or (iPjg = 10) then
      begin
        if iCount mod 2 = 0 then iGnj := iGnj+iCode else iGnp := iGnp+iCode ;
      end
      else
      begin
        if iCount mod 2 = 0 then iGnp := iGnp+iCode else iGnj := iGnj+iCode ;
      end;
    end;
    iCount := (10 - ((iGnj*3 + iGnp) mod 10 )) mod 10;
    sUpc   := sBarcode + trim(inttostr(iCount));
  end;
  Result := sUpc;
end;


Procedure tlib.KeEkor2(iEkor:integer ; iConv1 : integer ; iConv2 : integer ; dNilai : double ; out dEkor2 : double ; sCurah : string = '');
begin
  dEkor2 := dNilai;
  if sCurah = 'Y' then exit;

  case iEkor of
    0 : dEkor2 := dNilai * iConv2;
    1 : dEkor2 := dNilai * iConv2/iConv1;
    2 : dEkor2 := dNilai;
  end;

end;

Procedure tlib.KeEkorLain(iEkorDari:integer ; iConv1 : integer ; iConv2 : integer ; dNilaiAsal : double ; iEkorKe : Integer ; out dNilaiHasil : double);
begin
  case iEkorDari of
    0 : dNilaiAsal := dNilaiAsal / iConv2;
    1 : dNilaiAsal := dNilaiAsal / (iConv2/iConv1);
    2 : dNilaiAsal := dNilaiAsal;
  end;

  case iEkorKe of
    0 : dNilaiHasil := dNilaiAsal * iConv2;
    1 : dNilaiHasil := dNilaiAsal * (iConv2/iConv1);
    2 : dNilaiHasil := dNilaiAsal;
  end;
end;

Procedure tlib.PecahStock(iConv1 : integer ; iConv2 : integer ; dNilai : double ; out dEkor0 : double; out dEkor1 : double; out dEkor2 : double);
var dSisa : double;
begin
  dEkor0 := 0; dEkor1 := 0 ; dEkor2 := dNilai;
  if iConv2 > 1 then
  begin
    dEkor0 := trunc(dNilai/iConv2);
    dSisa  := dNilai - (dEkor0 * iConv2);
    if iConv1 > 1 then dEkor1 := trunc(dSisa/(iConv2/iConv1));
    dEkor2 := dSisa - (dEkor1 * (iConv2/iConv1));
  end;
end;

function tlib.StatusProses(sProses : string=' '; sKey:string = ''):boolean ;
begin
  Result := FALSE;
  if (sProses = 'C') and (sKey = 'C') then
  begin
    lib.msgbox('Transaksi sudah pernah dicetak, anda tidak dapat melakukan perubahan .... hanya bisa cetak ulang');
    Result := TRUE;
  end;
  if (sProses = 'Y') and (sKey = 'Y') then
  begin
    lib.msgbox('Transaksi sudah diposting ... tidak dapat diEdit lagi !!!'+chr(10)+chr(13));
    Result := TRUE;
  end;

end;

function tlib.TypeToko(dType:integer=1):boolean  ;
begin
  Result := False;
  Case dType Of
  1 : if g_uu_type = '1' then Result := True;  // Toko
  2 : if g_uu_type = '2' then Result := True;  // Reg. Opr
  3 : if g_uu_type = '3' then Result := True;  // Reg. MD
  4 : if g_uu_type = '4' then Result := True;  // Head Office
  5 : if (g_stand_alone='Y') then Result := True;  // Toko stand Alone
  6 : if (g_uu_type = '1') and (g_stand_alone<>'Y') then Result := True;  // Toko bukan stand Alone
  7 : if (g_uu_type = '3') or (g_stand_alone='Y') then Result := True;  // Regional MD + Stand Alone
  8 : if (g_uu_pk_wil=g_uu_pk_aktif) then Result := True;  // Induk Wilayah
  9 : if (pos(g_uu_type,'34')=0) and (g_uu_pk_wil=g_uu_pk_aktif) then Result := True;  // Bukan Regional MD Tetap IW
  10: if (g_uu_type='1') and (g_uu_pk_wil<>g_uu_pk_aktif) then Result := True;  // Toko Bukan Wilayah
  11: if (g_uu_type='7') then Result := True;  // DC Midi
  12: if (g_uu_type='6') then Result := True;  // Toko Midi
  end;
end;


function tlib.rightpos(teks:string;kt:string):integer;
var strtemp:string;
    intx,inttemp1,inttemp2:integer;
begin
   strtemp:= teks;
   inttemp2:=0;
   intx:=0;
   repeat
       inttemp1:=pos(kt,strtemp);
       delete(strtemp,inttemp1,1);
       if inttemp1 > 0 then
          inttemp2:=inttemp1+intx;
       inc(intx);
   until inttemp1=0;
   result:=inttemp2;
end;

procedure tlib.bagini(kata:string;out  str1: string);
begin
   str1 := trimright(kata);
end;


procedure tlib.bagi2(kata:string;panjang:integer; out  str1: string; out str2:string);
var xx,yy,xlen:integer;
begin
    xlen:=length(trimright(kata));
    if  xlen > panjang then
    begin
       xx:= rightpos(leftstr(trimright(kata),panjang+1),' ');
       yy:= rightpos(leftstr(trimright(kata),panjang),'/');
       if xx < yy then
       begin
          str1  := leftstr(trimright(kata),yy);
          str2  := rightstr(trimright(kata),xlen-yy);
       end
       else
       begin
          str1  := leftstr(trimright(kata),xx-1);
          str2  := rightstr(trimright(kata),xlen- xx);
       end;
    end
    else
    begin
       str1 := trimright(kata);
       str2 := '';
    end;
end;

procedure tlib.bagi3(kata:string;panjang:integer; out  str1: string; out str2:string; out str3:string);
var xx,yy,zz,xlen:integer;
strsisa:string;
begin
    xlen:=length(trimright(kata));//

//    lib.msgbox('['+trimright(kata)+'] :'+inttostr(xlen));     //32



    if  xlen > panjang then
    begin
       xx:= rightpos(leftstr(trimright(kata),panjang+1),' ');//       lib.msgbox(xx);  //12
       yy:= rightpos(leftstr(trimright(kata),panjang),'/');//       lib.msgbox(yy); // 0
       if xx < yy then
       begin
          str1  := leftstr(trimright(kata),yy); //          lib.msgbox(str1);
          str2  := rightstr(trimright(kata),xlen-yy);//

//          lib.msgbox('1['+trimright(str2)+'] :'+inttostr(xlen));     //32
       end
       else
       begin
          strsisa := copy(kata,xx,xlen)  ;
          str1  := leftstr(trimright(kata),xx-1);//          lib.msgbox('xx3 '+str1);
     //   xx:= rightpos(leftstr(trim(strsisa),panjang+1),' ');//

       //sini
//    xlen2:=length(trimright(strsisa));//

       if  length(trimright(strsisa)) < panjang then
          xx:= length(trimright(strsisa))
       else
          xx:= rightpos(leftstr(trimright(strsisa),panjang+1),' ');//             lib.msgbox('zz '+str2);//          str2  := rightstr(trimright(kata),xlen- zz);//          lib.msgbox('xx5 '+str2);
      //   str2  := leftstr(trim(strsisa),xx); //xx); //xlen-xx);//  panjang+1); //xlen- xx);//          lib.msgbox('xx4 '+str2);
           str2  := trim(leftstr(trimright(strsisa), xx));//

//          lib.msgbox('xx6 '+inttostr(xx));


//          lib.msgbox('2['+trimright(str2)+'] :'+inttostr(xx));     //32

          xlen:=length(trimright(strsisa));
          if  xlen > panjang then
          begin                          //str2
          zz:= rightpos(leftstr(trimright(strsisa),panjang+1),' ');//             lib.msgbox('zz '+str2);//          str2  := rightstr(trimright(kata),xlen- zz);//          lib.msgbox('xx5 '+str2);
          str3  := rightstr(trimright(strsisa),xlen- zz);//          lib.msgbox('xx6 '+str3);
//            lib.msgbox('3['+trimright(str2)+'] :'+inttostr(xlen));     //32
          end;
       end;

//         lib.msgbox('4['+trimright(str2)+'] :'+inttostr(xlen));     //32
//       lib.msgbox('str1 :'+str1+' str2 :'+str2+' str3 :'+str3 );



       if (trim(str3)='') then
       //and (str2<>'') and (str3<>'')) then
       begin
         str3 := ''; // str2;
         str2 := str2;
         str1 := str1; //'';
       end;
    end
    else
    begin
       str1 := trimright(kata); //''; //
       str2 := '';
       str3 := ''; //trimright(kata); //'';
    end;
end;

procedure tlib.cetaksisabarcode(baris:integer;flag:boolean;ijml:integer;
                            isisa:integer;xkd:string;cket:string;
                            cdepkes:string;cdepkes2:string;
                            btgl:boolean;stgl:string;
                            bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);
var
  f    : textfile ;
  panjangsku6or8,
  xcd,gnp,gjl,i,j: integer;
  clong_ket,clong_ket2,cplu: string;
  ssTgl:string;
begin
  if sku6or8=6 then panjangsku6or8:=7  else panjangsku6or8:=9; //9;
  if sku6or8=6 then
  begin
    cplu  := rightstr('000000000'+trimleft(xkd),panjangsku6or8); //7);
    for i:= 1 to panjangsku6or8 do   //7 do
    begin
       j := strtoint(copy(cplu,i,1));
       if i mod 2 = 0 then
          inc(gnp,j)
       else
          inc(gjl,j)
    end;
    xcd      := (10 - ((gjl*3+gnp) mod 10)) mod 10;    // buat cek digit sendiri donk
    cPLU     := cplu + inttostr(xcd);
  end
  else
    cplu:=  xkd;
  clong_ket := leftstr(cket,31);
{
  if  (g_sisa_cetak_barcode>=2) then   //>=1 ) then
  begin
     lib.msgbox('1b');
     tulis('siji b');
     if bHarga then
        // tulis('^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
        tulis('^FO235,25^A0R,20,18^CI13^FR^FD'+sHarga+'^FS')
     else
        tulis('^FO235,25^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
     if bNama then
     begin
        // tulis('^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        tulis('^FO25,0^B2N,55,Y,N,Y^FR^FD'+cPLU+'^FS');
        if cLong_Ket2 <> '' then
        begin
           tulis('^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
           tulis('^FO25,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
        end
        else
        begin
           if cdepkes = '' then
           begin
              tulis('^FO25,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
           end
           else
           begin
              tulis('^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              tulis('^FO25,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
           end;
        end;
     end
     else
     begin
        if cdepkes = '' then
        begin
           // tulis('^FO25,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
           //2
           tulis('^FO25,10^BCR,55,Y,N^FR^FD'+cPLU+'^FS');
        end
        else
        begin
           // tulis('^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
           //2
           tulis('^FO25,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');
           tulis('^FO25,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
        end;
     end;
  end;

}
//  if (g_sisa_cetak_barcode<=2) then //>=2 ) then
  if (isisa=2) then //>=2 ) then
  begin   // kolom 2
     lib.msgbox('b2');
     tulis('loro b');
     if bharga then
        // tulis('^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
        tulis('^FO520,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
     else
        tulis('^FO520,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');

     if bNama then
     begin             //335
        // tulis('^FO390,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        //3
        tulis('^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');
        if cLong_Ket2 <> '' then
        begin
           tulis('^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
           tulis('^FO305,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
        end
        else
        begin
           if cdepkes = '' then
           begin
              tulis('^FO305,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
           end
           else
           begin
                    tulis('^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    tulis('^FO305,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
           end;
        end;
     end
     else
        // tulis('^FO305,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        //3
        tulis('^FO305,10^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

  end;


//  if (g_sisa_cetak_barcode<=3) then   //<=3 )  then
  if (isisa<=3) then   //<=3 )  then
  begin // kolom 3
     lib.msgbox('3b');
     tulis('telu b    ' + inttostr(isisa));
     if bHarga then
        tulis('^FO800,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS' )
     else
        tulis('^FO800,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
     if bNama then
     begin             //335
        // tulis('^FO590,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        //4
        tulis('^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');
        if cLong_Ket2 <> '' then
        begin
           tulis('^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
           tulis('^FO590,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
        end
        else
        begin
           if cdepkes = '' then
           begin
              tulis('^FO590,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
           end
           else
           begin
              tulis('^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              tulis('^FO590,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
           end;
        end;
     end
     else
        // tulis('^FO590,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        //5
        tulis('^FO590,30^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

  end;

  tulis('^PQ1,0,1,N');
  tulis('^XZ');
end;

procedure tlib.cetakbarcode(baris:integer;flag:boolean;ijml:integer;
                            isisa:integer;xkd:string;cket:string;
                            cdepkes:string;cdepkes2:string;
                            btgl:boolean;stgl:string;
                            bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);
var
  f    : textfile ;
  panjangsku6or8,
  xcd,gnp,gjl,i,j: integer;
  clong_ket,clong_ket2,cplu: string;
  ssTgl:string;
begin
  gnp:=0;
  gjl:=0;
  cDepkes := '';
  clong_ket2 :='';

//  lib.msgbox(xkd);
//  lib.msgbox(panjangsku6or8);
  if sku6or8=6 then panjangsku6or8:=7  else panjangsku6or8:=9; //9;

//  cplu  := rightstr('000000000'+trimleft(xkd),panjangsku6or8); //7);
//  for i:= 1 to panjangsku6or8 do   //7 do
//  begin
//     j := strtoint(copy(cplu,i,1));
//     if i mod 2 = 0 then
//       inc(gnp,j)
//     else
//        inc(gjl,j)
//  end;
//  xcd      := (10 - ((gjl*3+gnp) mod 10)) mod 10;    // buat cek digit sendiri donk
//  cPLU     := cplu + inttostr(xcd);
  cplu:=  xkd;
//  if (trim(cdepkes) <> '') then
     clong_ket := leftstr(cket,31);
//  else
//   if baris=9 then
//       lib.bagi2(trim(cket),30,clong_ket,clong_ket2)
//    else
//     lib.bagi2(trim(cket),20,clong_ket,clong_ket2); //40

  ssTgl   := formatdatetime('ddmmyyyy',DATE);

  assignfile(f,g_printer_barcode) ;
  append(f);
  case baris of
14  // printer zm4000  3 mendatar
  :begin
      writeln(f,'^XA^PRA^LH8,05^JMA^FS');
      writeln(f,'^MD10^MMT^BY3'); //BY3');
      writeln(f,'^PON');
      if not bHarga then
      begin
              if (not flag) or (flag and (isisa>0 ) ) then
         begin   // kolom 1
              writeln(f,'^FO25,30^B2N,80,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,5^A0,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO345,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO345,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO345,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

         if (not flag) or (flag and (isisa>1)) then
         begin   // kolom 2
              writeln(f,'^FO440,30^B2N,80,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO440,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO440,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO760,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO760,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO760,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
         if (not flag) or (flag and (isisa>2)) then
         begin
              writeln(f,'^FO850,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO850,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO850,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO1175,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO1175,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO1175,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

      end;
      if bHarga then
      begin
         if (not flag) or (flag and (isisa>0 ) ) then
         begin   // kolom 1
              writeln(f,'^FO25,130^A0,30,35^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO25,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,5^A0,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO345,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO345,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO345,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

         if (not flag) or (flag and (isisa>1)) then
         begin   // kolom 2
              writeln(f,'^FO440,130^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO440,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO440,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO440,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO760,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO760,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO760,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
         if (not flag) or (flag and (isisa>2)) then
         begin
              writeln(f,'^FO850,130^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO850,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO850,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO850,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO1175,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO1175,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO1175,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
      end;
      if Flag then
           writeln(f,'^PQ1,0,1,N')
      else
      begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
      end;
      writeln(f,'^XZ');
    end;


 13
  :begin
      writeln(f,'^XA^PRA^LH8,12^FS');
      writeln(f,'^MD10^MMT^BY2'); //BY3');
      writeln(f,'^PON');
        if not bHarga then
        begin
          if (not flag) or (flag and (isisa>0 ) ) then
          begin   // kolom 1
              writeln(f,'^FO25,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO235,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO235,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO235,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>1)) then
          begin   // kolom 2
              writeln(f,'^FO310,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO310,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO310,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO520,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO520,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO520,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>2)) then
          begin
              writeln(f,'^FO590,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO590,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO590,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO800,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO800,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO800,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
        end;
        if bHarga then
        begin
          if (not flag) or (flag and (isisa>0 ) ) then
          begin   // kolom 1
              writeln(f,'^FO25,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO25,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO235,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO235,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO235,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>1)) then
          begin   // kolom 2
              writeln(f,'^FO310,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO310,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO310,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO310,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO520,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO520,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO520,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>2)) then
          begin
              writeln(f,'^FO590,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO590,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO590,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO590,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO800,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO800,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO800,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
        end;
        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


    11:begin
       writeln(f,'^XA^PRA^LH3,10^FS');
       writeln(f,'^MD5^MMT^BY3');
       writeln(f,'^PON');

       writeln(f,'^FO95,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//     writeln(f,'^FO95,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//     writeln(f,'^FO90,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//     writeln(f,'^FO100,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

//       writeln(f,'^FO100, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
//       writeln(f,'^FO100, 320^A0I,20,24^CI13^FR^FD Belanja^FS');
//       writeln(f,'^FO100, 300^A0I,20,20^CI13^FR^FD  Anda  ^FS');

       writeln(f,'^FO115, 340^A0I,20,24^CI13^FR^FDSahabat^FS');
       writeln(f,'^FO95, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');



        if (not flag) or (flag and (isisa>0 ) ) then
        begin
//           if bTgl then
//              writeln(f,'^FO120,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
//           if bTgl then
//              writeln(f,'^FO120,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
           //if bHarga then
           //   writeln(f,'^FO90,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO90,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO120,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;

//        writeln(f,'^FO175,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');
          writeln(f,'^FO175,70^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO85,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO115,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO115,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1 ) ) then
        begin
           writeln(f,'^FO260,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//           writeln(f,'^FO260,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO260,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO265,300^A0I,20,20^CI13^FR^FD001.00023429^FS');


       writeln(f,'^FO280, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO260, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');
//       writeln(f,'^FO260, 300^A0I,20,20^CI13^FR^FD  Anda  ^FS');



         //  if bTgl then
         //     writeln(f,'^FO280,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
          // if bTgl then
          //    writeln(f,'^FO280,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
          // if bHarga then
          //    writeln(f,'^FO245,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO260,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO290,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;

//        writeln(f,'^FO340,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');
          writeln(f,'^FO340,70^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO250,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');

              end
              else
              begin
                 writeln(f,'^FO280,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>2 ) ) then
        begin
           writeln(f,'^FO430,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//           writeln(f,'^FO430,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO430,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO435,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

       writeln(f,'^FO450, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO430, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');



           if bTgl then
//              writeln(f,'^FO440,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
//              ^FO260,40^A0n,20,24^CI13^FR^FD01001^FS
          // if bTgl then
          //    writeln(f,'^FO440,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
           //if bHarga then
           //   writeln(f,'^FO410,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
           writeln(f,'^FO425,12^A0n,20,24^CI13^FR^FDRp.^FS');
           writeln(f,'^FO455,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;
           writeln(f,'^FO510,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO420,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO450,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');

              end
              else
              begin
                    writeln(f,'^FO450,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if (not flag) or (flag and (isisa>3 ) ) then
        begin
           writeln(f,'^FO595,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');

//           writeln(f,'^FO595,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO595,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO600,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

       writeln(f,'^FO615, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO595, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');


           //if bTgl then
           //   writeln(f,'^FO595,40^A0n,20,24^CI13^FR^FD'+sTgl+'^FS');

           //if bTgl then
            //  writeln(f,'^FO600,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           //if bHarga then
           //   writeln(f,'^FO570,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO595,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO625,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;
           writeln(f,'^FO675,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO615,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO615,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


  10:begin
      writeln(f,'^XA^PRA^LH3,10^FS');
      writeln(f,'^MD10^MMT^BY2');
      writeln(f,'^PW810'); //^LL240^LT2');

      writeln(f,'^PON');



        if (not flag) or (flag and (isisa>0 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO120,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO120,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO90,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO90,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO160,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO90,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO110,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO100,55^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO280,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO280,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO245,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO245,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO320,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO250,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO270,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO260,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>2 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO440,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO440,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO410,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO410,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO480,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO410,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO430,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO420,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;
        if (not flag) or (flag and (isisa>3 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO600,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO600,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO570,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO570,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO640,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO570,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO590,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO580,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


  2:begin
      writeln(f,'^XA^PRA^LH5,10^FS');
      writeln(f,'^MD10^MMT^BY3');
      writeln(f,'^PON');
        if (not flag) or (flag and (isisa>0 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO255,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO45,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO45,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO45,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO45,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO45,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO45,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
           begin
              if cdepkes = '' then
              begin
                 writeln(f,'^FO45,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              end
              else
              begin
                 writeln(f,'^FO45,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO45,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1)) then
        begin
           if bTgl then
              writeln(f,'^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
           if bHarga then
              writeln(f,'^FO305,20^A0b,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO335,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO335,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO335,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO335,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO335,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO335,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
              writeln(f,'^FO335,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;

  3
  :begin
      writeln(f,'^XA^PRA^LH5,10^FS');
      writeln(f,'^MD10^MMT^BY2'); //BY3');
      writeln(f,'^PON');
        if (not flag) or (flag and (isisa>0 ) ) then
        begin
            if bHarga then
  //             writeln(f,'^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
               writeln(f,'^FO235,25^A0R,20,18^CI13^FR^FD'+sHarga+'^FS')
            else
               writeln(f,'^FO235,25^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin
//            writeln(f,'^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//              writeln(f,'^FO25,0^B2N,55,Y,N,Y^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO25,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO25,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO25,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
           begin
              if cdepkes = '' then
              begin
//               writeln(f,'^FO25,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2                 writeln(f,'^FO25,10^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

              end
              else
              begin
//               writeln(f,'^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2                 writeln(f,'^FO25,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

                 writeln(f,'^FO25,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1)) then
        begin   // kolom 2
           if bharga then
//              writeln(f,'^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
               writeln(f,'^FO520,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
           else
               writeln(f,'^FO520,20^A0R,20,18^CI13^FR^FD.'+sTgl+'^FS');

           if bNama then
           begin             //335
//            writeln(f,'^FO390,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//3              writeln(f,'^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO305,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO305,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO305,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            writeln(f,'^FO305,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//3              writeln(f,'^FO305,10^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

        end;


        if (not flag) or (flag and (isisa>1)) then
        begin// kolom 3
           if bHarga then
              writeln(f,'^FO800,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS' )
           else
              writeln(f,'^FO800,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin             //335
//            writeln(f,'^FO590,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//4              writeln(f,'^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO590,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO590,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO590,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            writeln(f,'^FO590,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
 //5             writeln(f,'^FO590,30^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

        end;



        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;



  4:begin
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD10^MMT^BY3');
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO150,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO130,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO190,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO130,30^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO145,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO125,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then
              writeln(f,'^FO285,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO265,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO325,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,15^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO260,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then
              writeln(f,'^FO420,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO400,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO460,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO400,30^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO415,30^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO395,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then
              writeln(f,'^FO555,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO535,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO595,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO535,30^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO550,30^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO530,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;

    5:begin
        writeln(f,'^XA^PRA^LH2,3^FS');
        writeln(f,'^MD3^MMT^BY3');
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=0)) then
           begin
           if bTgl then
              writeln(f,'^FO60,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO60,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO95,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO30,60^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO45,60^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO30,60^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO35,60^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO50,60^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO85,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO85,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO100,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl then
              writeln(f,'^FO200,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO200,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO230,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO165,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO180,55^A0R,15,15^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO165,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO165,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO185,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO230,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO165,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO185,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then
              writeln(f,'^FO330,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO330,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO300,55^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO315,55^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO300,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO300,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO315,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO315,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then
              writeln(f,'^FO470,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO470,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO500,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO435,55^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO450,55^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO435,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO435,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO450,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO500,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO500,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO435,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');
       end;

  6:begin    //type baru  bixolon 4 lajur vertikal 18*40 mm

//  lib.msgbox('jumlah baris :'+trim(inttostr(iJml))+' sisanya : '+trim(inttostr(isisa)) );

        writeln(f,'SW800');
        writeln(f,'SD20');
        writeln(f,'CB');
        writeln(f,'SL320,15,G');
        writeln(f,'SM5,10');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'V195,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
//           lib.sandibulantahun(DATE)

           if bHarga then writeln(f,'V90,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1170,40,8,3,14,60,1,1,'+quotedstr(cPLU));
           if trim(cLong_Ket2) <>'' then
              begin
                 writeln(f,'V200,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V225,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V225,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then   writeln(f,'V355,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));

           if bHarga then writeln(f,'V250,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1330,40,8,3,14,60,1,1,'+quotedstr(cPLU));
           if cLong_Ket2 <> '' then
              begin
                writeln(f,'V358,30,U,18,24,1,N,N,N,1,L,0,' +quotedstr(cLOng_Ket2));
                 writeln(f,'V386,30,U,18,24,1,N,N,N,1,L,0,' +quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V386,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_ket));
        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'V515,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
           if bHarga then writeln(f,'V410,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1490,40,8,3,14,60,1,1,'+quotedstr(cPLU));
//                          writeln(f,'B1650,40,8,3,14,60,1,1,'+quotedstr(cPlu));

           if cLong_Ket2 <> '' then
              begin
                 writeln(f,'V516,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V547,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V547,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then    writeln(f,'V675,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
           if bHarga then  writeln(f,'V570,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
           writeln(f,'B1650,40,8,3,14,60,1,1,'+quotedstr(cPlu));

           if cLong_Ket2 <> '' then
              begin
                 writeln(f,'V680,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V708,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V708,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if Flag then
           writeln(f,'P1')
        else
        begin
           if iJml > 0 then
              writeln(f,'P'+trim(inttostr(iJml)))
           else
              writeln(f,'P1');
        end;

        //writeln(f,'P1');

    end;

   7:begin   //type baru  zebra tlp 4 lajur vertikal 18*40 mm
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY3');  // md untuk tingkat panas
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO120,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO120,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO175,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO110,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO125,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO110,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then writeln(f,'^FO275,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO275,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO335,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,20^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO265,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'^FO435,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO435,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO495,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO425,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO440,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO425,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then   writeln(f,'^FO595,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO595,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO655,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO600,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO585,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;
   8:begin   //type baru  zebra tlp 4 lajur vertikal 18*40 mm  tanpa longkap sisa
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY3');  // md untuk tingkat panas
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO110,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO110,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO175,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO110,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO125,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO110,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then writeln(f,'^FO265,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO265,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO335,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,20^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO265,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'^FO425,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO425,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO495,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO425,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO440,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO425,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then   writeln(f,'^FO585,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO585,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO655,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO600,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO585,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;

9:begin   //malang type baru  zebra tlp 5 lajur vertikal 20*50 mm  tanpa longkap sisa tanpa gap, hanya die cut
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY4');  // md untuk tingkat panas  by = ukuran skala barcode
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           writeln(f,'^FO15,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl   then writeln(f,'^FO35,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO35,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           writeln(f,'^FO175,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then writeln(f,'^FO195,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO195,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           writeln(f,'^FO335,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO355,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO355,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin


                 writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa>=4)) then
        begin
           writeln(f,'^FO495,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO515,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO515,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa=5)) then
        begin
           writeln(f,'^FO655,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO675,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO675,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;




  end;
  closefile(f);
end;


procedure tlib.tcetakbarcode(baris:integer;flag:boolean;ijml:integer;
                            isisa:integer;xkd:string;cket:string;
                            cdepkes:string;cdepkes2:string;
                            btgl:boolean;stgl:string;
                            bnama:boolean;bharga:boolean;sharga:string;sharga2:string;sku6or8:integer;svendor:string);
var
  f    : textfile ;
  panjangsku6or8,
  xcd,gnp,gjl,i,j: integer;
  clong_ket,clong_ket2,cplu: string;
  ssTgl:string;
begin
  gnp:=0;
  gjl:=0;
  cDepkes := '';
  clong_ket2 :='';

//  lib.msgbox(xkd);
//  lib.msgbox(panjangsku6or8);
  if sku6or8=6 then panjangsku6or8:=7  else panjangsku6or8:=9; //9;
if sku6or8=6 then
begin
  cplu  := rightstr('000000000'+trimleft(xkd),panjangsku6or8); //7);
  for i:= 1 to panjangsku6or8 do   //7 do
  begin
     j := strtoint(copy(cplu,i,1));
     if i mod 2 = 0 then
       inc(gnp,j)
     else
        inc(gjl,j)
  end;
  xcd      := (10 - ((gjl*3+gnp) mod 10)) mod 10;    // buat cek digit sendiri donk
  cPLU     := cplu + inttostr(xcd);
end
else
  cplu:=  xkd;

//  if (trim(cdepkes) <> '') then
     clong_ket := leftstr(cket,31);
//  else
//   if baris=9 then
//       lib.bagi2(trim(cket),30,clong_ket,clong_ket2)
//    else
//     lib.bagi2(trim(cket),20,clong_ket,clong_ket2); //40

  ssTgl   := formatdatetime('ddmmyyyy',DATE);
  if baris <> 33 then
  begin  assignfile(f,g_printer_barcode) ;
         append(f);
  end;
  case baris of
  33  :begin
     //  lib.msgbox(1);
        with lib do
        begin
        if flag and (isisa=0) then
        begin
           tulis('^XA^PRA^LH5,10^FS');
           tulis('^MD10^MMT^BY2'); //BY3');
           tulis('^PON');
           // if isisa<>0 then  isisa:=isisa-1;
        end;                           //  >0
//        if isisa=2 then isisa:=3 else isisa:=1;

//        if ((not flag) or (flag and (isisa>0 ) )) then

//        lib.msgbox('masuk pak eko  :'+inttostr(isisa) );

        if ((not flag) or (flag and (isisa=1 ) ))
        or (g_sisa_cetak_barcode =2 )

        then
        begin
        lib.msgbox(1 );
        tulis('siji');
            if bHarga then
               // tulis('^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
               tulis('^FO235,25^A0R,20,18^CI13^FR^FD'+sHarga+'^FS')
            else
               tulis('^FO235,25^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin
              //  tulis('^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS')
              tulis('^FO25,0^B2N,55,Y,N,Y^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 tulis('^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 tulis('^FO25,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    tulis('^FO25,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    tulis('^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    tulis('^FO25,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
           begin
              if cdepkes = '' then
              begin
//               tulis('^FO25,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2
                tulis('^FO25,10^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

              end
              else
              begin
//               tulis('^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2
                 tulis('^FO25,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

                 tulis('^FO25,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

//        if (not flag) or (flag and (isisa>1)) then  //=2))   then
     if ((not flag) or (flag and (isisa=2 ) ))
     or (g_sisa_cetak_barcode =1 )
      then

        begin   // kolom 2
           tulis('loro');
           lib.msgbox(2);
           if bharga then
               // tulis('^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
               tulis('^FO520,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
           else
               tulis('^FO520,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');

           if bNama then
           begin             //335
              // tulis('^FO390,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              //3
              tulis('^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 tulis('^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 tulis('^FO305,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    tulis('^FO305,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    tulis('^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    tulis('^FO305,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            tulis('^FO305,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//3
              tulis('^FO305,10^BCN,55,Y,N^FR^FD'+cPLU+'^FS');
// if isisa<>0 then  isisa:=isisa-1;
        end;

                                      // =0
                                    //  >2
        if (not flag) or (flag and (isisa>2)) then
        if ((not flag) or (flag and (isisa=3 ) ))
        or (g_sisa_cetak_barcode =0 )
         then

        begin// kolom 3
           tulis('telu');
           lib.msgbox(3);
           if bHarga then
              tulis('^FO800,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS' )
           else
              tulis('^FO800,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin             //335
//            tulis('^FO590,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//4
             tulis('^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 tulis('^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 tulis('^FO590,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    tulis('^FO590,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    tulis('^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    tulis('^FO590,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            tulis('^FO590,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
 //5
             tulis('^FO590,30^BCN,55,Y,N^FR^FD'+cPLU+'^FS');
// if isisa<>0 then  isisa:=isisa-1;
        end;


if (not flag) or (flag and (isisa=0)) then
begin

        if Flag then
           tulis('^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              tulis('^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              tulis('^PQ1,0,1,N' );
        end;
        tulis('^XZ');
end;

//        tulis(inttostr(g_sisa_cetak_barcode));
//        lib.msgbox(9);
    end;
  end;


14  // printer zm4000  3 mendatar
  :begin
      writeln(f,'^XA^PRA^LH8,05^JMA^FS');
      writeln(f,'^MD10^MMT^BY3'); //BY3');
      writeln(f,'^PON');
      if not bHarga then
      begin
              if (not flag) or (flag and (isisa>0 ) ) then
         begin   // kolom 1
              writeln(f,'^FO25,30^B2N,80,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,5^A0,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO345,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO345,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO345,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

         if (not flag) or (flag and (isisa>1)) then
         begin   // kolom 2
              writeln(f,'^FO440,30^B2N,80,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO440,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO440,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO760,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO760,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO760,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
         if (not flag) or (flag and (isisa>2)) then
         begin
              writeln(f,'^FO850,130^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO850,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO850,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO1175,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO1175,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO1175,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

      end;
      if bHarga then
      begin
         if (not flag) or (flag and (isisa>0 ) ) then
         begin   // kolom 1
              writeln(f,'^FO25,130^A0,30,35^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO25,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,5^A0,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO345,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO345,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO345,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;

         if (not flag) or (flag and (isisa>1)) then
         begin   // kolom 2
              writeln(f,'^FO440,130^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO440,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO440,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO440,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO760,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO760,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO760,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
         if (not flag) or (flag and (isisa>2)) then
         begin
              writeln(f,'^FO850,130^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO850,100^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO850,30^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO850,5^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO1175,25^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO1175,50^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO1175,75^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
         end;
      end;
      if Flag then
           writeln(f,'^PQ1,0,1,N')
      else
      begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
      end;
      writeln(f,'^XZ');
    end;


 13
  :begin
      writeln(f,'^XA^PRA^LH8,12^FS');
      writeln(f,'^MD10^MMT^BY2'); //BY3');
      writeln(f,'^PON');
        if not bHarga then
        begin
          if (not flag) or (flag and (isisa>0 ) ) then
          begin   // kolom 1
              writeln(f,'^FO25,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO235,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO235,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO235,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>1)) then
          begin   // kolom 2
              writeln(f,'^FO310,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO310,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO310,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO520,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO520,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO520,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>2)) then
          begin
              writeln(f,'^FO590,18^B2N,60,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO590,85^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO590,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO800,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO800,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO800,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
        end;
        if bHarga then
        begin
          if (not flag) or (flag and (isisa>0 ) ) then
          begin   // kolom 1
              writeln(f,'^FO25,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO25,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO25,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO25,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO235,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO235,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO235,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>1)) then
          begin   // kolom 2
              writeln(f,'^FO310,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO310,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO310,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO310,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO520,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO520,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO520,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
          if (not flag) or (flag and (isisa>2)) then
          begin
              writeln(f,'^FO590,63^A0,25,20^CI13^FR^FD0'+cplu+'-'+svendor+'^FS');
              writeln(f,'^FO590,85^A0,30,30^CI13^FR^FDRp. '+sHarga+'^FS');
              writeln(f,'^FO590,18^B2N,40,N,N,N^FR^FD'+cPLU+'^FS');
              writeln(f,'^FO590,0^A0,20,15^CI13^FR^FD'+cLong_Ket+'^FS');
              writeln(f,'^FO800,15^A0,25,20^CI13^FR^FD'+formatdatetime('dd',g_sysdate_t)+'^FS');
              writeln(f,'^FO800,40^A0,25,20^CI13^FR^FD'+lib.sandibulan(DATE)+'^FS');
              writeln(f,'^FO800,65^A0,25,20^CI13^FR^FD'+formatdatetime('yy',g_sysdate_t)+'^FS');
          end;
        end;
        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


    11:begin
       writeln(f,'^XA^PRA^LH3,10^FS');
       writeln(f,'^MD5^MMT^BY3');
       writeln(f,'^PON');

       writeln(f,'^FO95,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//     writeln(f,'^FO95,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//     writeln(f,'^FO90,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//     writeln(f,'^FO100,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

//       writeln(f,'^FO100, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
//       writeln(f,'^FO100, 320^A0I,20,24^CI13^FR^FD Belanja^FS');
//       writeln(f,'^FO100, 300^A0I,20,20^CI13^FR^FD  Anda  ^FS');

       writeln(f,'^FO115, 340^A0I,20,24^CI13^FR^FDSahabat^FS');
       writeln(f,'^FO95, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');



        if (not flag) or (flag and (isisa>0 ) ) then
        begin
//           if bTgl then
//              writeln(f,'^FO120,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
//           if bTgl then
//              writeln(f,'^FO120,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
           //if bHarga then
           //   writeln(f,'^FO90,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO90,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO120,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;

//        writeln(f,'^FO175,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');
          writeln(f,'^FO175,70^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO85,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO115,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO115,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1 ) ) then
        begin
           writeln(f,'^FO260,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//           writeln(f,'^FO260,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO260,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO265,300^A0I,20,20^CI13^FR^FD001.00023429^FS');


       writeln(f,'^FO280, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO260, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');
//       writeln(f,'^FO260, 300^A0I,20,20^CI13^FR^FD  Anda  ^FS');



         //  if bTgl then
         //     writeln(f,'^FO280,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
          // if bTgl then
          //    writeln(f,'^FO280,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
          // if bHarga then
          //    writeln(f,'^FO245,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO260,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO290,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;

//        writeln(f,'^FO340,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');
          writeln(f,'^FO340,70^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO250,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');

              end
              else
              begin
                 writeln(f,'^FO280,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>2 ) ) then
        begin
           writeln(f,'^FO430,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');
//           writeln(f,'^FO430,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO430,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO435,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

       writeln(f,'^FO450, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO430, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');



           if bTgl then
//              writeln(f,'^FO440,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
//              ^FO260,40^A0n,20,24^CI13^FR^FD01001^FS
          // if bTgl then
          //    writeln(f,'^FO440,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');
           //if bHarga then
           //   writeln(f,'^FO410,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
           writeln(f,'^FO425,12^A0n,20,24^CI13^FR^FDRp.^FS');
           writeln(f,'^FO455,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;
           writeln(f,'^FO510,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO420,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO450,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');

              end
              else
              begin
                    writeln(f,'^FO450,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if (not flag) or (flag and (isisa>3 ) ) then
        begin
           writeln(f,'^FO595,360^A0I,30,20^CI13^FR^FDDUA SEKAWAN^FS');

//           writeln(f,'^FO595,340^A0I,20,24^CI13^FR^FD01-F-T01^FS');
//           writeln(f,'^FO595,320^A0I,20,24^CI13^FR^FD01S.0001.01^FS');
//           writeln(f,'^FO600,300^A0I,20,20^CI13^FR^FD001.00023429^FS');

       writeln(f,'^FO615, 340^A0I,20,24^CI13^FR^FD Sahabat^FS');
       writeln(f,'^FO595, 320^A0I,20,24^CI13^FR^FDBelanja Anda^FS');


           //if bTgl then
           //   writeln(f,'^FO595,40^A0n,20,24^CI13^FR^FD'+sTgl+'^FS');

           //if bTgl then
            //  writeln(f,'^FO600,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           //if bHarga then
           //   writeln(f,'^FO570,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
           begin
              writeln(f,'^FO595,12^A0n,20,24^CI13^FR^FDRp.^FS');
              writeln(f,'^FO625,12^A0n,30,27^CI13^FR^FD'+sHarga+'^FS');
           end;
           writeln(f,'^FO675,70^B8R,50,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,70^A0R,26,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO615,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO615,70^A0R,26,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


  10:begin
      writeln(f,'^XA^PRA^LH3,10^FS');
      writeln(f,'^MD10^MMT^BY2');
      writeln(f,'^PW810'); //^LL240^LT2');

      writeln(f,'^PON');



        if (not flag) or (flag and (isisa>0 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO120,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO120,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO90,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO90,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO160,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO90,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO110,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO100,55^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO280,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO280,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO245,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO245,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO320,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO250,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO270,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO260,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>2 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO440,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO440,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO410,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO410,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO480,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO410,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO430,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO420,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;
        if (not flag) or (flag and (isisa>3 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO600,225^A01,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bTgl then
              writeln(f,'^FO600,200^A01,20,24^CI13^FR^FD'+ssTgl+'^FS');

           if bHarga then
              writeln(f,'^FO570,2^A0n,20,24^CI13^FR^FD'+sHarga2+'^FS');

           if bHarga then
              writeln(f,'^FO570,25^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           writeln(f,'^FO640,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');

           if bNama then
           begin
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO570,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO590,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                    writeln(f,'^FO580,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;


  2:begin
      writeln(f,'^XA^PRA^LH5,10^FS');
      writeln(f,'^MD10^MMT^BY3');
      writeln(f,'^PON');
        if (not flag) or (flag and (isisa>0 ) ) then
        begin
           if bTgl then
              writeln(f,'^FO255,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO45,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO45,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO45,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO45,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO45,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO45,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
           begin
              if cdepkes = '' then
              begin
                 writeln(f,'^FO45,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              end
              else
              begin
                 writeln(f,'^FO45,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO45,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1)) then
        begin
           if bTgl then
              writeln(f,'^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
           if bHarga then
              writeln(f,'^FO305,20^A0b,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO335,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO335,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO335,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO335,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO335,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO335,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
              writeln(f,'^FO335,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;

  3
  :begin
      writeln(f,'^XA^PRA^LH5,10^FS');
      writeln(f,'^MD10^MMT^BY2'); //BY3');
      writeln(f,'^PON');
        if (not flag) or (flag and (isisa>0 ) ) then
        begin
            if bHarga then
  //             writeln(f,'^FO15,20^A0B,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
               writeln(f,'^FO235,25^A0R,20,18^CI13^FR^FD'+sHarga+'^FS')
            else
               writeln(f,'^FO235,25^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin
//            writeln(f,'^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//              writeln(f,'^FO25,0^B2N,55,Y,N,Y^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO25,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO25,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO25,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO25,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
           begin
              if cdepkes = '' then
              begin
//               writeln(f,'^FO25,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2                 writeln(f,'^FO25,10^BCR,55,Y,N^FR^FD'+cPLU+'^FS');

              end
              else
              begin
//               writeln(f,'^FO25,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//2                 writeln(f,'^FO25,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

                 writeln(f,'^FO25,85^A0N,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not flag) or (flag and (isisa>1)) then
        begin   // kolom 2
           if bharga then
//              writeln(f,'^FO545,25^A0R,18,18^CI13^FR^FD'+sTgl+'^FS' );
               writeln(f,'^FO520,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS')
           else
               writeln(f,'^FO520,20^A0R,20,18^CI13^FR^FD.'+sTgl+'^FS');

           if bNama then
           begin             //335
//            writeln(f,'^FO390,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//3              writeln(f,'^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO305,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO305,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO305,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO305,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            writeln(f,'^FO305,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//3              writeln(f,'^FO305,10^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

        end;


        if (not flag) or (flag and (isisa>1)) then
        begin// kolom 3
           if bHarga then
              writeln(f,'^FO800,20^A0R,20,18^CI13^FR^FDRp.'+sHarga+'^FS' )
           else
              writeln(f,'^FO800,20^A0R,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bNama then
           begin             //335
//            writeln(f,'^FO590,0^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
//4              writeln(f,'^FO590,0^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 writeln(f,'^FO590,100^A0N,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
              end
              else
              begin
                 if cdepkes = '' then
                 begin
                    writeln(f,'^FO590,85^A0N,35,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end
                 else
                 begin
                    writeln(f,'^FO590,85^A0N,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                    writeln(f,'^FO590,100^A0N,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                 end;
              end;
           end
           else
//            writeln(f,'^FO590,10^B8N,55,Y,N^FR^FD'+cPLU+'^FS');
 //5             writeln(f,'^FO590,30^BCN,55,Y,N^FR^FD'+cPLU+'^FS');

        end;



        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N' );
        end;
        writeln(f,'^XZ');
    end;



  4:begin
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD10^MMT^BY3');
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO150,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO130,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO190,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO130,30^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO145,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO125,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then
              writeln(f,'^FO285,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO265,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO325,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,15^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO260,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then
              writeln(f,'^FO420,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO400,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO460,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO400,30^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO415,30^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO395,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then
              writeln(f,'^FO555,240^A0I,18,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO535,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO595,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO535,30^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO550,30^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO530,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;

    5:begin
        writeln(f,'^XA^PRA^LH2,3^FS');
        writeln(f,'^MD3^MMT^BY3');
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=0)) then
           begin
           if bTgl then
              writeln(f,'^FO60,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO60,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO95,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO30,60^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO45,60^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO30,60^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO35,60^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO50,60^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO85,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO85,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO100,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl then
              writeln(f,'^FO200,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');

           if bHarga then
              writeln(f,'^FO200,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO230,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO165,55^A0R,15,15^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO180,55^A0R,15,15^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO165,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO165,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO185,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO230,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO165,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO185,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then
              writeln(f,'^FO330,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO330,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO300,55^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO315,55^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO300,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO300,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO315,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO365,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO315,55^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then
              writeln(f,'^FO470,265^A0I,20,18^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then
              writeln(f,'^FO470,30^A0n,20,18^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO500,55^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO435,55^A0R,15,18^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO450,55^A0R,15,18^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO435,55^A0R,35,15^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO435,55^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO450,55^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO500,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO500,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO435,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');
       end;

  6:begin    //type baru  bixolon 4 lajur vertikal 18*40 mm

//  lib.msgbox('jumlah baris :'+trim(inttostr(iJml))+' sisanya : '+trim(inttostr(isisa)) );

        writeln(f,'SW800');
        writeln(f,'SD20');
        writeln(f,'CB');
        writeln(f,'SL320,15,G');
        writeln(f,'SM5,10');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'V195,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
//           lib.sandibulantahun(DATE)

           if bHarga then writeln(f,'V90,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1170,40,8,3,14,60,1,1,'+quotedstr(cPLU));
           if trim(cLong_Ket2) <>'' then
              begin
                 writeln(f,'V200,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V225,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V225,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then   writeln(f,'V355,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));

           if bHarga then writeln(f,'V250,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1330,40,8,3,14,60,1,1,'+quotedstr(cPLU));
           if cLong_Ket2 <> '' then
              begin
                writeln(f,'V358,30,U,18,24,1,N,N,N,1,L,0,' +quotedstr(cLOng_Ket2));
                 writeln(f,'V386,30,U,18,24,1,N,N,N,1,L,0,' +quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V386,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_ket));
        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'V515,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
           if bHarga then writeln(f,'V410,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
                          writeln(f,'B1490,40,8,3,14,60,1,1,'+quotedstr(cPLU));
//                          writeln(f,'B1650,40,8,3,14,60,1,1,'+quotedstr(cPlu));

           if cLong_Ket2 <> '' then
              begin
                 writeln(f,'V516,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V547,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V547,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then    writeln(f,'V675,280,U,22,22,1,N,R,N,2,L,0,'+quotedstr(lib.sandibulantahun(DATE)));
           if bHarga then  writeln(f,'V570,5,U,22,22,1,N,N,N,0,L,0,'+quotedstr('Rp.'+sHarga));
           writeln(f,'B1650,40,8,3,14,60,1,1,'+quotedstr(cPlu));

           if cLong_Ket2 <> '' then
              begin
                 writeln(f,'V680,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket2));
                 writeln(f,'V708,30,U,18,24,1,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
              end
              else
                 writeln(f,'V708,30,U,18,50,2,N,N,N,1,L,0,'+quotedstr(cLong_Ket));
        end;

        if Flag then
           writeln(f,'P1')
        else
        begin
           if iJml > 0 then
              writeln(f,'P'+trim(inttostr(iJml)))
           else
              writeln(f,'P1');
        end;

        //writeln(f,'P1');

    end;

   7:begin   //type baru  zebra tlp 4 lajur vertikal 18*40 mm
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY3');  // md untuk tingkat panas
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO120,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO120,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO175,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO110,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO125,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO110,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then writeln(f,'^FO275,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO275,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO335,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,20^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO265,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'^FO435,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO435,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO495,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO425,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO440,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO425,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then   writeln(f,'^FO595,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO595,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO655,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO600,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO585,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;
   8:begin   //type baru  zebra tlp 4 lajur vertikal 18*40 mm  tanpa longkap sisa
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY3');  // md untuk tingkat panas
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           if bTgl   then writeln(f,'^FO110,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO110,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO175,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO110,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO125,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then writeln(f,'^FO110,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO135,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO150,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then writeln(f,'^FO190,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO200,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO135,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           if bTgl then writeln(f,'^FO265,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO265,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO335,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO265,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO280,30^A0R,15,20^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO265,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO270,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO285,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO325,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO330,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO285,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           if bTgl then   writeln(f,'^FO425,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO425,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO495,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO425,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO440,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO425,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO410,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO425,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO460,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if (not Flag) or (Flag and (iSisa=4)) then
        begin
           if bTgl then   writeln(f,'^FO585,240^A0I,20,24^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO585,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO655,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO585,30^A0R,15,20^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO600,30^A0R,15,20^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO585,30^A0R,30,18^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO545,30^A0R,15,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO560,30^A0R,15,15^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO465,35^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO475,30^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO410,30^A0R,35,15^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;

        end;

        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;

9:begin   //malang type baru  zebra tlp 5 lajur vertikal 20*50 mm  tanpa longkap sisa tanpa gap, hanya die cut
        writeln(f,'^XA^PRA^LH3,10^FS');
        writeln(f,'^MD1^MMT^BY4');  // md untuk tingkat panas  by = ukuran skala barcode
        writeln(f,'^PON');
        if (not Flag) or (Flag and (iSisa>=1)) then
        begin
           writeln(f,'^FO15,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl   then writeln(f,'^FO35,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO35,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama  then
           begin
              writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO143,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO65,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO120,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;

        if  (not Flag) or (Flag and (iSisa>=2)) then
        begin
           writeln(f,'^FO175,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then writeln(f,'^FO195,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO195,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');

           if bNama then
           begin
              writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLOng_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO303,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO225,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO280,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa>=3)) then
        begin
           writeln(f,'^FO335,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO355,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO355,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin


                 writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO463,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO385,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO440,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa>=4)) then
        begin
           writeln(f,'^FO495,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO515,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO515,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO623,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO545,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO600,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if (not Flag) or (Flag and (iSisa=5)) then
        begin
           writeln(f,'^FO655,30^A0R,20,20^CI13^FR^FD         -Bangun Indah Graha Malang-^FS');
           if bTgl then   writeln(f,'^FO675,360^A0I,20,20^CI13^FR^FD'+sTgl+'^FS');
           if bHarga then writeln(f,'^FO675,2^A0n,20,24^CI13^FR^FDRp.'+sHarga+'^FS');
           if bNama then
           begin
              writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
              if cLong_Ket2 <> '' then
              begin
                 writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cLong_Ket2+'^FS');
                 writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
              end
              else
              begin
                 if cDepkes = '' then
                    writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS')
                 else
                 begin
                    writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
                    writeln(f,'^FO783,30^A0R,25,25^CI13^FR^FD'+cLong_Ket+'^FS');
                 end;
              end;
           end
           else
           begin
              if cDepkes = '' then
                 writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS')
              else
              begin
                 writeln(f,'^FO705,60^B8R,55,Y,N^FR^FD'+cPLU+'^FS');
                 writeln(f,'^FO760,30^A0R,25,25^CI13^FR^FD'+cDepkes2+cDepkes+'^FS');
              end;
           end;
        end;


        if Flag then
           writeln(f,'^PQ1,0,1,N')
        else
        begin
           if iJml > 0 then
              writeln(f,'^PQ'+trim(inttostr(iJml))+',0,1,N')
           else
              writeln(f,'^PQ1,0,1,N');
        end;
        writeln(f,'^XZ');

    end;

  end;
  if baris<>33 then
  closefile(f);
end;

Function Tlib.cek_printer: boolean;
var
  res: string;
  putar, v_hasil : boolean ;
  vHasilMsg: TModalResult;
begin
  // file alfacekprinter letakan di /usr/local/bin
  // OFF -> ON 127 -> 79 -> 223
  // ON -> OFF 223 -> 79 -> 127
  // PRINTER STANBY : 223, 95
  // PAUSE & PAPPER OUT : 119
  putar   := TRUE ;
  v_hasil := FALSE ;
  while putar do
  begin
    res := '';
//  res := trim(ShellCommand('alfacekprinter'));

    res := trim(ShellCommand('bocis_printer'));


    if (res = '95') or (res = '216') or (res = '223') or (res = '255') or (res = '222') then
    begin
      v_hasil := true ;
      putar   := false ;
    end
    else
    begin
      v_hasil := false;
      putar   := true ;

      vHasilMsg := messagedlg('Status Printer => [' + res + ']' + #10 +
                              'Printer tidak aktif/siap. Tekan' + #10 +
                              '[Yes] untuk mulai mencetak,' + #10 +
                              '[No] untuk batal mencetak,' + #10 +
                              '[Cancel] untuk cek printer.', mtconfirmation, [mbYes, mbNo, mbCancel], 0, mbYes);

      if vHasilMsg = mrYes then
      begin
        v_hasil := true;
        putar := false;
      end
      else if vHasilMsg = mrNo then
      begin
        v_hasil := false;
        putar := false;
      end
      else if vHasilMsg = mrCancel then
      begin
        putar := true;
      end;
    end ;
  end ;

  result := v_hasil ;
end;

Function Tlib.ping_server(ip: string): boolean;
var
  res: string;
begin
  if ip = '' then
  begin
    result := false;
    exit;
  end;

  res := '';
  res := UpperCase(trim(ShellCommand('ping -w 3 ' + ip)));
  if (res = '') or
     (Pos('100% LOST', res) > 0) or
     (Pos('UNREACHABLE', res) > 0) or
     (Pos('UNKNOWN HOST', res) > 0) then
    result := false
  else
    result := true;
end;

Function Tlib.ShellCommand(command: string;PWait:boolean=true): string;
var
  Output: PIOFile;
  Buffer: PChar;
  TempString: string;
  rb: Integer;
  Cmd: string;

const
  BufferSize: Integer = 1000;
begin
  Cmd := command;
  Output := popen(PChar(Cmd),'r');
  if pWait then
  begin
    GetMem(Buffer,BufferSize);

    if Assigned(output) then
    begin
      while feof(Output)=0 do
      begin
        rb := Libc.fread(Buffer, 1,BufferSize, Output);
        SetLength(TempString, Length(TempString)+rb);
        memcpy(@TempString[length(TempString)-(rb-1)],Buffer,rb);
      end;
    end;

    Libc.pclose(output);
    wait(nil);
    FreeMem(Buffer,BufferSize);

    result := trim(TempString);
  end;
end;

Function TLib.ExpiredProgram: boolean;
var tTanggal : tdatetime;
    iExpired : double;
begin
  tTanggal := strtodatetime('30-09-2008');
  Result := false;
  if tTanggal <= date then
  begin
    lib.msgbox('Program BOCIS ini sudah Expired ... Silakan Hubungi Developer'+#10+#13);
    Result := true;
    exit;
  end;
  if tTanggal <= date+10  then
  begin
    iExpired := tTanggal-date;
    lib.msgbox('Program BOCIS akan Expired dalam waktu : '+floattostr(iExpired)+' hari lagi'+#10+#13);
  end;
end;

function tlib.UkuranFile(pSize: int64): string;
begin
	if pSize < 1024 then
		result := trim(FormatFloat('#,###', pSize) + ' bytes')
	else if pSize < 1048576 then
		result := trim(FormatFloat('###,###,###,###.##', RoundTo((pSize / 1024), -2)) + ' Kb')
	else if pSize < 1073741824 then
		result := trim(FormatFloat('###,###,###,###.##', RoundTo((pSize / 1048576), -2)) + ' Mb')
	else if pSize < 1099511627776 then
		result := trim(FormatFloat('###,###,###,###.##', RoundTo((pSize / 1073741824), -2)) + ' Gb')
end;

function Tlib.IIf(AValue: Boolean; const ATrue, AFalse: string): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;


function tlib.ambil_nama_field (scds : TMyQuery) : string ;
var
 v_hasil, v_field : string ;
 v_ulang_field : integer ;
begin
 v_hasil := ' (' ;
 for v_ulang_field := 0 to scds.FieldCount - 1 do
 begin
   v_field := scds.Fields.Fields[v_ulang_field].FieldName ;
   if v_ulang_field <> scds.FieldCount - 1 then
     v_hasil := v_hasil + v_field + ','
   else
     v_hasil := v_hasil + v_field + ')' ;
 end ;
 result := v_hasil ;
end ;

function tlib.ambil_isi_field (scds : TZQuery) : string ;
var
 v_hasil, v_isi : string ;
 v_ulang_field : integer ;
begin
 v_hasil := '(' ;
 for v_ulang_field := 0 to scds.FieldCount - 1 do
 begin
   if scds.Fields.Fields[v_ulang_field].Value = null then
     v_isi := 'NULL'
   else
   Begin
     case scds.Fields.Fields[v_ulang_field].DataType of
     ftDateTime: v_isi := ''''+formatdatetime('yyyy-mm-dd hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftDate : v_isi := ''''+formatdatetime('yyyy-mm-dd',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftTime : v_isi := ''''+formatdatetime('hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftMemo : v_isi := ''''+scds.Fields.Fields[v_ulang_field].Value+'''' ;
     else
       begin
//       v_isi := tochar(scds.Fields.Fields[v_ulang_field].asstring) ;

         v_isi := trim(stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','''''',[rfReplaceAll])) ;
         v_isi := trim(stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'\',' ',[rfReplaceAll])) ;
         v_isi := ''''+trim(v_isi)+'''' ;
       end ;
     end ;
   End ;

   if v_ulang_field <> scds.FieldCount - 1 then
     v_hasil := v_hasil + v_isi   + ','
   else
     v_hasil := v_hasil + v_isi   + ')' ;
 end ;

 result := v_hasil ;
end ;


function tlib.kasihkutip(str:string):string;
var
   cnt:integer;
   sx, sy, stemp1, stemp2 :string;
begin
   sx:='';
   sy:=trim(str);
   cnt:=pos(',',sy);
   while cnt > 0 do
   begin
      stemp1:=copy(sy,1,cnt-1);
      delete(sy,1,cnt);
      stemp2:= quotedstr(stemp1)+',';
      sx:= sx+stemp2;
      cnt:=pos(',',sy);
   end;
   if Length(sy) > 0 then
      sx:= sx+quotedstr(sy)+',';
   delete(sx,length(sx),1);
   result := sx;
end;

function tlib.ToChar(s:string): string;
begin
  result := stringreplace(stringreplace(s,'"','`',[rfReplaceAll]),'''','`',[rfreplaceall]);
end;

function Tlib.cek_kutip(str: string; bmsg: boolean=true): boolean;
begin
    result := true;
    if (pos('''',str) > 0 ) or (pos('"',str) > 0 ) then
    begin
        if bmsg then
           lib.msgbox('Entry mengandung tanda kutip ('' atau ") tidak diperbolehkan '+#10#13+
                      'Silahkan ganti dengan tanda ` (cacing)');
        Result := false;
    end;
end;
function Tlib.bulantahun(tgl:tdatetime):string;
begin
   result:='';
   case MonthOf(tgl)  of
     1 : result:= 'A'+formatdatetime('yy',tgl);
     2 : result:= 'B'+formatdatetime('yy',tgl);
     3 : result:= 'C'+formatdatetime('yy',tgl);
     4 : result:= 'D'+formatdatetime('yy',tgl);
     5 : result:= 'E'+formatdatetime('yy',tgl);
     6 : result:= 'F'+formatdatetime('yy',tgl);
     7 : result:= 'G'+formatdatetime('yy',tgl);
     8 : result:= 'H'+formatdatetime('yy',tgl);
     9 : result:= 'I'+formatdatetime('yy',tgl);
     10: result:= 'J'+formatdatetime('yy',tgl);
     11: result:= 'K'+formatdatetime('yy',tgl);
     12: result:= 'L'+formatdatetime('yy',tgl);
   end;
end;

function Tlib.sandibulan(tgl:tdatetime):string;
begin
   result:='';
   case MonthOf(tgl)  of
     1 : result:= 'A';
     2 : result:= 'B';
     3 : result:= 'C';
     4 : result:= 'D';
     5 : result:= 'E';
     6 : result:= 'F';
     7 : result:= 'G';
     8 : result:= 'H';
     9 : result:= 'I';
     10: result:= 'J';
     11: result:= 'K';
     12: result:= 'L';
   end;
end;

function Tlib.decodebulan(str: string):string;
begin
   result:='';
   if str ='A' then result:= '01' else
   if str ='B' then result:= '02' else
   if str ='C' then result:= '03' else
   if str ='D' then result:= '04' else
   if str ='E' then result:= '05' else
   if str ='F' then result:= '06' else
   if str ='G' then result:= '07' else
   if str ='H' then result:= '08' else
   if str ='I' then result:= '09' else
   if str ='J' then result:= '10' else
   if str ='K' then result:= '11' else
   if str ='L' then result:= '12' else result:= '0';
end;



Function Tlib.wiplocal(x:integer=1):string;
var res:string;
procedure potong;
begin
      DELETE(res,1,pos('inet',res)-1);
      DELETE(res,1,pos(':',res));
end;
begin
   try
      res:=lib.ShellCommand('ifconfig wlan');
   finally
      potong;
      case x of
        1: result:=copy(res,1,pos(' ',res)-1);
        2: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
        3: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
      end;
   end;
end;


Function Tlib.iplocal(x:integer=1):string;
var res:string;
procedure potong;
begin
      DELETE(res,1,pos('inet',res)-1);
      DELETE(res,1,pos(':',res));
end;
begin
   try
      res:=lib.ShellCommand('ifconfig');
   finally
      potong;
      case x of
        1: result:=copy(res,1,pos(' ',res)-1);
        2: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
        3: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
      end;
   end;
end;

Function Tlib.hwwiplocal(x:integer=1):string;
var res:string;
procedure potong;
begin
      DELETE(res,1,pos('HWaddr',res)-1);
      DELETE(res,1,pos(' ',res));
end;
begin
   try
      res:=lib.ShellCommand('ifconfig wlan');
   finally
      potong;
      case x of
        1: result:=copy(res,1,pos(' ',res)-1);
        2: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
        3: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
      end;
   end;
end;



Function Tlib.hwiplocal(x:integer=1):string;
var res:string;
procedure potong;
begin
      DELETE(res,1,pos('HWaddr',res)-1);
      DELETE(res,1,pos(' ',res));
end;
begin
   try
      res:=lib.ShellCommand('ifconfig');
   finally
      potong;
      case x of
        1: result:=copy(res,1,pos(' ',res)-1);
        2: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
        3: begin
             potong;
             result:=copy(res,1,pos(' ',res)-1);
           end;
      end;
   end;
end;


procedure Tlib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

function tlib.TagProduk(sType:string;sSparator:string=';'): string;
var sTag:string;
begin
  sTag := '';
  fmain.cari6('select MTS_KODE from ms.M_TYPE_SKU where INSTR(MTS_TY,"'+sType+'")>0');
  while not fmain.scds_cari6.eof do
  begin
    sTag := sTag + fmain.scds_cari6.fieldbyname('MTS_KODE').asstring+sSparator;
    fmain.scds_cari6.next;
  end;
  if sTag<>'' then sTag := leftstr(sTag,length(sTag)-1);
  result:= stag;
end;

Function tlib.cek_registrasi(sKey: string = '' ;sNomor : string = '' ;sValid:string=''):boolean ;
var vChar1,vKey,vString,vString2 : string;
    iPjg,iLenStr,iLength,i,vAcak,vAcak2 : integer;
    vTglX : tdatetime;
    iExpired:double;
begin
  if (trim(sKey) = '') or (trim(sNomor) = '') then
  begin
    lib.msgbox('Key Register System belum ada .... ');
    result := false;
    exit;
  end;
  Result := true;
  vString2 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
  vString  := 'DC0vHw1IdFJoQELGOjWPqRnSgT3UXbZl5aYeKcfh4ik7mVpNst9zuxM2A6y8Br';
  iLenStr  := length(vString2)+1;

  // ambil panjang
  vKey := trim(sKey)+trim(sNomor);
  iLength := length(vKey)-1;
  iPjg :=0;
  for i:= 1 to iLength do
  begin
    iPjg := iPjg+StrToWord(vKey[i]);
  end;
  iPjg := (iPjg mod iLenStr);
  if iPjg <= 0 then iPjg := 1;

  vKey := trim(sKey);
  iLength  := length(vKey);
  for i:= 1 to iLength do
  begin
    vAcak := StrToWord(vKey[i]);
    if vAcak <=0 then vAcak :=1 ;
    if vAcak >= iLenStr  then vAcak := (vAcak mod iLenStr)+1;
    vAcak2:= StrToWord(copy(vString2,vAcak,1));
    if vAcak2 <=0 then vAcak2 :=1 ;
    if vAcak2 >= iLenStr then vAcak2 := (vAcak2 mod iLenStr)+1;
    vChar1  := copy(vString,vAcak,1);
    vString := StuffString(vString, vAcak,1,'');
    vString := StuffString(vString, vAcak2,0,vChar1);
  end;
  vChar1 := lib.rpad(trim(sNomor),16);
  iLength := length(vChar1)-1;
  for i:=1 to iLength do
  begin
    vChar1[i] := vString2[pos(vChar1[i],vString)];
  end;
  if vString[iPjg] <> vChar1[16] then
  begin
    lib.msgbox('Check Key Register System anda Salah .... ');
    result := false;
    exit;
  end;

  if ((vChar1[14]+vChar1[5]+vChar1[7]+vChar1[10]+vChar1[12])<>'BOCIS') then
  begin
    lib.msgbox('Key Register System anda Salah .... ');
    result := false;
    exit;
  end;
  if Result and (vChar1[1]<>vKey[1]) or (vChar1[15]<>vKey[length(vKey)]) then
  begin
    lib.msgbox('Key & Nomor Register anda Berbeda .... Program tidak dapat Dilanjutkan');
    result := false;
    exit;
  end;
  if Result and
     (not (vChar1[2] in ['0'..'9']) or not (vChar1[4] in ['0'..'9']) or
      not (vChar1[6] in ['0'..'9']) or not (vChar1[8] in ['0'..'9']) or
      not (vChar1[11] in ['0'..'9']) or not (vChar1[9] in ['0'..'9']) or
      not (vChar1[3] in ['0'..'9']) or not (vChar1[13] in ['0'..'9'])) then
  begin
    lib.msgbox('Key & Nomor Tgl Register anda Berbeda .... Program tidak dapat Dilanjutkan');
    result := false;
    exit;
  end;
  if Result and not
  trystrtodatetime(vChar1[2]+vChar1[4]+'-'+vChar1[6]+vChar1[8]+'-'+vChar1[11]+vChar1[9]+vChar1[3]+vChar1[13],vTglX) then
  begin
    lib.msgbox('Format Tanggal Register anda Salah .... Program tidak dapat Dilanjutkan');
    result := false;
    exit;
  end;
  if Result then g_expired_t:=vTglx;
  if Result and (sValid = 'Exp') then
  begin

    if vTglX <= date then
    begin
      lib.msgbox('Program ini sudah Expired ... Silakan Hubungi Team IT'+#10+#13);
      Result := false;
      exit;
    end;
    if vTglx <= date+10  then
    begin
      iExpired := vTglX-date;
      lib.msgbox('Program akan Expired dalam waktu : '+floattostr(iExpired)+' hari lagi'+#10+#13);
    end;


  end;
end;

function Tlib.sandibulantahun(tgl:tdatetime):string;
var result1,result2,result3:string;
begin
   result:='';
   case MonthOf(tgl)  of
     1 : result1:= '0A';
     2 : result1:= '0B';
     3 : result1:= '0C';
     4 : result1:= '0D';
     5 : result1:= '0E';
     6 : result1:= '0F';
     7 : result1:= '0G';
     8 : result1:= '0H';
     9 : result1:= '0I';
     10: result1:= 'A0';
     11: result1:= 'AA';
     12: result1:= 'AB';
   end;
   case DayOf(tgl)  of
     1 : result2:= '0A';
     2 : result2:= '0B';
     3 : result2:= '0C';
     4 : result2:= '0D';
     5 : result2:= '0E';
     6 : result2:= '0F';
     7 : result2:= '0G';
     8 : result2:= '0H';
     9 : result2:= '0I';
     10: result2:= 'A0';
     11: result2:= 'AA';
     12: result2:= 'AB';
     13: result2:= 'AC';
     14: result2:= 'AD';
     15: result2:= 'AE';
     16: result2:= 'AF';
     17: result2:= 'AG';
     18: result2:= 'AH';
     19: result2:= 'AI';
     20: result2:= 'B0';
     21: result2:= 'BA';
     22: result2:= 'BB';
     23: result2:= 'BC';
     24: result2:= 'BD';
     25: result2:= 'BE';
     26: result2:= 'BF';
     27: result2:= 'BG';
     28: result2:= 'BH';
     29: result2:= 'BI';
     30: result2:= 'C0';
     31: result2:= 'CA';
   end;
   case YEAROF(tgl)  of
     2010 : result3:= 'A0';
     2011 : result3:= 'AB';
     2012 : result3:= 'AC';
     2013 : result3:= 'AD';
     2014 : result3:= 'AE';
     2016 : result3:= 'AF';
     2017 : result3:= 'AG';
     2018 : result3:= 'AH';
     2019 : result3:= 'AI';
     2020 : result3:= 'AJ';
     ELSE
      result3:= 'AK';
   end;
   result :=concat(result2,result1,result3);
end;


procedure tlib.cetakpricecard(baris:integer;flag:boolean;ijml:integer;
                            isisa:integer;xkd:string;cket:string;
                            cdepkes:string;cdepkes2:string;
                            btgl:boolean;stgl:string;
                            bnama:boolean;bharga:boolean;sharga:string);
var
  f    : textfile ;
  xcd,gnp,gjl,i,j: integer;
  clong_ket,clong_ket2,cplu: string;
begin
  gnp:=0;
  gjl:=0;
  cDepkes := '';
  clong_ket2 :='';
  cplu  := rightstr('000000'+trimleft(xkd),7);
  for i:= 1 to 7 do
  begin
     j := strtoint(copy(cplu,i,1));
     if i mod 2 = 0 then
        inc(gnp,j)
     else
        inc(gjl,j)
  end;
  xcd      := (10 - ((gjl*3+gnp) mod 10)) mod 10;    // buat cek digit sendiri donk
  cPLU     := cplu + inttostr(xcd);
  if (trim(cdepkes) <> '') then
     clong_ket := leftstr(cket,31)
  else
     lib.bagi2(trim(cket),40,clong_ket,clong_ket2); //40
             //itu
  assignfile(f,g_printer_barcode) ;
  append(f);

{
/// rule price card tambun


  writeln(f,'^XA^PRA^LH3,10^FS');
  writeln(f,'^MD1^MMT^BY3');
  writeln(f,'^PON');

  writeln(f,'^FO440,45^B8N,25,Y,N^FR^FD'+cPLU+'^FS');
  writeln(f,'^FO25,45^B8N,25,Y,N^FR^FD'+cPLU+'^FS');

  writeln(f,'^FO440,3^A0N,40,23^CI13^FR^FD'+cket+'^FS');
  writeln(f,'^FO25,3^A0N,40,23^CI13^FR^FD'+cket+'^FS');


  writeln(f,'^FO665,45^A0N,20,20^CI13^FR^FD'+formatdatetime('dd-MMM-yyyy',now)+'^FS');
  writeln(f,'^FO250,45^A0N,20,20^CI13^FR^FD'+formatdatetime('dd-MMM-yyyy',now)+'^FS');

  writeln(f,'^FO665,65^A0N,20,20^CI13^FR^FD'+g_uu_code_aktif+'^FS');
  writeln(f,'^FO250,65^A0N,20,20^CI13^FR^FD'+g_uu_code_aktif+'^FS');

//writeln(f,'^FO735,65^A0N,20,20^CI13^FR^FD'+cds_railcard_dtl.FieldByName('VENDOR').Asstring+'^FS');
//writeln(f,'^FO320,65^A0N,20,20^CI13^FR^FD'+cds_railcard_dtl.FieldByName('VENDOR').Asstring+'^FS');

//writeln(f,'^FO665,85^A0N,20,20^CI13^FR^FD'+cds_railcard_dtl.FieldByName('UPC').Asstring+'^FS');
//writeln(f,'^FO250,85^A0N,20,20^CI13^FR^FD'+cds_railcard_dtl.FieldByName('UPC').Asstring+'^FS');

  writeln(f,'^FO440,120^A0N,55,45^CI13^FR^FDRp. '+sharga+'^FS');
  writeln(f,'^FO25,120^A0N,55,45^CI13^FR^FDRp. '+sharga+'^FS');

  writeln(f,'^PQ1,0,1,N');
  writeln(f,'^XZ');
}

{
        writeln(f,'SW800');
        writeln(f,'SD20');
        writeln(f,'CB');
        writeln(f,'SL320,15,G');
        writeln(f,'SM5,10');
        writeln(f,'B1500,80,7,2,14,60,0,1,'+quotedstr('8997009510116'));
        writeln(f,'V100,80,U,22,22,1,N,N,B,0,L,0,'+quotedstr('Rp.'));
        writeln(f,'V120,110,U,80,130,1,N,N,B,0,L,0,'+quotedstr('100.000'));
        writeln(f,'V100,1,U,35,55,-1,N,N,B,0,F,0,'+quotedstr('DJI SAM SOE; BKS'));
        writeln(f,'V100,260,U,18,24,1,N,N,N,0,L,0,'+quotedstr('16-Jul-2010'));
        writeln(f,'V300,260,U,18,24,1,N,N,N,0,L,0,'+quotedstr('S.0001.01'));
        writeln(f,'V500,260,U,18,24,1,N,N,N,0,L,0,'+quotedstr('100001'));
        writeln(f,'V650,260,U,18,24,1,N,N,N,0,L,0,'+quotedstr('0001'));
        writeln(f,'P1');
}

  closefile(f);
end;





function tlib.ganti_isi_field (scds: TMyQuery;init : string) : string ;
var
 v_field : string ;
 v_hasil, v_isi : string ;
 v_ulang_field : integer ;
begin
 v_hasil := '(' ;
 for v_ulang_field := 0 to scds.FieldCount - 1 do
 begin
   if scds.Fields.Fields[v_ulang_field].Value = null then
     v_isi := 'NULL'
   else
   Begin
     case scds.Fields.Fields[v_ulang_field].DataType of
     ftDate : v_isi := ''''+formatdatetime('yyyy-mm-dd',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftTime : v_isi := ''''+formatdatetime('hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftDateTime: v_isi := ''''+formatdatetime('yyyy-mm-dd hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftString: begin
                   v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','''''',[rfReplaceAll]) ;
                   v_isi := stringreplace(v_isi,'\',' ',[rfReplaceAll]) ;
                   v_isi := stringreplace(v_isi,',','.',[rfReplaceAll]) ;
                   v_isi := ''''+v_isi+'''' ;
               end;
       else
       begin
         v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','''''',[rfReplaceAll]) ;
         v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'\',' ',[rfReplaceAll]) ;
         v_isi := ''''+v_isi+'''' ;
       end ;
     end ;
   End ;

   v_field := scds.Fields.Fields[v_ulang_field].FieldName ;
   if rightstr(v_field,8)='_MT_KODE' then
      v_isi := ''''+init+'''' ;
   if v_ulang_field <> scds.FieldCount - 1 then
     v_hasil := v_hasil + v_isi   + ','
   else
     v_hasil := v_hasil + v_isi   + ')' ;
 end ;

 result := v_hasil ;
end ;


function tlib.ganti_isi_field_saja(scds: TMyQuery) : string ;
var
 v_field : string ;
 v_hasil, v_isi : string ;
 v_ulang_field : integer ;
begin
 v_hasil := '(' ;
 for v_ulang_field := 0 to scds.FieldCount - 1 do
 begin
   if scds.Fields.Fields[v_ulang_field].Value = null then
     v_isi := 'NULL'
   else
   Begin
     case scds.Fields.Fields[v_ulang_field].DataType of
     ftDate : v_isi := ''''+formatdatetime('yyyy-mm-dd',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftTime : v_isi := ''''+formatdatetime('hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftDateTime: v_isi := ''''+formatdatetime('yyyy-mm-dd hh:nn:ss',scds.Fields.Fields[v_ulang_field].Value)+'''' ;
     ftString: begin
//                 v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','''''',[rfReplaceAll]) ;
                   v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','',[rfReplaceAll]) ;
                   v_isi := stringreplace(v_isi,'\',' ',[rfReplaceAll]) ;
                   v_isi := stringreplace(v_isi,',','.',[rfReplaceAll]) ;
                   v_isi := ''''+v_isi+'''' ;
               end;
       else
       begin
         v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'''','''''',[rfReplaceAll]) ;
         v_isi := stringreplace(vartostr(scds.Fields.Fields[v_ulang_field].Value),'\',' ',[rfReplaceAll]) ;
         v_isi := ''''+v_isi+'''' ;
       end ;
     end ;
   End ;
   {
   v_field := scds.Fields.Fields[v_ulang_field].FieldName ;
   if rightstr(v_field,8)='_MT_KODE' then
      v_isi := ''''+init+'''' ;
   }
   if v_ulang_field <> scds.FieldCount - 1 then
     v_hasil := v_hasil + v_isi   + ','
   else
     v_hasil := v_hasil + v_isi   + ')' ;
 end ;

 result := v_hasil ;
end ;

function Tlib.gantitglkomp(str: string): string;
var res:string;
begin
   try
        res:=lib.ShellCommand('sudo date --set "'+str+'"');
   finally
       result:=res;
   end;
end;



{
function Tlib.sinkronjamkomp(str: string): string;
var res:string;
begin
   try
//        res:=lib.ShellCommand('sudo ntpdate -s 0.id.pool.ntp.org');
        res:=lib.ShellCommand('sudo ntpdate -s 1.id.pool.ntp.org');
   finally
       result:=res;
   end;
end;
}



Function Tlib.cekservermysql(sKey: string = '' ):boolean;
var res:string;x:integer;
procedure potong;
begin
      DELETE(res,1,pos('mysqld',res)-2);
end;
begin  x:=0;
//   lib.msgbox('mysqladmin '+sKey);
   try
      res:=lib.ShellCommand('mysqladmin '+sKey);
   finally
      potong;
      if res='mysqld is alive' then
      result:=true
      else        result:=false;

   end;
end;

Function Tlib.cariprinter(x:integer=1):string;
var res:string;
procedure potong;
begin
      DELETE(res,1,pos('\n',res)-1);
      DELETE(res,1,pos('\n',res));
end;
begin
   try
      res:=lib.ShellCommand('find /dev/ -name lp*');
   finally
         result:=copy(res,1,30);
//         lib.msgbox(' 1 ini ibu budi yg sedang mandi kering dal dul idujjj djj jdjdjjd'+#13#10+result);

      potong;
      case x of
        1:
        result:=copy(res,1,30);
//        result:=copy(res,1,pos('#13#10',res)-1);
        2: begin
             potong;
             result:=copy(res,1,30);
//             result:=copy(res,1,pos('\n',res)-1);
           end;
        3: begin
             potong;
            result:=copy(res,1,30);
 //               result:=copy(res,1,pos('\n',res)-1);
           end;
      end;

   end;
end;


end.


