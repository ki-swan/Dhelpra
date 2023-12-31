unit Dhelpra.Field;

interface

uses
  Dhelpra.Interfaces, Data.DB, System.JSON;

type

TDhelpraField = class(TInterfacedObject, iDhelpraField)
private
  FName : String;
  FValue : Variant;
  FData_type : TFieldType;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraField;

  function name : String; overload;
  function name(aValue : String) : iDhelpraField; overload;
  function value : Variant; overload;
  function value(aValue : Variant) : iDhelpraField; overload;

  function data_type : TFieldType; overload;
  function data_type(AValue : TFieldType) : iDhelpraField; overload;

  procedure clear;

  function toJSON : TJSONPair;
  function fromJSON(aJSONObject : TJSONPair) : iDhelpraField;
end;

implementation

uses
  System.SysUtils, System.Variants;

{ TDhelpraField }

constructor TDhelpraField.Create;
begin
  clear;
end;

destructor TDhelpraField.Destroy;
begin

  inherited;
end;

class function TDhelpraField.New: iDhelpraField;
begin
  Result := TDhelpraField.Create;
end;

function TDhelpraField.name(aValue: String): iDhelpraField;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('name n�o foi preenchido em branco');
  FName := aValue;
end;

function TDhelpraField.name: String;
begin
  Result := FName;
end;

function TDhelpraField.data_type: TFieldType;
begin
  Result := FData_type;
end;

function TDhelpraField.data_type(AValue: TFieldType): iDhelpraField;
begin
  Result := Self;
  FData_type := AValue;
end;

function TDhelpraField.value: Variant;
begin
  Result := FValue;
end;

function TDhelpraField.value(aValue: Variant): iDhelpraField;
begin
  Result := Self;
  FValue := aValue;
end;

procedure TDhelpraField.clear;
begin
  FName := '';
  FValue := '';
  FData_type := TFieldType.ftUnknown;
end;

function TDhelpraField.fromJSON(aJSONObject: TJSONPair): iDhelpraField;
begin
  Result := Self;
//  FName := aJSONObject.JsonString.Value;
  { TODO 1 -oYuki : Implementar }
  raise Exception.Create('N�o implementado ainda');
end;

function TDhelpraField.toJSON: TJSONPair;
begin
  case FData_type of
    ftString: Result := TJSONPair.Create(FName, VarToStr(FValue));
    ftSmallint: raise Exception.Create('N�o implementado ainda');
    ftInteger: Result := TJSONPair.Create(FName, Integer(FValue));
    ftWord: raise Exception.Create('N�o implementado ainda');
    ftBoolean: Result := TJSONPair.Create(FName, Boolean(FValue));
    ftFloat: raise Exception.Create('N�o implementado ainda');
    ftCurrency: raise Exception.Create('N�o implementado ainda');
    ftDate: raise Exception.Create('N�o implementado ainda');
    ftTime: raise Exception.Create('N�o implementado ainda');
    ftDateTime: raise Exception.Create('N�o implementado ainda');
    ftBlob: raise Exception.Create('N�o implementado ainda');
    ftWideString: raise Exception.Create('N�o implementado ainda');
    ftLargeint: raise Exception.Create('N�o implementado ainda');
    ftTimeStamp: raise Exception.Create('N�o implementado ainda');
    ftLongWord: raise Exception.Create('N�o implementado ainda');
    ftShortint: raise Exception.Create('N�o implementado ainda');
    ftSingle: Result := TJSONPair.Create(FName, Single(FValue));
    else
      raise Exception.Create('Tipo desconhecido');
  end;

end;

end.
