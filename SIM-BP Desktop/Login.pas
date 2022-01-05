unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.Surfaces, System.IOUtils, System.JSON, FMX.Effects, FMX.VirtualKeyboard,
  FMX.Platform, System.Net.URLClient, System.Net.HttpClient, System.Threading,
  System.Net.HttpClientComponent, FMX.DialogService;

type
  TfrmLogin = class(TForm)
    background: TRectangle;
    layoutMain: TLayout;
    Layout3: TLayout;
    Label2: TLabel;
    btnHubungiKami: TLabel;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    edPass: TEdit;
    edName: TEdit;
    btnMasuk: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    btnLupaPass: TLabel;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    lblBP: TLabel;
    Label1: TLabel;
    Image1: TImage;
    IdHTTP1: TIdHTTP;
    ShadowEffect1: TShadowEffect;
    bukaPass: TImage;
    tutupPass: TImage;
    ColorAnimation1: TColorAnimation;
    ColorAnimation2: TColorAnimation;
    Layout5: TLayout;
    btnTitikTiga: TRectangle;
    Image15: TImage;
    FloatAnimation1: TFloatAnimation;
    rectMenuProfil: TRectangle;
    ShadowEffect6: TShadowEffect;
    menuBantuan: TRectangle;
    Label25: TLabel;
    Image16: TImage;
    ColorAnimation10: TColorAnimation;
    menuTentang: TRectangle;
    lbKeluar: TLabel;
    Image17: TImage;
    ColorAnimation11: TColorAnimation;
    animMenuProfilOpacity: TFloatAnimation;
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    Rectangle3: TRectangle;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    procedure edNameTyping(Sender: TObject);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure edPassTyping(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure bukaPassClick(Sender: TObject);
    procedure tutupPassClick(Sender: TObject);
    procedure btnTitikTigaClick(Sender: TObject);
    procedure btnMasukClick(Sender: TObject);
    procedure menuBantuanClick(Sender: TObject);
    procedure menuTentangClick(Sender: TObject);
    procedure animMenuProfilOpacityFinish(Sender: TObject);
    procedure btnHubungiKamiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    responseJSON: string;
    procedure writedata(ResponBody, tempatFile: string);
    procedure loaddata;
    procedure deletedata;
    // function cekdata: Boolean;
  public
    { Public declarations }
    username, nama_lengkap: string;
    function doService(service_path, param: String): TJSONArray;
    procedure setEdit(E: TEdit);
    procedure fnGetCenter(fromParent, AParent: TControl);
    procedure PrintPDFLawas;
    procedure Open(URL: string);
    function KonfirmasiClose(AMessage: String): String;
    // procedure tempatData();
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}
//
// procedure TfrmLogin.tempatData();
// var
// nm_lengkap
// begin
// end;

uses MainAdmin,
  // IndikatorAdmin, KelasAdmin, GuruAdmin,
  BantuanLogin, TentangPengembangLogin
  // SiswaAdmin, dataAdmin, LihatLaporanAdmin, PenggunaAdmin,
  // WKAdmin
{$IF Defined(MSWINDOWS)}
    , Winapi.ShellAPI, Winapi.Windows
{$ENDIF}
    ;

function TfrmLogin.doService(service_path, param: string): TJSONArray;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ResponseBody: string;
  ss: TStringStream;
begin
  IdHTTP1.Request.Accept := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';
  // ResponseBody := IdHTTP1.Get('http://sditulilalbab-kamal.sch.id/api/' + service_path +
  // '?' + param);
  NetHTTPClient1.Get('https://sditulilalbab-kamal.sch.id/api/' + service_path +
    '?' + param, ss);
  // JA := TJSONObject.ParseJSONValue(ResponseBody) as TJSONArray;
  JA := TJSONObject.ParseJSONValue(ss.DataString) as TJSONArray;
end;

// function TfrmLogin.login(user, pass: string)

procedure TfrmLogin.animMenuProfilOpacityFinish(Sender: TObject);
begin
  if animMenuProfilOpacity.Inverse = True then
  begin
    rectMenuProfil.Visible := False;
  end;
end;

procedure TfrmLogin.btnHubungiKamiClick(Sender: TObject);
begin
  Open('https://api.whatsapp.com/send?phone=6283830343368&text=Assalamualaikum%20Wr.%20Wb.%0A%0Asaya%20ingin%20bertanya%20terkait%20aplikasi%20buku%20penghubung.%0A%0Aterdapat%20masalah%20seperti%20berikut:%0A%0A');
end;

procedure TfrmLogin.Open(URL: string);
{$IF Defined(ANDROID)}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IF Defined(ANDROID)}
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(URL));
  tandroidhelper.Activity.startActivity(Intent);
  // SharedActivity.startActivity(Intent);
{$ELSEIF Defined(MSWINDOWS)}
  ShellExecute(0, 'OPEN', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
{$ELSEIF Defined(IOS)}
  SharedApplication.OpenURL(StrToNSUrl(URL));
{$ELSEIF Defined(MACOS)}
  _system(PAnsiChar('open ' + AnsiString(URL)));
{$ENDIF}
end;

procedure TfrmLogin.PrintPDFLawas;
var
  ResponBody: String;
  // ms: TStream;
  ms: TMemoryStream;
  fName: String;
{$IFDEF ANDROID}
  Intent: JIntent;
  URI: Jnet_Uri;
{$ENDIF}
begin
  // try
  // ms := TFileStream.Create('DataPengguna.pdf', fmCreate);
  // try
  // IdHTTP1.Get('http://sditulilalbab-kamal.sch.id/si-skm/cetak.php?' +
  // 'page=datapengguna', ms);
  // finally
  // ms.Free;
  // end;
  // except
  // on E: exception do
  // ShowMessage('Error DoServiceHomeGuru ' + E.ToString);
  // end;

  try
    ms := TMemoryStream.Create;
    try
      IdHTTP1.Get('http://sditulilalbab-kamal.sch.id/si-skm/cetak.php?' +
        'page=datapengguna', ms);
      ms.SaveToFile(TPath.GetPublicPath + 'DataPengguna_TMemoryStream.pdf');
    finally
      ms.Free;

      fName := TPath.GetPublicPath + 'DataPengguna_TMemoryStream.pdf';

      // {$IFDEF ANDROID}
      // URI := TJnet_Uri.JavaClass.parse(StringToJString('file:///' + fName));
      // Intent := TJIntent.Create;
      // Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
      // Intent.setDataAndType(URI, StringToJString('application/pdf'));
      // SharedActivity.startActivity(Intent);
      // {$ENDIF}
      // ShellExecute(Handle, 'open', 'file:///' + fName,nil,nil,SW_SHOWNORMAL) ;
    end;
  except
    on E: exception do
      ShowMessage('Error DoServiceHomeGuru ' + E.ToString);
  end;
end;

procedure TfrmLogin.btnMasukClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      ss: TStringStream;
      ResponseBody: string;
      httpresp: IHTTPResponse;
    begin
      Loading.Visible := True;
      try
        httpresp := NetHTTPClient1.Get
          ('http://sditulilalbab-kamal.sch.id/api/admin.php?hitung=login' +
          '&username=' + edName.Text + '&password=' + edPass.Text);
        ResponseBody := httpresp.ContentAsString;
        // ResponseBody := ss.DataString;
        JA := TJSONObject.ParseJSONValue(ResponseBody) as TJSONArray;
        // showMessage(ResponseBody);
      except
        on E: exception do
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              ShowMessage('Error DoServiceLogin ' + E.Message);
            end);
        end;
      end;
      if ResponseBody <> '[]' then
      begin
        writedata(ResponseBody, 'admin.txt');
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            if frmMainAdmin = nil then
            begin
              Application.CreateForm(TfrmMainAdmin, frmMainAdmin);
            end;
            frmMainAdmin.loaddata;
            frmMainAdmin.Show;
            frmLogin.Hide;
            FreeAndNil(frmLogin);
          end);
        // frmKelasAdmin.AmbilData('');
        // frmGuruAdmin.AmbilData('');
        // frmHomeSiswa.ambilkelas;
        // frmProfilGuruSiswa.showdata;
        // frmCatatanKhususSiswa.setTampil('ortu');
      end
      else
      begin
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            ShowMessage('Anda Salah Memasukkan Username / Password');
          end);
      end;
      Loading.Visible := False;
    end).Start;
end;

procedure TfrmLogin.btnTitikTigaClick(Sender: TObject);
begin
  if rectMenuProfil.Visible = True then
  begin
    animMenuProfilOpacity.Inverse := True;
    animMenuProfilOpacity.Start;
  end
  else
  begin
    rectMenuProfil.Visible := True;
    animMenuProfilOpacity.Inverse := False;
    animMenuProfilOpacity.Start;
  end;
end;

procedure TfrmLogin.writedata(ResponBody, tempatFile: string);
var
  paramList: TStringList;
  // t: file;
  // b64, aa: string;
  // ms: TMemoryStream;
  // surf: TBitmapSurface;
  // output, dd: TStringStream;
  // fs: TFileStream;
  // ratio: real;
begin
  try
    // delete file
    // deletedata;

    // save file into temp1
    paramList := TStringList.Create;
    paramList.Add(ResponBody);
    paramList.SaveToFile(System.IOUtils.TPath.GetDocumentsPath +
      System.SysUtils.PathDelim + tempatFile);
  except
    on E: exception do
      ShowMessage('Error writing temporary file ' + E.ToString);
  end;
end;

procedure TfrmLogin.loaddata;
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
begin
  try
    if FileExists(System.IOUtils.TPath.GetDocumentsPath +
      System.SysUtils.PathDelim + 'admin.txt') then
    begin
      paramList := TStringList.Create;
      paramList.LoadFromFile(System.IOUtils.TPath.GetDocumentsPath +
        System.SysUtils.PathDelim + 'admin.txt');
      JA := TJSONObject.ParseJSONValue(paramList.Text) as TJSONArray;
      paramList.Free;
      if JA.ToString <> '[]' then
      begin
        // for JV in JA do
        // begin
        // edSearch.Text := JV.GetValue('search', '');
        // end;
      end;
      JA.Free;
    end;
    // SearchDetailEIR;
  except
    on E: exception do
      ShowMessage('Error writing temporary file ' + E.ToString);
  end;
end;

procedure TfrmLogin.menuBantuanClick(Sender: TObject);
begin
  if frmBantuanLogin = nil then
  begin
    Application.CreateForm(TfrmBantuanLogin, frmBantuanLogin);
  end;
  frmBantuanLogin.Show;
end;

procedure TfrmLogin.menuTentangClick(Sender: TObject);
begin
  if frmTentangPengembangLogin = nil then
  begin
    Application.CreateForm(TfrmTentangPengembangLogin,
      frmTentangPengembangLogin);
  end;
  frmTentangPengembangLogin.Show;
end;

procedure TfrmLogin.bukaPassClick(Sender: TObject);
begin
  tutupPass.Visible := True;
  bukaPass.Visible := False;
  edPass.Password := False;
end;

procedure TfrmLogin.deletedata;
var
  deletevar: String;
begin
  // try
  // if FileExists(System.IOUtils.TPath.GetDocumentsPath + System.SysUtils.PathDelim + 'admin.txt') then
  // begin
  // deletevar := System.IOUtils.TPath.GetDocumentsPath + System.SysUtils.PathDelim + 'admin.txt';
  // deletefile(deletevar);
  // end;
  // except
  // on E: exception do
  // ShowMessage('Error delete file ' + E.ToString);
  // end;
end;

procedure TfrmLogin.edPassTyping(Sender: TObject);
begin
  setEdit(TEdit(Sender));
end;

procedure TfrmLogin.edNameTyping(Sender: TObject);
begin
  setEdit(TEdit(Sender));
end;

procedure TfrmLogin.fnGetCenter(fromParent, AParent: TControl);
var
  wiF, wiP, heF, heP: integer;
begin
  wiF := round(fromParent.Width);
  heF := round(fromParent.Height);
  wiP := round(AParent.Width);
  heP := round(AParent.Height);
  AParent.Position.X := round((wiF / 2) - (wiP / 2));
  AParent.Position.Y := round((heF / 2) - (heP / 2));
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  // Profil Bar Hide
  // rectMenuProfil.Visible := False;
  animMenuProfilOpacity.Inverse := True;
  animMenuProfilOpacity.Start;

  tutupPass.Visible := False;
  bukaPass.Visible := True;
  edPass.Password := True;
end;

function TfrmLogin.KonfirmasiClose(AMessage: String): String;
var
  lResultStr: String;
begin
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes:
          lResultStr := 'Y';
        mrNo:
          lResultStr := 'N';
      end;
    end);
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if KonfirmasiClose('Apakah Kamu Ingin Keluar Dari Aplikasi') = 'Y' then
    Application.Terminate;
end;

procedure TfrmLogin.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
Shift: TShiftState);
var
  FService: IFMXVirtualKeyboardService;
begin
  if Key = vkHardwareBack then
  begin
    Key := 0;
    TPlatformServices.Current.SupportsPlatformService
      (IFMXVirtualKeyboardService, IInterface(FService));
    if (FService <> nil) and (TVirtualKeyboardState.Visible
      in FService.VirtualKeyBoardState) then
    begin
      FService.HideVirtualKeyboard;
    end;
  end;
end;

procedure TfrmLogin.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  layoutMain.Margins.Top := -150;
  Layout1.Visible := True;
end;

procedure TfrmLogin.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
var
  h: single;
begin
  if KeyboardVisible then
  begin
    h := Bounds.BottomRight.Y - Bounds.TopLeft.Y;
    Layout1.Visible := False;
    layoutMain.Margins.Top := -h - 100;
  end;
end;

procedure TfrmLogin.setEdit(E: TEdit);
var
  L: TLabel;
  t: TFloatAnimation;
  i: integer;
begin
  L := nil;
  for i := 0 to E.ControlsCount - 1 do
  begin
    if E.Controls[i] is TLabel then
      L := TLabel(E.Controls[i]);
  end;
  if not Assigned(L) then
  begin
    L := TLabel.Create(E);
    L.Parent := E;
    L.Width := E.Width;
    L.Text := E.TextPrompt;
    fnGetCenter(E, L);
    L.Position.X := 0;
    L.Font.Size := 10;
    L.FontColor := $FF3E8551;
    L.StyledSettings := [];
    L.Visible := False;
    t := TFloatAnimation.Create(L);
    t.Parent := L;
    t.Interpolation := TInterpolationType.Quadratic;
    t.PropertyName := 'Position.Y';
    t.duration := 0.15;
    t.StartValue := L.Position.Y;
    t.StopValue := -17;
    t.Trigger := 'IsVisible=true';
    t.TriggerInverse := 'IsVisible=false';

  end;
  if E.Text <> '' then
    L.Visible := True
  else
    L.Visible := False;
end;

procedure TfrmLogin.tutupPassClick(Sender: TObject);
begin
  tutupPass.Visible := False;
  bukaPass.Visible := True;
  edPass.Password := True;
end;

end.
