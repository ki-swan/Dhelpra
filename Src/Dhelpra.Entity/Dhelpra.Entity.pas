unit Dhelpra.Entity;

interface

uses
  Dhelpra.Entity.Interfaces, System.JSON, System.Generics.Collections;

type

TDhelpraEntity = class(TInterfacedObject, iDhelpraEntity)
private
  FFields : TList<iDhelpraField>;
  FName : string;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraEntity;

  function name : string; overload;
  function name(aValue : string) : iDhelpraEntity; overload;
  function add(aField : iDhelpraField) : iDhelpraEntity;

  function FieldByDisplayName(aName : string) : iDhelpraField;
  function FieldByName(aName : string) : iDhelpraField;
  function FieldExists(aName : string) : boolean;
  function FieldByIndex(aIndex : integer) : iDhelpraField;
  function FieldByJSONName(aName : string) : iDhelpraField;
  function Fields : TList<iDhelpraField>;
  function count : integer;

  function isEmpty : boolean;
  function toJSON : TJSONObject;
  function fromJSON(aValue : TJSONObject) : iDhelpraEntity; overload;
  function fromJSON(aValue : string) : iDhelpraEntity; overload;
  function fromClone(aClone : iDhelpraEntity) : iDhelpraEntity;
end;

implementation

uses
  System.SysUtils;

{ TDhelpraEntity }

constructor TDhelpraEntity.Create;
begin

  FFields := TList<iDhelpraField>.Create;
  FName := '';
end;

destructor TDhelpraEntity.Destroy;
begin
  if Assigned(FFields) then
    FreeAndNil(FFields);
  inherited;
end;

class function TDhelpraEntity.New: iDhelpraEntity;
begin
  Result := TDhelpraEntity.Create;
end;

function TDhelpraEntity.name(aValue: string): iDhelpraEntity;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('name foi preenchido em branco');
  FName := aValue;
end;

function TDhelpraEntity.name: string;
begin
  Result := FName;
end;

function TDhelpraEntity.add(aField: iDhelpraField): iDhelpraEntity;
begin
  Result := Self;
  FFields.Add(aField);
end;

function TDhelpraEntity.count: integer;
begin
  Result := FFields.Count;
end;

function TDhelpraEntity.Fields: TList<iDhelpraField>;
begin
  Result := FFields;
end;






















function TDhelpraEntity.FieldByDisplayName(aName: string): iDhelpraField;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.FieldByIndex(aIndex: integer): iDhelpraField;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.FieldByJSONName(aName: string): iDhelpraField;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.FieldByName(aName: string): iDhelpraField;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.FieldExists(aName: string): boolean;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.fromClone(aClone: iDhelpraEntity): iDhelpraEntity;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.fromJSON(aValue: string): iDhelpraEntity;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.fromJSON(aValue: TJSONObject): iDhelpraEntity;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.isEmpty: boolean;
begin
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraEntity.toJSON: TJSONObject;
var
  I: Integer;
begin
  Result := TJSONObject.Create;
  for I := 0 to Pred(FFields.Count) do
    Result.AddPair(FFields.Items[i].toJSON);
end;

end.