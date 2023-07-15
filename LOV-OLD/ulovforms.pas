unit uLovForms;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  RxDBGrid,ZDataset ,DB ;

type

  { Tfrmlov }

  Tfrmlov = class(TForm)
    btnsearch: TButton;
    EdCari: TEdit;
    pemisah: TPanel;
    pnlatas: TPanel;
    pnlBawah: TPanel;
    pnltengah: TPanel;
    RxDbGrid: TRxDBGrid;
    procedure LoadDataToDBGrid(DataSet: TDataSource);
  private

  public
      SelectedValue: string;
  end;

var
  frmlov: Tfrmlov;

implementation

{$R *.lfm}

{ Tfrmlov }

procedure Tfrmlov.LoadDataToDBGrid(DataSet: TDataSource);
begin
 RxDbGrid.DataSource:= DataSet;
end;

end.

