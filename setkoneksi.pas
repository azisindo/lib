unit setkoneksi;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,ZConnection,LazFileUtils,Libstring,Dialogs;


 function Conn_db(Connection: TZConnection;dbname:string):boolean;
 function Logg_error:string;

implementation
var
  FlogError : string;

function Conn_db(Connection: TZConnection;dbname:string): boolean;
begin
  GetVarExternal;

  g_me_nik          :='1234';
  g_uu_code_aktif   :='4005';

  Connection.Connected:= false;

  Connection.HostName := g_HostName;
  Connection.Database := dbname;
  Connection.User     := g_UserName;
  Connection.Password := g_Password;
  Connection.Port     := g_Port;
  Connection.Protocol := g_protocol;

  Connection.LibraryLocation:=GetLibConnection;

  try
     begin
       Result := true;
       Connection.Connected:=True;
       Connection.ExecuteDirect('CALL laz.P_INIT('''+g_me_nik+''','''+g_uu_code_aktif+''')' );
       //vConn.ExecSQL('set @ApplicationCode = "' + qtaf.pubAppCode + qtaf.pubAppVersion + '" ', []) ;
     end;
  except
    on E: Exception do
    begin
      result := False;
      FlogError :=E.Message;
    end;
  end;
end;

function Logg_error: string;
begin
  result := FlogError;
end;


end.

