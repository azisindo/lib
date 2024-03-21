unit libdata;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Libstring,uConnect,ZDataset,Dialogs;

function get_pk:string;

implementation

function get_pk: string;
var
 Connect: TConnect;
 Query: TZQuery;
begin
  Connect := TConnect.Create();

  try
    if Connect.Connect then
    begin
      Query := Connect.ExecuteQuery('select laz.F_GET_PK() pk');
      if Query <> nil then
      begin
        Connect.DataSource.DataSet := Query;
        result  :=Connect.DataSource.DataSet.FieldByName('pk').AsString
      end
    end
    else
    begin
      ShowMessage(Connect.Logger);
      abort;
      //exit
      //Halt; // keluar dari aplikasi
    end;
  finally
    begin
      freeAndNil(Connect);
    end;
  end;
end;

end.

