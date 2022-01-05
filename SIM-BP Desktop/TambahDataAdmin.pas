unit TambahDataAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Ani, FMX.Objects, FMX.Edit, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, System.JSON, System.Threading,
  FMX.Memo, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Permissions, FMX.Platform, FMX.DialogService,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TfrmTambahDataAdmin = class(TForm)
    Isi: TRectangle;
    lbForm: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edNmLengkap: TEdit;
    lbNmLengkap: TLabel;
    btnSimpan: TRectangle;
    lbSimpan: TLabel;
    ColorAnimation1: TColorAnimation;
    Layout4: TLayout;
    Label2: TLabel;
    rectKlik: TRectangle;
    edUser: TEdit;
    Layout5: TLayout;
    Label3: TLabel;
    Rectangle4: TRectangle;
    edPass: TEdit;
    Layout10: TLayout;
    Label12: TLabel;
    Rectangle12: TRectangle;
    edTelp: TEdit;
    Image9: TImage;
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
    mmImgAkhwat: TMemo;
    mmImgDefault: TMemo;
    mmImgIkhwan: TMemo;
    IdHTTP1: TIdHTTP;
    NetHTTPClient1: TNetHTTPClient;
    VertScrollBox1: TVertScrollBox;
    OpenDialog1: TOpenDialog;
    gambarTemp: TImage;
    ActionList1: TActionList;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    Layout11: TLayout;
    lbFoto: TLabel;
    crFoto: TCircle;
    Label1: TLabel;
    btnFotoKamera: TImage;
    Label5: TLabel;
    btnFotoGaleri: TImage;
    Label4: TLabel;
    btnImgIkhwan: TImage;
    Label11: TLabel;
    btnImgAkhwat: TImage;
    Label13: TLabel;
    procedure rectKlikTap(Sender: TObject; const Point: TPointF);
    procedure btnFotoKameraClick(Sender: TObject);
    procedure btnFotoGaleriClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnImgIkhwanClick(Sender: TObject);
    procedure btnImgAkhwatClick(Sender: TObject);
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, user, ubah: String;
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
  frmTambahDataAdmin: TfrmTambahDataAdmin;

implementation

{$R *.fmx}

uses MainAdmin, DataAdmin, PenggunaAdmin
{$IF Defined(ANDROID)}
    , Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App, Androidapi.Helpers, FMX.Platform.Android,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Os
{$ELSEIF Defined(MSWINDOWS)}
    , Winapi.ShellAPI, Winapi.Windows
{$ENDIF}
    ;

{$IFDEF ANDROID}

procedure TfrmTambahDataAdmin.TakePicturePermissionRequestResult
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

procedure TfrmTambahDataAdmin.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('Aplikasi perlu mengakses kamera dan foto perangkat Anda',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;

procedure TfrmTambahDataAdmin.LibraryPermissionRequestResult(Sender: TObject;
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

procedure TfrmTambahDataAdmin.DisplayMessageLibrary(Sender: TObject;
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

procedure TfrmTambahDataAdmin.aktifawal;
begin
{$IFDEF ANDROID}
  PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage := JStringToString
    (TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString
    (TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
  if ubah = 'profil' then
  begin
    lbForm.Text := 'Ubah Profil > ' + user;
    ambilData;
  end
  else if ubah = 'data' then
  begin
    if exe = 'tambah' then
    begin
      lbForm.Text := 'Kelola Data Admin > ' + 'Tambah Data';
      cleardata;
    end
    else if exe = 'edit' then
    begin
      lbForm.Text := 'Kelola Data Admin > ' + 'Edit Data';
      ambilData;
    end
    else if exe = 'hapus' then
      lbForm.Text := 'Kelola Data Admin > ' + 'Hapus Data'
    else
      lbForm.Text := 'Kelola Data Admin > ' + '';
  end;
end;

procedure TfrmTambahDataAdmin.rectBackClick(Sender: TObject);
begin
  frmTambahDataAdmin.Hide;
end;

procedure TfrmTambahDataAdmin.rectKlikTap(Sender: TObject;
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

procedure TfrmTambahDataAdmin.btnFotoGaleriClick(Sender: TObject);
{$IF Defined(MSWINDOWS)}
var
  image: TBitmap;
  ubahUkuran: TBitmap;
  m_image: TBitmap;
{$ENDIF}
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

procedure TfrmTambahDataAdmin.btnFotoKameraClick(Sender: TObject);
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

procedure TfrmTambahDataAdmin.btnImgAkhwatClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgAkhwat.Text);
end;

procedure TfrmTambahDataAdmin.btnImgIkhwanClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgIkhwan.Text);
end;

procedure TfrmTambahDataAdmin.btnSimpanClick(Sender: TObject);
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

procedure TfrmTambahDataAdmin.cleardata;
begin
  edNmLengkap.Text := '';
  edUser.Text := '';
  edPass.Text := '';
  edTelp.Text := '';
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgDefault.Text);
end;

procedure TfrmTambahDataAdmin.ambilData;
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      I, iplus, x: Integer;
      kontenSementara: String;
      content, pecahLahir: TStringList;
      lahir_tahun, lahir_tanggal, lahir_bulan: String;
    begin
      Loading.Visible := true;
      // fnClearStg;
      JA := frmMainAdmin.doService('dataAdmin.php', 'exe=id' + '&user=' + user);
      I := 0;
      if JA.ToString <> '[]' then
      begin
        for JV in JA do
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              edNmLengkap.Text := JV.GetValue('a_nm_lengkap', '');
              edUser.Text := JV.GetValue('a_user', '');
              edPass.Text := JV.GetValue('a_pass', '');
              edTelp.Text := JV.GetValue('a_telepon', '');
              frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap,
                JV.GetValue('a_foto', ''));
            end);
        end;
      end;
      Loading.Visible := false;
    end).Start;
end;

procedure TfrmTambahDataAdmin.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  if edUser.Text = '' then
    ShowMessage('Username Belum Diisi')
  else if edPass.Text = '' then
    ShowMessage('Password Belum Diisi')
  else
  begin
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('user_lama=' + user);
    ParamList.Add('user=' + edUser.Text);
    ParamList.Add('pass=' + edPass.Text);
    ParamList.Add('nm_lengkap=' + edNmLengkap.Text);
    ParamList.Add('telepon=' + edTelp.Text);
    foto := frmMainAdmin.converttob64(crFoto.Fill.Bitmap.Bitmap);
    ParamList.Add('foto=' + foto);

    ResponseBody := NetHTTPClient1.Post
      ('http://sditulilalbab-kamal.sch.id/api/dataAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Admin');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Admin');
      end;
      frmTambahDataAdmin.Hide;
      frmDataAdmin.ambilData('');
      freeandnil(frmTambahDataAdmin);
    end
    else
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Admin');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Admin');
      end;
    end;
    ParamList.Free;
  end;
end;

end.
