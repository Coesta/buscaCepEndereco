unit buscacep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXJSON,
  DBXJSONReflect, idHTTP, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TTipoConsulta = (tcCep, tcEndereco);

type
  TEnderecoCompleto = record
    CEP,
    logradouro,
    complemento,
    bairro,
    localidade,
    uf,
    unidade,
    IBGE : string
  end;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    bt_limparCampos: TButton;
    bt_close: TButton;
    PageControl: TPageControl;
    aba_consultaPorCEP: TTabSheet;
    aba_consultaPorEndereco: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    ed_cepConsulta: TEdit;
    bt_consultarCEP: TButton;
    Label3: TLabel;
    ed_logradouro: TEdit;
    Label6: TLabel;
    ed_complemento: TEdit;
    Label4: TLabel;
    ed_unidade: TEdit;
    Label7: TLabel;
    ed_bairro: TEdit;
    Label5: TLabel;
    ed_ibge: TEdit;
    Label8: TLabel;
    ed_localidade: TEdit;
    Label9: TLabel;
    ed_uf: TEdit;
    Label10: TLabel;
    ed_ufConsulta: TEdit;
    bt_consultarEndereco: TButton;
    Label11: TLabel;
    ed_cep: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ed_cidadeConsulta: TEdit;
    ed_logradouroConsulta: TEdit;
    procedure bt_consultarCEPClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure bt_limparCamposClick(Sender: TObject);
    procedure bt_consultarEnderecoClick(Sender: TObject);
  private
    { Private declarations }
    function getDados(params: TEnderecoCompleto; tipoConsulta: TTipoConsulta): TJSONObject;
    procedure CarregaDados(JSON: TJSONObject);
    procedure LimparCampos;
    procedure numericopuro(var Key: Char);
    procedure mensagemAviso(mensagem: string);

    var
      dadosEnderecoCompleto : TEnderecoCompleto;

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

procedure TForm1.bt_consultarCEPClick(Sender: TObject);
var
  jsonObject: TJSONObject;
begin
  LimparCampos;

  if Length(ed_cepConsulta.Text) <> 8 then
  begin
    mensagemAviso('CEP inválido');
    ed_cepConsulta.SetFocus;
    exit;
  end;

  dadosEnderecoCompleto.CEP := ed_cepConsulta.text;

  jsonObject := getDados(dadosEnderecoCompleto, tcCep);

  if jsonObject <> nil then
    CarregaDados(jsonObject)
  else
  begin
    mensagemAviso('CEP inválido ou não encontrado');
    ed_cepConsulta.SetFocus;
    Exit;
  end;
end;

procedure TForm1.bt_consultarEnderecoClick(Sender: TObject);
var
  jsonObject: TJSONObject;
begin
  LimparCampos;

  if Length(Trim(ed_ufConsulta.Text)) <> 2 then
  begin
    mensagemAviso('O campo UF deve conter dois caracteres!');
    ed_logradouroConsulta.SetFocus;
    Exit;
  end;

  if Length(ed_cidadeConsulta.Text) < 3 then
  begin
    mensagemAviso('O campo Cidade deve conter pelo menos 3 caracteres!');
    ed_logradouroConsulta.SetFocus;
    Exit;
  end;

  if Length(ed_logradouroConsulta.Text) < 3 then
  begin
    mensagemAviso('O campo Logradouro deve conter pelo menos 3 caracteres!');
    ed_logradouroConsulta.SetFocus;
    Exit;
  end;

  dadosEnderecoCompleto.uf := ed_ufConsulta.Text;
  dadosEnderecoCompleto.localidade := ed_cidadeConsulta.Text;
  dadosEnderecoCompleto.logradouro := ed_logradouroConsulta.Text;

  jsonObject := getDados(dadosEnderecoCompleto, tcEndereco);
  if jsonObject <> nil then
    CarregaDados(jsonObject)
  else
  begin
    mensagemAviso('Endereço inválido ou não encontrado');
    ed_cep.SetFocus;
    Exit;
  end;
end;

procedure TForm1.bt_limparCamposClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TForm1.CarregaDados(JSON: TJSONObject);
begin
  try
    ed_logradouro.Text  := JSON.Get('logradouro').JsonValue.Value;
    ed_cep.Text         := JSON.Get('cep').JsonValue.Value;
    ed_localidade.Text  := UpperCase(JSON.Get('localidade').JsonValue.Value);
    ed_bairro.Text      := JSON.Get('bairro').JsonValue.Value;
    ed_uf.Text          := JSON.Get('uf').JsonValue.Value;
    ed_complemento.Text := JSON.Get('complemento').JsonValue.Value;
    ed_ibge.Text        := JSON.Get('ibge').JsonValue.Value;
    ed_unidade.Text        := JSON.Get('unidade').JsonValue.Value;
  except
    on e: Exception do
    begin
      Application.MessageBox(PChar('Ocorreu um erro ao consultar o CEP'), 'Erro', MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TForm1.getDados(params: TEnderecoCompleto; tipoConsulta: TTipoConsulta): TJSONObject;
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

      if tipoConsulta = tcCep then
      begin
        HTTP.Get('https://viacep.com.br/ws/' + params.CEP + '/json', Response);
        if (HTTP.ResponseCode = 200) and not(UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
          Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject
        else
          raise Exception.Create('CEP inexistente!');
      end;

      if tipoConsulta = tcEndereco then
      begin
        HTTP.Get('https://viacep.com.br/ws/' + params.CEP + '/json', Response);
        if (HTTP.ResponseCode = 200) and not(UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
          Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject
        else
          raise Exception.Create('CEP inexistente!');
      end;

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

  dadosEnderecoCompleto.CEP := '';
  dadosEnderecoCompleto.logradouro := '';
  dadosEnderecoCompleto.complemento := '';
  dadosEnderecoCompleto.bairro := '';
  dadosEnderecoCompleto.localidade := '';
  dadosEnderecoCompleto.uf := '';
  dadosEnderecoCompleto.unidade := '';
  dadosEnderecoCompleto.IBGE := '';

end;

procedure TForm1.mensagemAviso(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_OK + MB_ICONERROR);
end;

procedure TForm1.numericopuro(var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;
end.
