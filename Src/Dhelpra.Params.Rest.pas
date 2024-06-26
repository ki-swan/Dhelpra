unit Dhelpra.Params.Rest;

interface

uses
  Dhelpra.Rest.Interfaces, Dhelpra.Params;

type

TDhelpraParamsRest = class(TDhelpraParams, iDhelpraParamsRest)
protected
  FResorce : String;
  FTimeout : Integer;
  FToken : String;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iDhelpraParamsRest;

  function Resorce(aValue : String) : iDhelpraParamsRest; overload;
  function Resorce : String; overload;
  function Timeout(aValue : Integer) : iDhelpraParamsRest; overload;
  function Timeout : Integer; overload;
  function Token(aValue : String) : iDhelpraParamsRest; overload;
  function Token : String; overload;
end;

implementation

uses
  System.SysUtils;

{ TDhelpraParamsRest }

constructor TDhelpraParamsRest.Create;
begin

end;

destructor TDhelpraParamsRest.Destroy;
begin

  inherited;
end;

class function TDhelpraParamsRest.New: iDhelpraParamsRest;
begin
  Result := TDhelpraParamsRest.Create;
end;

function TDhelpraParamsRest.Resorce: String;
begin
  Result := FResorce;
end;

function TDhelpraParamsRest.Resorce(aValue: String): iDhelpraParamsRest;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Resorce n�o informado');
  FResorce := aValue;
end;

function TDhelpraParamsRest.Timeout(aValue: Integer): iDhelpraParamsRest;
begin
  Result := Self;
  FTimeout := aValue;
end;

function TDhelpraParamsRest.Timeout: Integer;
begin
  Result := FTimeout;
end;

function TDhelpraParamsRest.Token(aValue: String): iDhelpraParamsRest;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Token n�o informado');
  FToken := aValue;
end;

function TDhelpraParamsRest.Token: String;
begin
  Result := FToken;
end;

end.
