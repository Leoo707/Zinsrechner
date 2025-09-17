program ZinsrechnerProjekt;

uses
  Vcl.Forms,
  ZinsrechnerFunctions in 'ZinsrechnerFunctions.pas' {Form1},
  AboutWindow in 'AboutWindow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
