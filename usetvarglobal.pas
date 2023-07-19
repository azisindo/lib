unit uSetVarGlobal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,fpjson, jsonparser,LazFileUtils;

type
   { TSetVarGlobal }
   TSetVarGlobal=Class
     private
       FDb1:string;
       FDb2:string;
       FDb3:string;
       FDb4:string;
       FDb5:string;

     public
       property Db1:string read FDb1 write FDb1;

       constructor Create(const FileName:string);
       //procedure SaveSettingsToFile(const FileName: string);

   end;
var
  SetVarGlobal:TSetVarGlobal;

implementation

constructor TSetVarGlobal.Create(const FileName: string);
var
  JsonData: TJSONData;
  jsonFile: TFileStream;
begin
  jsonFile := TFileStream.Create(FileName, fmOpenRead);
  JsonData := GetJSON(jsonFile);
  try
    FDb1      := JsonData.FindPath('db1').AsString;
    FDb2      := JsonData.FindPath('db2').AsString;
    FDb3      := JsonData.FindPath('db3').AsString;
    FDb4      := JsonData.FindPath('db4').AsString;
    FDb5      := JsonData.FindPath('db5').AsString;
  finally
    JsonData.Free;
    jsonFile.Free;
  end;
end;

initialization
  SetVarGlobal:= TSetVarGlobal.Create('VarGlobal.json');

finalization
  SetVarGlobal.Free;


{procedure TSettings.SaveSettingsToFile(const FileName: string);
var
  JSON: TJsonObject;
begin
  JSON := TJsonObject.Create;
  try
    JSON.S['UserName'] := UserName;
    // Set values for other setting variables in the JSON object

    JSON.SaveToFile(FileName);
  finally
    JSON.Free;
  end;
end;}

end.

