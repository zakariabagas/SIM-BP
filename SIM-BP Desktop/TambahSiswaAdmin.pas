unit TambahSiswaAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Ani, FMX.Objects, FMX.DateTimeCtrls, FMX.Edit, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, System.JSON, System.Threading,
  FMX.Memo, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Permissions, FMX.Platform, FMX.DialogService,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TfrmTambahSiswaAdmin = class(TForm)
    Isi: TRectangle;
    lbForm: TLabel;
    Layout1: TLayout;
    rectKlik: TRectangle;
    edNIS: TEdit;
    lbNIS: TLabel;
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
    Layout4: TLayout;
    Label2: TLabel;
    Rectangle3: TRectangle;
    edUser: TEdit;
    Layout5: TLayout;
    Label3: TLabel;
    Rectangle4: TRectangle;
    edPass: TEdit;
    Layout7: TLayout;
    Label11: TLabel;
    rectLaki: TRectangle;
    lbLaki: TLabel;
    rectPerempuan: TRectangle;
    lbPerempuan: TLabel;
    Layout8: TLayout;
    Label1: TLabel;
    Label4: TLabel;
    Rectangle7: TRectangle;
    edTmpLahir: TEdit;
    edDate: TDateEdit;
    Rectangle8: TRectangle;
    edTglLahir: TEdit;
    Layout9: TLayout;
    Label5: TLabel;
    Rectangle11: TRectangle;
    edAlamat: TEdit;
    Layout10: TLayout;
    Label12: TLabel;
    Rectangle12: TRectangle;
    edTelpOrtu: TEdit;
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
    Layout12: TLayout;
    Label14: TLabel;
    Rectangle5: TRectangle;
    edNmOrtu: TEdit;
    mmImgAkhwat: TMemo;
    mmImgDefault: TMemo;
    mmImgIkhwan: TMemo;
    IdHTTP1: TIdHTTP;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    NetHTTPClient1: TNetHTTPClient;
    OpenDialog1: TOpenDialog;
    gambarTemp: TImage;
    VertScrollBox1: TVertScrollBox;
    Layout11: TLayout;
    lbFoto: TLabel;
    crFoto: TCircle;
    Label13: TLabel;
    btnFotoKamera: TImage;
    Label15: TLabel;
    btnFotoGaleri: TImage;
    Label16: TLabel;
    btnImgIkhwan: TImage;
    Label17: TLabel;
    btnImgAkhwat: TImage;
    Label18: TLabel;
    procedure Rectangle8Tap(Sender: TObject; const Point: TPointF);
    procedure edDateChange(Sender: TObject);
    procedure rectKlikTap(Sender: TObject; const Point: TPointF);
    procedure btnFotoKameraClick(Sender: TObject);
    procedure btnFotoGaleriClick(Sender: TObject);
    procedure btnImgIkhwanClick(Sender: TObject);
    procedure btnImgAkhwatClick(Sender: TObject);
    procedure rectPerempuanClick(Sender: TObject);
    procedure rectBackClick(Sender: TObject);
    procedure rectLakiClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, nis, user: String;
    jk: Integer;
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
  frmTambahSiswaAdmin: TfrmTambahSiswaAdmin;

implementation

{$R *.fmx}

uses MainAdmin, SiswaAdmin
{$IFDEF ANDROID}
    , Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App, Androidapi.Helpers, FMX.Platform.Android,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Os
{$ELSEIF Defined(MSWINDOWS)}
    , Winapi.ShellAPI, Winapi.Windows
{$ENDIF}
    ;

{$IFDEF ANDROID}

procedure TfrmTambahSiswaAdmin.TakePhotoFromCameraAction1DidFinishTaking
  (Image: TBitmap);
var
  ubahUkuran: TBitmap;
begin
  ubahUkuran := frmMainAdmin.changeratio(Image);
  crFoto.Fill.Bitmap.Bitmap.Assign(ubahUkuran);
  // rectUploadFoto.Visible := False;
end;

procedure TfrmTambahSiswaAdmin.TakePhotoFromLibraryAction1DidFinishTaking
  (Image: TBitmap);
var
  ubahUkuran: TBitmap;
begin
  ubahUkuran := frmMainAdmin.changeratio(Image);
  crFoto.Fill.Bitmap.Bitmap.Assign(ubahUkuran);
  // rectUploadFoto.Visible := False;
end;

procedure TfrmTambahSiswaAdmin.TakePicturePermissionRequestResult
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

procedure TfrmTambahSiswaAdmin.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('Aplikasi perlu mengakses kamera dan foto perangkat Anda',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;

procedure TfrmTambahSiswaAdmin.LibraryPermissionRequestResult(Sender: TObject;
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

procedure TfrmTambahSiswaAdmin.DisplayMessageLibrary(Sender: TObject;
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

procedure TfrmTambahSiswaAdmin.aktifawal;
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
    lbForm.Text := 'Kelola Data Siswa > ' + 'Tambah Data';
    cleardata;
  end
  else if exe = 'edit' then
  begin
    lbForm.Text := 'Kelola Data Siswa > ' + 'Edit Data';
    ambilData;
  end
  else if exe = 'hapus' then
    lbForm.Text := 'Kelola Data Siswa > ' + 'Hapus Data'
  else
    lbForm.Text := 'Kelola Data Siswa > ' + '';
end;

procedure TfrmTambahSiswaAdmin.Rectangle8Tap(Sender: TObject;
const Point: TPointF);
begin
  edDate.OpenPicker;
end;

procedure TfrmTambahSiswaAdmin.rectBackClick(Sender: TObject);
begin
  frmTambahSiswaAdmin.Hide;
  // freeandnil(frmTambahSiswaAdmin);
end;

procedure TfrmTambahSiswaAdmin.rectKlikTap(Sender: TObject;
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

procedure TfrmTambahSiswaAdmin.rectLakiClick(Sender: TObject);
begin
  rectLaki.Fill.Color := $FFF09037;
  rectLaki.Stroke.Color := $FFF09037;
  lbLaki.TextSettings.FontColor := $FFF8F8F8;
  rectPerempuan.Fill.Color := $FFF8F8F8;
  rectPerempuan.Stroke.Color := $FF3E8551;
  lbPerempuan.TextSettings.FontColor := $FF3E8551;
  jk := 1;
end;

procedure TfrmTambahSiswaAdmin.rectPerempuanClick(Sender: TObject);
begin
  rectPerempuan.Fill.Color := $FFF09037;
  rectPerempuan.Stroke.Color := $FFF09037;
  lbPerempuan.TextSettings.FontColor := $FFF8F8F8;
  rectLaki.Fill.Color := $FFF8F8F8;
  rectLaki.Stroke.Color := $FF3E8551;
  lbLaki.TextSettings.FontColor := $FF3E8551;
  jk := 0;
end;

procedure TfrmTambahSiswaAdmin.btnFotoGaleriClick(Sender: TObject);
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

procedure TfrmTambahSiswaAdmin.btnFotoKameraClick(Sender: TObject);
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

procedure TfrmTambahSiswaAdmin.btnImgAkhwatClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgAkhwat.Text);
end;

procedure TfrmTambahSiswaAdmin.btnImgIkhwanClick(Sender: TObject);
begin
  frmMainAdmin.loadbase64(crFoto.Fill.Bitmap.Bitmap, mmImgIkhwan.Text);
end;

procedure TfrmTambahSiswaAdmin.btnSimpanClick(Sender: TObject);
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

procedure TfrmTambahSiswaAdmin.cleardata;
begin
  edNIS.Text := '';
  edNmLengkap.Text := '';
  edNmPanggilan.Text := '';
  edUser.Text := '';
  edPass.Text := '';
  edAlamat.Text := '';
  edNmOrtu.Text := '';
  edTelpOrtu.Text := '';
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

procedure TfrmTambahSiswaAdmin.edDateChange(Sender: TObject);
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

procedure TfrmTambahSiswaAdmin.ambilData;
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
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := true;
        end);
      // fnClearStg;
      JA := frmMainAdmin.doService('siswaAdmin.php',
        'exe=id' + '&nis=' + frmSiswaAdmin.nis);
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
              edNIS.Text := JV.GetValue('s_nis', '');
              nis := JV.GetValue('s_nis', '');
              edNmLengkap.Text := JV.GetValue('s_nm_lengkap', '');
              edNmPanggilan.Text := JV.GetValue('s_nm_panggilan', '');
              edUser.Text := JV.GetValue('s_user', '');
              user := JV.GetValue('s_user', '');
              edPass.Text := JV.GetValue('s_pass', '');
              edAlamat.Text := JV.GetValue('s_alamat', '');
              edNmOrtu.Text := JV.GetValue('s_nm_ortu', '');
              edTelpOrtu.Text := JV.GetValue('s_telepon', '');
              edTmpLahir.Text := JV.GetValue('s_tmp_lahir', '');

              pecahLahir := TStringList.Create;
              try
                frmMainAdmin.Split('-', JV.GetValue('s_tgl_lahir', ''),
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
                JV.GetValue('s_foto', ''));
              if JV.GetValue('s_jk', '') = '0' then
              begin
                rectPerempuan.Fill.Color := $FFF09037;
                rectPerempuan.Stroke.Color := $FFF09037;
                lbPerempuan.TextSettings.FontColor := $FFF8F8F8;
                rectLaki.Fill.Color := $FFF8F8F8;
                rectLaki.Stroke.Color := $FF3E8551;
                lbLaki.TextSettings.FontColor := $FF3E8551;
                jk := 0;
              end
              else if JV.GetValue('s_jk', '') = '1' then
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
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := false;
        end);
    end).Start;
end;

procedure TfrmTambahSiswaAdmin.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  if edNIS.Text = '' then
    ShowMessage('NIS Belum Diisi')
  else if edUser.Text = '' then
    ShowMessage('Username Belum Diisi')
  else if edPass.Text = '' then
    ShowMessage('Password Belum Diisi')
  else
  begin
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('nis_lama=' + nis);
    ParamList.Add('nis=' + edNIS.Text);
    ParamList.Add('user=' + edUser.Text);
    ParamList.Add('user_lama=' + user);
    ParamList.Add('pass=' + edPass.Text);
    ParamList.Add('nm_lengkap=' + edNmLengkap.Text);
    ParamList.Add('nm_panggilan=' + edNmPanggilan.Text);
    ParamList.Add('jk=' + inttostr(jk));
    ParamList.Add('tmp_lahir=' + edTmpLahir.Text);
    ParamList.Add('tgl_lahir=' + FormatDateTime('yyyy-mm-dd', edDate.Date));
    ParamList.Add('alamat=' + edAlamat.Text);
    ParamList.Add('nm_ortu=' + edNmOrtu.Text);
    ParamList.Add('telp_ortu=' + edTelpOrtu.Text);
    foto := frmMainAdmin.converttob64(crFoto.Fill.Bitmap.Bitmap);
    ParamList.Add('foto=' + foto);

    ResponseBody := NetHTTPClient1.Post
      ('http://sditulilalbab-kamal.sch.id/api/siswaAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Siswa');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Siswa');
      end;
      frmTambahSiswaAdmin.Hide;
      frmSiswaAdmin.ambilData('');
      freeandnil(frmTambahSiswaAdmin);
    end
    else
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Siswa');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Siswa');
      end;
    end;
    ParamList.Free;
  end;
end;

end.
