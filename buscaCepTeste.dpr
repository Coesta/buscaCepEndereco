program buscaCepTeste;

uses
  Vcl.Forms,
  buscacep in 'buscacep.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
