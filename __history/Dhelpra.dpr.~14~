program Dhelpra;

uses
  Vcl.Forms,
  Dhelpra.Main.View in 'Dhelpra.Main.View.pas' {Form1},
  Connection in 'Connection.pas' {DataModule1: TDataModule},
  Dhelpra.Connection in 'Src\Dhelpra.Connection.pas',
  Dhelpra.Interfaces in 'Src\Dhelpra.Interfaces.pas',
  Dhelpra.Query in 'Src\Dhelpra.Query.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
