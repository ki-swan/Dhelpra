unit Dhelpra.Model;

interface

uses
  Dhelpra.Interfaces;

type

TDhelpraModel = class(TInterfacedObject, iDhelpraModel)
private
  FQuery : iDhelpraQuery;
  FDatabase : String;
public
  constructor Create(aDatabase : String; aConnection : iDhelpraConnection); reintroduce;
  destructor Destroy; override;
  class function New(aDatabase : String; aConnection : iDhelpraConnection) : iDhelpraModel;

  function get : iDhelpraEntity;
  function post(aEntity : iDhelpraEntity) : iDhelpraEntity;
  function put(aEntity : iDhelpraEntity) : iDhelpraEntity;
  function delete(aEntity : iDhelpraEntity) : iDhelpraModel;
end;

implementation

uses
  Dhelpra.Query;

{ TDhelpraModel }

constructor TDhelpraModel.Create(aDatabase : String; aConnection : iDhelpraConnection);
begin
  FQuery := TDhelpraQuery.New(aConnection);
  FDatabase := aDatabase;
end;

destructor TDhelpraModel.Destroy;
begin

  inherited;
end;

class function TDhelpraModel.New(aDatabase : String; aConnection : iDhelpraConnection): iDhelpraModel;
begin
  Result := TDhelpraModel.Create(aDatabase, aConnection);
end;




function TDhelpraModel.delete(aEntity: iDhelpraEntity): iDhelpraModel;
begin

end;

function TDhelpraModel.get: iDhelpraEntity;
begin

end;

function TDhelpraModel.post(aEntity: iDhelpraEntity): iDhelpraEntity;
begin

end;

function TDhelpraModel.put(aEntity: iDhelpraEntity): iDhelpraEntity;
begin

end;

end.
