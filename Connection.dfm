object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object lConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\Embarcadero\Projects\Testes\SiteLoginExemplo\SiteLog' +
        'inExemplo.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 304
    Top = 224
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Vulpes'
      'User_Name=postgres'
      'Password=master'
      'DriverID=PG')
    LoginPrompt = False
    Left = 416
    Top = 272
  end
end
