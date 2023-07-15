unit ULov;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids,Db, BCMaterialDesignButton;

type
  { TFrmLov }
  TLOVSelectValuesEvent = procedure(const Values: TStringList) of object;

  TFrmLov = class(TForm)
    BtnSearch: TBCMaterialDesignButton;
    DbgLov: TDBGrid;
    EdCariLov: TEdit;
    PnlBtnLov: TPanel;
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    PnlEdLov: TPanel;
    PnlTengah: TPanel;
    procedure DbgLovDblClick(Sender: TObject);
    procedure LoadDataToDbGrid(Dataset:TDataSource);
  private
    FOnSelectValues: TLOVSelectValuesEvent;

    FSelectedValue: Variant;
    FSelectedValue1: TStringList;

    function GetSelectedValue: Variant;

    function GetSelectedValue1: TStringList;


  public
      property SelectedValue: Variant read GetSelectedValue;

     property SelectedValue1: TStringList read GetSelectedValue1;

      property OnSelectValues: TLOVSelectValuesEvent read FOnSelectValues write FOnSelectValues;
  end;

var
  FrmLov: TFrmLov;

implementation

{$R *.lfm}

{ TFrmLov }

procedure TFrmLov.LoadDataToDbGrid(Dataset: TDataSource);
begin
  //update caption pada grid
  DbgLov.DataSource:=Dataset;
end;

procedure TFrmLov.DbgLovDblClick(Sender: TObject);
var
fvalues : TStringList;
 I:Integer;
begin
  fvalues :=TStringList.Create;
  try
    // Mengumpulkan nilai dari semua kolom di DBGrid ke dalam TStringList
    for I := 0 to DbgLov.Columns.Count - 1 do
    begin
      if DbgLov.Columns[I].Field <> nil then
        fvalues.Add(DbgLov.Columns[I].Field.AsString)
      else
        fvalues.Add('');
    end;

    // Memanggil event OnSelectValues dengan TStringList yang berisi nilai dari semua kolom
    if Assigned(FOnSelectValues) then
      FOnSelectValues(fvalues);

  finally
     fvalues.Free;
  end;

  Close;
end;


end.

