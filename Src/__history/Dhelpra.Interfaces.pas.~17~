unit Dhelpra.Interfaces;

interface

uses
  System.JSON, FireDAC.Comp.Client;

type

iDhelpraConnection = interface
['{56158758-A267-4787-8A8A-C6A1CE456EE1}']
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

iDhelpraQuery = interface
['{F920D9BC-CB3D-438F-8817-6BB260CDFC56}']
  function AssignConnection(aConnection: TFDConnection) : iDhelpraQuery; overload;
  function AssignConnection(aConnection: iDhelpraConnection) : iDhelpraQuery; overload;

  function ExecSQL(aSQL : string) : Integer; overload;
  procedure ExecSQL; overload;
  function Open(aSQL : String) : iDhelpraQuery; overload;
  function Open : iDhelpraQuery; overload;
  function Query : TFDQuery;
  function SQL(aSQL : String) : iDhelpraQuery;
  function Param(aParamName : String; aParamValue : Variant) : iDhelpraQuery;

  function QueryToJSON : TJSONArray;
end;

implementation

end.
