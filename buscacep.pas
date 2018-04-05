unit buscacep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXJSON,
  DBXJSONReflect, idHTTP, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ed_cep: TEdit;
    bt_consultar: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ed_logradouro: TEdit;
    ed_complemento: TEdit;
    ed_bairro: TEdit;
    ed_localidade: TEdit;
    ed_uf: TEdit;
    ed_unidade: TEdit;
    ed_ibge: TEdit;
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    bt_limparCampos: TButton;
    bt_close: TButton;
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure bt_limparCamposClick(Sender: TObject);
  private
    { Private declarations }
    function getCEP(CEP:string): TJSONObject;
    procedure CarregaCep(JSON: TJSONObject);
    procedure LimparCampos;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.bt_closeClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.bt_consultarClick(Sender: TObject);
var
   jsonObject: TJSONObject;
begin
   if length(ed_cep.Text) <> 8 then
   begin
      showMessage('CEP incorreto');
      LimparCampos;
      ed_cep.SetFocus;
      exit;
   end;

   jsonObject := GetCEP(ed_cep.text);
   if jsonObject <> nil then
      CarregaCep(jsonObject)
   else
   begin
      showMessage('CEP inválido ou não encontrado');
      LimparCampos;
      ed_cep.SetFocus;
      exit;
   end;
end;

procedure TForm1.bt_limparCamposClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TForm1.CarregaCep(JSON: TJSONObject);
begin
  try
    ed_logradouro.Text  := JSON.Get('logradouro').JsonValue.Value;
    ed_localidade.Text  := UpperCase(JSON.Get('localidade').JsonValue.Value);
    ed_bairro.Text      := JSON.Get('bairro').JsonValue.Value;
    ed_uf.Text          := JSON.Get('uf').JsonValue.Value;
    ed_complemento.Text := JSON.Get('complemento').JsonValue.Value;
    ed_ibge.Text        := JSON.Get('ibge').JsonValue.Value;
  except
    on e: Exception do
    begin
      Application.MessageBox(PChar('Ocorreu um erro ao consultar o CEP'), 'Erro', MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TForm1.getCEP(CEP: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
   LJsonObj: TJSONObject;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      HTTP.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
        Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject
      else
        raise Exception.Create('CEP inexistente!');
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end;

procedure TForm1.LimparCampos;
var
  i : integer;
begin
  for i := 0 to Self.ControlCount - 1 do
    if Self.Controls[i] is TEdit then
      TEdit(Self.Controls[i]).Clear;

end;

end.
