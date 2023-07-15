unit ulov_old-Old;

{$mode ObjFPC}{$H+}

interface

uses
  Forms,Dialogs,Controls,Grids,DBgrids,StdCtrls,ExtCtrls,Classes,SysUtils,uConnect,ZDataset, DB;

type

  { TLOV }

  TLOV= class
  private
    FForm:Tform;
    FDBGrid:TDBGrid;
    FSearchButton: TButton;
    FSearchEdit:TEdit;
    FDataSource:TDataSource;
    FQuery:TZQuery;
    FConnection : TConnect;
    procedure InitializeForm;
    procedure SearchButtonClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent;AConnection:TConnect);
    procedure Show;

  end;

implementation

{ TLOV }

procedure TLOV.InitializeForm;
begin
  // Menentukan pengaturan form LOV, seperti ukuran, judul, dan sebagainya
  FForm.Width  := 400;
  FForm.Height := 600;
  FForm.Left   := 3; //X
  FForm.Top    := 1; //y
  FForm.Caption := 'List of Values (LOV)';
end;

procedure TLOV.SearchButtonClick(Sender: TObject);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'SELECT * FROM your_table WHERE your_field LIKE :search';
  FQuery.Params.ParamByName('search').AsString := '%' + FSearchEdit.Text + '%';
  FQuery.Open;
end;

procedure TLOV.GridDblClick(Sender: TObject);
begin
    if not FQuery.IsEmpty then
    ShowMessage('Selected Value: ' + FQuery.FieldByName('your_field').AsString);
end;

constructor TLOV.Create(AOwner: TComponent; AConnection: TConnect);
begin
  FForm := TForm.Create(AOwner);
  FConnection := AConnection;

  {FDBGrid := TDBGrid.Create(FForm);
  FDBGrid.Parent := FForm;
  FDBGrid.Align := alBottom;
  FDBGrid.Options := FDBGrid.Options - [dgEditing];
  //FDBGrid.OnDblClick := GridDblClick;
   }

  FSearchButton := TButton.Create(FForm);
  FSearchButton.Parent := FForm;
  FSearchButton.Caption := 'Search';
  FSearchButton.Top := 10;
  FSearchButton.Left := 10;
  //FSearchButton.OnClick := SearchButtonClick;

  FSearchEdit := TEdit.Create(FForm);
  FSearchEdit.Parent := FForm;
  //FSearchEdit.Align:=alBottom;
  FSearchEdit.Top := 10;
  FSearchEdit.Left := FSearchButton.Left + FSearchButton.Width + 10;


  FDataSource := TDataSource.Create(FForm);
  //FDBGrid.DataSource := FDataSource;

  FQuery := TZQuery.Create(FForm);
 // FQuery.Connection := FConnection;
end;

procedure TLOV.Show;
begin
  InitializeForm;
 FForm.ShowModal;
end;

end.

