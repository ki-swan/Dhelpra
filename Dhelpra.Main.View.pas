unit Dhelpra.Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
//var
//  lConnection : iDhelpraConnection;
//  lQuery : iDhelpraQuery;
//  lJSON : TJSONObject;
//  lQueryJSON : TJSONArray;
//  lText : TStringList;
begin
//  lText := TStringList.Create;
//  lConnection := TDhelpraConnection.New;
  try
//    if lConnection.FileExist('config') then
//      lConnection.LoadFromFile('config')
//    else
//      lConnection.DriverID('PG')
//                 .Server('Vulpes')
//                 .Username('postgres')
//                 .Password('master')
//                 .SaveToFile('config');

//    lQuery := TDhelpraQuery.New(lConnection);
//    lQuery.Open('select * from usuarios');

//    lQuery.SQL('select * from usuarios where id = :id')
//          .Param('id', 1)
//          .Open;

//    lQueryJSON := lQuery.QueryToEntity.ToJSON;
//    Memo1.Text := lQueryJSON.ToString;
  finally
//    if Assigned(lQueryJSON) then
//      FreeAndNil(lQueryJSON);
//    if Assigned(lJSON) then
//      FreeAndNil(lJSON);
//    if Assigned(lText) then
//      FreeAndNil(lText);
  end;
end;

end.
