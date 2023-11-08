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

uses
  Dhelpra.Connection, System.JSON, Connection, Dhelpra.Query,
  Dhelpra.Interfaces;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var
  lQuery : iDhelpraQuery;
  lConnection : iDhelpraConnection;
  lJSON : TJSONObject;
  lQueryJSON : TJSONArray;
  lText : TStringList;
begin
  lText := TStringList.Create;
  try
    if FileExists(ExtractFileDir(GetCurrentDir())+'/config.json') then
    begin
      lText.LoadFromFile(ExtractFileDir(GetCurrentDir())+'/config.json');
      lJSON := TJSONObject.ParseJSONValue(lText.Text) as TJSONObject;
      lConnection := TDhelpraConnection.New.FromJSON(lJSON);
      if Assigned(lJSON) then
        FreeAndNil(lJSON);
    end
    else
    begin
      lConnection := TDhelpraConnection.New
                                       .DriverID('FB')
                                       .Server('D:\Embarcadero\Projects\Testes\SiteLoginExemplo\SiteLoginExemplo.fdb')
                                       .Username('SYSDBA')
                                       .Password('masterkey');
    end;
    lJSON := lConnection.ToJSON;
    lText.Text := lJSON.ToString;
    lText.SaveToFile(ExtractFileDir(GetCurrentDir())+'/config.json');
    lQuery := TDhelpraQuery.New(lConnection);
    lQuery.Open('select * from usuario');
//
//    lQuery.SQL('select * from usuario where id = :id')
//          .Param('id', 1)
//          .Open;

    lQueryJSON := lQuery.QueryToJSON;
    Memo1.Text := lQueryJSON.ToString;

  finally
    if Assigned(lQueryJSON) then
      FreeAndNil(lQueryJSON);
    if Assigned(lJSON) then
      FreeAndNil(lJSON);
    if Assigned(lText) then
      FreeAndNil(lText);
  end;
end;

end.