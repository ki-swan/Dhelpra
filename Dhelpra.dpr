program Dhelpra;

uses
  Vcl.Forms,
  Dhelpra.Main.View in 'Dhelpra.Main.View.pas' {Form1},
  Connection in 'Connection.pas' {DataModule1: TDataModule},
  Dhelpra.Query in 'lib\Dhelpra.Query.pas',
  Dhelpra.Connection in 'lib\Dhelpra.Connection.pas',
  Dhelpra.Interfaces in 'lib\Dhelpra.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
