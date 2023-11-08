unit Dhelpra.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  JSON, Dhelpra.Interfaces;

type

TDhelpraConnection = class(TInterfacedObject, iDhelpraConnection)
private
  FConnection: TFDConnection;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraConnection;

  function Server(aValue : String) : iDhelpraConnection; overload;
  function Server : String; overload;
  function DriverID(aValue : String) : iDhelpraConnection; overload;
  function DriverID : String; overload;
  function Username(aValue : String) : iDhelpraConnection; overload;
  function Username : String; overload;
  function Password(aValue : String) : iDhelpraConnection; overload;
  function Password : String; overload;

  function Connect : iDhelpraConnection;
  function Disconnect : iDhelpraConnection;
  function IsConnected : Boolean;

  function Connection : TFDConnection;
  function FromJSON(aValue : TJSONObject) : iDhelpraConnection;
  function ToJSON : TJSONObject;
end;

implementation

{ TDhelpraConnection }

constructor TDhelpraConnection.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.LoginPrompt := False;
end;

destructor TDhelpraConnection.Destroy;
begin
  FConnection.Free;
  inherited;
end;

class function TDhelpraConnection.New: iDhelpraConnection;
begin
  Result := TDhelpraConnection.Create;
end;

function TDhelpraConnection.Username(aValue: String): iDhelpraConnection;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Parametro Username em branco');
  FConnection.Params.UserName := aValue;
end;

function TDhelpraConnection.Username: String;
begin
  Result := FConnection.Params.UserName;
end;

function TDhelpraConnection.Password(aValue: String): iDhelpraConnection;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Parametro Password em branco');
  FConnection.Params.Password := aValue;
end;

function TDhelpraConnection.Password: String;
begin
  Result := FConnection.Params.Password;
end;

function TDhelpraConnection.Server(aValue: String): iDhelpraConnection;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Parametro Server em branco');
  FConnection.Params.Database := aValue;
end;

function TDhelpraConnection.Server: String;
begin
  Result := FConnection.Params.Database;
end;

function TDhelpraConnection.DriverID(aValue: String): iDhelpraConnection;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Parametro DriverID em branco');
  FConnection.Params.DriverID := aValue;
end;

function TDhelpraConnection.DriverID: String;
begin
  Result := FConnection.Params.DriverID;
end;

function TDhelpraConnection.IsConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

function TDhelpraConnection.Connect: iDhelpraConnection;
begin
  Result := Self;
  if not IsConnected then
    FConnection.Connected := True;
end;

function TDhelpraConnection.Disconnect: iDhelpraConnection;
begin
  Result := Self;
  if IsConnected then
    FConnection.Connected := False;
end;

function TDhelpraConnection.Connection: TFDConnection;
begin
  Result := FConnection;
end;

function TDhelpraConnection.FromJSON(aValue: TJSONObject): iDhelpraConnection;
var
  lServer, lUsername, lPassword, lDriverID : String;
begin
  Result := Self;
  aValue.TryGetValue<String>('server', lServer);
    Server(lServer);
  aValue.TryGetValue<String>('username', lUsername);
    Username(lUsername);
  aValue.TryGetValue<String>('password', lPassword);
    Password(lPassword);
  aValue.TryGetValue<String>('driverid', lDriverID);
    DriverID(lDriverID);
end;

function TDhelpraConnection.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('server', Server)
        .AddPair('username', Username)
        .AddPair('password', Password)
        .AddPair('driverid', DriverID);
end;

end.
