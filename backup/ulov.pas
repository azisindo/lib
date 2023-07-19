{

--------------------------------------------------------------
- Cara pemanggilan LOV dari Forms lain                       -
- Uses tambahan di form pemanggi LOV -> uconnect,Db,ZDataset;-
- By Azis - dev2023                                          -
--------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
var
  FrmLov:TFrmLov;
  ButtonPos: TPoint;
  vSqlForms:string;
  //uses uconnect,Db,ZDataset,uSetVarGlobal;
begin
  ButtonPos := Button1.ClientToScreen(Point(0, 0));
  FrmLov    := TFrmLov.Create(Self);
  try
    //Judul LOV
    vSqlForms :='Select * from '+SetVarGlobal.Db1  +'.ms_forms ';

    FrmLov.Caption :='Lov Master Barang';
    FrmLov.SqlLov  := vSqlForms;
    FrmLov.SetJudulLov :='master';
    FrmLov.Left    := ButtonPos.X;
    FrmLov.Top     := ButtonPos.Y + Button3.Height;
    FrmLov.OnSelectValues := @HandleLOVResult;
    FrmLov.ShowModal;
  finally
    FrmLov.Free;
  end;

 end;

 ================procedure pemanggil==================
 procedure HandleLOVResult(const Value: TStringList);

procedure TForm1.HandleLOVResult(const Value: TStringList);
begin
  // Disini Anda dapat menggunakan nilai yang dipilih dari LOV
  ShowMessage('Nilai yang dipilih: ' + Value[0]);
  edit1.Caption:=Value[0];
end;

}

unit ULov;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids,Db, BCMaterialDesignButton,LCLType,uconnect,ZDataset,uSetVarGlobal,libstring  ;

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
    Query: TZQuery;
    procedure DbgLovKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdCariLovExit(Sender: TObject);
    procedure EdCariLovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCariLovKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    FOnSelectValues: TLOVSelectValuesEvent;
    FConnect:Tconnect;
    FSQLQuery: String;
    FJudulLov: String;
  public
     property OnSelectValues: TLOVSelectValuesEvent read FOnSelectValues write FOnSelectValues;
     property SetJudulLov:string  read  FJudulLov write FJudulLov;
     property SqlLov:string read  FSQLQuery write FSQLQuery;
  end;

var
  FrmLov: TFrmLov;

implementation

{$R *.lfm}

{ TFrmLov }

procedure TFrmLov.DbgLovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 addValues : TStringList;
 dbgLoop   : Integer;

begin
  if key=VK_RETURN then
    begin
      PnlAtas.Visible:=True;
      EdCariLov.SetFocus;
    end;
  if key=  VK_ADD then
    begin
      if DbgLov.DataSource.DataSet.RecordCount> 0 then
        begin
          addValues :=TStringList.Create;
          try
            // Mengumpulkan nilai dari semua kolom di DBGrid ke dalam TStringList
            for dbgLoop := 0 to DbgLov.Columns.Count - 1 do
            begin
              if DbgLov.Columns[dbgLoop].Field <> nil then
                addValues.Add(DbgLov.Columns[dbgLoop].Field.AsString)
              else
                addValues.Add('');
            end;

            // Memanggil event OnSelectValues dengan TStringList yang berisi nilai dari semua kolom
            if Assigned(FOnSelectValues) then
              FOnSelectValues(addValues);

          finally
             addValues.Free;
          end;
          Close;
        end;
    end;
  if key= VK_ESCAPE  then
    Close;

  if (Key=VK_F1)  and (ssShift in Shift) then
    ShowMessage('F1 on dev');


end;

procedure TFrmLov.EdCariLovExit(Sender: TObject);
var
 vKey: Word;
begin
  vKey:=VK_RETURN;

end;

procedure TFrmLov.EdCariLovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vSqlLov : string;
  v_cur, v_pos : integer ;
  v_temp : string ;
begin
  v_temp:='';
  if Key=VK_ESCAPE then
    begin
      DbgLov.SetFocus;
      PnlAtas.Visible := False;
    end;
  if Key=VK_UP then
    DbgLov.DataSource.DataSet.Prior
  else if Key=VK_DOWN then
    DbgLov.DataSource.DataSet.Next
  else if key=VK_ADD then
    DbgLovKeyDown(Sender,Key,Shift)
  else if Key=VK_RETURN then
    begin
      if vSqlLov ='' then
         vSqlLov := FSQLQuery;

      v_pos := length(vSqlLov);
      if posisi_str(lowercase(vSqlLov),'order by') > 0 then
        v_pos := posisi_str(lowercase(vSqlLov),'order by') ;

      if posisi_str(lowercase(vSqlLov),'group by') > 0 then
        v_pos := posisi_str(lowercase(vSqlLov),'group by') ;

      if posisi_str(lowercase(vSqlLov),'where') > 0 then
         v_temp := copy(vSqlLov,1,v_pos - 1)+' and '+
         DbgLov.Columns.Items[DbgLov.SelectedIndex].FieldName+' like ''%'+EdCariLov.Text+'%'' '+
                  copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1)
      else
        v_temp := copy(vSqlLov,1,v_pos - 1)+' where '+
                  DbgLov.Columns.Items[DbgLov.SelectedIndex].FieldName+' like ''%'+EdCariLov.Text+'%'' '+
                  copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1) ;

      v_cur:=DbgLov.SelectedIndex;

      FConnect:=TConnect.Create();
      try
        if FConnect.Connect then
        begin
          Query:=FConnect.ExecuteQuery(v_temp);
          if Query<> nil then
          begin
            FConnect.DataSource.DataSet:= Query;
            DbgLov.DataSource:=FConnect.DataSource;
          end
        end
        else
         ShowMessage(FConnect.Logger);
      finally
       FConnect.Free;
      end;

      DbgLov.SelectedIndex:=v_cur;
    end;
end;

procedure TFrmLov.EdCariLovKeyPress(Sender: TObject; var Key: char);
begin
  Key:=UpCase(Key);
end;

procedure TFrmLov.FormShow(Sender: TObject);
begin
  FConnect:=TConnect.Create();
  try
    if FConnect.Connect then
    begin
      Query:=FConnect.ExecuteQuery(FSQLQuery);
      if Query<> nil then
      begin
        FConnect.DataSource.DataSet:= Query;
        DbgLov.DataSource:=FConnect.DataSource;
      end
    end
    else
     ShowMessage(FConnect.Logger);
  finally
   FConnect.Free;
  end;
  DbgLov.SetFocus;
end;

{
procedure TLOVForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  I: Integer;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Text := 'SELECT * FROM your_table WHERE ';

  for I := 0 to dbGrid.Columns.Count - 1 do
  begin
    if I > 0 then
      query.SQL.Add(' OR ');

    query.SQL.Add(dbGrid.Columns[I].FieldName + ' LIKE :search');
    query.Params.ParamByName('search').AsString := SearchText;
  end;

  query.Open;
end;

---ver 2
procedure TLOVForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  I: Integer;
  ColumnNames: TStringList;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Text := 'SELECT * FROM your_table WHERE ';

  ColumnNames := TStringList.Create;
  try
    for I := 0 to dbGrid.Columns.Count - 1 do
      ColumnNames.Add(dbGrid.Columns[I].FieldName);

    for I := 0 to ColumnNames.Count - 1 do
    begin
      if I > 0 then
        query.SQL.Add(' OR ');

      query.SQL.Add(ColumnNames[I] + ' LIKE :search');
      query.Params.ParamByName('search').AsString := SearchText;
    end;

    query.Open;
  finally
    ColumnNames.Free;
  end;
end;

--ver 3
procedure TLOVForm.PerformSearch;
var
  SearchText: string;
  I: Integer;
  Field: TField;
  SQLQuery: string;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM your_table WHERE 1=0'); // Mendapatkan struktur kolom dari tabel

  // Loop melalui semua kolom dalam dataset dan menambahkan klausa LIKE ke dalam query
  for I := 0 to query.Fields.Count - 1 do
  begin
    Field := query.Fields[I];
    if Field.DataType in [ftString, ftMemo, ftWideString, ftFmtMemo] then
    begin
      SQLQuery := SQLQuery + ' OR ' + Field.FieldName + ' LIKE :search';
      query.Params.ParamByName('search').AsString := SearchText;
    end;
  end;

  query.Open;
end;
--ver 4
procedure TSearchForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  SQLQuery: string;
  TableFields: TFieldDefs;
  Field: TFieldDef;
  I: Integer;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM produk WHERE 1 = 0'); // Menampilkan struktur kolom dari tabel

  TableFields := query.Fields.Definitions;
  for I := 0 to TableFields.Count - 1 do
  begin
    Field := TableFields.Items[I];
    if (Field.DataType in [ftString, ftMemo, ftWideString, ftFmtMemo]) then
    begin
      if SQLQuery <> '' then
        SQLQuery := SQLQuery + ' OR ';
      SQLQuery := SQLQuery + Field.Name + ' LIKE :search';
      query.Params.ParamByName('search').AsString := SearchText;
    end;
  end;

  if SQLQuery <> '' then
  begin
    query.SQL.Add('AND (' + SQLQuery + ')');
    query.Open;
  end;
end;

}

end.

