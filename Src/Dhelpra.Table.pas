unit Dhelpra.Table;

interface

uses
  System.JSON, Dhelpra.Interfaces, System.Generics.Collections;

type

TDhelpraTable = class(TInterfacedObject, iDhelpraTable)
private
  FTable : TList<iDhelpraEntity>;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraTable;

  function add(aValue : iDhelpraEntity) : iDhelpraTable;
  function table : TList<iDhelpraEntity>;
  function items(aValue : Integer) : iDhelpraEntity;
  function count : Integer;

  function ToJSON : TJSONArray;
  function FromJSON(aValue : TJSONArray) : iDhelpraTable;
end;

implementation

uses
  System.SysUtils, Dhelpra.Entity;

{ TDhelpraTable }

constructor TDhelpraTable.Create;
begin
  FTable := TList<iDhelpraEntity>.Create;
end;

destructor TDhelpraTable.Destroy;
begin
  if Assigned(FTable) then
    FreeAndNil(FTable);
  inherited;
end;

class function TDhelpraTable.New: iDhelpraTable;
begin
  Result := TDhelpraTable.Create;
end;

function TDhelpraTable.add(aValue: iDhelpraEntity): iDhelpraTable;
begin
  Result := Self;
  FTable.Add(aValue);
end;

function TDhelpraTable.count: Integer;
begin
  Result := FTable.Count;
end;

function TDhelpraTable.items(aValue: Integer): iDhelpraEntity;
begin
  Result := FTable.Items[aValue];
end;

function TDhelpraTable.table: TList<iDhelpraEntity>;
begin
  Result := FTable;
end;

function TDhelpraTable.FromJSON(aValue: TJSONArray): iDhelpraTable;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(aValue.Count) do
    FTable.Add(TDhelpraEntity.New.fromJSON(aValue.Items[i] as TJSONObject));
end;

function TDhelpraTable.ToJSON: TJSONArray;
var
  I: Integer;
begin
  Result := TJSONArray.Create;
  for I := 0 to Pred(FTable.Count) do
    Result.Add(FTable.Items[I].toJSON);
end;

end.
