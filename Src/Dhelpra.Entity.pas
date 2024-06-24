unit Dhelpra.Entity;

interface

uses
  System.JSON,
  Dhelpra.Interfaces,
  System.Generics.Collections;

type

TDhelpraEntity = class(TInterfacedObject, iDhelpraEntity)
private
  FPrimary : iDhelpraField;
  FLista : TList<iDhelpraField>;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraEntity;

  function add(aField : iDhelpraField) : iDhelpraEntity;

  function FieldByName(aName : string) : iDhelpraField;
  function FieldByDisplayName(aName : string) : iDhelpraField;
  function FieldByJsonName(aName : string) : iDhelpraField;
  function FieldExists(aName : string) : boolean;
  function FieldByIndex(aIndex : integer) : iDhelpraField;
  function Fields : TList<iDhelpraField>;
  function count : integer;

  function isEmpty : boolean;
  function toJSON : TJSONObject;
  function fromJSON(aValue : TJSONObject) : iDhelpraEntity;

  function NewEntity : iDhelpraEntity;
end;

implementation

{ TDhelpraEntity }

constructor TDhelpraEntity.Create;
begin
  FLista := TList<iDhelpraField>.Create;
end;

destructor TDhelpraEntity.Destroy;
begin

  inherited;
end;

class function TDhelpraEntity.New: iDhelpraEntity;
begin
  Result := TDhelpraEntity.Create;
end;

function TDhelpraEntity.add(aField: iDhelpraField): iDhelpraEntity;
begin

end;

function TDhelpraEntity.count: integer;
begin

end;

function TDhelpraEntity.FieldByDisplayName(aName: string): iDhelpraField;
begin

end;

function TDhelpraEntity.FieldByIndex(aIndex: integer): iDhelpraField;
begin

end;

function TDhelpraEntity.FieldByJsonName(aName: string): iDhelpraField;
begin

end;

function TDhelpraEntity.FieldByName(aName: string): iDhelpraField;
begin

end;

function TDhelpraEntity.FieldExists(aName: string): boolean;
begin

end;

function TDhelpraEntity.Fields: TList<iDhelpraField>;
begin

end;

function TDhelpraEntity.fromJSON(aValue: TJSONObject): iDhelpraEntity;
begin

end;

function TDhelpraEntity.isEmpty: boolean;
begin

end;

function TDhelpraEntity.NewEntity: iDhelpraEntity;
begin

end;

function TDhelpraEntity.toJSON: TJSONObject;
begin

end;

end.
