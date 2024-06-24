unit Dhelpra.Params;

interface

uses
  Dhelpra.Interfaces;

type

TDhelpraParams = class abstract(TInterfacedObject, iDhelpraParams)
protected
  FHost : String;
public
  function Host(aValue : String) : iDhelpraParams; overload;
  function Host : String; overload;
end;

implementation

uses
  System.SysUtils;

{ TDhelpraParams }

function TDhelpraParams.Host: String;
begin
  Result := FHost;
end;

function TDhelpraParams.Host(aValue: String): iDhelpraParams;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Host n�o informado');
  FHost := aValue;
end;

end.
