program CleanMemory;

uses
  Vcl.Forms,
  UClean in 'UClean.pas' {frmCleaner},
  UConfig in 'UConfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCleaner, frmCleaner);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.Run;
end.
