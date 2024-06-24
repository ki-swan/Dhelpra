unit Dhelpra.Interfaces;

interface

uses
  System.JSON, FireDAC.Comp.Client,
  System.Generics.Collections, Data.DB;

type

iDhelpraField = interface;
iDhelpraEntity = interface;
iDhelpraTable = interface;

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
  function SaveToFile(aFileName : String) : iDhelpraConnection;
  function LoadFromFile(aFileName : String) : iDhelpraConnection;
  function FileExist(aFileName : String) : Boolean;
end;

iDhelpraQuery = interface
['{F920D9BC-CB3D-438F-8817-6BB260CDFC56}']
  function AssignConnection(aConnection: TFDConnection) : iDhelpraQuery; overload;
  function AssignConnection(aConnection: iDhelpraConnection) : iDhelpraQuery; overload;
  function Connection : TFDCustomConnection;

  function ExecSQL(aSQL : string) : Integer; overload;
  procedure ExecSQL; overload;
  function Open(aSQL : String) : iDhelpraQuery; overload;
  function Open : iDhelpraQuery; overload;
  function Query : TFDQuery;
  function SQL(aSQL : String) : iDhelpraQuery; overload;
  function SQL : String; overload;
  function Param(aParamName : String; aParamValue : Variant) : iDhelpraQuery;

  function QueryToJSON : TJSONArray;
  function QueryToEntity : iDhelpraTable;
end;

iDhelpraModel = interface
['{184E52B4-ACE3-44F7-9C67-36835AF886FE}']
  function get : iDhelpraEntity;
  function post(aEntity : iDhelpraEntity) : iDhelpraEntity;
  function put(aEntity : iDhelpraEntity) : iDhelpraEntity;
  function delete(aEntity : iDhelpraEntity) : iDhelpraModel;
end;

iDhelpraEntity = interface
['{5FEB32E9-282E-4954-9A95-CEC922496B0B}']
  function name : string; overload;
  function name(aValue : string) : iDhelpraEntity; overload;
  function add(aField : iDhelpraField) : iDhelpraEntity;

  function FieldByName(aName : string) : iDhelpraField;
  function FieldExists(aName : string) : boolean;
  function FieldByIndex(aIndex : integer) : iDhelpraField;
  function Fields : TList<iDhelpraField>;
  function count : integer;

  function isEmpty : boolean;
  function clear : iDhelpraEntity;
  function toJSON : TJSONObject;
  function fromJSON(aValue : TJSONObject) : iDhelpraEntity;
  function fromClone(aClone : iDhelpraEntity) : iDhelpraEntity;
end;

iDhelpraField = interface
['{5AC400BE-670E-4039-9539-C34C3856269C}']
  function name : String; overload;
  function name(aValue : String) : iDhelpraField; overload;
  function value : Variant; overload;
  function value(aValue : Variant) : iDhelpraField; overload;

  function data_type : TFieldType; overload;
  function data_type(AValue : TFieldType) : iDhelpraField; overload;

//  function foreingkey_table : string; overload;
//  function foreingkey_table(aValue : string) : iDhelpraField; overload;
//  function foreingkey_field : string; overload;
//  function foreingkey_field(aValue : string) : iDhelpraField; overload;

  function toJSON : TJSONPair;
  function fromJSON(aJSONObject : TJSONPair) : iDhelpraField;

  procedure clear;
end;

iDhelpraTable = interface
['{C40C0B97-030B-4B7D-B3C5-3C82A16F0210}']
  function add(aValue : iDhelpraEntity) : iDhelpraTable;
  function table : TList<iDhelpraEntity>;
  function items(aValue : Integer) : iDhelpraEntity;
  function count : Integer;

  function ToJSON : TJSONArray;
  function FromJSON(aValue : TJSONArray) : iDhelpraTable;
end;

implementation

end.
