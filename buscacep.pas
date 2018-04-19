unit buscacep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXJSON,
  DBXJSONReflect, idHTTP, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

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
    Label14: TLabel;
    Memo_json: TMemo;
    DBGrid1: TDBGrid;
    ds_dados: TDataSource;
    cds_dados: TClientDataSet;
    cds_dadosLogradouro: TStringField;
    cds_dadosCEP: TStringField;
    cds_dadosComplemento: TStringField;
    cds_dadosUF: TStringField;
    cds_dadosBairro: TStringField;
    cds_dadosIBGE: TStringField;
    cds_dadosUnidade: TStringField;
    cds_dadosLocalidade: TStringField;
    procedure bt_consultarCEPClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure bt_limparCamposClick(Sender: TObject);
    procedure bt_consultarEnderecoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_ufConsultaExit(Sender: TObject);
    procedure ed_cidadeConsultaExit(Sender: TObject);
    procedure ed_logradouroConsultaExit(Sender: TObject);
  private
    { Private declarations }
    function getDados(params: TEnderecoCompleto; tipoConsulta: TTipoConsulta): TJSONObject;
    function removerAcentuacao(str: string): string;
    procedure CarregaDados(JSON: TJSONObject);
    procedure CarregaDadosEndereco(jsonArray: TJSONArray);
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
    mensagemAviso('CEP inv·lido');
    ed_cepConsulta.SetFocus;
    exit;
  end;

  dadosEnderecoCompleto.CEP := ed_cepConsulta.text;

  jsonObject := getDados(dadosEnderecoCompleto, tcCep);

  if jsonObject <> nil then
    CarregaDados(jsonObject)
  else
  begin
    mensagemAviso('CEP inv·lido ou n„o encontrado');
    ed_cepConsulta.SetFocus;
    Exit;
  end;
end;

procedure TForm1.bt_consultarEnderecoClick(Sender: TObject);
var
  json: TJSONObject;
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

  json := getDados(dadosEnderecoCompleto, tcEndereco);
//  json := getDados(dadosEnderecoCompleto, tcEndereco);
//  if json <> nil then
//    CarregaDadosEndereco(json)
//  else
//  begin
//    mensagemAviso('EndereÁo inv·lido ou n„o encontrado');
//    ed_cep.SetFocus;
//    Exit;
//  end;
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
    ed_unidade.Text     := JSON.Get('unidade').JsonValue.Value;
  except
    on e: Exception do
    begin
      Application.MessageBox(PChar('Ocorreu um erro ao consultar o CEP'), 'Erro', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TForm1.CarregaDadosEndereco(jsonArray: TJSONArray);
var
  i : Integer;
  resultados, jsonObjeto : TJSONObject;
begin
  for i := 0 to jsonArray.Size - 1 do
  begin
    cds_dados.Append;
    cds_dadosLogradouro.AsString  := TJSONObject(jsonArray.Get(i)).Get('logradouro').JsonValue.Value;
    cds_dadosCEP.AsString         := TJSONObject(jsonArray.Get(i)).Get('cep').JsonValue.Value;
    cds_dadosLocalidade.AsString  := UpperCase(TJSONObject(jsonArray.Get(0)).Get('localidade').JsonValue.Value);
    cds_dadosBairro.AsString      := TJSONObject(jsonArray.Get(i)).Get('bairro').JsonValue.Value;
    cds_dadosUF.AsString          := TJSONObject(jsonArray.Get(i)).Get('uf').JsonValue.Value;
    cds_dadosComplemento.AsString := TJSONObject(jsonArray.Get(i)).Get('complemento').JsonValue.Value;
    cds_dadosIBGE.AsString        := TJSONObject(jsonArray.Get(i)).Get('ibge').JsonValue.Value;
    cds_dadosUnidade.AsString     := TJSONObject(jsonArray.Get(i)).Get('unidade').JsonValue.Value;
    cds_dados.Post;
  end;

end;

procedure TForm1.ed_cidadeConsultaExit(Sender: TObject);
begin
  ed_cidadeConsulta.Text := Trim(ed_cidadeConsulta.Text)
end;

procedure TForm1.ed_logradouroConsultaExit(Sender: TObject);
begin
  ed_logradouroConsulta.Text := Trim(ed_logradouroConsulta.Text)
end;

procedure TForm1.ed_ufConsultaExit(Sender: TObject);
begin
  ed_ufConsulta.Text := Trim(ed_ufConsulta.Text)
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl.ActivePageIndex := aba_consultaPorCEP.TabIndex;
  Memo_json.Text := '';
end;

function TForm1.getDados(params: TEnderecoCompleto; tipoConsulta: TTipoConsulta): TJSONObject;
var
  HTTP: TIdHTTP;
  IDSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
  JsonArray: TJSONArray;
begin
  try
    HTTP := TIdHTTP.Create;
    IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
    HTTP.IOHandler := IDSSLHandler;
    Response := TStringStream.Create('');

    if tipoConsulta = tcCep then
    begin
      HTTP.Get('https://viacep.com.br/ws/' + params.CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not (UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
      begin
        Memo_json.Text := UTF8ToString(Response.DataString);
        Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(Response.DataString)), 0) as TJSONObject;
      end
      else
        raise Exception.Create('CEP inexistente!');
    end;

    if tipoConsulta = tcEndereco then
    begin
      HTTP.Get('https://viacep.com.br/ws/' + params.uf + '/' + removerAcentuacao(params.localidade) + '/' + removerAcentuacao(params.logradouro) + '/json', Response);
      if (HTTP.ResponseCode = 200) and not (UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
      begin
        JsonArray := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(Response.DataString)), 0) as TJSONArray;
        memo_json.Text := UTF8ToString(Response.DataString);
        CarregaDadosEndereco(JsonArray);
        Result := TJSONObject(JsonArray);
      end
      else
        raise Exception.Create('EndereÁo inexistente ou n„o encontrado!');
    end;

  finally
    FreeAndNil(HTTP);
    FreeAndNil(IDSSLHandler);
    Response.Destroy;
  end;
end;

procedure TForm1.LimparCampos;
var
  I : integer;
begin
  for I := 0 to Self.ControlCount - 1 do
    if Self.Controls[I] is TEdit then
      TEdit(Self.Controls[I]).Clear;

  memo_json.Clear;

  dadosEnderecoCompleto.CEP := '';
  dadosEnderecoCompleto.logradouro := '';
  dadosEnderecoCompleto.complemento := '';
  dadosEnderecoCompleto.uf := '';
  dadosEnderecoCompleto.bairro := '';
  dadosEnderecoCompleto.IBGE := '';
  dadosEnderecoCompleto.unidade := '';
  dadosEnderecoCompleto.localidade := '';

  with cds_dados do
  begin
    DisableControls;
    try
      while not Eof do
        Delete;
    finally
      EnableControls;
    end;
  end;
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

function TForm1.removerAcentuacao(str: string): string;
var
  x: Integer;
const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
begin
  for x := 1 to Length(Str) do

    if Pos(Str[x], ComAcento) <> 0 then
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];

  Result := Str;
end;

end.
