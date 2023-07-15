unit ULov;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids, BCMaterialDesignButton;

type

  { TFrmLov }

  TFrmLov = class(TForm)
    BtnSearch: TBCMaterialDesignButton;
    DbgLov: TDBGrid;
    EdCariLov: TEdit;
    PnlBtnLov: TPanel;
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    PnlEdLov: TPanel;
    PnlTengah: TPanel;
  private

  public

  end;

var
  FrmLov: TFrmLov;

implementation

{$R *.lfm}

end.

