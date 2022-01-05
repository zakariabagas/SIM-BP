unit TambahGuruAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.DateTimeCtrls, FMX.Effects, FMX.Ani, FMX.Objects, FMX.Edit, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, System.JSON,
  System.Threading, FMX.Memo, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList,
  FMX.StdActns,
  System.Permissions, FMX.Platform, FMX.DialogService, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TfrmTambahGuruAdmin = class(TForm)
    Isi: TRectangle;
    lbForm: TLabel;
    Layout1: TLayout;
    rectKlik: TRectangle;
    edNIP: TEdit;
    lbNIP: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edNmLengkap: TEdit;
    lbNmLengkap: TLabel;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    edNmPanggilan: TEdit;
    lbNmPanggilan: TLabel;
    btnSimpan: TRectangle;
    lbSimpan: TLabel;
    ColorAnimation1: TColorAnimation;
    Menu: TRectangle;
    Layout6: TLayout;
    btnBotBeranda: TLayout;
    Image3: TImage;
    Label6: TLabel;
    btnBotIsi: TLayout;
    Image2: TImage;
    Label7: TLabel;
    btnBotCatatan: TLayout;
    Image4: TImage;
    Label8: TLabel;
    btnBotSiswa: TLayout;
    Image5: TImage;
    Label9: TLabel;
    btnBotUser: TLayout;
    Image6: TImage;
    Label10: TLabel;
    Title: TRectangle;
    lbTitle: TLabel;
    rectBack: TRectangle;
    Image1: TImage;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    Layout4: TLayout;
    lbUser: TLabel;
    Rectangle3: TRectangle;
    edUser: TEdit;
    Layout5: TLayout;
    lbPass: TLabel;
    Rectangle4: TRectangle;
    edPass: TEdit;
    Layout7: TLayout;
    Label11: TLabel;
    rectLaki: TRectangle;
    lbLaki: TLabel;
    rectPerempuan: TRectangle;
    lbPerempuan: TLabel;
    Layout8: TLayout;
    lbTTL: TLabel;
    Label4: TLabel;
    Rectangle7: TRectangle;
    edTmpLahir: TEdit;
    edDate: TDateEdit;
    Rectangle8: TRectangle;
    edTglLahir: TEdit;
    Layout9: TLayout;
    lbAlamat: TLabel;
    Rectangle11: TRectangle;
    edAlamat: TEdit;
    Layout10: TLayout;
    lbTelp: TLabel;
    Rectangle12: TRectangle;
    edTelp: TEdit;
    Layout11: TLayout;
    lbFoto: TLabel;
    crFoto: TCircle;
    btnFotoKamera: TImage;
    btnFotoGaleri: TImage;
    Image9: TImage;
    btnImgIkhwan: TImage;
    btnImgAkhwat: TImage;
    mmImgDefault: TMemo;
    mmImgIkhwan: TMemo;
    mmImgAkhwat: TMemo;
    IdHTTP1: TIdHTTP;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    NetHTTPClient1: TNetHTTPClient;
    OpenDialog1: TOpenDialog;
    gambarTemp: TImage;
    VertScrollBox1: TVertScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    procedure Rectangle8Tap(Sender: TObject; const Point: TPointF);
    procedure edDateChange(Sender: TObject);
    procedure rectKlikTap(Sender: TObject; const Point: TPointF);
    // procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    // procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure btnFotoKameraClick(Sender: TObject);
    procedure btnFotoGaleriClick(Sender: TObject);
    procedure btnImgIkhwanClick(Sender: TObject);
    procedure btnImgAkhwatClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure rectLakiClick(Sender: TObject);
    procedure rectPerempuanClick(Sender: TObject);
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, nip, user: String;
    jk: Integer;
    foto: String;
{$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage: string;

    procedure TakePicturePermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageCamera(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
    procedure LibraryPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
{$ENDIF}
    procedure cleardata;
    procedure ambilData;
    procedure simpanData(crud: String);
    procedure aktifawal;
  end;

var
  frmTambahGuruAdmin: TfrmTambahGuruAdmin;

implementation

{$R *.fmx}

uses MainAdmin, GuruAdmin
{$IFDEF ANDROID}
    , Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App, Androidapi.Helpers, FMX.Platform.Android,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Os
{$ELSEIF Defined(MSWINDOWS)}
    , Winapi.ShellAPI, Winapi.Windows
{$ENDIF}
    ;

{$IFDEF ANDROID}

procedure TfrmTambahGuruAdmin.TakePhotoFromCameraAction1DidFinishTaking
  (Image: TBitmap);
var
  ubahUkuran: TBitmap;
begin
  ubahUkuran := frmMainAdmin.changeratio(Image);
  crFoto.Fill.Bitmap.Bitmap.Assign(ubahUkuran);
  // rectUploadFoto.Visible := False;
end;

procedure TfrmTambahGuruAdmin.TakePhotoFromLibraryAction1DidFinishTaking
  (Image: TBitmap);
var
  ubahUkuran: TBitmap;
begin
  ubahUkuran := frmMainAdmin.changeratio(Image);
  crFoto.Fill.Bitmap.Bitmap.Assign(ubahUkuran);
  // rectUploadFoto.Visible := False;
end;

procedure TfrmTambahGuruAdmin.TakePicturePermissionRequestResult
  (Sender: TObject; const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (Length(AGrantResults) = 3) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) and
    (AGrantResults[2] = TPermissionStatus.Granted) then
    TakePhotoFromCameraAction1.Execute
  else
    TDialogService.ShowMessage('Anda tidak diperbolehkan mengambil foto');
end;

procedure TfrmTambahGuruAdmin.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('Aplikasi perlu mengakses kamera dan foto perangkat Anda',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;

procedure TfrmTambahGuruAdmin.LibraryPermissionRequestResult(Sender: TObject;
const APermissions: TArray<string>;
const AGrantResults: TArray<TPermissionStatus>);
begin
  // 2 Permissoes: READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
    TakePhotoFromLibraryAction1.Execute
  else
    TDialogService.ShowMessage('Anda tidak diizinkan mengakses foto');
end;

procedure TfrmTambahGuruAdmin.DisplayMessageLibrary(Sender: TObject;
const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('Aplikasi perlu mengakses foto dari perangkat Anda',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;

{$ENDIF}

procedure TfrmTambahGuruAdmin.edDateChange(Sender: TObject);
var
  TglLahir: String;
  BlnLahir: String;
  ThnLahir: String;
begin
  // edHariLahir.Text:= FormatDateTime('dd', DateEdit1.Date);
  // edBulanLahir.Text:= FormatDateTime('mm', DateEdit1.Date);
  // edTahunLahir.Text:= FormatDateTime('yyyy', DateEdit1.Date);
  TglLahir := FormatDateTime('dd', edDate.Date);
  BlnLahir := FormatDateTime('mm', edDate.Date);
  ThnLahir := FormatDateTime('yyyy', edDate.Date);
  edTglLahir.Text := TglLahir + ' ' + frmMainAdmin.ubahBulan(BlnLahir) + ' '
    + ThnLahir;
end;

procedure TfrmTambahGuruAdmin.aktifawal;
begin
{$IFDEF ANDROID}
  PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage := JStringToString
    (TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString
    (TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
  if exe = 'tambah' then
  begin
    lbForm.Text := 'Kelola Data Guru > ' + 'Tambah Data';
    cleardata;
  end
  else if exe = 'edit' then
  begin
    lbForm.Text := 'Kelola Data Guru > ' + 'Edit Data';
    ambilData;
  end
  else if exe = 'hapus' then
    lbForm.Text := 'Kelola Data Guru > ' + 'Hapus Data'
  else
    lbForm.Text := 'Kelola Data Guru > ' + '';
end;

procedure TfrmTambahGuruAdmin.btnFotoGaleriClick(Sender: TObject);
begin
{$IF Defined(ANDROID)}
  PermissionsService.RequestPermissions([PermissaoReadStorage,
    PermissaoWriteStorage], LibraryPermissionRequestResult,
    DisplayMessageLibrary);
{$ELSEIF Defined(IOS)}
  TakePhotoFromLibraryAction1.Execute;
{$ELSEIF Defined(MSWINDOWS)}
  OpenDialog1.Title := 'Upload Gambar';
  OpenDialog1.Filter :=
    'Image Files (*.bmp;*.jpg;*.jpeg,*.png)|*.BMP;*.JPG;*.JPEG;*.PNG';
  if OpenDialog1.Execute then
  begin
    gambarTemp.Bitmap.LoadFromFile(OpenDialog1.FileName);
    // m_Image = new Bitmap(dialog.FileName);
    // ubahUkuran := frmMainAdmin.changeratio(gambarTemp.Bitmap);
    // ubahUkuran := frmMainAdmin.changeratio(gambarTemp.Bitmap);
    crFoto.Fill.Bitmap.Bitmap.Assign
      (frmMainAdmin.changeratio(gambarTemp.Bitmap));
  end;
{$ENDIF}
end;

procedure TfrmTambahGuruAdmin.btnFotoKameraClick(Sender: TObject);
begin
{$IF Defined(ANDROID)}
  PermissionsService.RequestPermissions([PermissaoCamera, PermissaoReadStorage,
    PermissaoWriteStorage], TakePicturePermissionRequestResult,
    DisplayMessageCamera);
{$ELSEIF Defined(IOS)}
  TakePhotoFromCameraAction1.Execute;
{$ELSEIF Defined(MSWINDOWS)}
  ShellExecute(0, 'OPEN', PChar('microsoft.windows.camera:'), '', '', 1);
{$ENDIF}
end;

procedure TfrmTambahGuruAdmin.btnImgAkhwatClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgAkhwat.Text);
end;

procedure TfrmTambahGuruAdmin.btnImgIkhwanClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgIkhwan.Text);
end;

procedure TfrmTambahGuruAdmin.btnSimpanClick(Sender: TObject);
begin
  if exe = 'tambah' then
  begin
    simpanData(exe);
  end
  else if exe = 'edit' then
  begin
    simpanData(exe);
  end;
end;

procedure TfrmTambahGuruAdmin.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  if edNIP.Text = '' then
    ShowMessage('NIP Belum Diisi')
  else if edUser.Text = '' then
    ShowMessage('Username Belum Diisi')
  else if edPass.Text = '' then
    ShowMessage('Password Belum Diisi')
  else
  begin
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('nip_lama=' + nip);
    ParamList.Add('nip=' + edNIP.Text);
    ParamList.Add('user=' + edUser.Text);
    ParamList.Add('user_lama=' + user);
    ParamList.Add('pass=' + edPass.Text);
    ParamList.Add('nm_lengkap=' + edNmLengkap.Text);
    ParamList.Add('nm_panggilan=' + edNmPanggilan.Text);
    ParamList.Add('jk=' + inttostr(jk));
    ParamList.Add('tmp_lahir=' + edTmpLahir.Text);
    ParamList.Add('tgl_lahir=' + FormatDateTime('yyyy-mm-dd', edDate.Date));
    ParamList.Add('alamat=' + edAlamat.Text);
    ParamList.Add('telepon=' + edTelp.Text);
    foto := frmMainAdmin.converttob64(crFoto.Fill.Bitmap.Bitmap);
    ParamList.Add('foto=' + foto);

    ResponseBody := NetHTTPClient1.Post
      ('http://sditulilalbab-kamal.sch.id/api/guruAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Guru');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Guru');
      end;
      frmTambahGuruAdmin.Hide;
      frmGuruAdmin.ambilData('');
      freeandnil(frmTambahGuruAdmin);
    end
    else
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Guru');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Guru');
      end;
    end;
    ParamList.Free;
  end;
end;

procedure TfrmTambahGuruAdmin.cleardata;
begin
  edNIP.Text := '';
  edNmLengkap.Text := '';
  edNmPanggilan.Text := '';
  edUser.Text := '';
  edPass.Text := '';
  edAlamat.Text := '';
  edTelp.Text := '';
  edTmpLahir.Text := '';
  edDate.Date := Now;
  edTglLahir.Text := '';
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgDefault.Text);
  rectPerempuan.Fill.Color := $FFF8F8F8;
  rectPerempuan.Stroke.Color := $FF3E8551;
  lbPerempuan.TextSettings.FontColor := $FF3E8551;
  rectLaki.Fill.Color := $FFF8F8F8;
  rectLaki.Stroke.Color := $FF3E8551;
  lbLaki.TextSettings.FontColor := $FF3E8551;
end;

procedure TfrmTambahGuruAdmin.ambilData;
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      I, iplus, X: Integer;
      kontenSementara: String;
      content, pecahLahir: TStringList;
      lahir_tahun, lahir_tanggal, lahir_bulan: String;
    begin
      Loading.Visible := true;
      // fnClearStg;
      JA := frmMainAdmin.doService('guruAdmin.php',
        'exe=id' + '&nip=' + frmGuruAdmin.nip);
      I := 0;
      // stgMain.RowCount := JA.Count;

      // showMessage(JA.ToString);

      if JA.ToString <> '[]' then
      begin
        for JV in JA do
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              // iplus := I + 1;
              // stgMain.Cells[0, I] := inttostr(iplus);
              // stgMain.Cells[1, I] := JV.GetValue('ib_indikator_id', '');
              // stgMain.Cells[2, I] := JV.GetValue('ib_indikator', '');
              // stgMain.Cells[3, I] := JV.GetValue('k_nm_kelas', '');
              // stgMain.Cells[4, I] := JV.GetValue('ib_ia', '');
              // stgMain.Cells[5, I] := JV.GetValue('ib_status', '');
              // stgMain.Cells[6, I] := JV.GetValue('ib_id', '');
              // I := iplus;
              // // ShowMessage(JV.GetValue('ib_indikator', ''));
              edNIP.Text := JV.GetValue('g_nip', '');
              nip := JV.GetValue('g_nip', '');
              edNmLengkap.Text := JV.GetValue('g_nm_lengkap', '');
              edNmPanggilan.Text := JV.GetValue('g_nm_panggilan', '');
              edUser.Text := JV.GetValue('g_user', '');
              user := JV.GetValue('g_user', '');
              edPass.Text := JV.GetValue('g_pass', '');
              edAlamat.Text := JV.GetValue('g_alamat', '');
              edTelp.Text := JV.GetValue('g_telepon', '');
              edTmpLahir.Text := JV.GetValue('g_tmp_lahir', '');

              pecahLahir := TStringList.Create;
              try
                frmMainAdmin.Split('-', JV.GetValue('g_tgl_lahir', ''),
                  pecahLahir);
                lahir_tahun := pecahLahir[0];
                lahir_bulan := pecahLahir[1];
                lahir_tanggal := pecahLahir[2];
              finally
                pecahLahir.Free;
              end;
              edTglLahir.Text := lahir_tanggal + ' ' + frmMainAdmin.ubahBulan
                (lahir_bulan) + ' ' + lahir_tahun;
              edDate.Date := StrToDate(lahir_tanggal + '/' + lahir_bulan + '/' +
                lahir_tahun);
              frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap,
                JV.GetValue('g_foto', ''));
              if JV.GetValue('g_jk', '') = '0' then
              begin
                rectPerempuan.Fill.Color := $FFF09037;
                rectPerempuan.Stroke.Color := $FFF09037;
                lbPerempuan.TextSettings.FontColor := $FFF8F8F8;
                rectLaki.Fill.Color := $FFF8F8F8;
                rectLaki.Stroke.Color := $FF3E8551;
                lbLaki.TextSettings.FontColor := $FF3E8551;
                jk := 0;
              end
              else if JV.GetValue('g_jk', '') = '1' then
              begin
                rectLaki.Fill.Color := $FFF09037;
                rectLaki.Stroke.Color := $FFF09037;
                lbLaki.TextSettings.FontColor := $FFF8F8F8;
                rectPerempuan.Fill.Color := $FFF8F8F8;
                rectPerempuan.Stroke.Color := $FF3E8551;
                lbPerempuan.TextSettings.FontColor := $FF3E8551;
                jk := 1;
              end;
            end);
        end;
      end;
      Loading.Visible := false;
    end).Start;
end;

procedure TfrmTambahGuruAdmin.Rectangle8Tap(Sender: TObject;
const Point: TPointF);
begin
  edDate.OpenPicker;
end;

procedure TfrmTambahGuruAdmin.rectBackClick(Sender: TObject);
begin
  frmTambahGuruAdmin.Hide;
  // freeandnil(frmTambahGuruAdmin);
end;

procedure TfrmTambahGuruAdmin.rectKlikTap(Sender: TObject;
const Point: TPointF);
var
  R: TRectangle;
  I: Integer;
begin
  R := TRectangle(Sender);
  for I := 0 to R.ControlsCount - 1 do
    if R.Controls[I] is TEdit then
    begin
      TEdit(R.Controls[I]).SetFocus;
    end;
end;

procedure TfrmTambahGuruAdmin.rectLakiClick(Sender: TObject);
begin
  rectLaki.Fill.Color := $FFF09037;
  rectLaki.Stroke.Color := $FFF09037;
  lbLaki.TextSettings.FontColor := $FFF8F8F8;
  rectPerempuan.Fill.Color := $FFF8F8F8;
  rectPerempuan.Stroke.Color := $FF3E8551;
  lbPerempuan.TextSettings.FontColor := $FF3E8551;
  jk := 1;
end;

procedure TfrmTambahGuruAdmin.rectPerempuanClick(Sender: TObject);
begin
  rectPerempuan.Fill.Color := $FFF09037;
  rectPerempuan.Stroke.Color := $FFF09037;
  lbPerempuan.TextSettings.FontColor := $FFF8F8F8;
  rectLaki.Fill.Color := $FFF8F8F8;
  rectLaki.Stroke.Color := $FF3E8551;
  lbLaki.TextSettings.FontColor := $FF3E8551;
  jk := 0;
end;

end.
