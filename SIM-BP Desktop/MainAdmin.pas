unit MainAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.ScrollBox,
  FMX.Effects, System.JSON, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, FMX.Memo, System.NetEncoding, Soap.EncdDecd,
  FMX.Surfaces, System.IOUtils, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, FMX.DialogService;

type
  TfrmMainAdmin = class(TForm)
    Title: TRectangle;
    Circle1: TCircle;
    crFoto: TCircle;
    menuBar: TRectangle;
    Image3: TImage;
    menu: TRectangle;
    FloatAnimation1: TFloatAnimation;
    rectBeranda: TRectangle;
    Image4: TImage;
    Layout1: TLayout;
    Label3: TLabel;
    rectIndikator: TRectangle;
    Image5: TImage;
    Label4: TLabel;
    rectKelas: TRectangle;
    Image6: TImage;
    Label5: TLabel;
    rectGuru: TRectangle;
    Image7: TImage;
    Label6: TLabel;
    rectSiswa: TRectangle;
    Image8: TImage;
    Label7: TLabel;
    rectAdmin: TRectangle;
    Image9: TImage;
    Label8: TLabel;
    rectLaporan: TRectangle;
    Image10: TImage;
    Label9: TLabel;
    rectProfil: TRectangle;
    lbProfil: TLabel;
    rectMenuProfil: TRectangle;
    ShadowEffect6: TShadowEffect;
    menuProfil: TRectangle;
    Label10: TLabel;
    Image15: TImage;
    menuKeluar: TRectangle;
    lbKeluar: TLabel;
    Image17: TImage;
    animMenuProfil: TFloatAnimation;
    ColorAnimation1: TColorAnimation;
    ColorAnimation2: TColorAnimation;
    ColorAnimation3: TColorAnimation;
    RectAnimation1: TRectAnimation;
    menuButton: TRectangle;
    menuScaleX: TFloatAnimation;
    menuScaleY: TFloatAnimation;
    btnBeranda: TRectangle;
    FloatAnimation3: TFloatAnimation;
    btnGuru: TRectangle;
    FloatAnimation4: TFloatAnimation;
    btnIndikator: TRectangle;
    FloatAnimation5: TFloatAnimation;
    btnKelas: TRectangle;
    FloatAnimation6: TFloatAnimation;
    btnLaporan: TRectangle;
    FloatAnimation7: TFloatAnimation;
    btnAdmin: TRectangle;
    FloatAnimation8: TFloatAnimation;
    btnSiswa: TRectangle;
    FloatAnimation9: TFloatAnimation;
    IdHTTP1: TIdHTTP;
    TitleLogo: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    rectWK: TRectangle;
    Image18: TImage;
    Label18: TLabel;
    btnWK: TRectangle;
    FloatAnimation15: TFloatAnimation;
    menuBantuan: TRectangle;
    lbBantuan: TLabel;
    Image19: TImage;
    ColorAnimation4: TColorAnimation;
    closeMenu: TRectangle;
    blackScreen: TRectangle;
    animTransparan: TFloatAnimation;
    rectClose: TRectangle;
    lbQuit: TLabel;
    rectCloseYa: TRectangle;
    Label11: TLabel;
    ColorAnimation6: TColorAnimation;
    rectCloseTidak: TRectangle;
    Label12: TLabel;
    ColorAnimation7: TColorAnimation;
    animScaleX: TFloatAnimation;
    animScaleY: TFloatAnimation;
    NetHTTPClient1: TNetHTTPClient;
    layMain: TLayout;
    FloatAnimation2a: TFloatAnimation;
    FloatAnimation2b: TFloatAnimation;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    layContent: TLayout;
    procedure closeTap(Sender: TObject; const Point: TPointF);
    procedure animMenuProfilFinish(Sender: TObject);
    procedure btnIndikatorTap(Sender: TObject; const Point: TPointF);
    procedure FormCreate(Sender: TObject);
    procedure btnGuruTap(Sender: TObject; const Point: TPointF);
    procedure btnKelasTap(Sender: TObject; const Point: TPointF);
    procedure btnSiswaTap(Sender: TObject; const Point: TPointF);
    procedure btnAdminTap(Sender: TObject; const Point: TPointF);
    procedure btnLaporanTap(Sender: TObject; const Point: TPointF);
    procedure menuProfilTap(Sender: TObject; const Point: TPointF);
    procedure FormActivate(Sender: TObject);
    procedure btnWKTap(Sender: TObject; const Point: TPointF);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure rectCloseTidakTap(Sender: TObject; const Point: TPointF);
    procedure animScaleYFinish(Sender: TObject);
    procedure menuBantuanTap(Sender: TObject; const Point: TPointF);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure menuButtonClick(Sender: TObject);
    procedure rectProfilClick(Sender: TObject);
    procedure btnIndikatorClick(Sender: TObject);
    procedure btnBerandaClick(Sender: TObject);
    procedure menuKeluarClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure btnGuruClick(Sender: TObject);
    procedure btnSiswaClick(Sender: TObject);
    procedure btnKelasClick(Sender: TObject);
    procedure btnWKClick(Sender: TObject);
    procedure menuProfilClick(Sender: TObject);
    procedure menuBantuanClick(Sender: TObject);
    procedure btnLaporanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    menuProfilBuka: Boolean;
  public
    { Public declarations }
    thn_pelajaran: String;
    dari, ke: String;
    a_user, a_pass, a_nm_lengkap, a_telepon, a_foto: String;
    function doService(service_path, param: string): TJSONArray;
    function doServiceGet(service_path, param: string): String;
    function doServicePost(service_path: string; param: TStringList): String;
    procedure Split(const Delimiter: Char; Input: string;
      const Strings: TStrings);
    function ubahBulan(bulanString: String): String;
    procedure loadbase64(img: TBitmap; b64: string);
    function converttob64(img: TBitmap): string;
    function changeratio(a: TBitmap): TBitmap;
    procedure loaddata;
    procedure profil(img: TBitmap; labelProfile: TLabel);
    procedure keluarSystem(frmAwal: TForm);
    procedure deletedata;
    procedure fnGoFrame(from, go: String);
    function KonfirmasiClose(AMessage: String): String;
  end;

var
  frmMainAdmin: TfrmMainAdmin;

implementation

{$R *.fmx}

uses
  IndikatorAdmin, DataAdmin, WKAdmin, PenggunaAdmin,
  GuruAdmin, KelasAdmin, SiswaAdmin,
  LihatLaporanAdmin, BantuanAdmin,
  HomeAdmin, Login;

function TfrmMainAdmin.changeratio(a: TBitmap): TBitmap;
var
  b: TBitmap;
  lebar, half, d, w, h: Single;
  src, trg: TRectF;
begin
  w := a.Width;
  h := a.Height;
  d := abs(w - h);
  half := d / 2;
  b := TBitmap.Create;
  if w > h then
    lebar := h
  else
    lebar := w;
  b.SetSize(round(lebar), round(lebar));
  if w > h then
    src := RectF(0 + half, 0, w - half, h)
  else
    src := RectF(0, 0 + half, w, h - half);
  trg := RectF(0, 0, lebar - 1, lebar - 1);
  b.Canvas.BeginScene;
  b.Canvas.DrawBitmap(a, src, trg, 1);
  b.Canvas.EndScene;
  result := b;
end;

procedure TfrmMainAdmin.animMenuProfilFinish(Sender: TObject);
begin
  if animMenuProfil.Inverse = True then
  begin
    rectMenuProfil.Visible := False;
  end;
end;

procedure TfrmMainAdmin.animScaleYFinish(Sender: TObject);
begin
  if animScaleY.Inverse = True then
  begin
    closeMenu.Visible := False;
  end;
end;

procedure TfrmMainAdmin.loadbase64(img: TBitmap; b64: string);
var
  mm: TMemo;
  m1, m2: TMemoryStream;
begin
  try
    mm := TMemo.Create(nil);
    mm.Lines.Clear;
    mm.Lines.Text := b64;
    m1 := TMemoryStream.Create;
    m2 := TMemoryStream.Create;
    mm.Lines.SaveToStream(m1);
    m1.Position := 0;
    Soap.EncdDecd.DecodeStream(m1, m2);
    m2.Position := 0;
    img.LoadFromStream(m2);
    m1.Free;
    m2.Free;
  except
    on E: exception do
      ShowMessage('Error load bitmap ' + E.ToString);
  end;
end;

function TfrmMainAdmin.converttob64(img: TBitmap): string;
var
  b64, aa: string;
  ms: TMemoryStream;
  surf: TBitmapSurface;
  output, dd: TStringStream;
  fs: TFileStream;
  ratio: real;
begin
  try
    ratio := img.Width / img.Height;
    img.Resize(round(600 * ratio), 600);
    ms := TMemoryStream.Create;
    surf := TBitmapSurface.Create;
    surf.Assign(img);
    TBitmapCodecManager.SaveToStream(ms, surf, '.jpg');
    ms.Position := 0;
    output := TStringStream.Create;
    TNetEncoding.Base64.Encode(ms, output);
    b64 := output.DataString;
    result := b64;
  except
    on E: exception do
      ShowMessage('Error convert to base 64 ' + E.ToString);
  end;
end;

function TfrmMainAdmin.ubahBulan(bulanString: String): String;
begin
  if bulanString = '01' then
    result := 'Januari'
  else if bulanString = '02' then
    result := 'Februari'
  else if bulanString = '03' then
    result := 'Maret'
  else if bulanString = '04' then
    result := 'April'
  else if bulanString = '05' then
    result := 'Mei'
  else if bulanString = '06' then
    result := 'Juni'
  else if bulanString = '07' then
    result := 'Juli'
  else if bulanString = '08' then
    result := 'Agustus'
  else if bulanString = '09' then
    result := 'September'
  else if bulanString = '10' then
    result := 'Oktober'
  else if bulanString = '11' then
    result := 'November'
  else if bulanString = '12' then
    result := 'Desember'
  else
    result := 'Bulan Tidak Diketahui';
end;

procedure TfrmMainAdmin.btnAdminClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Admin');
end;

procedure TfrmMainAdmin.btnAdminTap(Sender: TObject; const Point: TPointF);
begin
  // if frmDataAdmin = nil then
  // Application.CreateForm(TfrmDataAdmin, frmDataAdmin);
  // frmDataAdmin.Show;
end;

procedure TfrmMainAdmin.btnBerandaClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Home');
end;

procedure TfrmMainAdmin.btnGuruClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Guru');
end;

procedure TfrmMainAdmin.btnGuruTap(Sender: TObject; const Point: TPointF);
begin
  // if frmGuruAdmin = nil then
  // Application.CreateForm(TfrmGuruAdmin, frmGuruAdmin);
  // frmGuruAdmin.Show;
end;

procedure TfrmMainAdmin.btnIndikatorClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Indikator');
end;

procedure TfrmMainAdmin.fnGoFrame(from, go: String);
begin
  layContent.Opacity := 0;
  layContent.Visible := False;

  if from = 'Home' then
  begin
    frmHomeAdmin.Visible := False;
    rectBeranda.Fill.Color := $FF78BC71;
  end
  else if from = 'Indikator' then
  begin
    frmIndikatorAdmin.Visible := False;
    rectIndikator.Fill.Color := $FF78BC71;
  end
  else if from = 'Admin' then
  begin
    frmDataAdmin.Visible := False;
    rectAdmin.Fill.Color := $FF78BC71;
  end
  else if from = 'Guru' then
  begin
    frmGuruAdmin.Visible := False;
    rectGuru.Fill.Color := $FF78BC71;
  end
  else if from = 'Siswa' then
  begin
    frmSiswaAdmin.Visible := False;
    rectSiswa.Fill.Color := $FF78BC71;
  end
  else if from = 'Kelas' then
  begin
    frmKelasAdmin.Visible := False;
    rectKelas.Fill.Color := $FF78BC71;
  end
  else if from = 'WK' then
  begin
    frmWKAdmin.Visible := False;
    rectWK.Fill.Color := $FF78BC71;
  end
  else if from = 'Laporan' then
  begin
    frmLihatLaporanAdmin.Visible := False;
    rectLaporan.Fill.Color := $FF78BC71;
  end
  else if from = 'Pengguna' then
  begin
    frmPenggunaAdmin.Visible := False;
  end;

  if go = 'Home' then
  begin
    if Assigned(frmHomeAdmin) then
    begin
      frmHomeAdmin.Visible := True;
    end
    else
    begin
      frmHomeAdmin := TfrmHomeAdmin.Create(frmMainAdmin);
      frmHomeAdmin.Parent := frmMainAdmin.layContent;
      frmHomeAdmin.Align := TAlignLayout.Contents;
    end;
    rectBeranda.Fill.Color := $FF57A44D;
  end
  else if go = 'Pengguna' then
  begin
    if Assigned(frmPenggunaAdmin) then
    begin
      frmPenggunaAdmin.Visible := True;
    end
    else
    begin
      frmPenggunaAdmin := TfrmPenggunaAdmin.Create(frmMainAdmin);
      frmPenggunaAdmin.Parent := frmMainAdmin.layContent;
      frmPenggunaAdmin.Align := TAlignLayout.Contents;
      frmPenggunaAdmin.ambilData;
    end;
  end
  else if go = 'Indikator' then
  begin
    if Assigned(frmIndikatorAdmin) then
    begin
      frmIndikatorAdmin.Visible := True;
    end
    else
    begin
      frmIndikatorAdmin := TfrmIndikatorAdmin.Create(frmMainAdmin);
      frmIndikatorAdmin.Parent := frmMainAdmin.layContent;
      frmIndikatorAdmin.Align := TAlignLayout.Contents;
      frmIndikatorAdmin.ambilData('');
    end;
    rectIndikator.Fill.Color := $FF57A44D;
  end
  else if go = 'Admin' then
  begin
    if Assigned(frmDataAdmin) then
    begin
      frmDataAdmin.Visible := True;
    end
    else
    begin
      frmDataAdmin := TfrmDataAdmin.Create(frmMainAdmin);
      frmDataAdmin.Parent := frmMainAdmin.layContent;
      frmDataAdmin.Align := TAlignLayout.Contents;
      frmDataAdmin.ambilData('');
    end;
    rectAdmin.Fill.Color := $FF57A44D;
  end
  else if go = 'Guru' then
  begin
    if Assigned(frmGuruAdmin) then
    begin
      frmGuruAdmin.Visible := True;
    end
    else
    begin
      frmGuruAdmin := TfrmGuruAdmin.Create(frmMainAdmin);
      frmGuruAdmin.Parent := frmMainAdmin.layContent;
      frmGuruAdmin.Align := TAlignLayout.Contents;
      frmGuruAdmin.ambilData('');
    end;
    rectGuru.Fill.Color := $FF57A44D;
  end
  else if go = 'Siswa' then
  begin
    if Assigned(frmSiswaAdmin) then
    begin
      frmSiswaAdmin.Visible := True;
    end
    else
    begin
      frmSiswaAdmin := TfrmSiswaAdmin.Create(frmMainAdmin);
      frmSiswaAdmin.Parent := frmMainAdmin.layContent;
      frmSiswaAdmin.Align := TAlignLayout.Contents;
      frmSiswaAdmin.ambilData('');
    end;
    rectSiswa.Fill.Color := $FF57A44D;
  end
  else if go = 'Kelas' then
  begin
    if Assigned(frmKelasAdmin) then
    begin
      frmKelasAdmin.Visible := True;
    end
    else
    begin
      frmKelasAdmin := TfrmKelasAdmin.Create(frmMainAdmin);
      frmKelasAdmin.Parent := frmMainAdmin.layContent;
      frmKelasAdmin.Align := TAlignLayout.Contents;
      frmKelasAdmin.ambilData('');
    end;
    rectKelas.Fill.Color := $FF57A44D;
  end
  else if go = 'WK' then
  begin
    if Assigned(frmWKAdmin) then
    begin
      frmWKAdmin.Visible := True;
    end
    else
    begin
      frmWKAdmin := TfrmWKAdmin.Create(frmMainAdmin);
      frmWKAdmin.Parent := frmMainAdmin.layContent;
      frmWKAdmin.Align := TAlignLayout.Contents;
      frmWKAdmin.isiKelas;
    end;
    rectWK.Fill.Color := $FF57A44D;
  end
  else if go = 'Laporan' then
  begin
    if Assigned(frmLihatLaporanAdmin) then
    begin
      frmLihatLaporanAdmin.Visible := True;
    end
    else
    begin
      frmLihatLaporanAdmin := TfrmLihatLaporanAdmin.Create(frmMainAdmin);
      frmLihatLaporanAdmin.Parent := frmMainAdmin.layContent;
      frmLihatLaporanAdmin.Align := TAlignLayout.Contents;
      frmLihatLaporanAdmin.CreateAwal;
    end;
    rectLaporan.Fill.Color := $FF57A44D;
  end;

  dari := go;

  layContent.Visible := True;
  // FAFrameOpen.Enabled := True;
  layContent.Opacity := 1;
end;

procedure TfrmMainAdmin.btnIndikatorTap(Sender: TObject; const Point: TPointF);
begin
  // if frmIndikatorAdmin = nil then
  // Application.CreateForm(TfrmIndikatorAdmin, frmIndikatorAdmin);
  // frmIndikatorAdmin.Show;
end;

procedure TfrmMainAdmin.btnKelasClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Kelas');
end;

procedure TfrmMainAdmin.btnKelasTap(Sender: TObject; const Point: TPointF);
begin
  // if frmKelasAdmin = nil then
  // Application.CreateForm(TfrmKelasAdmin, frmKelasAdmin);
  // frmKelasAdmin.Show;
end;

procedure TfrmMainAdmin.btnLaporanClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Laporan');
end;

procedure TfrmMainAdmin.btnLaporanTap(Sender: TObject; const Point: TPointF);
begin
  // frmLihatLaporanAdmin.Show;
end;

procedure TfrmMainAdmin.btnSiswaClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Siswa');
end;

procedure TfrmMainAdmin.btnSiswaTap(Sender: TObject; const Point: TPointF);
begin
  // if frmSiswaAdmin = nil then
  // Application.CreateForm(TfrmSiswaAdmin, frmSiswaAdmin);
  // frmSiswaAdmin.Show;
end;

procedure TfrmMainAdmin.btnWKClick(Sender: TObject);
begin
  fnGoFrame(dari, 'WK');
end;

procedure TfrmMainAdmin.btnWKTap(Sender: TObject; const Point: TPointF);
begin
  // frmWKAdmin.Show;
end;

procedure TfrmMainAdmin.closeTap(Sender: TObject; const Point: TPointF);
begin
  // FloatAnimation1.Enabled := false;
  // FloatAnimation2.Enabled := false;
  // FloatAnimation1.Inverse := True;
  // FloatAnimation2.Inverse := True;
  // FloatAnimation1.Enabled := true;
  // FloatAnimation2.Enabled := true;
  // if menuBar.Visible = true then
  // begin
  // menu.AnimateFloat('Position.X', -250, 0.5, TAnimationType.InOut,
  // TInterpolationType.Quintic);
  // Blackbar.AnimateFloat('Opacity', 0, 0.5, TAnimationType.InOut,
  // TInterpolationType.Quintic);
  // end
  // else
  // begin
  // menu.AnimateFloat('Height', 0, 0.5, TAnimationType.InOut,
  // TInterpolationType.Quintic);
  // Blackbar.AnimateFloat('Opacity', 0, 0.5, TAnimationType.InOut,
  // TInterpolationType.Quintic);
  // end;
end;

procedure TfrmMainAdmin.loaddata;
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
        for JV in JA do
        begin
          a_user := JV.GetValue('a_user', '');
          a_pass := JV.GetValue('a_pass', '');
          a_nm_lengkap := JV.GetValue('a_nm_lengkap', '');
          a_telepon := JV.GetValue('a_telepon', '');
          a_foto := JV.GetValue('a_foto', '');
        end;
      end;
      JA.Free;
    end;
    // SearchDetailEIR;
  except
    on E: exception do
    begin
      ShowMessage('Error writing temporary file ' + E.ToString);
    end;
  end;
end;

procedure TfrmMainAdmin.FloatAnimation1Finish(Sender: TObject);
begin
  if FloatAnimation1.Inverse = True then
  begin
    menuBar.Visible := False;
  end;
end;

procedure TfrmMainAdmin.FormActivate(Sender: TObject);
begin
  profil(crFoto.Fill.Bitmap.Bitmap, lbProfil);
  // animMenuProfil.Inverse := False;
  // animMenuProfil.Start;
  // FloatAnimation1.Inverse := False;
  // FloatAnimation1.Start;
end;

procedure TfrmMainAdmin.keluarSystem(frmAwal: TForm);
begin
  // delete data
  deletedata;

  // remove icon
  a_user := '';
  a_pass := '';
  a_nm_lengkap := '';
  a_telepon := '';
  a_foto := '';

  // Ganti Scene
  if frmLogin = nil then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;
  frmLogin.Show;
  frmAwal.Hide;

  // freeandnil(frmMainAdmin);

  // frmAwal.DisposeOf;
  // frmIndikatorAdmin.DisposeOf;
  // frmDataAdmin.DisposeOf;
  // frmSiswaAdmin.DisposeOf;
  // frmGuruAdmin.DisposeOf;
  // frmKelasAdmin.DisposeOf;
  // frmWKAdmin.DisposeOf;
  // frmLihatLaporanAdmin.DisposeOf;
  // frmPenggunaAdmin.DisposeOf;

  // freeandnil(frmIndikatorAdmin);
  // freeandnil(frmDataAdmin);
  // freeandnil(frmSiswaAdmin);
  // freeandnil(frmGuruAdmin);
  // freeandnil(frmKelasAdmin);
  // freeandnil(frmWKAdmin);
  // freeandnil(frmLihatLaporanAdmin);
  // freeandnil(frmPenggunaAdmin);
  //
  // frmIndikatorAdmin := nil;
  // frmDataAdmin := nil;
  // frmSiswaAdmin := nil;
  // frmGuruAdmin := nil;
  // frmKelasAdmin := nil;
  // frmWKAdmin := nil;
  // frmLihatLaporanAdmin := nil;
  // frmPenggunaAdmin := nil;

  ShowMessage('Anda Telah Keluar Dari Sistem');
end;

procedure TfrmMainAdmin.deletedata;
begin
  try
    if FileExists(System.IOUtils.TPath.GetDocumentsPath +
      System.SysUtils.PathDelim + 'admin.txt') then
      deletefile(System.IOUtils.TPath.GetDocumentsPath +
        System.SysUtils.PathDelim + 'admin.txt');
  except
    on E: exception do
      ShowMessage('Error delete file ' + E.ToString);
  end;
end;

procedure TfrmMainAdmin.profil(img: TBitmap; labelProfile: TLabel);
begin
  labelProfile.Text := a_nm_lengkap;
  loadbase64(img, a_foto);
end;

function TfrmMainAdmin.KonfirmasiClose(AMessage: String): String;
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

procedure TfrmMainAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if KonfirmasiClose('Apakah Kamu Ingin Keluar Dari Aplikasi') = 'Y' then
    Application.Terminate;
end;

procedure TfrmMainAdmin.FormCreate(Sender: TObject);
begin
  // ambilData;
  frmHomeAdmin := TfrmHomeAdmin.Create(frmMainAdmin);
  frmHomeAdmin.Parent := layContent;
  frmHomeAdmin.Align := TAlignLayout.Contents;
  frmHomeAdmin.ambilData;
  dari := 'Home';
end;

procedure TfrmMainAdmin.FormKeyUp(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    Key := 0;
    closeMenu.Visible := True;

    animTransparan.Inverse := False;
    animScaleX.Inverse := False;
    animScaleY.Inverse := False;
    animTransparan.Start;
    animScaleX.Start;
    animScaleY.Start;
  end;
end;

procedure TfrmMainAdmin.Split(const Delimiter: Char; // delimiter charachter
Input: string; // input string
const Strings: TStrings); // list of string result
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
end;

procedure TfrmMainAdmin.menuBantuanClick(Sender: TObject);
begin
  if frmBantuanAdmin = nil then
  begin
    Application.CreateForm(TfrmBantuanAdmin, frmBantuanAdmin);
  end;
  frmBantuanAdmin.form := frmMainAdmin;
  frmBantuanAdmin.Show;
end;

procedure TfrmMainAdmin.menuBantuanTap(Sender: TObject; const Point: TPointF);
begin
  // frmBantuanAdmin.Show;
  // frmBantuanAdmin.form := frmHomeAdmin;
end;

procedure TfrmMainAdmin.menuButtonClick(Sender: TObject);
begin
  layMain.Align := TAlignLayout.None;
  if menuBar.Visible = True then
  begin
    // menuScaleX.Start;
    // menuScaleY.Start;

    FloatAnimation1.Inverse := True;
    FloatAnimation1.Start;
    FloatAnimation2a.Inverse := True;
    FloatAnimation2a.Start;
    FloatAnimation2b.Inverse := True;
    FloatAnimation2b.Start;
  end
  else
  begin
    // menuScaleX.Start;
    // menuScaleY.Start;

    menuBar.Visible := True;

    FloatAnimation1.Inverse := False;
    FloatAnimation1.Start;
    FloatAnimation2a.Inverse := False;
    FloatAnimation2a.Start;
    FloatAnimation2b.Inverse := False;
    FloatAnimation2b.Start;
    // FloatAnimation1.Enabled := true;
    // FloatAnimation2.Enabled := true;
  end;
  layMain.Align := TAlignLayout.Horizontal;
end;

procedure TfrmMainAdmin.menuKeluarClick(Sender: TObject);
begin
  keluarSystem(frmMainAdmin);
end;

procedure TfrmMainAdmin.menuProfilClick(Sender: TObject);
begin
  fnGoFrame(dari, 'Pengguna');
end;

procedure TfrmMainAdmin.menuProfilTap(Sender: TObject; const Point: TPointF);
begin
  // frmPenggunaAdmin.Show;
end;

procedure TfrmMainAdmin.rectCloseTidakTap(Sender: TObject;
const Point: TPointF);
begin
  animTransparan.Inverse := True;
  animScaleX.Inverse := True;
  animScaleY.Inverse := True;
  animTransparan.Start;
  animScaleX.Start;
  animScaleY.Start;
end;

procedure TfrmMainAdmin.rectProfilClick(Sender: TObject);
begin
  if rectMenuProfil.Visible = True then
  begin
    animMenuProfil.Inverse := True;
    animMenuProfil.Start;
  end
  else
  begin
    rectMenuProfil.Visible := True;
    animMenuProfil.Inverse := False;
    animMenuProfil.Start;
  end;
end;

function TfrmMainAdmin.doService(service_path, param: string): TJSONArray;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ResponseBody: string;
begin
  try
    IdHTTP1.Request.Accept := 'application/json';
    IdHTTP1.Request.ContentType := 'application/json';
    ResponseBody := NetHTTPClient1.Get('http://sditulilalbab-kamal.sch.id/api/'
      + service_path + '?' + param).ContentAsString;
    JA := TJSONObject.ParseJSONValue(ResponseBody) as TJSONArray;
    result := JA;
  except
    on E: exception do
      ShowMessage('Error DoServiceHomeGuru ' + E.ToString);
  end;
end;

function TfrmMainAdmin.doServiceGet(service_path, param: string): String;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ResponseBody: string;
begin
  try
    // IdHTTP1.Request.Accept := 'application/json';
    // IdHTTP1.Request.ContentType := 'application/json';
    ResponseBody := NetHTTPClient1.Get('http://sditulilalbab-kamal.sch.id/api/'
      + service_path + '?' + param).ContentAsString;
    result := ResponseBody;
    // JA := TJSONObject.ParseJSONValue(ResponseBody) as TJSONArray;
    // result := JA;
    // showMessage(JA.ToString);
  except
    on E: exception do
      ShowMessage('Error DoServiceHomeGuru ' + E.ToString);
  end;
end;

function TfrmMainAdmin.doServicePost(service_path: string;
param: TStringList): String;
var
  // JA: TJSONArray;
  ResponseBody: string;
begin
  try
    // IdHTTP1.Request.Accept := 'application/json';
    // IdHTTP1.Request.ContentType := 'application/json';
    ResponseBody := NetHTTPClient1.Post('http://sditulilalbab-kamal.sch.id/api/'
      + service_path, param).ContentAsString;
    result := ResponseBody;

    // if ResponseBody = 'ERROR' then
    // ShowMessage('doServicePost = ' + ResponseBody);
    // JA := TJSONArray.Create;
    // if ResponseBody <> 'ERROR' then
    // begin
    // try
    // JA := TJSONObject.ParseJSONValue(ResponseBody) as TJSONArray;
    // except
    // JA := JA;
    // end;
    // doServicePost := JA;
    // // ShowMessage(JA.ToString);
    // end;
  except
    on E: exception do
      ShowMessage('Error DoServicePostHomeGuru ' + E.ToString);
  end;
end;

end.
