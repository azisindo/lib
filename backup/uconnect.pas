unit uConnect;

interface

uses
  SysUtils, Classes, ZConnection, ZDataset, DB,fpjson, jsonparser,LazFileUtils,Libstring;

type

  { TConnect }

  TConnect = class
  private
    FHostName: string;
    FDatabaseName: string;
    FUserName: string;
    FPassword: string;
    FPort: Integer;
    Flogger: string;
    FProtocol: string;

    FConnection: TZConnection;
    FDataSource: TDataSource;
  public
    constructor Create();
    function Connect: Boolean;
    function Disconnect: Boolean;
    function ExecuteQuery(AQuery: string): TZQuery; overload;
    function ExecuteQuery(AQuery: string; AParams: array of Variant): TZQuery; overload;
    function ExecuteSQL(Const ASQL:string):Integer;overload;
    function ExecuteSQL(Const ASQL:string; const Aparam:array of Variant):Integer;overload;
    function Logger:string;
    property DataSource: TDataSource read FDataSource write FDataSource;
  end;

implementation

constructor TConnect.Create();
begin
  GetVarExternal;

  FHostName     := g_HostName;
  FPort         := g_Port;
  FDatabaseName := g_DatabaseName;
  FUserName     := g_UserName;
  FPassword     := g_Password;
  FProtocol     := g_protocol;


  FConnection := TZConnection.Create(nil);

  FDataSource := TDataSource.Create(nil);
end;

function TConnect.Connect: Boolean;
begin
  Result := False;
  FConnection.Connected:=False;

  FConnection.HostName := FHostName;
  FConnection.Database := FDatabaseName;
  FConnection.User     := FUserName;
  FConnection.Password := FPassword;
  FConnection.Port     := FPort;
  FConnection.Protocol := FProtocol;
  FConnection.LibraryLocation:=GetLibConnection;

  try
    Result := True;
    FConnection.Connected:=True;
    FConnection.ExecuteDirect('CALL laz.P_INIT('''+g_me_nik+''','''+g_uu_code_aktif+''')' );
  except
    on E: Exception do
    begin
      Result:=False;
      Flogger:='Gagal koneksi '+E.Message;
    end;
  end;
 end;

function TConnect.Disconnect: Boolean;
begin
  Result := False;
  try
    FConnection.Disconnect;
    FDataSource.DataSet := nil;
    Result := True;
  except
    on E: Exception do
       Result := False;
  end;
end;

function TConnect.ExecuteQuery(AQuery: string): TZQuery;
begin
  Result := TZQuery.Create(nil);
  try
    Result.Connection := FConnection;
    Result.SQL.Text := AQuery;
    Result.Open;
    if Assigned(FDataSource) then
      FDataSource.DataSet := Result;
  except
    on E: Exception do
    begin
      Flogger:='Error executing query: '+E.Message;
      raise Exception.CreateFmt('Error executing query: %s', [E.Message]);
      Result.Free;
      Result := nil;
    end;
  end;
end;

function TConnect.ExecuteQuery(AQuery: string; AParams: array of Variant): TZQuery;
var
  I: Integer;
begin
  Result := TZQuery.Create(nil);
  try
    Result.Connection := FConnection;
    Result.SQL.Text := AQuery;
    for I := Low(AParams) to High(AParams) do
      Result.Params[I].Value := AParams[I];
    Result.Open;
    if Assigned(FDataSource) then
      FDataSource.DataSet := Result;
  except
    on E: Exception do
    begin
      Flogger:='Error executing query: '+E.Message;
      raise Exception.CreateFmt('Error executing query:  %s', [E.Message]);
      Result.Free;
      Result := nil;
    end;
  end;
end;

function TConnect.ExecuteSQL(const ASQL: string): Integer;
var
  Query: TZQuery;
begin
  Query := TZQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := ASQL;
    Query.ExecSQL;
    Result := Query.RowsAffected;
  finally
    Query.Free;
  end;
end;

function TConnect.ExecuteSQL(const ASQL: string; const Aparam: array of Variant
  ): Integer;
var
  Query: TZQuery;
  I: Integer;
begin
  Query := TZQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := ASQL;
    for I := Low(Aparam) to High(Aparam) do
    begin
      Query.Params[I].Value := Aparam[I];
    end;
    Query.ExecSQL;
    Result := Query.RowsAffected;
  finally
    Query.Free;
  end;
end;

function TConnect.Logger: string;
begin
  Result := Flogger;
end;

{
  ctrl+Shift+c = membuat function baru

   Penggunaa Class Connection

procedure TForm1.Button1Click(Sender: TObject);
var
  Connect: TConnect;
  Query: TZQuery;
begin
   Connect := TConnect.Create();

   try
    if Connect.Connect then
    begin
      Query := Connect.ExecuteQuery('SELECT * FROM mytable');
      if Query <> nil then
      begin
        // menggunakan TDataSource yang telah ditambahkan
        Connect.DataSource.DataSet := Query;

        // menampilkan hasil query pada DBGrid
        DBGrid1.DataSource := Connect.DataSource;
      end;
    end;
  finally
    Connect.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Connect: TConnect;
  Query: TZQuery;
begin
   Connect := TConnect.Create();
   try
    if Connect.Connect then
    begin
      Query := Connect.ExecuteQuery('SELECT * FROM mytable WHERE field1 = :param1 AND field2 = :param2', [123, 'abc']);
      if Query <> nil then
      begin
        // menggunakan TDataSource yang telah ditambahkan
        Connect.DataSource.DataSet := Query;

        // menampilkan hasil query pada DBGrid
        DBGrid1.DataSource := Connect.DataSource;
      end;
    end;
  finally
    Connect.Free;
  end;
end;

FConnection.ExecuteSQL('INSERT INTO users (username, email, password) VALUES (?, ?, ?)',
    [AUsername, AEmail, APassword])

FConnection.ExecuteSQL('UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?',
        [AUsername, AEmail, APassword, AID]);

FConnection.ExecuteSQL('DELETE FROM users WHERE id = ?', [AID]);

}

end.

