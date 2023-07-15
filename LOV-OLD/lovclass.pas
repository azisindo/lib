unit LOVClass;

interface

uses
  Classes, SysUtils, DB, DBGrids, Controls, Dialogs, StdCtrls,forms,ExtCtrls,ZDataset;

type
  TLOVClass = class
  private
    FDataSource: TDataSource;
    FDBGrid: TDBGrid;
    FSelectedValue: Variant;
    FSearchButton: TButton;
    FSearchEdit: TEdit;
    function GetSelectedValue: Variant;
    procedure DBGridDblClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; ADataSet: TDataSet);
    function Execute: Boolean;
    property SelectedValue: Variant read GetSelectedValue;
  end;

implementation

constructor TLOVClass.Create(AOwner: TComponent; ADataSet: TDataSet);
var
  Panel: TPanel;
begin
  FDataSource := TDataSource.Create(AOwner);
  FDataSource.DataSet := ADataSet;

  FDBGrid := TDBGrid.Create(AOwner);
  FDBGrid.Align:=alClient;
  FDBGrid.DataSource := FDataSource;
  FDBGrid.OnDblClick := @DBGridDblClick;

  Panel := TPanel.Create(AOwner);
  Panel.Align := alTop;
  Panel.Height := 30;

  FSearchButton := TButton.Create(Panel);
  FSearchButton.Parent := Panel;
  FSearchButton.Caption := 'Search';
  FSearchButton.Width := 75;
  FSearchButton.Left := Panel.Width - FSearchButton.Width - 10;
  FSearchButton.OnClick := @SearchButtonClick;

  FSearchEdit := TEdit.Create(Panel);
  FSearchEdit.Parent := Panel;
  FSearchEdit.Width := Panel.Width - FSearchButton.Width - 20;

  Panel.Parent := TForm(AOwner);

  FDBGrid.Parent := TForm(AOwner);
end;

function TLOVClass.GetSelectedValue: Variant;
var
  Field: TField;
begin
  Result := Null;
  if FDBGrid.SelectedField <> nil then
  begin
    Field := FDBGrid.SelectedField;
    Result := Field.Value;
  end;
end;

function TLOVClass.Execute: Boolean;
var
  Form: TForm;
begin
  Result := False;

  Form := TForm.Create(nil);
  try
    Form.Width := 400;
    Form.Height := 300;
    Form.Caption := 'List of Values';

    FDBGrid.Parent := Form;

    if Form.ShowModal = mrOk then
    begin
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;

procedure TLOVClass.DBGridDblClick(Sender: TObject);
begin
  TForm(TDBGrid(Sender).Parent).ModalResult := mrOk;
end;

procedure TLOVClass.SearchButtonClick(Sender: TObject);
begin
  FDataSource.DataSet.Locate('SearchField', FSearchEdit.Text, [loPartialKey]);
end;

end.
