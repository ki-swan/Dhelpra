program Dhelpra;

uses
  Vcl.Forms,
  Dhelpra.Main.View in 'Dhelpra.Main.View.pas' {Form1},
  Dhelpra.Connection in 'Src\Dhelpra.Connection.pas',
  Dhelpra.Entity in 'Src\Dhelpra.Entity.pas',
  Dhelpra.Field in 'Src\Dhelpra.Field.pas',
  Dhelpra.Interfaces in 'Src\Dhelpra.Interfaces.pas',
  Dhelpra.Model in 'Src\Dhelpra.Model.pas',
  Dhelpra.Query in 'Src\Dhelpra.Query.pas',
  Dhelpra.Table in 'Src\Dhelpra.Table.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
