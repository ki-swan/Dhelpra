unit Dhelpra.Rest.Interfaces;

interface

uses
  Dhelpra.Interfaces;

type

iDhelpraParamsRest = interface(iDhelpraParams)
['{7C00DBEF-D34F-4395-974B-FA56A50209F8}']
  function Resorce(aValue : String) : iDhelpraParamsRest; overload;
  function Resorce : String; overload;
  function Timeout(aValue : Integer) : iDhelpraParamsRest; overload;
  function Timeout : Integer; overload;
  function Token(aValue : String) : iDhelpraParamsRest; overload;
  function Token : String; overload;
end;

implementation

end.
