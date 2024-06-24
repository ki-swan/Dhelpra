program Dhelpra;

uses
  Vcl.Forms,
  Dhelpra.Main.View in 'Dhelpra.Main.View.pas' {Form1},
  Dhelpra.Interfaces in 'Src\Dhelpra.Interfaces.pas',
  Dhelpra.Rest.Interfaces in 'Src\Dhelpra.Rest.Interfaces.pas',
  Dhelpra.Params.Rest in 'Src\Dhelpra.Params.Rest.pas',
  Dhelpra.Params in 'Src\Dhelpra.Params.pas',
  Dhelpra.Field in 'Src\Dhelpra.Field.pas',
  Dhelpra.Entity in 'Src\Dhelpra.Entity.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
