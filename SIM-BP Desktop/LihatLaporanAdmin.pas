unit LihatLaporanAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.DateTimeCtrls, FMXTee.Series, FMXTee.Engine, FMXTee.Procs,
  FMXTee.Chart, FMX.ScrollBox, FMX.Layouts, FMX.Objects, FMX.Ani,
  FMX.Controls.Presentation, FMX.Effects, System.JSON, System.Threading;

type
  TfrmLihatLaporanAdmin = class(TFrame)
    content: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    btnCetak: TRectangle;
    Label11: TLabel;
    ColorAnimation6: TColorAnimation;
    Image11: TImage;
    layGrafikIndikator: TLayout;
    layPilihIndikator: TLayout;
    lbPilihIndikator: TLabel;
    lbJudulGrafikIndikatorSiswa: TLabel;
    lbSubJudulGrafikIndikatorSiswa: TLabel;
    PresentedScrollBox2: TPresentedScrollBox;
    chIndikator: TChart;
    Label16: TLabel;
    Label17: TLabel;
    AreaSeries1: TAreaSeries;
    LineSeries1: TLineSeries;
    layNilaiIndikator: TLayout;
    rectNilaiIndikator: TRectangle;
    lbIndikator: TLabel;
    lbNilaiIndikator: TLabel;
    ShadowEffect1: TShadowEffect;
    lbRataIndikator: TLabel;
    lbNilaiRataIndikator: TLabel;
    Layout2: TLayout;
    rectIndikatorRumah: TRectangle;
    imgRumahUnselected: TImage;
    lbIndikatorRumah: TLabel;
    lbNilaiRumah: TLabel;
    ShadowEffect5: TShadowEffect;
    imgRumahSelected: TImage;
    lbTitleNilaiRumah: TLabel;
    lbTitleRataRumah: TLabel;
    lbRataRumah: TLabel;
    rectIndikatorSekolah: TRectangle;
    imgSekolahUnselected: TImage;
    lbIndikatorSekolah: TLabel;
    lbNilaiSekolah: TLabel;
    ShadowEffect7: TShadowEffect;
    ImgSekolahSelected: TImage;
    lbTitleNilaiSekolah: TLabel;
    lbTitleRataSekolah: TLabel;
    lbRataSekolah: TLabel;
    lbForm: TLabel;
    lbJudulGrafik: TLabel;
    lbNmIndikator: TLabel;
    lbSubJudulGrafik: TLabel;
    PresentedScrollBox1: TPresentedScrollBox;
    chMain: TChart;
    Label12: TLabel;
    Label13: TLabel;
    Series1: TAreaSeries;
    Series2: TLineSeries;
    Rectangle1: TRectangle;
    rectNmSiswa: TRectangle;
    lbNamaSiswa: TLabel;
    Image12: TImage;
    rectHarian: TRectangle;
    boxHari: TRectangle;
    lbHarian: TLabel;
    rectBulanan: TRectangle;
    boxBulan: TRectangle;
    lbBulanan: TLabel;
    rectSemesteran: TRectangle;
    boxSemester: TRectangle;
    lbSemesteran: TLabel;
    rectTanggal: TRectangle;
    lbTanggal: TLabel;
    Image13: TImage;
    edDate: TDateEdit;
    btnResetTgl: TRectangle;
    lbResetTgl: TLabel;
    ColorAnimation4: TColorAnimation;
    layKelas: TLayout;
    Rectangle3: TRectangle;
    cbKelas: TComboBox;
    lbKelas: TLabel;
    btnLihat: TRectangle;
    Label49: TLabel;
    ColorAnimation5: TColorAnimation;
    layListSiswa: TLayout;
    rectListSiswa: TRectangle;
    Rectangle4: TRectangle;
    lbListNmSiswa: TLabel;
    rectDaftarLaporanSiswa: TRectangle;
    Rectangle2: TRectangle;
    btnTutup: TImage;
    rectPilihIndikator: TRectangle;
    cbPilihIndikator: TComboBox;
    VertScrollBox4: TVertScrollBox;
    VertScrollBox3: TVertScrollBox;
    procedure cbKelasChange(Sender: TObject);
    procedure cbPilihIndikatorChange(Sender: TObject);
    procedure rectHarianClick(Sender: TObject);
    procedure rectListSiswaClick(Sender: TObject);
    procedure rectBulananClick(Sender: TObject);
    procedure rectIndikatorRumahClick(Sender: TObject);
    procedure rectIndikatorSekolahClick(Sender: TObject);
    procedure rectSemesteranClick(Sender: TObject);
    procedure edDateChange(Sender: TObject);
    procedure rectNmSiswaClick(Sender: TObject);
    procedure rectTanggalClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure btnResetTglClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    XX, o, x, YY, i, y, durasi: Integer;
    TglUpload, NISN, NmSiswa, statusklik: String;
    arrId, arrKelas, arrNISN, arrNmSiswa, arrNmWK, arrIdPilihIndikator,
      arrNamaIndikator: TStringList;

    IndikatorNilai, IndikatorLabel, IndikatorKode: TStringList;

    indA_I_1, indA_I_2, indA_I_3, indA_I_4, indA_I_5, indA_I_6, indA_I_7,
      indA_I_8, indA_A_1, indA_A_2, indA_A_3, indA_A_4, indA_A_5: String;
    indB_I_1, indB_I_2, indB_I_3, indB_I_4, indB_I_5, indB_I_6, indB_I_7,
      indB_I_8, indB_I_9, indB_A_1, indB_A_2, indB_A_3, indB_A_4, indB_A_5,
      indB_A_6, indB_A_7, indB_A_8: String;

    A_I_1, A_I_2, A_I_3, A_I_4, A_I_5, A_I_6, A_I_7, A_I_8, A_A_1, A_A_2, A_A_3,
      A_A_4, A_A_5: Integer;
    B_I_1, B_I_2, B_I_3, B_I_4, B_I_5, B_I_6, B_I_7, B_I_8, B_I_9, B_A_1, B_A_2,
      B_A_3, B_A_4, B_A_5, B_A_6, B_A_7, B_A_8: Integer;
    totA_I_1, totA_I_2, totA_I_3, totA_I_4, totA_I_5, totA_I_6, totA_I_7,
      totA_I_8, totA_A_1, totA_A_2, totA_A_3, totA_A_4, totA_A_5, totB_I_1,
      totB_I_2, totB_I_3, totB_I_4, totB_I_5, totB_I_6, totB_I_7, totB_I_8,
      totB_I_9, totB_A_1, totB_A_2, totB_A_3, totB_A_4, totB_A_5, totB_A_6,
      totB_A_7, totB_A_8: Integer;
    rataA_I_1, rataA_I_2, rataA_I_3, rataA_I_4, rataA_I_5, rataA_I_6, rataA_I_7,
      rataA_I_8, rataA_A_1, rataA_A_2, rataA_A_3, rataA_A_4, rataA_A_5,
      rataB_I_1, rataB_I_2, rataB_I_3, rataB_I_4, rataB_I_5, rataB_I_6,
      rataB_I_7, rataB_I_8, rataB_I_9, rataB_A_1, rataB_A_2, rataB_A_3,
      rataB_A_4, rataB_A_5, rataB_A_6, rataB_A_7, rataB_A_8: Integer;
    chartA_I_1, chartA_I_2, chartA_I_3, chartA_I_4, chartA_I_5, chartA_I_6,
      chartA_I_7, chartA_I_8, chartA_A_1, chartA_A_2, chartA_A_3, chartA_A_4,
      chartA_A_5, chartB_I_1, chartB_I_2, chartB_I_3, chartB_I_4, chartB_I_5,
      chartB_I_6, chartB_I_7, chartB_I_8, chartB_I_9, chartB_A_1, chartB_A_2,
      chartB_A_3, chartB_A_4, chartB_A_5, chartB_A_6, chartB_A_7,
      chartB_A_8: Integer;

    procedure CreateAwal;
    procedure reset;
    procedure ambilKelas;
    procedure cloneIndikator(vs: TVertScrollBox);
    procedure clone2(vs: TVertScrollBox);
    procedure showDataSiswa(id: String);
    procedure showdataIndikator(nis, tanggal: String);
    procedure rataIndikator(nis, tanggal: String);
    procedure grafikIndikator(nis, tanggal: String);
    procedure grafikRataIndikator(tanggal: String);
    procedure inputChart(JA: TJSONArray; tanggal, chartSeries: String);
    procedure pilihIndikator;
    procedure cetakLaporan(nis, tanggal: String);
    procedure Open(URL: string);
  end;

var
  frmLihatLaporanAdmin: TfrmLihatLaporanAdmin;

implementation

{$R *.fmx}

uses MainAdmin
{$IF Defined(MSWINDOWS)}
    , Winapi.ShellAPI, Winapi.Windows
{$ENDIF}
    ;

procedure TfrmLihatLaporanAdmin.rectBulananClick(Sender: TObject);
begin
  durasi := 2;

  lbHarian.TextSettings.FontColor := $FF78BC71;
  boxHari.Fill.Color := $FFEAEAEA;

  lbBulanan.TextSettings.FontColor := $FFF09037;
  boxBulan.Fill.Color := $FFF09037;

  lbSemesteran.TextSettings.FontColor := $FF78BC71;
  boxSemester.Fill.Color := $FFEAEAEA;

  edDate.Format := 'yyyy-mm';
  TglUpload := FormatDateTime('yyyy-mm-dd', edDate.Date);
  rectTanggal.Visible := True;
  btnResetTgl.Visible := True;
  edDate.Visible := True;
  btnLihat.Position.y := 190;
  Rectangle1.Height := 240;

  // layPilihIndikator.Visible := True;
  // lbJudulGrafikIndikatorSiswa.Visible := True;
  // lbSubJudulGrafikIndikatorSiswa.Visible := True;
  // PresentedScrollBox2.Visible := True;
  //
  // layPilihIndikator.Position.y := 1120;
  // lbJudulGrafikIndikatorSiswa.Position.y := 1180;
  // lbSubJudulGrafikIndikatorSiswa.Position.y := 1200;
  // PresentedScrollBox2.Position.y := 1230;

  layGrafikIndikator.Visible := True;

  // YY := 0;
  // showdataIndikator(NISN, tglUpload);
end;

procedure TfrmLihatLaporanAdmin.rectHarianClick(Sender: TObject);
begin
  durasi := 1;

  lbHarian.TextSettings.FontColor := $FFF09037;
  boxHari.Fill.Color := $FFF09037;

  lbBulanan.TextSettings.FontColor := $FF78BC71;
  boxBulan.Fill.Color := $FFEAEAEA;

  lbSemesteran.TextSettings.FontColor := $FF78BC71;
  boxSemester.Fill.Color := $FFEAEAEA;

  edDate.Format := 'yyyy-mm-dd';
  TglUpload := FormatDateTime('yyyy-mm-dd', edDate.Date);
  rectTanggal.Visible := True;
  btnResetTgl.Visible := True;
  edDate.Visible := True;
  btnLihat.Position.y := 190;
  Rectangle1.Height := 240;

  // layPilihIndikator.Position.y := 1120;
  // lbJudulGrafikIndikatorSiswa.Position.y := 1180;
  // lbSubJudulGrafikIndikatorSiswa.Position.y := 1200;
  // PresentedScrollBox2.Position.y := 1230;
  //
  // layPilihIndikator.Visible := False;
  // lbJudulGrafikIndikatorSiswa.Visible := False;
  // lbSubJudulGrafikIndikatorSiswa.Visible := False;
  // PresentedScrollBox2.Visible := False;
  layGrafikIndikator.Visible := False;

  // YY := 0;
  // showdataIndikator(NISN, tglUpload);
end;

procedure TfrmLihatLaporanAdmin.rectIndikatorRumahClick(Sender: TObject);
begin
  lbNmIndikator.Text := 'Indikator Rumah';
  statusklik := 'Rumah';

  rectIndikatorRumah.Fill.Color := $FF57A44D;
  lbIndikatorRumah.TextSettings.FontColor := TAlphaColors.White;
  lbNilaiRumah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleNilaiRumah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleRataRumah.TextSettings.FontColor := TAlphaColors.White;
  lbRataRumah.TextSettings.FontColor := TAlphaColors.White;
  imgRumahUnselected.Visible := True;
  imgRumahSelected.Visible := False;

  rectIndikatorSekolah.Fill.Color := TAlphaColors.White;
  lbIndikatorSekolah.TextSettings.FontColor := $FF57A44D;
  lbNilaiSekolah.TextSettings.FontColor := $FFF09037;
  lbTitleNilaiSekolah.TextSettings.FontColor := $FF57A44D;
  lbTitleRataSekolah.TextSettings.FontColor := $FF57A44D;
  lbRataSekolah.TextSettings.FontColor := $FFF09037;
  imgSekolahUnselected.Visible := False;
  ImgSekolahSelected.Visible := True;
end;

procedure TfrmLihatLaporanAdmin.rectIndikatorSekolahClick(Sender: TObject);
begin
  lbNmIndikator.Text := 'Indikator Sekolah';
  statusklik := 'Sekolah';

  rectIndikatorSekolah.Fill.Color := $FF57A44D;
  lbIndikatorSekolah.TextSettings.FontColor := TAlphaColors.White;
  lbNilaiSekolah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleNilaiSekolah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleRataSekolah.TextSettings.FontColor := TAlphaColors.White;
  lbRataSekolah.TextSettings.FontColor := TAlphaColors.White;
  imgSekolahUnselected.Visible := True;
  ImgSekolahSelected.Visible := False;

  rectIndikatorRumah.Fill.Color := TAlphaColors.White;
  lbIndikatorRumah.TextSettings.FontColor := $FF57A44D;
  lbNilaiRumah.TextSettings.FontColor := $FFF09037;
  lbTitleNilaiRumah.TextSettings.FontColor := $FF57A44D;
  lbTitleRataRumah.TextSettings.FontColor := $FF57A44D;
  lbRataRumah.TextSettings.FontColor := $FFF09037;
  imgRumahUnselected.Visible := False;
  imgRumahSelected.Visible := True;
end;

procedure TfrmLihatLaporanAdmin.rectListSiswaClick(Sender: TObject);
var
  r: TRectangle;
  y: Integer;
  lo: TRectangle;
begin
  r := TRectangle(Sender);
  lbNamaSiswa.Text := arrNmSiswa[r.Tag];
  NISN := arrNISN[r.Tag];
  // showMessage(NISN + '-' + inttostr(r.Tag));
  YY := 0;
  rectDaftarLaporanSiswa.Visible := False;
end;

procedure TfrmLihatLaporanAdmin.rectNmSiswaClick(Sender: TObject);
begin
  rectDaftarLaporanSiswa.Visible := True;
end;

procedure TfrmLihatLaporanAdmin.rectSemesteranClick(Sender: TObject);
var
  JA: TJSONArray;
  JV: TJSONValue;
  currentDate: TDateTime;
  ia, status, tanggal, tanggalakhir, tanggalawal, TglLahir, BlnLahir, ThnLahir,
    kode, nilai, lable: String;
  tgl: String;
  cekIndikatorBool: Boolean;
  kelas, y, apa, nilaiTemp, nilaiTgl: Integer;
  nilairumah, nilaiakhirrumah, nilaisekolah, nilaiakhirsekolah, nb_nilai_rumah,
    nb_nilai_sekolah: Integer;
begin
  durasi := 3;

  lbHarian.TextSettings.FontColor := $FF78BC71;
  boxHari.Fill.Color := $FFEAEAEA;

  lbBulanan.TextSettings.FontColor := $FF78BC71;
  boxBulan.Fill.Color := $FFEAEAEA;

  lbSemesteran.TextSettings.FontColor := $FFF09037;
  boxSemester.Fill.Color := $FFF09037;

  currentDate := Now;
  tanggal := FormatDateTime('yyyy-mm-dd', currentDate);
  TglUpload := tanggal;

  rectTanggal.Visible := False;
  btnResetTgl.Visible := False;
  edDate.Visible := False;
  btnLihat.Position.y := 140;
  Rectangle1.Height := 190;

  // layPilihIndikator.Visible := True;
  // lbJudulGrafikIndikatorSiswa.Visible := True;
  // lbSubJudulGrafikIndikatorSiswa.Visible := True;
  // PresentedScrollBox2.Visible := True;
  //
  // layPilihIndikator.Position.y := 1120;
  // lbJudulGrafikIndikatorSiswa.Position.y := 1180;
  // lbSubJudulGrafikIndikatorSiswa.Position.y := 1200;
  // PresentedScrollBox2.Position.y := 1230;

  layGrafikIndikator.Visible := True;

  // YY := 0;
  // showdataIndikator(NISN, tglUpload);
end;

procedure TfrmLihatLaporanAdmin.rectTanggalClick(Sender: TObject);
begin
  edDate.OpenPicker;
end;

procedure TfrmLihatLaporanAdmin.reset;
var
  TglLahir, BlnLahir, ThnLahir: String;
begin
  edDate.Date := Now;

  TglLahir := FormatDateTime('dd', edDate.Date);
  BlnLahir := FormatDateTime('mm', edDate.Date);
  ThnLahir := FormatDateTime('yyyy', edDate.Date);
  lbTanggal.Text := TglLahir + '-' + BlnLahir + '-' + ThnLahir;

  TglUpload := ThnLahir + '-' + BlnLahir + '-' + TglLahir;

  // showdataIndikator(NISN, tglUpload);
end;

procedure TfrmLihatLaporanAdmin.btnCetakClick(Sender: TObject);
var
  idKelas: String;
begin
  idKelas := arrId[cbKelas.ItemIndex];
  Open('http://sditulilalbab-kamal.sch.id/api/cetaklaporan.php?' + 'nis=' + NISN
    + '&tgl=' + TglUpload + '&kelas=' + idKelas + '&durasi=' +
    inttostr(durasi));
end;

procedure TfrmLihatLaporanAdmin.Open(URL: string);
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

procedure TfrmLihatLaporanAdmin.btnLihatClick(Sender: TObject);
begin
  YY := 0;
  lbSubJudulGrafik.Text := '';
  lbSubJudulGrafikIndikatorSiswa.Text := '';
  if cbKelas.ItemIndex = -1 then
    showMessage('Silahkan Isi Data Diatas Tombol Lihat Terlebih Dahulu')
  else if NISN = '' then
    showMessage('Silahkan Isi Data Diatas Tombol Lihat Terlebih Dahulu')
  else
    showdataIndikator(NISN, TglUpload);
end;

procedure TfrmLihatLaporanAdmin.btnResetTglClick(Sender: TObject);
begin
  reset;
end;

procedure TfrmLihatLaporanAdmin.btnTutupClick(Sender: TObject);
begin
  rectDaftarLaporanSiswa.Visible := False;
end;

procedure TfrmLihatLaporanAdmin.cbKelasChange(Sender: TObject);
begin
  // ShowMessage(arrId[cbKelas.ItemIndex]);
  VertScrollBox3.content.DeleteChildren;
  XX := 0;
  showDataSiswa(arrId[cbKelas.ItemIndex]);
  rectDaftarLaporanSiswa.Visible := True;
end;

procedure TfrmLihatLaporanAdmin.cbPilihIndikatorChange(Sender: TObject);
begin
  if (cbPilihIndikator.ItemIndex >= 0) then
  begin
    grafikIndikator(NISN, TglUpload);
    // showdriver;
  end;
end;

procedure TfrmLihatLaporanAdmin.cetakLaporan(nis, tanggal: String);
// var
// URL: string;
// Intent: JIntent;
// paramList: TStringList;
// JA: TJSONArray;
// idKelas: String;
begin
  // idKelas := arrId[cbKelas.ItemIndex];
  // URL := 'http://sditulilalbab-kamal.sch.id/api/cetaklaporan.php?' + 'nis=' + nis + '&tgl='
  // + tanggal + '&kelas=' + idKelas + '&durasi=' + inttostr(durasi);
  // Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
  // TJnet_Uri.JavaClass.parse(StringToJString(URL)));
  // SharedActivity.startActivity(Intent);
end;

procedure TfrmLihatLaporanAdmin.showDataSiswa(id: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
  u: Integer;
  // arrNISN, arrNmSiswa : array [0 .. 100] of string;
begin
  // SiswaScroll.Content.DeleteChildren;
  // XX := 10;
  // arrNISN.Clear;
  // arrNmSiswa.Clear;
  o := 0;
  JA := frmMainAdmin.doService('siswaAdmin.php', 'exe=' + 'laporan' +
    '&id=' + id);
  // ParamList.Free;
  // JA := formLogin.doService(formLogin.access_token,'selectkota','username='+formLogin.edUsername.Text+'&kota='+edSearchKota.Text);
  arrNISN := TStringList.Create;
  arrNmSiswa := TStringList.Create;
  u := 0;
  // for u:=0 to frmDataSiswaGuru.arrNISN.Count do
  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      lbListNmSiswa.Text := JV.GetValue('s_nm_lengkap', '');
      arrNISN.add(JV.GetValue('s_nis', ''));
      arrNmSiswa.add(JV.GetValue('s_nm_lengkap', ''));
      // showMessage('No.'+u+' NISN: '+arrNISN[u]+' & '+arrNmSiswa[u]);
      clone2(VertScrollBox3);
      inc(u);
      inc(o);
    end;
  end;
end;

procedure TfrmLihatLaporanAdmin.clone2(vs: TVertScrollBox);
var
  lo: TLayout;
  y: Integer;
begin
  rectListSiswa.Tag := o;
  // ShowMessage(IntToStr(rectListSiswa.Tag));
  lo := TLayout(layListSiswa.Clone(vs));
  lo.Parent := vs;
  lo.Height := 50;
  lo.Position.y := XX;
  XX := XX + 50;
  lo.Visible := True;
  for y := 0 to lo.ControlsCount - 1 do
  begin
    if lo.Controls[y] is TRectangle then
    begin
      TRectangle(lo.Controls[y]).OnClick := rectListSiswaClick;
    end;
  end;
end;

procedure TfrmLihatLaporanAdmin.edDateChange(Sender: TObject);
var
  tanggal, TglLahir, BlnLahir, ThnLahir: String;
begin
  TglLahir := FormatDateTime('dd', edDate.Date);
  BlnLahir := FormatDateTime('mm', edDate.Date);
  ThnLahir := FormatDateTime('yyyy', edDate.Date);
  lbTanggal.Text := TglLahir + '-' + BlnLahir + '-' + ThnLahir;

  TglUpload := ThnLahir + '-' + BlnLahir + '-' + TglLahir;

  // showdataIndikator(NISN, tglUpload);
end;

procedure TfrmLihatLaporanAdmin.CreateAwal;
begin
  ambilKelas;

  // FUNGSI DURASI
  durasi := 1;

  lbHarian.TextSettings.FontColor := $FFF09037;
  boxHari.Fill.Color := $FFF09037;

  lbBulanan.TextSettings.FontColor := $FF78BC71;
  boxBulan.Fill.Color := $FFEAEAEA;

  lbSemesteran.TextSettings.FontColor := $FF78BC71;
  boxSemester.Fill.Color := $FFEAEAEA;

  // layPilihIndikator.Position.y := 1120;
  // lbJudulGrafikIndikatorSiswa.Position.y := 1180;
  // lbSubJudulGrafikIndikatorSiswa.Position.y := 1200;
  // PresentedScrollBox2.Position.y := 1230;
  //
  // layPilihIndikator.Visible := False;
  // lbJudulGrafikIndikatorSiswa.Visible := False;
  // lbSubJudulGrafikIndikatorSiswa.Visible := False;
  // PresentedScrollBox2.Visible := False;
  layGrafikIndikator.Visible := False;

  // FUNGSI SEKOLAH/RUMAH
  lbNmIndikator.Text := 'Indikator Rumah';
  statusklik := 'Rumah';

  rectIndikatorRumah.Fill.Color := $FF57A44D;
  lbIndikatorRumah.TextSettings.FontColor := TAlphaColors.White;
  lbNilaiRumah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleNilaiRumah.TextSettings.FontColor := TAlphaColors.White;
  lbTitleRataRumah.TextSettings.FontColor := TAlphaColors.White;
  lbRataRumah.TextSettings.FontColor := TAlphaColors.White;
  imgRumahUnselected.Visible := True;
  imgRumahSelected.Visible := False;

  rectIndikatorSekolah.Fill.Color := TAlphaColors.White;
  lbIndikatorSekolah.TextSettings.FontColor := $FF57A44D;
  lbNilaiSekolah.TextSettings.FontColor := $FFF09037;
  lbTitleNilaiSekolah.TextSettings.FontColor := $FF57A44D;
  lbTitleRataSekolah.TextSettings.FontColor := $FF57A44D;
  lbRataSekolah.TextSettings.FontColor := $FFF09037;
  imgSekolahUnselected.Visible := False;
  ImgSekolahSelected.Visible := True;

  // TANGGAL
  edDate.Date := Now;
end;

procedure TfrmLihatLaporanAdmin.ambilKelas;
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      i: Integer;
    begin
      JA := frmMainAdmin.doService('kelasAdmin.php', 'exe=tampil');
      if JA.ToString <> '[]' then
      begin
        cbKelas.Items.Clear;
        i := 0;
        arrId := TStringList.Create;
        arrKelas := TStringList.Create;
        arrNmWK := TStringList.Create;
        for JV in JA do
        begin
          tthread.Synchronize(nil,
            procedure
            begin
              // cbKelas.ListBox.ListItems[I].TextSettings.FontColor := $FF1A4709;
              // cbKelas.ListBox.ListItems[I].TextSettings.Font.Size := 10;
              cbKelas.Items.add('kelas: ' + JV.GetValue('k_nm_kelas',
                '') + ' (Thn Ajaran: ' + JV.GetValue('k_thn_ajaran', '') + ')');
              arrId.add(JV.GetValue('k_id', ''));
              arrNmWK.add('kelas: ' + JV.GetValue('k_nm_kelas',
                '') + ' (Thn Ajaran: ' + JV.GetValue('k_thn_ajaran', '') + ')');
              arrKelas.add(JV.GetValue('k_kelas', ''));
              inc(i);
            end);
        end;
      end;
    end).Start;
end;

procedure TfrmLihatLaporanAdmin.cloneIndikator(vs: TVertScrollBox);
var
  lo: TLayout;
  y: Integer;
begin
  rectListSiswa.Tag := x;
  // ShowMessage(IntToStr(rectListSiswa.Tag));
  lo := TLayout(layNilaiIndikator.Clone(vs));
  lo.Parent := vs;
  lo.Height := 80;
  lo.Position.y := YY;
  YY := YY + 90;
  lo.Visible := True;
  for y := 0 to lo.ControlsCount - 1 do
  begin
    if lo.Controls[y] is TRectangle then
    begin
      // TRectangle(lo.Controls[Y]).OnTap := rectListSiswaTap;
    end;
  end;
end;

procedure TfrmLihatLaporanAdmin.showdataIndikator(nis, tanggal: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
  currentDate: TDateTime;
  ia, status, tanggalakhir, tanggalawal, TglLahir, BlnLahir, ThnLahir,
    semester: String;

  bulan_nilai, tgl, gantiBulan: String;
  cekIndikatorBool: Boolean;
  y, apa, nilaiTemp, nilaiTgl, nilaiInd, nilaiAkt: Integer;
  pecahTanggal: TStringList;
  Date, bulan, tahun, thnbln, n_sekolah, n_rumah: string;

  u, kelas, nilairumah, nilaiakhirrumah, nilaisekolah, nilaiakhirsekolah,
    nb_nilai_rumah, nb_nilai_sekolah, totDataGrafik, totRumah,
    totSekolah: Integer;
  // arrNISN, arrNmSiswa : array [0 .. 100] of string;
begin
  A_I_1 := 0;
  A_I_2 := 0;
  A_I_3 := 0;
  A_I_4 := 0;
  A_I_5 := 0;
  A_I_6 := 0;
  A_I_7 := 0;
  A_I_8 := 0;
  A_A_1 := 0;
  A_A_2 := 0;
  A_A_3 := 0;
  A_A_4 := 0;
  A_A_5 := 0;
  B_I_1 := 0;
  B_I_2 := 0;
  B_I_3 := 0;
  B_I_4 := 0;
  B_I_5 := 0;
  B_I_6 := 0;
  B_I_7 := 0;
  B_I_8 := 0;
  B_I_9 := 0;
  B_A_1 := 0;
  B_A_2 := 0;
  B_A_3 := 0;
  B_A_4 := 0;
  B_A_5 := 0;
  B_A_6 := 0;
  B_A_7 := 0;
  B_A_8 := 0;
  indA_I_1 := '';
  indA_I_2 := '';
  indA_I_3 := '';
  indA_I_4 := '';
  indA_I_5 := '';
  indA_I_6 := '';
  indA_I_7 := '';
  indA_I_8 := '';
  indA_A_1 := '';
  indA_A_2 := '';
  indA_A_3 := '';
  indA_A_4 := '';
  indA_A_5 := '';
  indB_I_1 := '';
  indB_I_2 := '';
  indB_I_3 := '';
  indB_I_4 := '';
  indB_I_5 := '';
  indB_I_6 := '';
  indB_I_7 := '';
  indB_I_8 := '';
  indB_I_9 := '';
  indB_A_1 := '';
  indB_A_2 := '';
  indB_A_3 := '';
  indB_A_4 := '';
  indB_A_5 := '';
  indB_A_6 := '';
  indB_A_7 := '';
  indB_A_8 := '';
  totA_I_1 := 0;
  totA_I_2 := 0;
  totA_I_3 := 0;
  totA_I_4 := 0;
  totA_I_5 := 0;
  totA_I_6 := 0;
  totA_I_7 := 0;
  totA_I_8 := 0;
  totA_A_1 := 0;
  totA_A_2 := 0;
  totA_A_3 := 0;
  totA_A_4 := 0;
  totA_A_5 := 0;
  totB_I_1 := 0;
  totB_I_2 := 0;
  totB_I_3 := 0;
  totB_I_4 := 0;
  totB_I_5 := 0;
  totB_I_6 := 0;
  totB_I_7 := 0;
  totB_I_8 := 0;
  totB_I_9 := 0;
  totB_A_1 := 0;
  totB_A_2 := 0;
  totB_A_3 := 0;
  totB_A_4 := 0;
  totB_A_5 := 0;
  totB_A_6 := 0;
  totB_A_7 := 0;
  totB_A_8 := 0;
  x := 0;

  VertScrollBox4.content.DeleteChildren;
  i := 0;

  chMain.Series[0].Clear;
  chMain.Series[1].Clear;

  lbNilaiSekolah.Text := '-';
  lbNilaiRumah.Text := '-';
  lbRataRumah.Text := '-';
  lbRataSekolah.Text := '-';
  if durasi = 1 then
  begin
    // VertScrollBox4.content.DeleteChildren;
    // i := 0;
    //
    // // showMessage('INI DURASI KE-'+inttostr(durasi));
    //
    // chMain.Series[0].Clear;
    // chMain.Series[1].Clear;

    // lbNilaiSekolah.Text := '-';
    // lbNilaiRumah.Text := '-';
    // lbRataRumah.Text := '-';
    // lbRataSekolah.Text := '-';

    // currentDate := Now;
    // TglLahir := FormatDateTime('dd', currentDate);
    // BlnLahir := FormatDateTime('mm', currentDate);
    // ThnLahir := FormatDateTime('yyyy', currentDate);
    // tanggal := ThnLahir + '-' + BlnLahir + '-' + TglLahir;
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totRumah := 0;
    totSekolah := 0;

    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&tgl=' + tanggal + '&durasi=' + 'harian');

    if (JA.ToString <> '[]') then
    begin
      pecahTanggal := TStringList.Create;
      try
        frmMainAdmin.Split('-', tanggal, pecahTanggal);
        Date := pecahTanggal[2];
        bulan := pecahTanggal[1];
        tahun := pecahTanggal[0];
      finally
        pecahTanggal.Free;
      end;
      lbSubJudulGrafik.Text := Date + ' ' + frmMainAdmin.ubahBulan(bulan) +
        ' ' + tahun;
      // showMessage(JA.ToString);
      // TTask.Run(procedure begin
      lbNilaiRataIndikator.Text := '-';
      lbIndikator.Visible := True;
      lbRataIndikator.Visible := True;
      lbNilaiRataIndikator.Visible := True;
      layNilaiIndikator.Visible := False;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Leading;
      lbNilaiIndikator.Position.y := 30;
      for JV in JA do
      // for u:=0 to frmDataSiswaGuru.arrNISN.Count do
      begin
        status := JV.GetValue('ib_status', '');
        // TThread.Synchronize(nil, procedure begin
        if (status = 'Rumah') then
        begin
          // showMessage('Rumah');
          ia := JV.GetValue('ib_ia', '');
          // showMessage(JV.GetValue('ib_ia', ''));
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            chMain.Series[0].add(nilaiInd, JV.GetValue('ib_indikator', ''));
            // showMessage('indikator');
            // lbIndikator.Text := JV.GetValue('ib_indikator', '');
            // lbNilaiIndikator.Text := inttostr(nilaiInd);
            // showMessage(JV.GetValue('ib_indikator', ''));
            // showMessage(JV.GetValue('nb_nilai', ''));
            // cloneIndikator(VertScrollBox4);
            nb_nilai_rumah := nilaiInd;
            nilairumah := nilairumah + nb_nilai_rumah;
            nilaiakhirrumah := nilaiakhirrumah + 3;
            inc(i);
          end
          // lbAktivitas.Text := 'Aktivitas Rumah';
          // lbAktivitas.Position.Y := YY;
          // YY := YY + 20;
          // lbAktivitas.Visible := True;
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
            // showMessage('aktivitas');
            // lbIndikator.Text := JV.GetValue('ib_indikator', '');
            // lbNilaiIndikator.Text := inttostr(nilaiAkt);
            // showMessage(JV.GetValue('ib_indikator', ''));
            // showMessage(JV.GetValue('nb_nilai', ''));
            // cloneIndikator(VertScrollBox4);
            nb_nilai_rumah := nilaiAkt;
            nilairumah := nilairumah + nb_nilai_rumah;
            nilaiakhirrumah := nilaiakhirrumah + 1;
            inc(i);
          end;
          totRumah := totRumah + 1;
        end
        // end);
        else if (status = 'Sekolah') then
        begin
          // showMessage('Rumah');
          ia := JV.GetValue('ib_ia', '');
          // showMessage(JV.GetValue('ib_ia', ''));
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            chMain.Series[0].add(nilaiInd, JV.GetValue('ib_indikator', ''));
            // showMessage('indikator');
            // lbIndikator.Text := JV.GetValue('ib_indikator', '');
            // lbNilaiIndikator.Text := inttostr(nilaiInd);
            // showMessage(JV.GetValue('ib_indikator', ''));
            // showMessage(JV.GetValue('nb_nilai', ''));
            // cloneIndikator(VertScrollBox4);
            nb_nilai_sekolah := nilaiInd;
            nilaisekolah := nilaisekolah + nb_nilai_sekolah;
            nilaiakhirsekolah := nilaiakhirsekolah + 3;
            inc(i);
          end
          // lbAktivitas.Text := 'Aktivitas Rumah';
          // lbAktivitas.Position.Y := YY;
          // YY := YY + 20;
          // lbAktivitas.Visible := True;
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
            // showMessage('aktivitas');
            // lbIndikator.Text := JV.GetValue('ib_indikator', '');
            // lbNilaiIndikator.Text := inttostr(nilaiAkt);
            // showMessage(JV.GetValue('ib_indikator', ''));
            // showMessage(JV.GetValue('nb_nilai', ''));
            // cloneIndikator(VertScrollBox4);
            nb_nilai_sekolah := nilaiAkt;
            nilaisekolah := nilaisekolah + nb_nilai_sekolah;
            nilaiakhirsekolah := nilaiakhirsekolah + 1;
            inc(i);
          end;
          totSekolah := totSekolah + 1;
        end;
        // nilairumah := Round(nilairumah / totRumah);
        // nilaisekolah := Round(nilaisekolah / totSekolah);
        if kelas > 3 then
        begin
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
        end;
      end;
      if totRumah <> 0 then
        lbNilaiRumah.Text := inttostr(Round(nilairumah / totRumah));
      if totSekolah <> 0 then
        lbNilaiSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));

      // showMessage('NILAI RUMAH ASLI SISWA: ' + inttostr(nilairumah));
      // end).Start;
    end;
    // else
    // begin
    // lbIndikator.Visible := False;
    // lbRataIndikator.Visible := False;
    // lbNilaiRataIndikator.Visible := False;
    // layNilaiIndikator.Visible := True;
    // lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
    // lbNilaiIndikator.Position.y := 30;
    // lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
    // end;
    // if kelas > 3 then
    // begin
    // tthread.Synchronize(nil,
    // procedure
    // begin
    // lbIndikator.Text := indA_I_1;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_1 / totA_I_1));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_2;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_2 / totA_I_2));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_3;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_3 / totA_I_3));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_4;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_4 / totA_I_4));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_5;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_5 / totA_I_5));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_6;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_6 / totA_I_6));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_7;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_7 / totA_I_7));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_8;
    // lbNilaiIndikator.Text := inttostr(Round(A_I_8 / totA_I_8));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_1;
    // lbNilaiIndikator.Text := inttostr(Round(A_A_1 / totA_A_1));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_2;
    // lbNilaiIndikator.Text := inttostr(Round(A_A_2 / totA_A_2));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_3;
    // lbNilaiIndikator.Text := inttostr(Round(A_A_3 / totA_A_3));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_4;
    // lbNilaiIndikator.Text := inttostr(Round(A_A_4 / totA_A_4));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_5;
    // lbNilaiIndikator.Text := inttostr(Round(A_A_5 / totA_A_5));
    // cloneIndikator(VertScrollBox4);

    // chMain.Series[1].add(Round(rataA_I_1 / totA_I_1), indA_I_1);
    // chMain.Series[1].add(Round(rataA_I_2 / totA_I_2), indA_I_2);
    // chMain.Series[1].add(Round(rataA_I_3 / totA_I_3), indA_I_3);
    // chMain.Series[1].add(Round(rataA_I_4 / totA_I_4), indA_I_4);
    // chMain.Series[1].add(Round(rataA_I_5 / totA_I_5), indA_I_5);
    // chMain.Series[1].add(Round(rataA_I_6 / totA_I_6), indA_I_6);
    // chMain.Series[1].add(Round(rataA_I_7 / totA_I_7), indA_I_7);
    // chMain.Series[1].add(Round(rataA_I_8 / totA_I_8), indA_I_8);
    // chMain.Series[1].add(Round(rataA_A_1 / totA_A_1), indA_A_1);
    // chMain.Series[1].add(Round(rataA_A_2 / totA_A_2), indA_A_2);
    // chMain.Series[1].add(Round(rataA_A_3 / totA_A_3), indA_A_3);
    // chMain.Series[1].add(Round(rataA_A_4 / totA_A_4), indA_A_4);
    // chMain.Series[1].add(Round(rataA_A_5 / totA_A_5), indA_A_5);

    // showMessage('A_I_1 Nilai: ' + inttostr(rataA_I_1));
    // showMessage('A_I_2 Nilai: ' + inttostr(rataA_I_2));
    // showMessage('A_I_3 Nilai: ' + inttostr(rataA_I_3));
    // showMessage('A_I_4 Nilai: ' + inttostr(rataA_I_4));
    // showMessage('A_I_5 Nilai: ' + inttostr(rataA_I_5));
    // showMessage('A_I_6 Nilai: ' + inttostr(rataA_I_6));
    // showMessage('A_I_7 Nilai: ' + inttostr(rataA_I_7));
    // showMessage('A_I_8 Nilai: ' + inttostr(rataA_I_8));
    // showMessage('A_A_1 Nilai: ' + inttostr(rataA_A_1));
    // showMessage('A_A_2 Nilai: ' + inttostr(rataA_A_2));
    // showMessage('A_A_3 Nilai: ' + inttostr(rataA_A_3));
    // showMessage('A_A_4 Nilai: ' + inttostr(rataA_A_4));
    // showMessage('A_A_5 Nilai: ' + inttostr(rataA_A_5));

    // rataB_I_1 := (Round(rataB_I_1 / totB_I_1));
    // rataB_I_2 := (Round(rataB_I_2 / totB_I_2));
    // rataB_I_3 := (Round(rataB_I_3 / totB_I_3));
    // rataB_I_4 := (Round(rataB_I_4 / totB_I_4));
    // rataB_I_5 := (Round(rataB_I_5 / totB_I_5));
    // rataB_I_6 := (Round(rataB_I_6 / totB_I_6));
    // rataB_I_7 := (Round(rataB_I_7 / totB_I_7));
    // rataB_I_8 := (Round(rataB_I_8 / totB_I_8));
    // rataB_I_9 := (Round(rataB_I_9 / totB_I_9));
    // rataB_A_1 := (Round(rataB_A_1 / totB_A_1));
    // rataB_A_2 := (Round(rataB_A_2 / totB_A_2));
    // rataB_A_3 := (Round(rataB_A_3 / totB_A_3));
    // rataB_A_4 := (Round(rataB_A_4 / totB_A_4));
    // rataB_A_5 := (Round(rataB_A_5 / totB_A_5));
    // rataB_A_6 := (Round(rataB_A_6 / totB_A_6));
    // rataB_A_7 := (Round(rataB_A_7 / totB_A_7));
    // rataB_A_8 := (Round(rataB_A_8 / totB_A_8));

    // lbIndikator.Text := indA_I_1;
    // lbNilaiIndikator.Text := inttostr(A_I_1);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_2;
    // lbNilaiIndikator.Text := inttostr(A_I_2);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_3;
    // lbNilaiIndikator.Text := inttostr(A_I_3);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_4;
    // lbNilaiIndikator.Text := inttostr(A_I_4);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_5;
    // lbNilaiIndikator.Text := inttostr(A_I_5);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_6;
    // lbNilaiIndikator.Text := inttostr(A_I_6);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_7;
    // lbNilaiIndikator.Text := inttostr(A_I_7);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_I_8;
    // lbNilaiIndikator.Text := inttostr(A_I_8);
    // lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_1;
    // lbNilaiIndikator.Text := inttostr(A_A_1);
    // lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_2;
    // lbNilaiIndikator.Text := inttostr(A_A_2);
    // lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_3;
    // lbNilaiIndikator.Text := inttostr(A_A_3);
    // lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_4;
    // lbNilaiIndikator.Text := inttostr(A_A_4);
    // lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indA_A_5;
    // lbNilaiIndikator.Text := inttostr(A_A_5);
    // lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
    // cloneIndikator(VertScrollBox4);
    // end);
    // end
    // else if kelas < 3 then
    // begin
    // lbIndikator.Text := indB_I_1;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_1 / totB_I_1));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_2;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_2 / totB_I_2));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_3;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_3 / totB_I_3));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_4;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_4 / totB_I_4));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_5;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_5 / totB_I_5));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_6;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_6 / totB_I_6));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_7;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_7 / totB_I_7));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_8;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_8 / totB_I_8));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_9;
    // lbNilaiIndikator.Text := inttostr(Round(B_I_9 / totB_I_9));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_1;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_1 / totB_A_1));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_2;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_2 / totB_A_2));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_3;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_3 / totB_A_3));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_4;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_4 / totB_A_4));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_5;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_5 / totB_A_5));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_6;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_6 / totB_A_6));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_7;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_7 / totB_A_7));
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_8;
    // lbNilaiIndikator.Text := inttostr(Round(B_A_8 / totB_A_8));
    // cloneIndikator(VertScrollBox4);

    // lbIndikator.Text := indB_I_1;
    // lbNilaiIndikator.Text := inttostr(B_I_1);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_2;
    // lbNilaiIndikator.Text := inttostr(B_I_2);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_3;
    // lbNilaiIndikator.Text := inttostr(B_I_3);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_4;
    // lbNilaiIndikator.Text := inttostr(B_I_4);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_5;
    // lbNilaiIndikator.Text := inttostr(B_I_5);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_6;
    // lbNilaiIndikator.Text := inttostr(B_I_6);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_7;
    // lbNilaiIndikator.Text := inttostr(B_I_7);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_8;
    // lbNilaiIndikator.Text := inttostr(B_I_8);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_I_9;
    // lbNilaiIndikator.Text := inttostr(B_I_9);
    // lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_1;
    // lbNilaiIndikator.Text := inttostr(B_A_1);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_2;
    // lbNilaiIndikator.Text := inttostr(B_A_2);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_3;
    // lbNilaiIndikator.Text := inttostr(B_A_3);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_4;
    // lbNilaiIndikator.Text := inttostr(B_A_4);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_5;
    // lbNilaiIndikator.Text := inttostr(B_A_5);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_6;
    // lbNilaiIndikator.Text := inttostr(B_A_6);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_7;
    // lbNilaiIndikator.Text := inttostr(B_A_7);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
    // cloneIndikator(VertScrollBox4);
    // lbIndikator.Text := indB_A_8;
    // lbNilaiIndikator.Text := inttostr(B_A_8);
    // lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
    // cloneIndikator(VertScrollBox4);
    // end;
    // TTask.Run(
    // procedure
    // begin
    // rataIndikator(tanggal);
    // end).Start;
    rataIndikator(nis, tanggal);
    // pilihIndikator;
  end
  else if durasi = 2 then
  begin
    // VertScrollBox4.content.DeleteChildren;
    // i := 0;
    //
    // chMain.Series[0].Clear;
    // chMain.Series[1].Clear;
    //
    // lbNilaiSekolah.Text := '-';
    // lbNilaiRumah.Text := '-';
    // lbRataRumah.Text := '-';
    // lbRataSekolah.Text := '-';

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    // currentDate := Now;
    // TglLahir := FormatDateTime('dd', currentDate);
    // BlnLahir := FormatDateTime('mm', currentDate);
    // ThnLahir := FormatDateTime('yyyy', currentDate);
    // tanggal := ThnLahir + '-' + BlnLahir;
    // tgl := ThnLahir + '-' + BlnLahir + '-01';
    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;
    thnbln := tahun + '-' + bulan;
    tgl := thnbln + '-01';
    // tanggalakhir := ThnLahir + '-' + BlnLahir + '-';
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);

    // IndikatorNilai := TStringList.Create;
    // IndikatorLabel := TStringList.Create;
    // IndikatorKode := TStringList.Create;

    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&tgl=' + thnbln + '&durasi=' + 'bulanan');

    if (JA.ToString <> '[]') then
    begin
      inputChart(JA, tanggal, 'chMain0');
      lbSubJudulGrafik.Text := frmMainAdmin.ubahBulan(bulan) + ' ' + tahun;
      // showMessage(JA.ToString);
      // TTask.Run(procedure begin
      // apa := 1;
      lbNilaiRataIndikator.Text := '-';
      lbIndikator.Visible := True;
      lbRataIndikator.Visible := True;
      lbNilaiRataIndikator.Visible := True;
      layNilaiIndikator.Visible := False;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Leading;
      lbNilaiIndikator.Position.y := 30;
      for JV in JA do
      begin
        // lable := JV.GetValue('ib_indikator', '');
        // nilai := JV.GetValue('nb_nilai', '');
        // kode := JV.GetValue('ib_indikator_id', '');
        // showmessage(kode+' - '+lable+' - '+nilai);
        // cekIndikatorBool := cekIndikator(lable, nilai, kode);
        // if cekIndikatorBool = True then
        // begin
        // // showMessage('Indikator True');
        // end
        // else if cekIndikatorBool = False then
        // begin
        // IndikatorNilai.add(nilai);
        // IndikatorKode.add(kode);
        // IndikatorLabel.add(lable);
        // // showMessage('Indikator False');
        // end;
        // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
        // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
        // showMessage('Nilai Akt: '+inttostr(nilaiAkt));
        status := JV.GetValue('ib_status', '');
        ia := JV.GetValue('ib_ia', '');
        if kelas > 3 then
        begin
          // showMessage(JV.GetValue('ib_ia', ''));
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
                // showMessage('Nilai A_I_1: ' + inttostr(A_I_1));
                // showMessage('Nilai totA_I_1: ' + inttostr(totA_I_1));
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                // showMessage('Nilai A_A_1 Awal: ' + inttostr(A_A_1));
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
                // showMessage('Nilai A_A_1: ' + inttostr(A_A_1));
                // showMessage('Nilai totA_A_1: ' + inttostr(totA_A_1));
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // totDataGrafik := totDataGrafik + 1;
          // if ia = 'Indikator' then
          // begin
          // nilaiTgl := nilaiTgl + nilaiInd;
          // nilaiTemp := 2;
          // // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // nilaiTgl := nilaiTgl + nilaiAkt;
          // nilaiTemp := 2;
          // end;
          // // totDataGrafik := totDataGrafik + 1;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[0].add(nilaiTgl, tgl);
          // showMessage('nilai totDataGrafik: ' + inttostr(totDataGrafik));
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // // nilaiTgl := 0;
          // totDataGrafik := 1;
          // if ia = 'Indikator' then
          // begin
          // nilaiTemp := 1;
          // nilaiTgl := nilaiInd;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // nilaiTgl := nilaiAkt;
          // nilaiTemp := 1;
          // end;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := JV.GetValue('nb_tgl', '');
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // totDataGrafik := 1;
          // nilaiTemp := 1;
          // if ia = 'Indikator' then
          // nilaiTgl := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTgl := nilaiAkt;
          // end;
          // end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[0].add(nilaiTgl, tgl);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := JV.GetValue('nb_tgl', '');
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end;
      end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chMain.Series[0].add(nilaiTgl, tgl);
      // lbNilaiSekolah.Text := 'WKWK';
      // lbNilaiRumah.Text := 'WKWK';
      // showMessage('NilaiRumah: ' + inttostr(NilaiRumah) +
      // 'totNilaiRumah: ' + inttostr(totRumah));
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Rata-rata: ' + inttostr(Round(nilairumah / totRumah)));

      // nilaisekolah := Round(nilaisekolah / totSekolah);
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Nilai Sekolah String: ' + n_sekolah + ' dan Nilai Rumah: ' + n_rumah);
      // lbNilaiSekolah.Text := inttostr(nilaisekolah);
      // lbNilaiRumah.Text := inttostr(nilairumah);
      // tmpNilaiSekolah := Round(nilaisekolah / i);
      // tmpNilaiAkhirSekolah := nilaiakhirsekolah;
      // tmpNilaiRumah := Round(nilairumah / i);
      // tmpNilaiAkhirRumah := nilaiakhirrumah;
      // sleep(3000);
      // n_sekolah := inttostr(Round(nilaisekolah / totSekolah));
      // n_rumah := inttostr(Round(nilairumah / totRumah));
      // A_I_1 := Round(A_I_1 / totA_I_1);
      // A_I_2 := Round(A_I_2 / totA_I_2);
      // A_I_3 := Round(A_I_3 / totA_I_3);
      // A_I_4 := Round(A_I_4 / totA_I_4);
      // A_I_5 := Round(A_I_5 / totA_I_5);
      // A_I_6 := Round(A_I_6 / totA_I_6);
      // A_I_7 := Round(A_I_7 / totA_I_7);
      // A_I_8 := Round(A_I_8 / totA_I_8);
      // A_A_1 := Round(A_A_1 / totA_A_1);
      // A_A_2 := Round(A_A_2 / totA_A_2);
      // A_A_3 := Round(A_A_3 / totA_A_3);
      // A_A_4 := Round(A_A_4 / totA_A_4);
      // A_A_5 := Round(A_A_5 / totA_A_5);
      if kelas > 3 then
      begin
        A_I_1 := Round(A_I_1 / totA_I_1);
        A_I_2 := Round(A_I_2 / totA_I_2);
        A_I_3 := Round(A_I_3 / totA_I_3);
        A_I_4 := Round(A_I_4 / totA_I_4);
        A_I_5 := Round(A_I_5 / totA_I_5);
        A_I_6 := Round(A_I_6 / totA_I_6);
        A_I_7 := Round(A_I_7 / totA_I_7);
        A_I_8 := Round(A_I_8 / totA_I_8);
        A_A_1 := Round(A_A_1 / totA_A_1);
        A_A_2 := Round(A_A_2 / totA_A_2);
        A_A_3 := Round(A_A_3 / totA_A_3);
        A_A_4 := Round(A_A_4 / totA_A_4);
        A_A_5 := Round(A_A_5 / totA_A_5);

        // lbIndikator.Text := indA_I_1;
        // lbNilaiIndikator.Text := inttostr(A_I_1);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_2;
        // lbNilaiIndikator.Text := inttostr(A_I_2);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_3;
        // lbNilaiIndikator.Text := inttostr(A_I_3);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_4;
        // lbNilaiIndikator.Text := inttostr(A_I_4);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_5;
        // lbNilaiIndikator.Text := inttostr(A_I_5);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_6;
        // lbNilaiIndikator.Text := inttostr(A_I_6);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_7;
        // lbNilaiIndikator.Text := inttostr(A_I_7);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_8;
        // lbNilaiIndikator.Text := inttostr(A_I_8);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_1;
        // lbNilaiIndikator.Text := inttostr(A_A_1);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_2;
        // lbNilaiIndikator.Text := inttostr(A_A_2);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_3;
        // lbNilaiIndikator.Text := inttostr(A_A_3);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_4;
        // lbNilaiIndikator.Text := inttostr(A_A_4);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_5;
        // lbNilaiIndikator.Text := inttostr(A_A_5);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
        // cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbNilaiRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbNilaiSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end
      else if kelas < 3 then
      begin
        B_I_1 := Round(B_I_1 / totB_I_1);
        B_I_2 := Round(B_I_2 / totB_I_2);
        B_I_3 := Round(B_I_3 / totB_I_3);
        B_I_4 := Round(B_I_4 / totB_I_4);
        B_I_5 := Round(B_I_5 / totB_I_5);
        B_I_6 := Round(B_I_6 / totB_I_6);
        B_I_7 := Round(B_I_7 / totB_I_7);
        B_I_8 := Round(B_I_8 / totB_I_8);
        B_I_9 := Round(B_I_9 / totB_I_9);
        B_A_1 := Round(B_A_1 / totB_A_1);
        B_A_2 := Round(B_A_2 / totB_A_2);
        B_A_3 := Round(B_A_3 / totB_A_3);
        B_A_4 := Round(B_A_4 / totB_A_4);
        B_A_5 := Round(B_A_5 / totB_A_5);
        B_A_6 := Round(B_A_6 / totB_A_6);
        B_A_7 := Round(B_A_7 / totB_A_7);
        B_A_8 := Round(B_A_8 / totB_A_8);

        // lbIndikator.Text := indB_I_1;
        // lbNilaiIndikator.Text := inttostr(B_I_1);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_2;
        // lbNilaiIndikator.Text := inttostr(B_I_2);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_3;
        // lbNilaiIndikator.Text := inttostr(B_I_3);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_4;
        // lbNilaiIndikator.Text := inttostr(B_I_4);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_5;
        // lbNilaiIndikator.Text := inttostr(B_I_5);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_6;
        // lbNilaiIndikator.Text := inttostr(B_I_6);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_7;
        // lbNilaiIndikator.Text := inttostr(B_I_7);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_8;
        // lbNilaiIndikator.Text := inttostr(B_I_8);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_9;
        // lbNilaiIndikator.Text := inttostr(B_I_9);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_1;
        // lbNilaiIndikator.Text := inttostr(B_A_1);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_2;
        // lbNilaiIndikator.Text := inttostr(B_A_2);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_3;
        // lbNilaiIndikator.Text := inttostr(B_A_3);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_4;
        // lbNilaiIndikator.Text := inttostr(B_A_4);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_5;
        // lbNilaiIndikator.Text := inttostr(B_A_5);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_6;
        // lbNilaiIndikator.Text := inttostr(B_A_6);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_7;
        // lbNilaiIndikator.Text := inttostr(B_A_7);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_8;
        // lbNilaiIndikator.Text := inttostr(B_A_8);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
        // cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbNilaiRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbNilaiSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end;
    end;
    // else
    // begin
    // lbIndikator.Visible := False;
    // lbRataIndikator.Visible := False;
    // lbNilaiRataIndikator.Visible := False;
    // layNilaiIndikator.Visible := True;
    // lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
    // lbNilaiIndikator.Position.y := 30;
    // lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
    // end;
    // IndikatorNilai.Free;
    // IndikatorLabel.Free;
    // IndikatorKode.Free;
    rataIndikator(nis, tanggal);
    // pilihIndikator;
  end
  else if durasi = 3 then
  begin
    // VertScrollBox4.content.DeleteChildren;
    // i := 0;
    //
    // chMain.Series[0].Clear;
    // chMain.Series[1].Clear;
    //
    // lbNilaiSekolah.Text := '-';
    // lbNilaiRumah.Text := '-';
    // lbRataRumah.Text := '-';
    // lbRataSekolah.Text := '-';

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;

    if frmMainAdmin.thn_pelajaran <= tahun then
    begin
      tanggalawal := tahun + '-' + '01' + '-01';
      tanggalakhir := tahun + '-' + '07' + '-05';
      semester := 'Semester Genap Tahun Pelajaran ' +
        inttostr(strtoint(tahun) - 1) + '-' + tahun;
      tgl := '01';
    end
    else
    begin
      tanggalawal := tahun + '-' + '07' + '-06';
      tanggalakhir := tahun + '-' + '12' + '-31';
      semester := 'Semester Ganjil Tahun Pelajaran ' + tahun + '-' +
        inttostr(strtoint(tahun) + 1);
      tgl := '07';
    end;

    // showMessage('Tanggal Awal = ' + tanggalawal + ' Tanggal Akhir = ' + tanggalakhir);

    // tgl := ThnLahir + '-' + BlnLahir + '-01';
    // tanggalakhir := ThnLahir + '-' + BlnLahir + '-';
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);

    // IndikatorNilai := TStringList.Create;
    // IndikatorLabel := TStringList.Create;
    // IndikatorKode := TStringList.Create;
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&tglawal=' + tanggalawal + '&tglakhir=' + tanggalakhir +
      '&durasi=' + 'semesteran');

    if (JA.ToString <> '[]') then
    begin
      inputChart(JA, tanggal, 'chMain0');
      lbSubJudulGrafik.Text := semester;
      // showMessage(JA.ToString);
      // TTask.Run(procedure begin
      // apa := 1;
      lbNilaiRataIndikator.Text := '-';
      lbIndikator.Visible := True;
      lbRataIndikator.Visible := True;
      lbNilaiRataIndikator.Visible := True;
      layNilaiIndikator.Visible := False;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Leading;
      lbNilaiIndikator.Position.y := 30;
      for JV in JA do
      begin
        // lable := JV.GetValue('ib_indikator', '');
        // nilai := JV.GetValue('nb_nilai', '');
        // kode := JV.GetValue('ib_indikator_id', '');
        // showmessage(kode+' - '+lable+' - '+nilai);
        // cekIndikatorBool := cekIndikator(lable, nilai, kode);
        // if cekIndikatorBool = True then
        // begin
        // // showMessage('Indikator True');
        // end
        // else if cekIndikatorBool = False then
        // begin
        // IndikatorNilai.add(nilai);
        // IndikatorKode.add(kode);
        // IndikatorLabel.add(lable);
        // // showMessage('Indikator False');
        // end;
        // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
        // nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
        status := JV.GetValue('ib_status', '');
        ia := JV.GetValue('ib_ia', '');
        if kelas > 3 then
        begin
          // showMessage(JV.GetValue('ib_ia', ''));
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                A_I_1 := A_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                A_I_2 := A_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                A_I_3 := A_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                A_I_4 := A_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                A_I_5 := A_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                A_I_6 := A_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                A_I_7 := A_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                A_I_8 := A_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                A_A_1 := A_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                A_A_2 := A_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                A_A_3 := A_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                A_A_4 := A_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                A_A_5 := A_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
          // pecah tanggal lahir
          // pecahTanggal := TStringList.Create;
          // try
          // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
          // bulan_nilai := pecahTanggal[1];
          // finally
          // pecahTanggal.Free;
          // end;
          // if bulan_nilai = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // gantiBulan := frmMainAdmin.ubahBulan(tgl);
          // chMain.Series[0].add(nilaiTgl, gantiBulan);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := bulan_nilai;
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := bulan_nilai;
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                B_I_1 := B_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                B_I_2 := B_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                B_I_3 := B_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                B_I_4 := B_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                B_I_5 := B_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                B_I_6 := B_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                B_I_7 := B_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                B_I_8 := B_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                B_I_9 := B_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                B_A_1 := B_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                B_A_2 := B_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                B_A_3 := B_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                B_A_4 := B_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                B_A_5 := B_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                B_A_6 := B_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                B_A_7 := B_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                B_A_8 := B_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
          // pecah tanggal lahir
          // pecahTanggal := TStringList.Create;
          // try
          // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
          // bulan_nilai := pecahTanggal[1];
          // finally
          // pecahTanggal.Free;
          // end;
          // if bulan_nilai = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // gantiBulan := frmMainAdmin.ubahBulan(tgl);
          // chMain.Series[0].add(nilaiTgl, gantiBulan);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := bulan_nilai;
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := bulan_nilai;
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end;
      end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chMain.Series[0].add(nilaiTgl, gantiBulan);
      if kelas > 3 then
      begin
        A_I_1 := Round(A_I_1 / totA_I_1);
        A_I_2 := Round(A_I_2 / totA_I_2);
        A_I_3 := Round(A_I_3 / totA_I_3);
        A_I_4 := Round(A_I_4 / totA_I_4);
        A_I_5 := Round(A_I_5 / totA_I_5);
        A_I_6 := Round(A_I_6 / totA_I_6);
        A_I_7 := Round(A_I_7 / totA_I_7);
        A_I_8 := Round(A_I_8 / totA_I_8);
        A_A_1 := Round(A_A_1 / totA_A_1);
        A_A_2 := Round(A_A_2 / totA_A_2);
        A_A_3 := Round(A_A_3 / totA_A_3);
        A_A_4 := Round(A_A_4 / totA_A_4);
        A_A_5 := Round(A_A_5 / totA_A_5);

        // lbIndikator.Text := indA_I_1;
        // lbNilaiIndikator.Text := inttostr(A_I_1);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_2;
        // lbNilaiIndikator.Text := inttostr(A_I_2);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_3;
        // lbNilaiIndikator.Text := inttostr(A_I_3);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_4;
        // lbNilaiIndikator.Text := inttostr(A_I_4);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_5;
        // lbNilaiIndikator.Text := inttostr(A_I_5);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_6;
        // lbNilaiIndikator.Text := inttostr(A_I_6);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_7;
        // lbNilaiIndikator.Text := inttostr(A_I_7);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_8;
        // lbNilaiIndikator.Text := inttostr(A_I_8);
        // lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_1;
        // lbNilaiIndikator.Text := inttostr(A_A_1);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_2;
        // lbNilaiIndikator.Text := inttostr(A_A_2);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_3;
        // lbNilaiIndikator.Text := inttostr(A_A_3);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_4;
        // lbNilaiIndikator.Text := inttostr(A_A_4);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_5;
        // lbNilaiIndikator.Text := inttostr(A_A_5);
        // lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
        // cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbNilaiRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbNilaiSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end
      else if kelas < 3 then
      begin
        B_I_1 := Round(B_I_1 / totB_I_1);
        B_I_2 := Round(B_I_2 / totB_I_2);
        B_I_3 := Round(B_I_3 / totB_I_3);
        B_I_4 := Round(B_I_4 / totB_I_4);
        B_I_5 := Round(B_I_5 / totB_I_5);
        B_I_6 := Round(B_I_6 / totB_I_6);
        B_I_7 := Round(B_I_7 / totB_I_7);
        B_I_8 := Round(B_I_8 / totB_I_8);
        B_I_9 := Round(B_I_9 / totB_I_9);
        B_A_1 := Round(B_A_1 / totB_A_1);
        B_A_2 := Round(B_A_2 / totB_A_2);
        B_A_3 := Round(B_A_3 / totB_A_3);
        B_A_4 := Round(B_A_4 / totB_A_4);
        B_A_5 := Round(B_A_5 / totB_A_5);
        B_A_6 := Round(B_A_6 / totB_A_6);
        B_A_7 := Round(B_A_7 / totB_A_7);
        B_A_8 := Round(B_A_8 / totB_A_8);

        // lbIndikator.Text := indB_I_1;
        // lbNilaiIndikator.Text := inttostr(B_I_1);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_2;
        // lbNilaiIndikator.Text := inttostr(B_I_2);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_3;
        // lbNilaiIndikator.Text := inttostr(B_I_3);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_4;
        // lbNilaiIndikator.Text := inttostr(B_I_4);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_5;
        // lbNilaiIndikator.Text := inttostr(B_I_5);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_6;
        // lbNilaiIndikator.Text := inttostr(B_I_6);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_7;
        // lbNilaiIndikator.Text := inttostr(B_I_7);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_8;
        // lbNilaiIndikator.Text := inttostr(B_I_8);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_9;
        // lbNilaiIndikator.Text := inttostr(B_I_9);
        // lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_1;
        // lbNilaiIndikator.Text := inttostr(B_A_1);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_2;
        // lbNilaiIndikator.Text := inttostr(B_A_2);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_3;
        // lbNilaiIndikator.Text := inttostr(B_A_3);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_4;
        // lbNilaiIndikator.Text := inttostr(B_A_4);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_5;
        // lbNilaiIndikator.Text := inttostr(B_A_5);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_6;
        // lbNilaiIndikator.Text := inttostr(B_A_6);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_7;
        // lbNilaiIndikator.Text := inttostr(B_A_7);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_8;
        // lbNilaiIndikator.Text := inttostr(B_A_8);
        // lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
        // cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbNilaiRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbNilaiSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end;
    end;
    rataIndikator(nis, tanggal);
    // pilihIndikator;
  end
  else
  begin
    lbIndikator.Visible := False;
    lbRataIndikator.Visible := False;
    lbNilaiRataIndikator.Visible := False;
    layNilaiIndikator.Visible := True;
    layNilaiIndikator.Position.y := 825;
    lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
    lbNilaiIndikator.Position.y := 30;
    lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
  end;
  // IndikatorNilai.Free;
  // IndikatorLabel.Free;
  // IndikatorKode.Free;
end;

procedure TfrmLihatLaporanAdmin.rataIndikator(nis, tanggal: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
  currentDate: TDateTime;
  ia, status, tanggalakhir, tanggalawal, TglLahir, BlnLahir, ThnLahir, semester,
    idKelas: String;

  bulan_nilai, tgl, gantiBulan: String;
  cekIndikatorBool: Boolean;
  y, apa, nilaiTemp, nilaiTgl, nilaiInd, nilaiAkt: Integer;
  pecahTanggal: TStringList;
  Date, bulan, tahun, thnbln, n_sekolah, n_rumah: string;

  u, kelas, nilairumah, nilaiakhirrumah, nilaisekolah, nilaiakhirsekolah,
    nb_nilai_rumah, nb_nilai_sekolah, totDataGrafik, totRumah,
    totSekolah: Integer;
  // arrNISN, arrNmSiswa : array [0 .. 100] of string;
begin
  indA_I_1 := '';
  indA_I_2 := '';
  indA_I_3 := '';
  indA_I_4 := '';
  indA_I_5 := '';
  indA_I_6 := '';
  indA_I_7 := '';
  indA_I_8 := '';
  indA_A_1 := '';
  indA_A_2 := '';
  indA_A_3 := '';
  indA_A_4 := '';
  indA_A_5 := '';
  indB_I_1 := '';
  indB_I_2 := '';
  indB_I_3 := '';
  indB_I_4 := '';
  indB_I_5 := '';
  indB_I_6 := '';
  indB_I_7 := '';
  indB_I_8 := '';
  indB_A_1 := '';
  indB_A_2 := '';
  indB_A_3 := '';
  indB_A_4 := '';
  indB_A_5 := '';
  rataA_I_1 := 0;
  rataA_I_2 := 0;
  rataA_I_3 := 0;
  rataA_I_4 := 0;
  rataA_I_5 := 0;
  rataA_I_6 := 0;
  rataA_I_7 := 0;
  rataA_I_8 := 0;
  rataA_A_1 := 0;
  rataA_A_2 := 0;
  rataA_A_3 := 0;
  rataA_A_4 := 0;
  rataA_A_5 := 0;
  rataB_I_1 := 0;
  rataB_I_2 := 0;
  rataB_I_3 := 0;
  rataB_I_4 := 0;
  rataB_I_5 := 0;
  rataB_I_6 := 0;
  rataB_I_7 := 0;
  rataB_I_8 := 0;
  rataB_I_9 := 0;
  rataB_A_1 := 0;
  rataB_A_2 := 0;
  rataB_A_3 := 0;
  rataB_A_4 := 0;
  rataB_A_5 := 0;
  rataB_A_6 := 0;
  rataB_A_7 := 0;
  rataB_A_8 := 0;
  totA_I_1 := 0;
  totA_I_2 := 0;
  totA_I_3 := 0;
  totA_I_4 := 0;
  totA_I_5 := 0;
  totA_I_6 := 0;
  totA_I_7 := 0;
  totA_I_8 := 0;
  totA_A_1 := 0;
  totA_A_2 := 0;
  totA_A_3 := 0;
  totA_A_4 := 0;
  totA_A_5 := 0;
  totB_I_1 := 0;
  totB_I_2 := 0;
  totB_I_3 := 0;
  totB_I_4 := 0;
  totB_I_5 := 0;
  totB_I_6 := 0;
  totB_I_7 := 0;
  totB_I_8 := 0;
  totB_I_9 := 0;
  totB_A_1 := 0;
  totB_A_2 := 0;
  totB_A_3 := 0;
  totB_A_4 := 0;
  totB_A_5 := 0;
  totB_A_6 := 0;
  totB_A_7 := 0;
  totB_A_8 := 0;
  chartA_I_1 := 0;
  chartA_I_2 := 0;
  chartA_I_3 := 0;
  chartA_I_4 := 0;
  chartA_I_5 := 0;
  chartA_I_6 := 0;
  chartA_I_7 := 0;
  chartA_I_8 := 0;
  chartA_A_1 := 0;
  chartA_A_2 := 0;
  chartA_A_3 := 0;
  chartA_A_4 := 0;
  chartA_A_5 := 0;
  chartB_I_1 := 0;
  chartB_I_2 := 0;
  chartB_I_3 := 0;
  chartB_I_4 := 0;
  chartB_I_5 := 0;
  chartB_I_6 := 0;
  chartB_I_7 := 0;
  chartB_I_8 := 0;
  chartB_I_9 := 0;
  chartB_A_1 := 0;
  chartB_A_2 := 0;
  chartB_A_3 := 0;
  chartB_A_4 := 0;
  chartB_A_5 := 0;
  chartB_A_6 := 0;
  chartB_A_7 := 0;
  chartB_A_8 := 0;

  // VertScrollBox4.content.DeleteChildren;
  // i := 0;
  //
  // chMain.Series[0].Clear;
  // chMain.Series[1].Clear;
  //
  // lbNilaiSekolah.Text := '-';
  // lbNilaiRumah.Text := '-';
  // lbRataRumah.Text := '-';
  // lbRataSekolah.Text := '-';

  if durasi = 1 then
  begin
    idKelas := arrId[cbKelas.ItemIndex];
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tgl=' + tanggal + '&kelas=' + idKelas + '&durasi=' + 'rataharian');

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totRumah := 0;
    totSekolah := 0;

    if JA.ToString <> '[]' then
    begin
      for JV in JA do
      begin
        status := JV.GetValue('ib_status', '');
        if (status = 'Rumah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            // chMain.Series[0].add(nilaiInd, JV.GetValue('ib_indikator', ''));
            nb_nilai_rumah := nilaiInd;
            nilairumah := nilairumah + nb_nilai_rumah;
            nilaiakhirrumah := nilaiakhirrumah + 3;
            inc(i);
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            // chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
            nb_nilai_rumah := nilaiAkt;
            nilairumah := nilairumah + nb_nilai_rumah;
            nilaiakhirrumah := nilaiakhirrumah + 1;
            inc(i);
          end;
          totRumah := totRumah + 1;
        end
        else if (status = 'Sekolah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            // chMain.Series[0].add(nilaiInd, JV.GetValue('ib_indikator', ''));
            nb_nilai_sekolah := nilaiInd;
            nilaisekolah := nilaisekolah + nb_nilai_sekolah;
            nilaiakhirsekolah := nilaiakhirsekolah + 3;
            inc(i);
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            // chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
            nb_nilai_sekolah := nilaiAkt;
            nilaisekolah := nilaisekolah + nb_nilai_sekolah;
            nilaiakhirsekolah := nilaiakhirsekolah + 1;
            inc(i);
          end;
          totSekolah := totSekolah + 1;
        end;
        if kelas > 3 then
        begin
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[0].add(nilaiTgl, tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                rataB_I_8 := rataB_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[0].add(nilaiTgl, tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end;
      end;
      if totRumah <> 0 then
      begin
        // tthread.Synchronize(nil,
        // procedure
        // begin
        // showMessage('Nilai Rumah: ' + inttostr(nilairumah) + 'Rata2: ' +
        // inttostr(Round(nilairumah / totRumah)));
        lbRataRumah.Text := inttostr(Round(nilairumah / totRumah));
        // end);
      end;
      if totSekolah <> 0 then
      begin
        // tthread.Synchronize(nil,
        // procedure
        // begin
        // showMessage('Nilai Sekolah: ' + inttostr(nilaisekolah) + 'Rata2: ' +
        // inttostr(Round(nilaisekolah / totSekolah)));
        lbRataSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
        // end);
      end;
      if kelas > 3 then
      begin
        // tthread.Synchronize(nil,
        // procedure
        // begin
        // lbIndikator.Text := indA_I_1;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_1 / totA_I_1));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_2;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_2 / totA_I_2));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_3;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_3 / totA_I_3));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_4;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_4 / totA_I_4));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_5;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_5 / totA_I_5));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_6;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_6 / totA_I_6));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_7;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_7 / totA_I_7));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_I_8;
        // lbNilaiIndikator.Text := inttostr(Round(A_I_8 / totA_I_8));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_1;
        // lbNilaiIndikator.Text := inttostr(Round(A_A_1 / totA_A_1));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_2;
        // lbNilaiIndikator.Text := inttostr(Round(A_A_2 / totA_A_2));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_3;
        // lbNilaiIndikator.Text := inttostr(Round(A_A_3 / totA_A_3));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_4;
        // lbNilaiIndikator.Text := inttostr(Round(A_A_4 / totA_A_4));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indA_A_5;
        // lbNilaiIndikator.Text := inttostr(Round(A_A_5 / totA_A_5));
        // cloneIndikator(VertScrollBox4);

        // chMain.Series[1].add(Round(rataA_I_1 / totA_I_1), indA_I_1);
        // chMain.Series[1].add(Round(rataA_I_2 / totA_I_2), indA_I_2);
        // chMain.Series[1].add(Round(rataA_I_3 / totA_I_3), indA_I_3);
        // chMain.Series[1].add(Round(rataA_I_4 / totA_I_4), indA_I_4);
        // chMain.Series[1].add(Round(rataA_I_5 / totA_I_5), indA_I_5);
        // chMain.Series[1].add(Round(rataA_I_6 / totA_I_6), indA_I_6);
        // chMain.Series[1].add(Round(rataA_I_7 / totA_I_7), indA_I_7);
        // chMain.Series[1].add(Round(rataA_I_8 / totA_I_8), indA_I_8);
        // chMain.Series[1].add(Round(rataA_A_1 / totA_A_1), indA_A_1);
        // chMain.Series[1].add(Round(rataA_A_2 / totA_A_2), indA_A_2);
        // chMain.Series[1].add(Round(rataA_A_3 / totA_A_3), indA_A_3);
        // chMain.Series[1].add(Round(rataA_A_4 / totA_A_4), indA_A_4);
        // chMain.Series[1].add(Round(rataA_A_5 / totA_A_5), indA_A_5);

        rataA_I_1 := (Round(rataA_I_1 / totA_I_1));
        rataA_I_2 := (Round(rataA_I_2 / totA_I_2));
        rataA_I_3 := (Round(rataA_I_3 / totA_I_3));
        rataA_I_4 := (Round(rataA_I_4 / totA_I_4));
        rataA_I_5 := (Round(rataA_I_5 / totA_I_5));
        rataA_I_6 := (Round(rataA_I_6 / totA_I_6));
        rataA_I_7 := (Round(rataA_I_7 / totA_I_7));
        rataA_I_8 := (Round(rataA_I_8 / totA_I_8));
        rataA_A_1 := (Round(rataA_A_1 / totA_A_1));
        rataA_A_2 := (Round(rataA_A_2 / totA_A_2));
        rataA_A_3 := (Round(rataA_A_3 / totA_A_3));
        rataA_A_4 := (Round(rataA_A_4 / totA_A_4));
        rataA_A_5 := (Round(rataA_A_5 / totA_A_5));

        chMain.Series[1].add(rataA_I_1, indA_I_1);
        chMain.Series[1].add(rataA_I_2, indA_I_2);
        chMain.Series[1].add(rataA_I_3, indA_I_3);
        chMain.Series[1].add(rataA_I_4, indA_I_4);
        chMain.Series[1].add(rataA_I_5, indA_I_5);
        chMain.Series[1].add(rataA_I_6, indA_I_6);
        chMain.Series[1].add(rataA_I_7, indA_I_7);
        chMain.Series[1].add(rataA_I_8, indA_I_8);
        chMain.Series[1].add(rataA_A_1, indA_A_1);
        chMain.Series[1].add(rataA_A_2, indA_A_2);
        chMain.Series[1].add(rataA_A_3, indA_A_3);
        chMain.Series[1].add(rataA_A_4, indA_A_4);
        chMain.Series[1].add(rataA_A_5, indA_A_5);

        // showMessage('A_I_1 Nilai: ' + inttostr(rataA_I_1));
        // showMessage('A_I_2 Nilai: ' + inttostr(rataA_I_2));
        // showMessage('A_I_3 Nilai: ' + inttostr(rataA_I_3));
        // showMessage('A_I_4 Nilai: ' + inttostr(rataA_I_4));
        // showMessage('A_I_5 Nilai: ' + inttostr(rataA_I_5));
        // showMessage('A_I_6 Nilai: ' + inttostr(rataA_I_6));
        // showMessage('A_I_7 Nilai: ' + inttostr(rataA_I_7));
        // showMessage('A_I_8 Nilai: ' + inttostr(rataA_I_8));
        // showMessage('A_A_1 Nilai: ' + inttostr(rataA_A_1));
        // showMessage('A_A_2 Nilai: ' + inttostr(rataA_A_2));
        // showMessage('A_A_3 Nilai: ' + inttostr(rataA_A_3));
        // showMessage('A_A_4 Nilai: ' + inttostr(rataA_A_4));
        // showMessage('A_A_5 Nilai: ' + inttostr(rataA_A_5));

        // rataB_I_1 := (Round(rataB_I_1 / totB_I_1));
        // rataB_I_2 := (Round(rataB_I_2 / totB_I_2));
        // rataB_I_3 := (Round(rataB_I_3 / totB_I_3));
        // rataB_I_4 := (Round(rataB_I_4 / totB_I_4));
        // rataB_I_5 := (Round(rataB_I_5 / totB_I_5));
        // rataB_I_6 := (Round(rataB_I_6 / totB_I_6));
        // rataB_I_7 := (Round(rataB_I_7 / totB_I_7));
        // rataB_I_8 := (Round(rataB_I_8 / totB_I_8));
        // rataB_I_9 := (Round(rataB_I_9 / totB_I_9));
        // rataB_A_1 := (Round(rataB_A_1 / totB_A_1));
        // rataB_A_2 := (Round(rataB_A_2 / totB_A_2));
        // rataB_A_3 := (Round(rataB_A_3 / totB_A_3));
        // rataB_A_4 := (Round(rataB_A_4 / totB_A_4));
        // rataB_A_5 := (Round(rataB_A_5 / totB_A_5));
        // rataB_A_6 := (Round(rataB_A_6 / totB_A_6));
        // rataB_A_7 := (Round(rataB_A_7 / totB_A_7));
        // rataB_A_8 := (Round(rataB_A_8 / totB_A_8));

        lbIndikator.Text := indA_I_1;
        lbNilaiIndikator.Text := inttostr(A_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_2;
        lbNilaiIndikator.Text := inttostr(A_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_3;
        lbNilaiIndikator.Text := inttostr(A_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_4;
        lbNilaiIndikator.Text := inttostr(A_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_5;
        lbNilaiIndikator.Text := inttostr(A_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_6;
        lbNilaiIndikator.Text := inttostr(A_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_7;
        lbNilaiIndikator.Text := inttostr(A_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_8;
        lbNilaiIndikator.Text := inttostr(A_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_1;
        lbNilaiIndikator.Text := inttostr(A_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_2;
        lbNilaiIndikator.Text := inttostr(A_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_3;
        lbNilaiIndikator.Text := inttostr(A_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_4;
        lbNilaiIndikator.Text := inttostr(A_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_5;
        lbNilaiIndikator.Text := inttostr(A_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
        cloneIndikator(VertScrollBox4);
        // end);
      end
      else if kelas < 3 then
      begin
        // lbIndikator.Text := indB_I_1;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_1 / totB_I_1));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_2;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_2 / totB_I_2));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_3;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_3 / totB_I_3));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_4;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_4 / totB_I_4));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_5;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_5 / totB_I_5));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_6;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_6 / totB_I_6));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_7;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_7 / totB_I_7));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_8;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_8 / totB_I_8));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_I_9;
        // lbNilaiIndikator.Text := inttostr(Round(B_I_9 / totB_I_9));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_1;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_1 / totB_A_1));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_2;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_2 / totB_A_2));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_3;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_3 / totB_A_3));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_4;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_4 / totB_A_4));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_5;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_5 / totB_A_5));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_6;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_6 / totB_A_6));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_7;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_7 / totB_A_7));
        // cloneIndikator(VertScrollBox4);
        // lbIndikator.Text := indB_A_8;
        // lbNilaiIndikator.Text := inttostr(Round(B_A_8 / totB_A_8));
        // cloneIndikator(VertScrollBox4);
        chMain.Series[1].add(Round(rataB_I_1 / totB_I_1), indB_I_1);
        chMain.Series[1].add(Round(rataB_I_2 / totB_I_2), indB_I_2);
        chMain.Series[1].add(Round(rataB_I_3 / totB_I_3), indB_I_3);
        chMain.Series[1].add(Round(rataB_I_4 / totB_I_4), indB_I_4);
        chMain.Series[1].add(Round(rataB_I_5 / totB_I_5), indB_I_5);
        chMain.Series[1].add(Round(rataB_I_6 / totB_I_6), indB_I_6);
        chMain.Series[1].add(Round(rataB_I_7 / totB_I_7), indB_I_7);
        chMain.Series[1].add(Round(rataB_I_8 / totB_I_8), indB_I_8);
        chMain.Series[1].add(Round(rataB_I_9 / totB_I_9), indB_I_9);
        chMain.Series[1].add(Round(rataB_A_1 / totB_A_1), indB_A_1);
        chMain.Series[1].add(Round(rataB_A_2 / totB_A_2), indB_A_2);
        chMain.Series[1].add(Round(rataB_A_3 / totB_A_3), indB_A_3);
        chMain.Series[1].add(Round(rataB_A_4 / totB_A_4), indB_A_4);
        chMain.Series[1].add(Round(rataB_A_5 / totB_A_5), indB_A_5);
        chMain.Series[1].add(Round(rataB_A_6 / totB_A_6), indB_A_6);
        chMain.Series[1].add(Round(rataB_A_7 / totB_A_7), indB_A_7);
        chMain.Series[1].add(Round(rataB_A_8 / totB_A_8), indB_A_8);

        rataB_I_1 := Round(rataB_I_1 / totB_I_1);
        rataB_I_2 := Round(rataB_I_2 / totB_I_2);
        rataB_I_3 := Round(rataB_I_3 / totB_I_3);
        rataB_I_4 := Round(rataB_I_4 / totB_I_4);
        rataB_I_5 := Round(rataB_I_5 / totB_I_5);
        rataB_I_6 := Round(rataB_I_6 / totB_I_6);
        rataB_I_7 := Round(rataB_I_7 / totB_I_7);
        rataB_I_8 := Round(rataB_I_8 / totB_I_8);
        rataB_I_9 := Round(rataB_I_9 / totB_I_9);
        rataB_A_1 := Round(rataB_A_1 / totB_A_1);
        rataB_A_2 := Round(rataB_A_2 / totB_A_2);
        rataB_A_3 := Round(rataB_A_3 / totB_A_3);
        rataB_A_4 := Round(rataB_A_4 / totB_A_4);
        rataB_A_5 := Round(rataB_A_5 / totB_A_5);
        rataB_A_6 := Round(rataB_A_6 / totB_A_6);
        rataB_A_7 := Round(rataB_A_7 / totB_A_7);
        rataB_A_8 := Round(rataB_A_8 / totB_A_8);

        lbIndikator.Text := indB_I_1;
        lbNilaiIndikator.Text := inttostr(B_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_2;
        lbNilaiIndikator.Text := inttostr(B_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_3;
        lbNilaiIndikator.Text := inttostr(B_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_4;
        lbNilaiIndikator.Text := inttostr(B_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_5;
        lbNilaiIndikator.Text := inttostr(B_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_6;
        lbNilaiIndikator.Text := inttostr(B_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_7;
        lbNilaiIndikator.Text := inttostr(B_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_8;
        lbNilaiIndikator.Text := inttostr(B_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_9;
        lbNilaiIndikator.Text := inttostr(B_I_9);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_1;
        lbNilaiIndikator.Text := inttostr(B_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_2;
        lbNilaiIndikator.Text := inttostr(B_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_3;
        lbNilaiIndikator.Text := inttostr(B_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_4;
        lbNilaiIndikator.Text := inttostr(B_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_5;
        lbNilaiIndikator.Text := inttostr(B_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_6;
        lbNilaiIndikator.Text := inttostr(B_A_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_7;
        lbNilaiIndikator.Text := inttostr(B_A_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_8;
        lbNilaiIndikator.Text := inttostr(B_A_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
        cloneIndikator(VertScrollBox4);
      end;
      // pilihIndikator;
    end
    else
    begin
      lbIndikator.Visible := False;
      lbRataIndikator.Visible := False;
      lbNilaiRataIndikator.Visible := False;
      layNilaiIndikator.Visible := True;
      layNilaiIndikator.Position.y := 825;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
      lbNilaiIndikator.Position.y := 30;
      lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
    end;
    // showdataIndikator(nis, tanggal);
  end
  else if durasi = 2 then
  begin
    i := 0;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;
    thnbln := tahun + '-' + bulan;
    tgl := thnbln + '-01';
    // tanggalakhir := ThnLahir + '-' + BlnLahir + '-';
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);

    // IndikatorNilai := TStringList.Create;
    // IndikatorLabel := TStringList.Create;
    // IndikatorKode := TStringList.Create;
    idKelas := arrId[cbKelas.ItemIndex];
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tgl=' + thnbln + '&kelas=' + idKelas + '&durasi=' + 'ratabulanan');

    if (JA.ToString <> '[]') then
    begin
      inputChart(JA, tanggal, 'chMain1');
      for JV in JA do
      begin
        // lable := JV.GetValue('ib_indikator', '');
        // nilai := JV.GetValue('nb_nilai', '');
        // kode := JV.GetValue('ib_indikator_id', '');
        // showmessage(kode+' - '+lable+' - '+nilai);
        // cekIndikatorBool := cekIndikator(lable, nilai, kode);
        // if cekIndikatorBool = True then
        // begin
        // // showMessage('Indikator True');
        // end
        // else if cekIndikatorBool = False then
        // begin
        // IndikatorNilai.add(nilai);
        // IndikatorKode.add(kode);
        // IndikatorLabel.add(lable);
        // // showMessage('Indikator False');
        // end;
        // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
        // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
        // showMessage('Nilai Akt: '+inttostr(nilaiAkt));
        status := JV.GetValue('ib_status', '');
        ia := JV.GetValue('ib_ia', '');
        if kelas > 3 then
        begin
          // showMessage(JV.GetValue('ib_ia', ''));
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // totDataGrafik := totDataGrafik + 1;
          // if ia = 'Indikator' then
          // begin
          // nilaiTgl := nilaiTgl + nilaiInd;
          // nilaiTemp := 2;
          // // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // nilaiTgl := nilaiTgl + nilaiAkt;
          // nilaiTemp := 2;
          // end;
          // // totDataGrafik := totDataGrafik + 1;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[1].add(nilaiTgl, tgl);
          // showMessage('nilai totDataGrafik: ' + inttostr(totDataGrafik));
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // // nilaiTgl := 0;
          // totDataGrafik := 1;
          // if ia = 'Indikator' then
          // begin
          // nilaiTemp := 1;
          // nilaiTgl := nilaiInd;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // nilaiTgl := nilaiAkt;
          // nilaiTemp := 1;
          // end;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := JV.GetValue('nb_tgl', '');
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // totDataGrafik := 1;
          // nilaiTemp := 1;
          // if ia = 'Indikator' then
          // nilaiTgl := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTgl := nilaiAkt;
          // end;
          // end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                rataB_I_8 := rataB_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
          // if JV.GetValue('nb_tgl', '') = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // chMain.Series[1].add(nilaiTgl, tgl);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := JV.GetValue('nb_tgl', '');
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := JV.GetValue('nb_tgl', '');
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end;
      end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // showMessage('totdatagrafik akhir= ' + inttostr(totDataGrafik));
      // chMain.Series[1].add(nilaiTgl, tgl);
      // lbNilaiSekolah.Text := 'WKWK';
      // lbNilaiRumah.Text := 'WKWK';
      // showMessage('NilaiRumah: ' + inttostr(NilaiRumah) +
      // 'totNilaiRumah: ' + inttostr(totRumah));
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Rata-rata: ' + inttostr(Round(nilairumah / totRumah)));

      // nilaisekolah := Round(nilaisekolah / totSekolah);
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Nilai Sekolah String: ' + n_sekolah + ' dan Nilai Rumah: ' + n_rumah);
      // lbNilaiSekolah.Text := inttostr(nilaisekolah);
      // lbNilaiRumah.Text := inttostr(nilairumah);
      // tmpNilaiSekolah := Round(nilaisekolah / i);
      // tmpNilaiAkhirSekolah := nilaiakhirsekolah;
      // tmpNilaiRumah := Round(nilairumah / i);
      // tmpNilaiAkhirRumah := nilaiakhirrumah;
      // sleep(3000);
      // n_sekolah := inttostr(Round(nilaisekolah / totSekolah));
      // n_rumah := inttostr(Round(nilairumah / totRumah));
      // A_I_1 := Round(A_I_1 / totA_I_1);
      // A_I_2 := Round(A_I_2 / totA_I_2);
      // A_I_3 := Round(A_I_3 / totA_I_3);
      // A_I_4 := Round(A_I_4 / totA_I_4);
      // A_I_5 := Round(A_I_5 / totA_I_5);
      // A_I_6 := Round(A_I_6 / totA_I_6);
      // A_I_7 := Round(A_I_7 / totA_I_7);
      // A_I_8 := Round(A_I_8 / totA_I_8);
      // A_A_1 := Round(A_A_1 / totA_A_1);
      // A_A_2 := Round(A_A_2 / totA_A_2);
      // A_A_3 := Round(A_A_3 / totA_A_3);
      // A_A_4 := Round(A_A_4 / totA_A_4);
      // A_A_5 := Round(A_A_5 / totA_A_5);

      if kelas > 3 then
      begin
        rataA_I_1 := (Round(rataA_I_1 / totA_I_1));
        rataA_I_2 := (Round(rataA_I_2 / totA_I_2));
        rataA_I_3 := (Round(rataA_I_3 / totA_I_3));
        rataA_I_4 := (Round(rataA_I_4 / totA_I_4));
        rataA_I_5 := (Round(rataA_I_5 / totA_I_5));
        rataA_I_6 := (Round(rataA_I_6 / totA_I_6));
        rataA_I_7 := (Round(rataA_I_7 / totA_I_7));
        rataA_I_8 := (Round(rataA_I_8 / totA_I_8));
        rataA_A_1 := (Round(rataA_A_1 / totA_A_1));
        rataA_A_2 := (Round(rataA_A_2 / totA_A_2));
        rataA_A_3 := (Round(rataA_A_3 / totA_A_3));
        rataA_A_4 := (Round(rataA_A_4 / totA_A_4));
        rataA_A_5 := (Round(rataA_A_5 / totA_A_5));

        lbIndikator.Text := indA_I_1;
        lbNilaiIndikator.Text := inttostr(A_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_2;
        lbNilaiIndikator.Text := inttostr(A_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_3;
        lbNilaiIndikator.Text := inttostr(A_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_4;
        lbNilaiIndikator.Text := inttostr(A_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_5;
        lbNilaiIndikator.Text := inttostr(A_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_6;
        lbNilaiIndikator.Text := inttostr(A_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_7;
        lbNilaiIndikator.Text := inttostr(A_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_8;
        lbNilaiIndikator.Text := inttostr(A_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_1;
        lbNilaiIndikator.Text := inttostr(A_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_2;
        lbNilaiIndikator.Text := inttostr(A_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_3;
        lbNilaiIndikator.Text := inttostr(A_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_4;
        lbNilaiIndikator.Text := inttostr(A_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_5;
        lbNilaiIndikator.Text := inttostr(A_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
        cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbRataRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbRataSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end
      else if kelas < 3 then
      begin
        rataB_I_1 := Round(rataB_I_1 / totB_I_1);
        rataB_I_2 := Round(rataB_I_2 / totB_I_2);
        rataB_I_3 := Round(rataB_I_3 / totB_I_3);
        rataB_I_4 := Round(rataB_I_4 / totB_I_4);
        rataB_I_5 := Round(rataB_I_5 / totB_I_5);
        rataB_I_6 := Round(rataB_I_6 / totB_I_6);
        rataB_I_7 := Round(rataB_I_7 / totB_I_7);
        rataB_I_8 := Round(rataB_I_8 / totB_I_8);
        rataB_I_9 := Round(rataB_I_9 / totB_I_9);
        rataB_A_1 := Round(rataB_A_1 / totB_A_1);
        rataB_A_2 := Round(rataB_A_2 / totB_A_2);
        rataB_A_3 := Round(rataB_A_3 / totB_A_3);
        rataB_A_4 := Round(rataB_A_4 / totB_A_4);
        rataB_A_5 := Round(rataB_A_5 / totB_A_5);
        rataB_A_6 := Round(rataB_A_6 / totB_A_6);
        rataB_A_7 := Round(rataB_A_7 / totB_A_7);
        rataB_A_8 := Round(rataB_A_8 / totB_A_8);

        lbIndikator.Text := indB_I_1;
        lbNilaiIndikator.Text := inttostr(B_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_2;
        lbNilaiIndikator.Text := inttostr(B_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_3;
        lbNilaiIndikator.Text := inttostr(B_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_4;
        lbNilaiIndikator.Text := inttostr(B_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_5;
        lbNilaiIndikator.Text := inttostr(B_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_6;
        lbNilaiIndikator.Text := inttostr(B_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_7;
        lbNilaiIndikator.Text := inttostr(B_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_8;
        lbNilaiIndikator.Text := inttostr(B_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_9;
        lbNilaiIndikator.Text := inttostr(B_I_9);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_1;
        lbNilaiIndikator.Text := inttostr(B_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_2;
        lbNilaiIndikator.Text := inttostr(B_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_3;
        lbNilaiIndikator.Text := inttostr(B_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_4;
        lbNilaiIndikator.Text := inttostr(B_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_5;
        lbNilaiIndikator.Text := inttostr(B_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_6;
        lbNilaiIndikator.Text := inttostr(B_A_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_7;
        lbNilaiIndikator.Text := inttostr(B_A_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_8;
        lbNilaiIndikator.Text := inttostr(B_A_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
        cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbRataRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbRataSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end;
      pilihIndikator;
    end
    else
    begin
      lbIndikator.Visible := False;
      lbRataIndikator.Visible := False;
      lbNilaiRataIndikator.Visible := False;
      layNilaiIndikator.Visible := True;
      layNilaiIndikator.Position.y := 825;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
      lbNilaiIndikator.Position.y := 30;
      lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
    end;
    // showdataIndikator(nis, tanggal);
    // IndikatorNilai.Free;
    // IndikatorLabel.Free;
    // IndikatorKode.Free;
  end
  else if durasi = 3 then
  begin
    i := 0;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;

    if frmMainAdmin.thn_pelajaran <= tahun then
    begin
      tanggalawal := tahun + '-' + '01' + '-01';
      tanggalakhir := tahun + '-' + '07' + '-05';
      semester := 'Semester Genap Tahun Pelajaran ' +
        inttostr(strtoint(tahun) - 1) + '-' + tahun;
      tgl := '01';
    end
    else
    begin
      tanggalawal := tahun + '-' + '07' + '-06';
      tanggalakhir := tahun + '-' + '12' + '-31';
      semester := 'Semester Ganjil Tahun Pelajaran ' + tahun + '-' +
        inttostr(strtoint(tahun) + 1);
      tgl := '07';
    end;
    // tanggalakhir := ThnLahir + '-' + BlnLahir + '-';
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);

    // IndikatorNilai := TStringList.Create;
    // IndikatorLabel := TStringList.Create;
    // IndikatorKode := TStringList.Create;
    idKelas := arrId[cbKelas.ItemIndex];
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tglawal=' + tanggalawal + '&tglakhir=' + tanggalakhir + '&kelas=' +
      idKelas + '&durasi=' + 'ratasemesteran');

    if (JA.ToString <> '[]') then
    begin
      inputChart(JA, tanggal, 'chMain1');
      for JV in JA do
      begin
        // lable := JV.GetValue('ib_indikator', '');
        // nilai := JV.GetValue('nb_nilai', '');
        // kode := JV.GetValue('ib_indikator_id', '');
        // showmessage(kode+' - '+lable+' - '+nilai);
        // cekIndikatorBool := cekIndikator(lable, nilai, kode);
        // if cekIndikatorBool = True then
        // begin
        // // showMessage('Indikator True');
        // end
        // else if cekIndikatorBool = False then
        // begin
        // IndikatorNilai.add(nilai);
        // IndikatorKode.add(kode);
        // IndikatorLabel.add(lable);
        // // showMessage('Indikator False');
        // end;
        // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
        // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
        // showMessage('Nilai Akt: '+inttostr(nilaiAkt));
        status := JV.GetValue('ib_status', '');
        ia := JV.GetValue('ib_ia', '');
        if kelas > 3 then
        begin
          // showMessage(JV.GetValue('ib_ia', ''));
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_I_1' then
              begin
                rataA_I_1 := rataA_I_1 + nilaiInd;
                indA_I_1 := JV.GetValue('ib_indikator', '');
                totA_I_1 := totA_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_2' then
              begin
                rataA_I_2 := rataA_I_2 + nilaiInd;
                indA_I_2 := JV.GetValue('ib_indikator', '');
                totA_I_2 := totA_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_3' then
              begin
                rataA_I_3 := rataA_I_3 + nilaiInd;
                indA_I_3 := JV.GetValue('ib_indikator', '');
                totA_I_3 := totA_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_4' then
              begin
                rataA_I_4 := rataA_I_4 + nilaiInd;
                indA_I_4 := JV.GetValue('ib_indikator', '');
                totA_I_4 := totA_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_5' then
              begin
                rataA_I_5 := rataA_I_5 + nilaiInd;
                indA_I_5 := JV.GetValue('ib_indikator', '');
                totA_I_5 := totA_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_6' then
              begin
                rataA_I_6 := rataA_I_6 + nilaiInd;
                indA_I_6 := JV.GetValue('ib_indikator', '');
                totA_I_6 := totA_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_7' then
              begin
                rataA_I_7 := rataA_I_7 + nilaiInd;
                indA_I_7 := JV.GetValue('ib_indikator', '');
                totA_I_7 := totA_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_I_8' then
              begin
                rataA_I_8 := rataA_I_8 + nilaiInd;
                indA_I_8 := JV.GetValue('ib_indikator', '');
                totA_I_8 := totA_I_8 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'A_A_1' then
              begin
                rataA_A_1 := rataA_A_1 + nilaiAkt;
                indA_A_1 := JV.GetValue('ib_indikator', '');
                totA_A_1 := totA_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_2' then
              begin
                rataA_A_2 := rataA_A_2 + nilaiAkt;
                indA_A_2 := JV.GetValue('ib_indikator', '');
                totA_A_2 := totA_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_3' then
              begin
                rataA_A_3 := rataA_A_3 + nilaiAkt;
                indA_A_3 := JV.GetValue('ib_indikator', '');
                totA_A_3 := totA_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_4' then
              begin
                rataA_A_4 := rataA_A_4 + nilaiAkt;
                indA_A_4 := JV.GetValue('ib_indikator', '');
                totA_A_4 := totA_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'A_A_5' then
              begin
                rataA_A_5 := rataA_A_5 + nilaiAkt;
                indA_A_5 := JV.GetValue('ib_indikator', '');
                totA_A_5 := totA_A_5 + 1;
              end;
            end;
            inc(i);
          end;
          // pecahTanggal := TStringList.Create;
          // try
          // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
          // bulan_nilai := pecahTanggal[1];
          // finally
          // pecahTanggal.Free;
          // end;
          // if bulan_nilai = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // gantiBulan := frmMainAdmin.ubahBulan(tgl);
          // chMain.Series[1].add(nilaiTgl, gantiBulan);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := bulan_nilai;
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := bulan_nilai;
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end
        else if kelas < 3 then
        begin
          if (status = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_rumah := nilaiInd;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_rumah := nilaiAkt;
              nilairumah := nilairumah + nb_nilai_rumah;
              nilaiakhirrumah := nilaiakhirrumah + 1;
            end;
            totRumah := totRumah + 1;
          end
          else if (status = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
              nb_nilai_sekolah := nilaiInd;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 3;
            end
            else if ia = 'Aktivitas' then
            begin
              nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
              nb_nilai_sekolah := nilaiAkt;
              nilaisekolah := nilaisekolah + nb_nilai_sekolah;
              nilaiakhirsekolah := nilaiakhirsekolah + 1;
            end;
            totSekolah := totSekolah + 1;
          end;
          if (status = 'Rumah') and (statusklik = 'Rumah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_7 := totB_I_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_8' then
              begin
                rataB_I_8 := rataB_I_8 + nilaiInd;
                indB_I_8 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end
          else if (status = 'Sekolah') and (statusklik = 'Sekolah') then
          begin
            if ia = 'Indikator' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_I_1' then
              begin
                rataB_I_1 := rataB_I_1 + nilaiInd;
                indB_I_1 := JV.GetValue('ib_indikator', '');
                totB_I_1 := totB_I_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_2' then
              begin
                rataB_I_2 := rataB_I_2 + nilaiInd;
                indB_I_2 := JV.GetValue('ib_indikator', '');
                totB_I_2 := totB_I_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_3' then
              begin
                rataB_I_3 := rataB_I_3 + nilaiInd;
                indB_I_3 := JV.GetValue('ib_indikator', '');
                totB_I_3 := totB_I_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_4' then
              begin
                rataB_I_4 := rataB_I_4 + nilaiInd;
                indB_I_4 := JV.GetValue('ib_indikator', '');
                totB_I_4 := totB_I_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_5' then
              begin
                rataB_I_5 := rataB_I_5 + nilaiInd;
                indB_I_5 := JV.GetValue('ib_indikator', '');
                totB_I_5 := totB_I_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_6' then
              begin
                rataB_I_6 := rataB_I_6 + nilaiInd;
                indB_I_6 := JV.GetValue('ib_indikator', '');
                totB_I_6 := totB_I_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_7' then
              begin
                rataB_I_7 := rataB_I_7 + nilaiInd;
                indB_I_7 := JV.GetValue('ib_indikator', '');
                totB_I_8 := totB_I_8 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_I_9' then
              begin
                rataB_I_9 := rataB_I_9 + nilaiInd;
                indB_I_9 := JV.GetValue('ib_indikator', '');
                totB_I_9 := totB_I_9 + 1;
              end;
            end
            else if ia = 'Aktivitas' then
            begin
              if JV.GetValue('ib_indikator_id', '') = 'B_A_1' then
              begin
                rataB_A_1 := rataB_A_1 + nilaiAkt;
                indB_A_1 := JV.GetValue('ib_indikator', '');
                totB_A_1 := totB_A_1 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_2' then
              begin
                rataB_A_2 := rataB_A_2 + nilaiAkt;
                indB_A_2 := JV.GetValue('ib_indikator', '');
                totB_A_2 := totB_A_2 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_3' then
              begin
                rataB_A_3 := rataB_A_3 + nilaiAkt;
                indB_A_3 := JV.GetValue('ib_indikator', '');
                totB_A_3 := totB_A_3 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_4' then
              begin
                rataB_A_4 := rataB_A_4 + nilaiAkt;
                indB_A_4 := JV.GetValue('ib_indikator', '');
                totB_A_4 := totB_A_4 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_5' then
              begin
                rataB_A_5 := rataB_A_5 + nilaiAkt;
                indB_A_5 := JV.GetValue('ib_indikator', '');
                totB_A_5 := totB_A_5 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_6' then
              begin
                rataB_A_6 := rataB_A_6 + nilaiAkt;
                indB_A_6 := JV.GetValue('ib_indikator', '');
                totB_A_6 := totB_A_6 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_7' then
              begin
                rataB_A_7 := rataB_A_7 + nilaiAkt;
                indB_A_7 := JV.GetValue('ib_indikator', '');
                totB_A_7 := totB_A_7 + 1;
              end
              else if JV.GetValue('ib_indikator_id', '') = 'B_A_8' then
              begin
                rataB_A_8 := rataB_A_8 + nilaiAkt;
                indB_A_8 := JV.GetValue('ib_indikator', '');
                totB_A_8 := totB_A_8 + 1;
              end;
            end;
            inc(i);
          end;
          // pecahTanggal := TStringList.Create;
          // try
          // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
          // bulan_nilai := pecahTanggal[1];
          // finally
          // pecahTanggal.Free;
          // end;
          // if bulan_nilai = tgl then
          // begin
          // if ia = 'Indikator' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiInd
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiInd;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end
          // else if ia = 'Aktivitas' then
          // begin
          // if nilaiTgl <> 0 then
          // nilaiTgl := nilaiTgl + nilaiAkt
          // else
          // begin
          // nilaiTgl := nilaiTemp + nilaiAkt;
          // nilaiTemp := nilaiTgl;
          // end;
          // totDataGrafik := totDataGrafik + 1;
          // end;
          // end
          // else
          // begin
          // if nilaiTemp <> 0 then
          // begin
          // nilaiTgl := Round(nilaiTgl / totDataGrafik);
          // gantiBulan := frmMainAdmin.ubahBulan(tgl);
          // chMain.Series[0].add(nilaiTgl, gantiBulan);
          // // showMessage('tambah data chart di tgl = ' + tgl);
          // tgl := bulan_nilai;
          // nilaiTgl := 0;
          // totDataGrafik := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end
          // else
          // begin
          // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
          // tgl := bulan_nilai;
          // // showMessage('tgl = '+tgl);
          // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
          // nilaiTgl := 0;
          // if ia = 'Indikator' then
          // nilaiTemp := nilaiInd
          // else if ia = 'Aktivitas' then
          // nilaiTemp := nilaiAkt;
          // end;
          // end;
        end;
      end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chMain.Series[1].add(nilaiTgl, gantiBulan);
      // lbNilaiSekolah.Text := 'WKWK';
      // lbNilaiRumah.Text := 'WKWK';
      // showMessage('NilaiRumah: ' + inttostr(NilaiRumah) +
      // 'totNilaiRumah: ' + inttostr(totRumah));
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Rata-rata: ' + inttostr(Round(nilairumah / totRumah)));

      // nilaisekolah := Round(nilaisekolah / totSekolah);
      // nilairumah := Round(nilairumah / totRumah);
      // showMessage('Nilai Sekolah String: ' + n_sekolah + ' dan Nilai Rumah: ' + n_rumah);
      // lbNilaiSekolah.Text := inttostr(nilaisekolah);
      // lbNilaiRumah.Text := inttostr(nilairumah);
      // tmpNilaiSekolah := Round(nilaisekolah / i);
      // tmpNilaiAkhirSekolah := nilaiakhirsekolah;
      // tmpNilaiRumah := Round(nilairumah / i);
      // tmpNilaiAkhirRumah := nilaiakhirrumah;
      // sleep(3000);
      // n_sekolah := inttostr(Round(nilaisekolah / totSekolah));
      // n_rumah := inttostr(Round(nilairumah / totRumah));
      // A_I_1 := Round(A_I_1 / totA_I_1);
      // A_I_2 := Round(A_I_2 / totA_I_2);
      // A_I_3 := Round(A_I_3 / totA_I_3);
      // A_I_4 := Round(A_I_4 / totA_I_4);
      // A_I_5 := Round(A_I_5 / totA_I_5);
      // A_I_6 := Round(A_I_6 / totA_I_6);
      // A_I_7 := Round(A_I_7 / totA_I_7);
      // A_I_8 := Round(A_I_8 / totA_I_8);
      // A_A_1 := Round(A_A_1 / totA_A_1);
      // A_A_2 := Round(A_A_2 / totA_A_2);
      // A_A_3 := Round(A_A_3 / totA_A_3);
      // A_A_4 := Round(A_A_4 / totA_A_4);
      // A_A_5 := Round(A_A_5 / totA_A_5);

      if kelas > 3 then
      begin
        rataA_I_1 := (Round(rataA_I_1 / totA_I_1));
        rataA_I_2 := (Round(rataA_I_2 / totA_I_2));
        rataA_I_3 := (Round(rataA_I_3 / totA_I_3));
        rataA_I_4 := (Round(rataA_I_4 / totA_I_4));
        rataA_I_5 := (Round(rataA_I_5 / totA_I_5));
        rataA_I_6 := (Round(rataA_I_6 / totA_I_6));
        rataA_I_7 := (Round(rataA_I_7 / totA_I_7));
        rataA_I_8 := (Round(rataA_I_8 / totA_I_8));
        rataA_A_1 := (Round(rataA_A_1 / totA_A_1));
        rataA_A_2 := (Round(rataA_A_2 / totA_A_2));
        rataA_A_3 := (Round(rataA_A_3 / totA_A_3));
        rataA_A_4 := (Round(rataA_A_4 / totA_A_4));
        rataA_A_5 := (Round(rataA_A_5 / totA_A_5));

        lbIndikator.Text := indA_I_1;
        lbNilaiIndikator.Text := inttostr(A_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_2;
        lbNilaiIndikator.Text := inttostr(A_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_3;
        lbNilaiIndikator.Text := inttostr(A_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_4;
        lbNilaiIndikator.Text := inttostr(A_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_5;
        lbNilaiIndikator.Text := inttostr(A_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_6;
        lbNilaiIndikator.Text := inttostr(A_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_7;
        lbNilaiIndikator.Text := inttostr(A_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_I_8;
        lbNilaiIndikator.Text := inttostr(A_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataA_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_1;
        lbNilaiIndikator.Text := inttostr(A_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_2;
        lbNilaiIndikator.Text := inttostr(A_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_3;
        lbNilaiIndikator.Text := inttostr(A_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_4;
        lbNilaiIndikator.Text := inttostr(A_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indA_A_5;
        lbNilaiIndikator.Text := inttostr(A_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataA_A_5);
        cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbRataRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbRataSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end
      else if kelas < 3 then
      begin
        rataB_I_1 := Round(rataB_I_1 / totB_I_1);
        rataB_I_2 := Round(rataB_I_2 / totB_I_2);
        rataB_I_3 := Round(rataB_I_3 / totB_I_3);
        rataB_I_4 := Round(rataB_I_4 / totB_I_4);
        rataB_I_5 := Round(rataB_I_5 / totB_I_5);
        rataB_I_6 := Round(rataB_I_6 / totB_I_6);
        rataB_I_7 := Round(rataB_I_7 / totB_I_7);
        rataB_I_8 := Round(rataB_I_8 / totB_I_8);
        rataB_I_9 := Round(rataB_I_9 / totB_I_9);
        rataB_A_1 := Round(rataB_A_1 / totB_A_1);
        rataB_A_2 := Round(rataB_A_2 / totB_A_2);
        rataB_A_3 := Round(rataB_A_3 / totB_A_3);
        rataB_A_4 := Round(rataB_A_4 / totB_A_4);
        rataB_A_5 := Round(rataB_A_5 / totB_A_5);
        rataB_A_6 := Round(rataB_A_6 / totB_A_6);
        rataB_A_7 := Round(rataB_A_7 / totB_A_7);
        rataB_A_8 := Round(rataB_A_8 / totB_A_8);

        lbIndikator.Text := indB_I_1;
        lbNilaiIndikator.Text := inttostr(B_I_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_2;
        lbNilaiIndikator.Text := inttostr(B_I_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_3;
        lbNilaiIndikator.Text := inttostr(B_I_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_4;
        lbNilaiIndikator.Text := inttostr(B_I_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_5;
        lbNilaiIndikator.Text := inttostr(B_I_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_6;
        lbNilaiIndikator.Text := inttostr(B_I_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_7;
        lbNilaiIndikator.Text := inttostr(B_I_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_8;
        lbNilaiIndikator.Text := inttostr(B_I_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_8);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_I_9;
        lbNilaiIndikator.Text := inttostr(B_I_9);
        lbNilaiRataIndikator.Text := inttostr(rataB_I_9);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_1;
        lbNilaiIndikator.Text := inttostr(B_A_1);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_1);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_2;
        lbNilaiIndikator.Text := inttostr(B_A_2);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_2);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_3;
        lbNilaiIndikator.Text := inttostr(B_A_3);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_3);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_4;
        lbNilaiIndikator.Text := inttostr(B_A_4);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_4);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_5;
        lbNilaiIndikator.Text := inttostr(B_A_5);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_5);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_6;
        lbNilaiIndikator.Text := inttostr(B_A_6);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_6);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_7;
        lbNilaiIndikator.Text := inttostr(B_A_7);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_7);
        cloneIndikator(VertScrollBox4);
        lbIndikator.Text := indB_A_8;
        lbNilaiIndikator.Text := inttostr(B_A_8);
        lbNilaiRataIndikator.Text := inttostr(rataB_A_8);
        cloneIndikator(VertScrollBox4);

        if totRumah <> 0 then
          lbRataRumah.Text := inttostr(Round(nilairumah / totRumah));
        if totSekolah <> 0 then
          lbRataSekolah.Text := inttostr(Round(nilaisekolah / totSekolah));
      end;
      pilihIndikator;
    end
    else
    begin
      lbIndikator.Visible := False;
      lbRataIndikator.Visible := False;
      lbNilaiRataIndikator.Visible := False;
      layNilaiIndikator.Visible := True;
      layNilaiIndikator.Position.y := 825;
      lbNilaiIndikator.TextSettings.HorzAlign := TTextAlign.Center;
      lbNilaiIndikator.Position.y := 30;
      lbNilaiIndikator.Text := 'DATA TIDAK DITEMUKAN';
    end;
    // IndikatorNilai.Free;
    // IndikatorLabel.Free;
    // IndikatorKode.Free;
  end;
end;

procedure TfrmLihatLaporanAdmin.pilihIndikator;
var
  JA: TJSONArray;
  JV: TJSONValue;
  idKelas: String;
  // arrNISN, arrNmSiswa : array [0 .. 100] of string;
begin
  cbPilihIndikator.ItemIndex := -1;
  cbPilihIndikator.Items.Clear;

  // chIndikator.Series[0].Clear;
  // chIndikator.Series[1].Clear;

  idKelas := arrId[cbKelas.ItemIndex];
  JA := frmMainAdmin.doService('indikatorAdmin.php',
    'kelas=' + idKelas + '&exe=' + 'indikatornilai');
  // edPilihIndikator.Text := 'Pilih Indikator';
  y := 0;
  if JA.ToString <> '[]' then
  begin
    arrIdPilihIndikator := TStringList.Create;
    arrNamaIndikator := TStringList.Create;
    for JV in JA do
    begin
      // tthread.Synchronize(nil,
      // procedure
      // begin
      cbPilihIndikator.Items.add(JV.GetValue('ib_indikator', ''));
      arrIdPilihIndikator.add(JV.GetValue('ib_id', ''));
      arrNamaIndikator.add(JV.GetValue('ib_indikator', ''));
      inc(y);
      // end);
    end;
  end;
end;

procedure TfrmLihatLaporanAdmin.grafikIndikator(nis, tanggal: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
  currentDate: TDateTime;
  ia, status, tanggalakhir, tanggalawal, TglLahir, BlnLahir, ThnLahir,
    semester: String;

  bulan_nilai, tgl, gantiBulan: String;
  cekIndikatorBool: Boolean;
  nilaiTemp, nilaiTgl, nilaiInd, nilaiAkt: Integer;
  pecahTanggal: TStringList;
  indikator, nmIndikator, Date, bulan, tahun, thnbln, n_sekolah,
    n_rumah: string;

  u, kelas, nilairumah, nilaiakhirrumah, nilaisekolah, nilaiakhirsekolah,
    nb_nilai_rumah, nb_nilai_sekolah, totDataGrafik, totRumah,
    totSekolah: Integer;
  // arrNISN, arrNmSiswa : array [0 .. 100] of string;
begin
  if durasi = 1 then
  begin
    i := 0;

    chIndikator.Series[0].Clear;
    chIndikator.Series[1].Clear;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totRumah := 0;
    totSekolah := 0;

    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];

    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&indikator=' + indikator + '&tgl=' + tanggal + '&durasi='
      + 'indikatorharian');
    // showMessage('Nilai JA: ' + JA.ToString);
    // showMessage('Nilai JA.Count: ' + inttostr(JA.Count));

    if (JA.ToString <> '[]') then
    begin
      for JV in JA do
      begin
        status := JV.GetValue('ib_status', '');
        if (status = 'Rumah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            chIndikator.Series[0].add(nilaiInd,
              JV.GetValue('ib_indikator', ''));
            inc(i);
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            chIndikator.Series[0].add(nilaiAkt,
              JV.GetValue('ib_indikator', ''));
            inc(i);
          end;
          totRumah := totRumah + 1;
        end
        else if (status = 'Sekolah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            chIndikator.Series[0].add(nilaiInd,
              JV.GetValue('ib_indikator', ''));
            inc(i);
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            chIndikator.Series[0].add(nilaiAkt,
              JV.GetValue('ib_indikator', ''));
            inc(i);
          end;
          totSekolah := totSekolah + 1;
        end;
      end;
    end;
    grafikRataIndikator(tanggal);
  end
  else if durasi = 2 then
  begin
    i := 0;

    chIndikator.Series[0].Clear;
    chIndikator.Series[1].Clear;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;
    thnbln := tahun + '-' + bulan;
    tgl := thnbln + '-01';

    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];

    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&indikator=' + indikator + '&tgl=' + thnbln + '&durasi=' +
      'indikatorbulanan');
    // showMessage('Nilai JA Indikator: ' + JA.ToString);
    // showMessage('Nilai JA.Count: ' + inttostr(JA.Count));
    // TTask.Run(
    // procedure
    // var
    // JV: TJSONValue;
    // begin
    if (JA.ToString <> '[]') then
    begin
      lbSubJudulGrafikIndikatorSiswa.Text := nmIndikator + ' ' +
        frmMainAdmin.ubahBulan(bulan) + '-' + tahun;
      inputChart(JA, tanggal, 'chIndikator0');
      // for JV in JA do
      // begin
      // status := JV.GetValue('ib_status', '');
      // ia := JV.GetValue('ib_ia', '');
      // if (status = 'Rumah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
      // end;
      // totRumah := totRumah + 1;
      // end
      // else if (status = 'Sekolah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
      // end;
      // totSekolah := totSekolah + 1;
      // end;
      // // tthread.Synchronize(nil,
      // // procedure
      // // begin
      // // ShowMessage('penambahan nilai status: ' + status + ' ia: ' + ia +
      // // ' nilai = ' + JV.GetValue('nb_nilai', '') + ' tgl= ' +
      // // JV.GetValue('nb_tgl', ''));
      // // end);
      // if kelas > 3 then
      // begin
      // if JV.GetValue('nb_tgl', '') = tgl then
      // begin
      // totDataGrafik := totDataGrafik + 1;
      // if ia = 'Indikator' then
      // begin
      // nilaiTgl := nilaiTgl + nilaiInd;
      // nilaiTemp := 2;
      // // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiTgl := nilaiTgl + nilaiAkt;
      // nilaiTemp := 2;
      // end;
      // // totDataGrafik := totDataGrafik + 1;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[0].add(nilaiTgl, tgl);
      // showMessage('nilai totDataGrafik: ' + inttostr(totDataGrafik));
      // // showMessage('tambah data chart di tgl = ' + tgl);
      // tgl := JV.GetValue('nb_tgl', '');
      // // nilaiTgl := 0;
      // totDataGrafik := 1;
      // if ia = 'Indikator' then
      // begin
      // nilaiTemp := 1;
      // nilaiTgl := nilaiInd;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiTgl := nilaiAkt;
      // nilaiTemp := 1;
      // end;
      // end
      // else
      // begin
      // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
      // tgl := JV.GetValue('nb_tgl', '');
      // // showMessage('tgl = '+tgl);
      // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
      // totDataGrafik := 1;
      // nilaiTemp := 1;
      // if ia = 'Indikator' then
      // nilaiTgl := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTgl := nilaiAkt;
      // end;
      // end;
      // end
      // else if kelas < 3 then
      // begin
      // if JV.GetValue('nb_tgl', '') = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[0].add(nilaiTgl, tgl);
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end
      // else
      // begin
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end;
      // end;
      // tthread.Synchronize(nil,
      // procedure
      // begin
      // showMessage('tambah Tchart terakhir');
      // totDataGrafik := totDataGrafik + 1;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[0].add(nilaiTgl, tgl);
      // ShowMessage('tchart nilaitgl: ' + inttostr(nilaiTgl) +
      // ' tgl: ' + tgl);
      // end);
    end;
    // end).Start;
    grafikRataIndikator(tanggal);
  end
  else if durasi = 3 then
  begin
    i := 0;

    chIndikator.Series[0].Clear;
    chIndikator.Series[1].Clear;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;

    if frmMainAdmin.thn_pelajaran <= tahun then
    begin
      tanggalawal := tahun + '-' + '01' + '-01';
      tanggalakhir := tahun + '-' + '07' + '-05';
      semester := 'Semester Genap Tahun Pelajaran ' +
        inttostr(strtoint(tahun) - 1) + '-' + tahun;
      tgl := '01';
    end
    else
    begin
      tanggalawal := tahun + '-' + '07' + '-06';
      tanggalakhir := tahun + '-' + '12' + '-31';
      semester := 'Semester Ganjil Tahun Pelajaran ' + tahun + '-' +
        inttostr(strtoint(tahun) + 1);
      tgl := '07';
    end;

    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];

    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'nis=' + nis + '&tglawal=' + tanggalawal + '&tglakhir=' + tanggalakhir +
      '&indikator=' + indikator + '&durasi=' + 'indikatorsemesteran');
    // showMessage('Nilai JA Indikator: ' + JA.ToString);
    // showMessage('Nilai JA.Count: ' + inttostr(JA.Count));

    if (JA.ToString <> '[]') then
    begin
      inputChart(JA, tanggal, 'chIndikator0');
      // lbSubJudulGrafikIndikatorSiswa.Text := nmIndikator + ' ' + semester;
      // for JV in JA do
      // begin
      // status := JV.GetValue('ib_status', '');
      // ia := JV.GetValue('ib_ia', '');
      // if (status = 'Rumah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // end;
      // totRumah := totRumah + 1;
      // end
      // else if (status = 'Sekolah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // end;
      // totSekolah := totSekolah + 1;
      // end;
      // if kelas > 3 then
      // begin
      // // pecah tanggal lahir
      // pecahTanggal := TStringList.Create;
      // try
      // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
      // bulan_nilai := pecahTanggal[1];
      // finally
      // pecahTanggal.Free;
      // end;
      // if bulan_nilai = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[0].add(nilaiTgl, gantiBulan);
      // tgl := bulan_nilai;
      // // showMessage('tambah data chart di tgl = ' + tgl);
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end
      // else
      // begin
      // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
      // tgl := bulan_nilai;
      // // showMessage('tgl = '+tgl);
      // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end
      // else if kelas < 3 then
      // begin
      // // pecah tanggal lahir
      // pecahTanggal := TStringList.Create;
      // try
      // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
      // bulan_nilai := pecahTanggal[1];
      // finally
      // pecahTanggal.Free;
      // end;
      // if bulan_nilai = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[0].add(nilaiTgl, gantiBulan);
      // // showMessage('tambah data chart di tgl = ' + tgl);
      // tgl := bulan_nilai;
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end
      // else
      // begin
      // // showMessage('tgl = '+tgl+', nilai temp = '+inttostr(nilaiTemp));
      // tgl := bulan_nilai;
      // // showMessage('tgl = '+tgl);
      // // showMessage('nb_tanggal = '+JV.GetValue('nb_tgl', ''));
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end;
      // end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[0].add(nilaiTgl, gantiBulan);
    end;
    grafikRataIndikator(tanggal);
  end;
end;

procedure TfrmLihatLaporanAdmin.grafikRataIndikator(tanggal: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  paramList: TStringList;
  currentDate: TDateTime;
  ia, status, tanggalakhir, tanggalawal, TglLahir, BlnLahir, ThnLahir, semester,
    idKelas: String;

  bulan_nilai, tgl, gantiBulan, ib_indikator: String;
  nilaiTemp, nilaiTgl, nilaiInd, nilaiAkt: Integer;
  indikator, nmIndikator, Date, bulan, tahun, thnbln: string;
  pecahTanggal: TStringList;
  i, kelas, nilairumah, nilaiakhirrumah, nilaisekolah, nilaiakhirsekolah,
    nb_nilai_rumah, nb_nilai_sekolah, totDataGrafik, totRumah,
    totSekolah: Integer;
begin
  if durasi = 1 then
  begin
    idKelas := arrId[cbKelas.ItemIndex];
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tgl=' + tanggal + '&kelas=' + idKelas + '&indikator=' + indikator +
      '&durasi=' + 'indikatorrataharian');
    // showMessage('Nilai JA Rata2: ' + JA.ToString);
    // showMessage('Rata-rata JA.Count: ' + inttostr(JA.Count));

    i := 0;
    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totRumah := 0;
    totSekolah := 0;

    if JA.ToString <> '[]' then
    begin
      pecahTanggal := TStringList.Create;
      try
        frmMainAdmin.Split('-', tanggal, pecahTanggal);
        Date := pecahTanggal[2];
        bulan := pecahTanggal[1];
        tahun := pecahTanggal[0];
      finally
        pecahTanggal.Free;
      end;
      lbSubJudulGrafikIndikatorSiswa.Text := nmIndikator + ' (' + Date + ' ' +
        frmMainAdmin.ubahBulan(bulan) + ' ' + tahun + ')';
      for JV in JA do
      begin
        status := JV.GetValue('ib_status', '');
        if (status = 'Rumah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            // chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
          end;
          totRumah := totRumah + 1;
        end
        else if (status = 'Sekolah') then
        begin
          ia := JV.GetValue('ib_ia', '');
          if ia = 'Indikator' then
          begin
            nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
            // chMain.Series[0].add(nilaiInd, JV.GetValue('ib_indikator', ''));
          end
          else if ia = 'Aktivitas' then
          begin
            nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
            // chMain.Series[0].add(nilaiAkt, JV.GetValue('ib_indikator', ''));
          end;
          totSekolah := totSekolah + 1;
        end;
        inc(i);
        ib_indikator := JV.GetValue('ib_indikator', '');
      end;
      chIndikator.Series[1].add(Round((nilaiAkt + nilaiInd) / i), ib_indikator);
    end;
  end
  else if durasi = 2 then
  begin
    i := 0;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;
    thnbln := tahun + '-' + bulan;
    tgl := thnbln + '-01';

    idKelas := arrId[cbKelas.ItemIndex];
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tgl=' + thnbln + '&kelas=' + idKelas + '&indikator=' + indikator +
      '&durasi=' + 'indikatorratabulanan');
    // showMessage('Rata JA Indikator: ' + JA.ToString);
    // showMessage('Rata-rata JA.Count: ' + inttostr(JA.Count));

    if (JA.ToString <> '[]') then
    begin
      lbSubJudulGrafikIndikatorSiswa.Text := nmIndikator + ' (' +
        frmMainAdmin.ubahBulan(bulan) + ' ' + tahun + ')';
      inputChart(JA, tanggal, 'chIndikator1');
      // for JV in JA do
      // begin
      // status := JV.GetValue('ib_status', '');
      // ia := JV.GetValue('ib_ia', '');
      // if (status = 'Rumah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
      // end;
      // totRumah := totRumah + 1;
      // end
      // else if (status = 'Sekolah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // // nilaiInd := strtoint(JV.GetValue('nb_nilai', ''));
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // // nilaiAkt := strtoint(JV.GetValue('nb_nilai', ''));
      // end;
      // totSekolah := totSekolah + 1;
      // end;
      // if kelas > 3 then
      // begin
      // totDataGrafik := totDataGrafik + 1;
      // if JV.GetValue('nb_tgl', '') = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[1].add(nilaiTgl, tgl);
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // begin
      // nilaiTemp := nilaiInd;
      // nilaiTgl := nilaiInd;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiTemp := nilaiAkt;
      // nilaiTgl := nilaiAkt;
      // end;
      // end
      // else
      // begin
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end
      // else if kelas < 3 then
      // begin
      // totDataGrafik := totDataGrafik + 1;
      // if JV.GetValue('nb_tgl', '') = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[1].add(nilaiTgl, tgl);
      // showMessage('nilai totDataGrafik: ' + inttostr(totDataGrafik));
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // begin
      // nilaiTemp := nilaiInd;
      // nilaiTgl := nilaiInd;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiTemp := nilaiAkt;
      // nilaiTgl := nilaiAkt;
      // end;
      // end
      // else
      // begin
      // tgl := JV.GetValue('nb_tgl', '');
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // chIndikator.Series[1].add(nilaiTgl, tgl);
    end;
  end
  else if durasi = 3 then
  begin
    i := 0;

    nilairumah := 0;
    nilaiakhirrumah := 0;
    nilaisekolah := 0;
    nilaiakhirsekolah := 0;
    nb_nilai_rumah := 0;
    nb_nilai_sekolah := 0;
    nilaiTgl := 0;
    nilaiTemp := 0;
    nilaiInd := 0;
    nilaiAkt := 0;
    totDataGrafik := 0;
    totRumah := 0;
    totSekolah := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;

    if frmMainAdmin.thn_pelajaran <= tahun then
    begin
      tanggalawal := tahun + '-' + '01' + '-01';
      tanggalakhir := tahun + '-' + '07' + '-05';
      semester := 'Semester Genap Tahun Pelajaran ' +
        inttostr(strtoint(tahun) - 1) + '-' + tahun;
      tgl := '01';
    end
    else
    begin
      tanggalawal := tahun + '-' + '07' + '-06';
      tanggalakhir := tahun + '-' + '12' + '-31';
      semester := 'Semester Ganjil Tahun Pelajaran ' + tahun + '-' +
        inttostr(strtoint(tahun) + 1);
      tgl := '07';
    end;

    idKelas := arrId[cbKelas.ItemIndex];
    kelas := strtoint(arrKelas[cbKelas.ItemIndex]);
    indikator := arrIdPilihIndikator[cbPilihIndikator.ItemIndex];
    nmIndikator := arrNamaIndikator[cbPilihIndikator.ItemIndex];
    JA := frmMainAdmin.doService('nilaiIsiEvaluasi.php',
      'tglawal=' + tanggalawal + '&tglakhir=' + tanggalakhir + '&kelas=' +
      idKelas + '&indikator=' + indikator + '&durasi=' +
      'indikatorratasemesteran');
    // showMessage('Rata JA Indikator: ' + JA.ToString);
    // showMessage('Rata-rata JA.Count: ' + inttostr(JA.Count));

    if (JA.ToString <> '[]') then
    begin
      lbSubJudulGrafikIndikatorSiswa.Text := nmIndikator + ' (' +
        semester + ')';
      inputChart(JA, tanggal, 'chIndikator1');
      // for JV in JA do
      // begin
      // status := JV.GetValue('ib_status', '');
      // ia := JV.GetValue('ib_ia', '');
      // if (status = 'Rumah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // end;
      // totRumah := totRumah + 1;
      // end
      // else if (status = 'Sekolah') then
      // begin
      // if ia = 'Indikator' then
      // begin
      // nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // nilaiAkt := strtoint(JV.GetValue('nb_nilai', '')) * 100;
      // end;
      // totSekolah := totSekolah + 1;
      // end;
      // if kelas > 3 then
      // begin
      // pecahTanggal := TStringList.Create;
      // try
      // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
      // bulan_nilai := pecahTanggal[1];
      // finally
      // pecahTanggal.Free;
      // end;
      // if bulan_nilai = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[1].add(nilaiTgl, gantiBulan);
      // tgl := bulan_nilai;
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end
      // else
      // begin
      // tgl := bulan_nilai;
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end
      // else if kelas < 3 then
      // begin
      // pecahTanggal := TStringList.Create;
      // try
      // frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
      // bulan_nilai := pecahTanggal[1];
      // finally
      // pecahTanggal.Free;
      // end;
      // if bulan_nilai = tgl then
      // begin
      // if ia = 'Indikator' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiInd
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiInd;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end
      // else if ia = 'Aktivitas' then
      // begin
      // if nilaiTgl <> 0 then
      // nilaiTgl := nilaiTgl + nilaiAkt
      // else
      // begin
      // nilaiTgl := nilaiTemp + nilaiAkt;
      // nilaiTemp := nilaiTgl;
      // end;
      // totDataGrafik := totDataGrafik + 1;
      // end;
      // end
      // else
      // begin
      // if nilaiTemp <> 0 then
      // begin
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[0].add(nilaiTgl, gantiBulan);
      // tgl := bulan_nilai;
      // nilaiTgl := 0;
      // totDataGrafik := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end
      // else
      // begin
      // tgl := bulan_nilai;
      // nilaiTgl := 0;
      // if ia = 'Indikator' then
      // nilaiTemp := nilaiInd
      // else if ia = 'Aktivitas' then
      // nilaiTemp := nilaiAkt;
      // end;
      // end;
      // end;
      // end;
      // nilaiTgl := Round(nilaiTgl / totDataGrafik);
      // gantiBulan := frmMainAdmin.ubahBulan(tgl);
      // chIndikator.Series[1].add(nilaiTgl, gantiBulan);
    end;
  end;
end;

procedure TfrmLihatLaporanAdmin.inputChart(JA: TJSONArray;
tanggal, chartSeries: String);
var
  pecahTanggal: TStringList;
  Date, bulan, tahun, thnbln, tgl, tanggalawal, tanggalakhir, ia, gantiBulan,
    bulan_nilai, tanggal_nilai: String;
  JV: TJSONValue;
  nilaiInd, nilaiAkt: Integer;
  tgl1, tgl2, tgl3, tgl4, tgl5, tgl6, tgl7, tgl8, tgl9, tgl10, tgl11, tgl12,
    tgl13, tgl14, tgl15, tgl16, tgl17, tgl18, tgl19, tgl20, tgl21, tgl22, tgl23,
    tgl24, tgl25, tgl26, tgl27, tgl28, tgl29, tgl30, tgl31: Integer;
  totData1, totData2, totData3, totData4, totData5, totData6, totData7,
    totData8, totData9, totData10, totData11, totData12, totData13, totData14,
    totData15, totData16, totData17, totData18, totData19, totData20, totData21,
    totData22, totData23, totData24, totData25, totData26, totData27, totData28,
    totData29, totData30, totData31: Integer;
  bln1, bln2, bln3, bln4, bln5, bln6, bln7a, bln7b, bln8, bln9, bln10, bln11,
    bln12: Integer;
  totbln1, totbln2, totbln3, totbln4, totbln5, totbln6, totbln7a, totbln7b,
    totbln8, totbln9, totbln10, totbln11, totbln12: Integer;

begin
  if durasi = 2 then
  begin
    tgl1 := 0;
    tgl2 := 0;
    tgl3 := 0;
    tgl4 := 0;
    tgl5 := 0;
    tgl6 := 0;
    tgl7 := 0;
    tgl8 := 0;
    tgl9 := 0;
    tgl10 := 0;
    tgl11 := 0;
    tgl12 := 0;
    tgl13 := 0;
    tgl14 := 0;
    tgl15 := 0;
    tgl16 := 0;
    tgl17 := 0;
    tgl18 := 0;
    tgl19 := 0;
    tgl20 := 0;
    tgl21 := 0;
    tgl22 := 0;
    tgl23 := 0;
    tgl24 := 0;
    tgl25 := 0;
    tgl26 := 0;
    tgl27 := 0;
    tgl28 := 0;
    tgl29 := 0;
    tgl30 := 0;
    tgl31 := 0;

    totData1 := 0;
    totData2 := 0;
    totData3 := 0;
    totData4 := 0;
    totData5 := 0;
    totData6 := 0;
    totData7 := 0;
    totData8 := 0;
    totData9 := 0;
    totData10 := 0;
    totData11 := 0;
    totData12 := 0;
    totData13 := 0;
    totData14 := 0;
    totData15 := 0;
    totData16 := 0;
    totData17 := 0;
    totData18 := 0;
    totData19 := 0;
    totData20 := 0;
    totData21 := 0;
    totData22 := 0;
    totData23 := 0;
    totData24 := 0;
    totData25 := 0;
    totData26 := 0;
    totData27 := 0;
    totData28 := 0;
    totData29 := 0;
    totData30 := 0;
    totData31 := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;
    thnbln := tahun + '-' + bulan;
    tgl := thnbln + '-';

    for JV in JA do
    begin
      ia := JV.GetValue('ib_ia', '');
      if ia = 'Indikator' then
      begin
        nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
      end
      else if ia = 'Aktivitas' then
      begin
        nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
      end;
      if JV.GetValue('nb_tgl', '') = (tgl + '01') then
      begin
        if ia = 'Indikator' then
          tgl1 := tgl1 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl1 := tgl1 + nilaiAkt;
        totData1 := totData1 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '02') then
      begin
        if ia = 'Indikator' then
          tgl2 := tgl2 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl2 := tgl2 + nilaiAkt;
        totData2 := totData2 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '03') then
      begin
        if ia = 'Indikator' then
          tgl3 := tgl3 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl3 := tgl3 + nilaiAkt;
        totData3 := totData3 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '04') then
      begin
        if ia = 'Indikator' then
          tgl4 := tgl4 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl4 := tgl4 + nilaiAkt;
        totData4 := totData4 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '05') then
      begin
        if ia = 'Indikator' then
          tgl5 := tgl5 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl5 := tgl5 + nilaiAkt;
        totData5 := totData5 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '06') then
      begin
        if ia = 'Indikator' then
          tgl6 := tgl6 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl6 := tgl6 + nilaiAkt;
        totData6 := totData6 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '07') then
      begin
        if ia = 'Indikator' then
          tgl7 := tgl7 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl7 := tgl1 + nilaiAkt;
        totData7 := totData7 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '08') then
      begin
        if ia = 'Indikator' then
          tgl8 := tgl8 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl8 := tgl8 + nilaiAkt;
        totData8 := totData8 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '09') then
      begin
        if ia = 'Indikator' then
          tgl9 := tgl9 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl9 := tgl9 + nilaiAkt;
        totData9 := totData9 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '10') then
      begin
        if ia = 'Indikator' then
          tgl10 := tgl10 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl10 := tgl10 + nilaiAkt;
        totData10 := totData10 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '11') then
      begin
        if ia = 'Indikator' then
          tgl11 := tgl11 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl11 := tgl11 + nilaiAkt;
        totData11 := totData11 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '12') then
      begin
        if ia = 'Indikator' then
          tgl12 := tgl12 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl12 := tgl12 + nilaiAkt;
        totData12 := totData12 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '13') then
      begin
        if ia = 'Indikator' then
          tgl13 := tgl13 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl13 := tgl13 + nilaiAkt;
        totData13 := totData13 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '14') then
      begin
        if ia = 'Indikator' then
          tgl14 := tgl14 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl14 := tgl14 + nilaiAkt;
        totData14 := totData14 + 1;
      end

      else if JV.GetValue('nb_tgl', '') = (tgl + '15') then
      begin
        if ia = 'Indikator' then
          tgl15 := tgl15 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl15 := tgl1 + nilaiAkt;
        totData15 := totData15 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '16') then
      begin
        if ia = 'Indikator' then
          tgl16 := tgl16 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl16 := tgl16 + nilaiAkt;
        totData16 := totData16 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '17') then
      begin
        if ia = 'Indikator' then
          tgl17 := tgl17 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl17 := tgl17 + nilaiAkt;
        totData17 := totData17 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '18') then
      begin
        if ia = 'Indikator' then
          tgl18 := tgl18 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl18 := tgl18 + nilaiAkt;
        totData18 := totData18 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '19') then
      begin
        if ia = 'Indikator' then
          tgl19 := tgl19 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl19 := tgl19 + nilaiAkt;
        totData19 := totData19 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '20') then
      begin
        if ia = 'Indikator' then
          tgl20 := tgl20 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl20 := tgl20 + nilaiAkt;
        totData20 := totData20 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '21') then
      begin
        if ia = 'Indikator' then
          tgl21 := tgl21 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl21 := tgl21 + nilaiAkt;
        totData21 := totData21 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '22') then
      begin
        if ia = 'Indikator' then
          tgl22 := tgl22 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl22 := tgl22 + nilaiAkt;
        totData22 := totData22 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '23') then
      begin
        if ia = 'Indikator' then
          tgl23 := tgl23 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl23 := tgl23 + nilaiAkt;
        totData23 := totData23 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '24') then
      begin
        if ia = 'Indikator' then
          tgl24 := tgl24 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl24 := tgl24 + nilaiAkt;
        totData24 := totData24 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '25') then
      begin
        if ia = 'Indikator' then
          tgl25 := tgl25 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl25 := tgl25 + nilaiAkt;
        totData25 := totData25 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '26') then
      begin
        if ia = 'Indikator' then
          tgl26 := tgl26 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl26 := tgl26 + nilaiAkt;
        totData26 := totData26 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '27') then
      begin
        if ia = 'Indikator' then
          tgl27 := tgl27 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl27 := tgl27 + nilaiAkt;
        totData27 := totData27 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '28') then
      begin
        if ia = 'Indikator' then
          tgl28 := tgl28 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl28 := tgl28 + nilaiAkt;
        totData28 := totData28 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '29') then
      begin
        if ia = 'Indikator' then
          tgl29 := tgl29 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl29 := tgl29 + nilaiAkt;
        totData29 := totData29 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '30') then
      begin
        if ia = 'Indikator' then
          tgl30 := tgl30 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl30 := tgl30 + nilaiAkt;
        totData30 := totData30 + 1;
      end
      else if JV.GetValue('nb_tgl', '') = (tgl + '31') then
      begin
        if ia = 'Indikator' then
          tgl31 := tgl31 + nilaiInd
        else if ia = 'Aktivitas' then
          tgl31 := tgl31 + nilaiAkt;
        totData31 := totData31 + 1;
      end;
    end;
    if chartSeries = 'chMain0' then
    begin
      if totData1 <> 0 then
        chMain.Series[0].add((Round(tgl1 / totData1)), tgl + '01')
      else
        chMain.Series[0].add((Round(tgl1 / 1)), tgl + '01');
      if totData2 <> 0 then
        chMain.Series[0].add((Round(tgl2 / totData2)), tgl + '2')
      else
        chMain.Series[0].add((Round(tgl2 / 1)), tgl + '2');
      if totData3 <> 0 then
        chMain.Series[0].add((Round(tgl3 / totData3)), tgl + '3')
      else
        chMain.Series[0].add((Round(tgl3 / 1)), tgl + '3');
      if totData4 <> 0 then
        chMain.Series[0].add((Round(tgl4 / totData4)), tgl + '4')
      else
        chMain.Series[0].add((Round(tgl4 / 1)), tgl + '4');
      if totData5 <> 0 then
        chMain.Series[0].add((Round(tgl5 / totData5)), tgl + '5')
      else
        chMain.Series[0].add((Round(tgl5 / 1)), tgl + '5');
      if totData6 <> 0 then
        chMain.Series[0].add((Round(tgl6 / totData6)), tgl + '6')
      else
        chMain.Series[0].add((Round(tgl6 / 1)), tgl + '6');
      if totData7 <> 0 then
        chMain.Series[0].add((Round(tgl7 / totData7)), tgl + '7')
      else
        chMain.Series[0].add((Round(tgl7 / 1)), tgl + '7');
      if totData8 <> 0 then
        chMain.Series[0].add((Round(tgl8 / totData8)), tgl + '8')
      else
        chMain.Series[0].add((Round(tgl8 / 1)), tgl + '8');
      if totData9 <> 0 then
        chMain.Series[0].add((Round(tgl9 / totData9)), tgl + '9')
      else
        chMain.Series[0].add((Round(tgl9 / 1)), tgl + '9');
      if totData10 <> 0 then
        chMain.Series[0].add((Round(tgl10 / totData10)), tgl + '10')
      else
        chMain.Series[0].add((Round(tgl10 / 1)), tgl + '10');
      if totData11 <> 0 then
        chMain.Series[0].add((Round(tgl11 / totData11)), tgl + '11')
      else
        chMain.Series[0].add((Round(tgl11 / 1)), tgl + '11');
      if totData12 <> 0 then
        chMain.Series[0].add((Round(tgl12 / totData12)), tgl + '12')
      else
        chMain.Series[0].add((Round(tgl12 / 1)), tgl + '12');
      if totData13 <> 0 then
        chMain.Series[0].add((Round(tgl13 / totData13)), tgl + '13')
      else
        chMain.Series[0].add((Round(tgl13 / 1)), tgl + '13');
      if totData14 <> 0 then
        chMain.Series[0].add((Round(tgl14 / totData14)), tgl + '14')
      else
        chMain.Series[0].add((Round(tgl14 / 1)), tgl + '14');
      if totData15 <> 0 then
        chMain.Series[0].add((Round(tgl15 / totData15)), tgl + '15')
      else
        chMain.Series[0].add((Round(tgl15 / 1)), tgl + '15');
      if totData16 <> 0 then
        chMain.Series[0].add((Round(tgl16 / totData16)), tgl + '16')
      else
        chMain.Series[0].add((Round(tgl16 / 1)), tgl + '16');
      if totData17 <> 0 then
        chMain.Series[0].add((Round(tgl17 / totData17)), tgl + '17')
      else
        chMain.Series[0].add((Round(tgl17 / 1)), tgl + '17');
      if totData18 <> 0 then
        chMain.Series[0].add((Round(tgl18 / totData18)), tgl + '18')
      else
        chMain.Series[0].add((Round(tgl18 / 1)), tgl + '18');
      if totData19 <> 0 then
        chMain.Series[0].add((Round(tgl19 / totData19)), tgl + '19')
      else
        chMain.Series[0].add((Round(tgl19 / 1)), tgl + '19');
      if totData20 <> 0 then
        chMain.Series[0].add((Round(tgl20 / totData20)), tgl + '20')
      else
        chMain.Series[0].add((Round(tgl20 / 1)), tgl + '20');
      if totData21 <> 0 then
        chMain.Series[0].add((Round(tgl21 / totData21)), tgl + '21')
      else
        chMain.Series[0].add((Round(tgl21 / 1)), tgl + '21');
      if totData22 <> 0 then
        chMain.Series[0].add((Round(tgl22 / totData22)), tgl + '22')
      else
        chMain.Series[0].add((Round(tgl22 / 1)), tgl + '22');
      if totData23 <> 0 then
        chMain.Series[0].add((Round(tgl23 / totData23)), tgl + '23')
      else
        chMain.Series[0].add((Round(tgl23 / 1)), tgl + '23');
      if totData24 <> 0 then
        chMain.Series[0].add((Round(tgl24 / totData24)), tgl + '24')
      else
        chMain.Series[0].add((Round(tgl24 / 1)), tgl + '24');
      if totData25 <> 0 then
        chMain.Series[0].add((Round(tgl25 / totData25)), tgl + '25')
      else
        chMain.Series[0].add((Round(tgl25 / 1)), tgl + '25');
      if totData26 <> 0 then
        chMain.Series[0].add((Round(tgl26 / totData26)), tgl + '26')
      else
        chMain.Series[0].add((Round(tgl26 / 1)), tgl + '26');
      if totData27 <> 0 then
        chMain.Series[0].add((Round(tgl27 / totData27)), tgl + '27')
      else
        chMain.Series[0].add((Round(tgl27 / 1)), tgl + '27');
      if totData28 <> 0 then
        chMain.Series[0].add((Round(tgl28 / totData28)), tgl + '28')
      else
        chMain.Series[0].add((Round(tgl28 / 1)), tgl + '28');
      if totData29 <> 0 then
        chMain.Series[0].add((Round(tgl29 / totData29)), tgl + '29')
      else
        chMain.Series[0].add((Round(tgl29 / 1)), tgl + '29');
      if totData30 <> 0 then
        chMain.Series[0].add((Round(tgl30 / totData30)), tgl + '30')
      else
        chMain.Series[0].add((Round(tgl30 / 1)), tgl + '30');
      if totData31 <> 0 then
        chMain.Series[0].add((Round(tgl31 / totData31)), tgl + '31')
      else
        chMain.Series[0].add((Round(tgl31 / 1)), tgl + '31');
    end
    else if chartSeries = 'chMain1' then
    begin
      if totData1 <> 0 then
        chMain.Series[1].add((Round(tgl1 / totData1)), tgl + '1')
      else
        chMain.Series[1].add((Round(tgl1 / 1)), tgl + '1');
      if totData2 <> 0 then
        chMain.Series[1].add((Round(tgl2 / totData2)), tgl + '2')
      else
        chMain.Series[1].add((Round(tgl2 / 1)), tgl + '2');
      if totData3 <> 0 then
        chMain.Series[1].add((Round(tgl3 / totData3)), tgl + '3')
      else
        chMain.Series[1].add((Round(tgl3 / 1)), tgl + '3');
      if totData4 <> 0 then
        chMain.Series[1].add((Round(tgl4 / totData4)), tgl + '4')
      else
        chMain.Series[1].add((Round(tgl4 / 1)), tgl + '4');
      if totData5 <> 0 then
        chMain.Series[1].add((Round(tgl5 / totData5)), tgl + '5')
      else
        chMain.Series[1].add((Round(tgl5 / 1)), tgl + '5');
      if totData6 <> 0 then
        chMain.Series[1].add((Round(tgl6 / totData6)), tgl + '6')
      else
        chMain.Series[1].add((Round(tgl6 / 1)), tgl + '6');
      if totData7 <> 0 then
        chMain.Series[1].add((Round(tgl7 / totData7)), tgl + '7')
      else
        chMain.Series[1].add((Round(tgl7 / 1)), tgl + '7');
      if totData8 <> 0 then
        chMain.Series[1].add((Round(tgl8 / totData8)), tgl + '8')
      else
        chMain.Series[1].add((Round(tgl8 / 1)), tgl + '8');
      if totData9 <> 0 then
        chMain.Series[1].add((Round(tgl9 / totData9)), tgl + '9')
      else
        chMain.Series[1].add((Round(tgl9 / 1)), tgl + '9');
      if totData10 <> 0 then
        chMain.Series[1].add((Round(tgl10 / totData10)), tgl + '10')
      else
        chMain.Series[1].add((Round(tgl10 / 1)), tgl + '10');
      if totData11 <> 0 then
        chMain.Series[1].add((Round(tgl11 / totData11)), tgl + '11')
      else
        chMain.Series[1].add((Round(tgl11 / 1)), tgl + '11');
      if totData12 <> 0 then
        chMain.Series[1].add((Round(tgl12 / totData12)), tgl + '12')
      else
        chMain.Series[1].add((Round(tgl12 / 1)), tgl + '12');
      if totData13 <> 0 then
        chMain.Series[1].add((Round(tgl13 / totData13)), tgl + '13')
      else
        chMain.Series[1].add((Round(tgl13 / 1)), tgl + '13');
      if totData14 <> 0 then
        chMain.Series[1].add((Round(tgl14 / totData14)), tgl + '14')
      else
        chMain.Series[1].add((Round(tgl14 / 1)), tgl + '14');
      if totData15 <> 0 then
        chMain.Series[1].add((Round(tgl15 / totData15)), tgl + '15')
      else
        chMain.Series[1].add((Round(tgl15 / 1)), tgl + '15');
      if totData16 <> 0 then
        chMain.Series[1].add((Round(tgl16 / totData16)), tgl + '16')
      else
        chMain.Series[1].add((Round(tgl16 / 1)), tgl + '16');
      if totData17 <> 0 then
        chMain.Series[1].add((Round(tgl17 / totData17)), tgl + '17')
      else
        chMain.Series[1].add((Round(tgl17 / 1)), tgl + '17');
      if totData18 <> 0 then
        chMain.Series[1].add((Round(tgl18 / totData18)), tgl + '18')
      else
        chMain.Series[1].add((Round(tgl18 / 1)), tgl + '18');
      if totData19 <> 0 then
        chMain.Series[1].add((Round(tgl19 / totData19)), tgl + '19')
      else
        chMain.Series[1].add((Round(tgl19 / 1)), tgl + '19');
      if totData20 <> 0 then
        chMain.Series[1].add((Round(tgl20 / totData20)), tgl + '20')
      else
        chMain.Series[1].add((Round(tgl20 / 1)), tgl + '20');
      if totData21 <> 0 then
        chMain.Series[1].add((Round(tgl21 / totData21)), tgl + '21')
      else
        chMain.Series[1].add((Round(tgl21 / 1)), tgl + '21');
      if totData22 <> 0 then
        chMain.Series[1].add((Round(tgl22 / totData22)), tgl + '22')
      else
        chMain.Series[1].add((Round(tgl22 / 1)), tgl + '22');
      if totData23 <> 0 then
        chMain.Series[1].add((Round(tgl23 / totData23)), tgl + '23')
      else
        chMain.Series[1].add((Round(tgl23 / 1)), tgl + '23');
      if totData24 <> 0 then
        chMain.Series[1].add((Round(tgl24 / totData24)), tgl + '24')
      else
        chMain.Series[1].add((Round(tgl24 / 1)), tgl + '24');
      if totData25 <> 0 then
        chMain.Series[1].add((Round(tgl25 / totData25)), tgl + '25')
      else
        chMain.Series[1].add((Round(tgl25 / 1)), tgl + '25');
      if totData26 <> 0 then
        chMain.Series[1].add((Round(tgl26 / totData26)), tgl + '26')
      else
        chMain.Series[1].add((Round(tgl26 / 1)), tgl + '26');
      if totData27 <> 0 then
        chMain.Series[1].add((Round(tgl27 / totData27)), tgl + '27')
      else
        chMain.Series[1].add((Round(tgl27 / 1)), tgl + '27');
      if totData28 <> 0 then
        chMain.Series[1].add((Round(tgl28 / totData28)), tgl + '28')
      else
        chMain.Series[1].add((Round(tgl28 / 1)), tgl + '28');
      if totData29 <> 0 then
        chMain.Series[1].add((Round(tgl29 / totData29)), tgl + '29')
      else
        chMain.Series[1].add((Round(tgl29 / 1)), tgl + '29');
      if totData30 <> 0 then
        chMain.Series[1].add((Round(tgl30 / totData30)), tgl + '30')
      else
        chMain.Series[1].add((Round(tgl30 / 1)), tgl + '30');
      if totData31 <> 0 then
        chMain.Series[1].add((Round(tgl31 / totData31)), tgl + '31')
      else
        chMain.Series[1].add((Round(tgl31 / 1)), tgl + '31');
    end
    else if chartSeries = 'chIndikator0' then
    begin
      if totData1 <> 0 then
        chIndikator.Series[0].add((Round(tgl1 / totData1)), tgl + '1')
      else
        chIndikator.Series[0].add((Round(tgl1 / 1)), tgl + '1');
      if totData2 <> 0 then
        chIndikator.Series[0].add((Round(tgl2 / totData2)), tgl + '2')
      else
        chIndikator.Series[0].add((Round(tgl2 / 1)), tgl + '2');
      if totData3 <> 0 then
        chIndikator.Series[0].add((Round(tgl3 / totData3)), tgl + '3')
      else
        chIndikator.Series[0].add((Round(tgl3 / 1)), tgl + '3');
      if totData4 <> 0 then
        chIndikator.Series[0].add((Round(tgl4 / totData4)), tgl + '4')
      else
        chIndikator.Series[0].add((Round(tgl4 / 1)), tgl + '4');
      if totData5 <> 0 then
        chIndikator.Series[0].add((Round(tgl5 / totData5)), tgl + '5')
      else
        chIndikator.Series[0].add((Round(tgl5 / 1)), tgl + '5');
      if totData6 <> 0 then
        chIndikator.Series[0].add((Round(tgl6 / totData6)), tgl + '6')
      else
        chIndikator.Series[0].add((Round(tgl6 / 1)), tgl + '6');
      if totData7 <> 0 then
        chIndikator.Series[0].add((Round(tgl7 / totData7)), tgl + '7')
      else
        chIndikator.Series[0].add((Round(tgl7 / 1)), tgl + '7');
      if totData8 <> 0 then
        chIndikator.Series[0].add((Round(tgl8 / totData8)), tgl + '8')
      else
        chIndikator.Series[0].add((Round(tgl8 / 1)), tgl + '8');
      if totData9 <> 0 then
        chIndikator.Series[0].add((Round(tgl9 / totData9)), tgl + '9')
      else
        chIndikator.Series[0].add((Round(tgl9 / 1)), tgl + '9');
      if totData10 <> 0 then
        chIndikator.Series[0].add((Round(tgl10 / totData10)), tgl + '10')
      else
        chIndikator.Series[0].add((Round(tgl10 / 1)), tgl + '10');
      if totData11 <> 0 then
        chIndikator.Series[0].add((Round(tgl11 / totData11)), tgl + '11')
      else
        chIndikator.Series[0].add((Round(tgl11 / 1)), tgl + '11');
      if totData12 <> 0 then
        chIndikator.Series[0].add((Round(tgl12 / totData12)), tgl + '12')
      else
        chIndikator.Series[0].add((Round(tgl12 / 1)), tgl + '12');
      if totData13 <> 0 then
        chIndikator.Series[0].add((Round(tgl13 / totData13)), tgl + '13')
      else
        chIndikator.Series[0].add((Round(tgl13 / 1)), tgl + '13');
      if totData14 <> 0 then
        chIndikator.Series[0].add((Round(tgl14 / totData14)), tgl + '14')
      else
        chIndikator.Series[0].add((Round(tgl14 / 1)), tgl + '14');
      if totData15 <> 0 then
        chIndikator.Series[0].add((Round(tgl15 / totData15)), tgl + '15')
      else
        chIndikator.Series[0].add((Round(tgl15 / 1)), tgl + '15');
      if totData16 <> 0 then
        chIndikator.Series[0].add((Round(tgl16 / totData16)), tgl + '16')
      else
        chIndikator.Series[0].add((Round(tgl16 / 1)), tgl + '16');
      if totData17 <> 0 then
        chIndikator.Series[0].add((Round(tgl17 / totData17)), tgl + '17')
      else
        chIndikator.Series[0].add((Round(tgl17 / 1)), tgl + '17');
      if totData18 <> 0 then
        chIndikator.Series[0].add((Round(tgl18 / totData18)), tgl + '18')
      else
        chIndikator.Series[0].add((Round(tgl18 / 1)), tgl + '18');
      if totData19 <> 0 then
        chIndikator.Series[0].add((Round(tgl19 / totData19)), tgl + '19')
      else
        chIndikator.Series[0].add((Round(tgl19 / 1)), tgl + '19');
      if totData20 <> 0 then
        chIndikator.Series[0].add((Round(tgl20 / totData20)), tgl + '20')
      else
        chIndikator.Series[0].add((Round(tgl20 / 1)), tgl + '20');
      if totData21 <> 0 then
        chIndikator.Series[0].add((Round(tgl21 / totData21)), tgl + '21')
      else
        chIndikator.Series[0].add((Round(tgl21 / 1)), tgl + '21');
      if totData22 <> 0 then
        chIndikator.Series[0].add((Round(tgl22 / totData22)), tgl + '22')
      else
        chIndikator.Series[0].add((Round(tgl22 / 1)), tgl + '22');
      if totData23 <> 0 then
        chIndikator.Series[0].add((Round(tgl23 / totData23)), tgl + '23')
      else
        chIndikator.Series[0].add((Round(tgl23 / 1)), tgl + '23');
      if totData24 <> 0 then
        chIndikator.Series[0].add((Round(tgl24 / totData24)), tgl + '24')
      else
        chIndikator.Series[0].add((Round(tgl24 / 1)), tgl + '24');
      if totData25 <> 0 then
        chIndikator.Series[0].add((Round(tgl25 / totData25)), tgl + '25')
      else
        chIndikator.Series[0].add((Round(tgl25 / 1)), tgl + '25');
      if totData26 <> 0 then
        chIndikator.Series[0].add((Round(tgl26 / totData26)), tgl + '26')
      else
        chIndikator.Series[0].add((Round(tgl26 / 1)), tgl + '26');
      if totData27 <> 0 then
        chIndikator.Series[0].add((Round(tgl27 / totData27)), tgl + '27')
      else
        chIndikator.Series[0].add((Round(tgl27 / 1)), tgl + '27');
      if totData28 <> 0 then
        chIndikator.Series[0].add((Round(tgl28 / totData28)), tgl + '28')
      else
        chIndikator.Series[0].add((Round(tgl28 / 1)), tgl + '28');
      if totData29 <> 0 then
        chIndikator.Series[0].add((Round(tgl29 / totData29)), tgl + '29')
      else
        chIndikator.Series[0].add((Round(tgl29 / 1)), tgl + '29');
      if totData30 <> 0 then
        chIndikator.Series[0].add((Round(tgl30 / totData30)), tgl + '30')
      else
        chIndikator.Series[0].add((Round(tgl30 / 1)), tgl + '30');
      if totData31 <> 0 then
        chIndikator.Series[0].add((Round(tgl31 / totData31)), tgl + '31')
      else
        chIndikator.Series[0].add((Round(tgl31 / 1)), tgl + '31');
    end
    else if chartSeries = 'chIndikator1' then
    begin
      if totData1 <> 0 then
        chIndikator.Series[1].add((Round(tgl1 / totData1)), tgl + '1')
      else
        chIndikator.Series[1].add((Round(tgl1 / 1)), tgl + '1');
      if totData2 <> 0 then
        chIndikator.Series[1].add((Round(tgl2 / totData2)), tgl + '2')
      else
        chIndikator.Series[1].add((Round(tgl2 / 1)), tgl + '2');
      if totData3 <> 0 then
        chIndikator.Series[1].add((Round(tgl3 / totData3)), tgl + '3')
      else
        chIndikator.Series[1].add((Round(tgl3 / 1)), tgl + '3');
      if totData4 <> 0 then
        chIndikator.Series[1].add((Round(tgl4 / totData4)), tgl + '4')
      else
        chIndikator.Series[1].add((Round(tgl4 / 1)), tgl + '4');
      if totData5 <> 0 then
        chIndikator.Series[1].add((Round(tgl5 / totData5)), tgl + '5')
      else
        chIndikator.Series[1].add((Round(tgl5 / 1)), tgl + '5');
      if totData6 <> 0 then
        chIndikator.Series[1].add((Round(tgl6 / totData6)), tgl + '6')
      else
        chIndikator.Series[1].add((Round(tgl6 / 1)), tgl + '6');
      if totData7 <> 0 then
        chIndikator.Series[1].add((Round(tgl7 / totData7)), tgl + '7')
      else
        chIndikator.Series[1].add((Round(tgl7 / 1)), tgl + '7');
      if totData8 <> 0 then
        chIndikator.Series[1].add((Round(tgl8 / totData8)), tgl + '8')
      else
        chIndikator.Series[1].add((Round(tgl8 / 1)), tgl + '8');
      if totData9 <> 0 then
        chIndikator.Series[1].add((Round(tgl9 / totData9)), tgl + '9')
      else
        chIndikator.Series[1].add((Round(tgl9 / 1)), tgl + '9');
      if totData10 <> 0 then
        chIndikator.Series[1].add((Round(tgl10 / totData10)), tgl + '10')
      else
        chIndikator.Series[1].add((Round(tgl10 / 1)), tgl + '10');
      if totData11 <> 0 then
        chIndikator.Series[1].add((Round(tgl11 / totData11)), tgl + '11')
      else
        chIndikator.Series[1].add((Round(tgl11 / 1)), tgl + '11');
      if totData12 <> 0 then
        chIndikator.Series[1].add((Round(tgl12 / totData12)), tgl + '12')
      else
        chIndikator.Series[1].add((Round(tgl12 / 1)), tgl + '12');
      if totData13 <> 0 then
        chIndikator.Series[1].add((Round(tgl13 / totData13)), tgl + '13')
      else
        chIndikator.Series[1].add((Round(tgl13 / 1)), tgl + '13');
      if totData14 <> 0 then
        chIndikator.Series[1].add((Round(tgl14 / totData14)), tgl + '14')
      else
        chIndikator.Series[1].add((Round(tgl14 / 1)), tgl + '14');
      if totData15 <> 0 then
        chIndikator.Series[1].add((Round(tgl15 / totData15)), tgl + '15')
      else
        chIndikator.Series[1].add((Round(tgl15 / 1)), tgl + '15');
      if totData16 <> 0 then
        chIndikator.Series[1].add((Round(tgl16 / totData16)), tgl + '16')
      else
        chIndikator.Series[1].add((Round(tgl16 / 1)), tgl + '16');
      if totData17 <> 0 then
        chIndikator.Series[1].add((Round(tgl17 / totData17)), tgl + '17')
      else
        chIndikator.Series[1].add((Round(tgl17 / 1)), tgl + '17');
      if totData18 <> 0 then
        chIndikator.Series[1].add((Round(tgl18 / totData18)), tgl + '18')
      else
        chIndikator.Series[1].add((Round(tgl18 / 1)), tgl + '18');
      if totData19 <> 0 then
        chIndikator.Series[1].add((Round(tgl19 / totData19)), tgl + '19')
      else
        chIndikator.Series[1].add((Round(tgl19 / 1)), tgl + '19');
      if totData20 <> 0 then
        chIndikator.Series[1].add((Round(tgl20 / totData20)), tgl + '20')
      else
        chIndikator.Series[1].add((Round(tgl20 / 1)), tgl + '20');
      if totData21 <> 0 then
        chIndikator.Series[1].add((Round(tgl21 / totData21)), tgl + '21')
      else
        chIndikator.Series[1].add((Round(tgl21 / 1)), tgl + '21');
      if totData22 <> 0 then
        chIndikator.Series[1].add((Round(tgl22 / totData22)), tgl + '22')
      else
        chIndikator.Series[1].add((Round(tgl22 / 1)), tgl + '22');
      if totData23 <> 0 then
        chIndikator.Series[1].add((Round(tgl23 / totData23)), tgl + '23')
      else
        chIndikator.Series[1].add((Round(tgl23 / 1)), tgl + '23');
      if totData24 <> 0 then
        chIndikator.Series[1].add((Round(tgl24 / totData24)), tgl + '24')
      else
        chIndikator.Series[1].add((Round(tgl24 / 1)), tgl + '24');
      if totData25 <> 0 then
        chIndikator.Series[1].add((Round(tgl25 / totData25)), tgl + '25')
      else
        chIndikator.Series[1].add((Round(tgl25 / 1)), tgl + '25');
      if totData26 <> 0 then
        chIndikator.Series[1].add((Round(tgl26 / totData26)), tgl + '26')
      else
        chIndikator.Series[1].add((Round(tgl26 / 1)), tgl + '26');
      if totData27 <> 0 then
        chIndikator.Series[1].add((Round(tgl27 / totData27)), tgl + '27')
      else
        chIndikator.Series[1].add((Round(tgl27 / 1)), tgl + '27');
      if totData28 <> 0 then
        chIndikator.Series[1].add((Round(tgl28 / totData28)), tgl + '28')
      else
        chIndikator.Series[1].add((Round(tgl28 / 1)), tgl + '28');
      if totData29 <> 0 then
        chIndikator.Series[1].add((Round(tgl29 / totData29)), tgl + '29')
      else
        chIndikator.Series[1].add((Round(tgl29 / 1)), tgl + '29');
      if totData30 <> 0 then
        chIndikator.Series[1].add((Round(tgl30 / totData30)), tgl + '30')
      else
        chIndikator.Series[1].add((Round(tgl30 / 1)), tgl + '30');
      if totData31 <> 0 then
        chIndikator.Series[1].add((Round(tgl31 / totData31)), tgl + '31')
      else
        chIndikator.Series[1].add((Round(tgl31 / 1)), tgl + '31');
    end;
  end
  else if durasi = 3 then
  begin
    bln1 := 0;
    bln2 := 0;
    bln3 := 0;
    bln4 := 0;
    bln5 := 0;
    bln6 := 0;
    bln7a := 0;
    bln7b := 0;
    bln8 := 0;
    bln9 := 0;
    bln10 := 0;
    bln11 := 0;
    bln12 := 0;

    totbln1 := 0;
    totbln2 := 0;
    totbln3 := 0;
    totbln4 := 0;
    totbln5 := 0;
    totbln6 := 0;
    totbln7a := 0;
    totbln7b := 0;
    totbln8 := 0;
    totbln9 := 0;
    totbln10 := 0;
    totbln11 := 0;
    totbln12 := 0;

    pecahTanggal := TStringList.Create;
    try
      frmMainAdmin.Split('-', tanggal, pecahTanggal);
      Date := pecahTanggal[2];
      bulan := pecahTanggal[1];
      tahun := pecahTanggal[0];
    finally
      pecahTanggal.Free;
    end;

    if frmMainAdmin.thn_pelajaran <= tahun then
    begin
      tanggalawal := tahun + '-' + '01' + '-01';
      tanggalakhir := tahun + '-' + '07' + '-05';
      tgl := '01';
    end
    else
    begin
      tanggalawal := tahun + '-' + '07' + '-06';
      tanggalakhir := tahun + '-' + '12' + '-31';
      tgl := '07';
    end;
    if JA.ToString <> '[]' then
    begin
      for JV in JA do
      begin
        ia := JV.GetValue('ib_ia', '');
        if ia = 'Indikator' then
        begin
          nilaiInd := Round(strtoint(JV.GetValue('nb_nilai', '')) * 33.33);
        end
        else if ia = 'Aktivitas' then
        begin
          nilaiAkt := Round(strtoint(JV.GetValue('nb_nilai', '')) * 100);
        end;
        pecahTanggal := TStringList.Create;
        try
          frmMainAdmin.Split('-', JV.GetValue('nb_tgl', ''), pecahTanggal);
          bulan_nilai := pecahTanggal[1];
          tanggal_nilai := pecahTanggal[2];
        finally
          pecahTanggal.Free;
        end;
        if bulan_nilai = '01' then
        begin
          if ia = 'Indikator' then
            bln1 := bln1 + nilaiInd
          else if ia = 'Aktivitas' then
            bln1 := bln1 + nilaiAkt;
          totbln1 := totbln1 + 1;
        end
        else if bulan_nilai = '02' then
        begin
          if ia = 'Indikator' then
            bln2 := bln2 + nilaiInd
          else if ia = 'Aktivitas' then
            bln2 := bln2 + nilaiAkt;
          totbln2 := totbln2 + 1;
        end
        else if bulan_nilai = '03' then
        begin
          if ia = 'Indikator' then
            bln3 := bln3 + nilaiInd
          else if ia = 'Aktivitas' then
            bln3 := bln3 + nilaiAkt;
          totbln3 := totbln3 + 1;
        end
        else if bulan_nilai = '04' then
        begin
          if ia = 'Indikator' then
            bln4 := bln4 + nilaiInd
          else if ia = 'Aktivitas' then
            bln4 := bln4 + nilaiAkt;
          totbln4 := totbln4 + 1;
        end
        else if bulan_nilai = '05' then
        begin
          if ia = 'Indikator' then
            bln5 := bln5 + nilaiInd
          else if ia = 'Aktivitas' then
            bln5 := bln5 + nilaiAkt;
          totbln5 := totbln5 + 1;
        end
        else if bulan_nilai = '06' then
        begin
          if ia = 'Indikator' then
            bln6 := bln6 + nilaiInd
          else if ia = 'Aktivitas' then
            bln6 := bln6 + nilaiAkt;
          totbln6 := totbln6 + 1;
        end
        else if bulan_nilai = '07' then
        begin
          if strtoint(tanggal_nilai) < 6 then
          begin
            if ia = 'Indikator' then
              bln7a := bln7a + nilaiInd
            else if ia = 'Aktivitas' then
              bln7a := bln7a + nilaiAkt;
            totbln7a := totbln7a + 1;
          end
          else
          begin
            if ia = 'Indikator' then
              bln7b := bln7b + nilaiInd
            else if ia = 'Aktivitas' then
              bln7b := bln7b + nilaiAkt;
            totbln7b := totbln7b + 1;
          end;
        end
        else if bulan_nilai = '08' then
        begin
          if ia = 'Indikator' then
            bln8 := bln8 + nilaiInd
          else if ia = 'Aktivitas' then
            bln8 := bln8 + nilaiAkt;
          totbln8 := totbln8 + 1;
        end
        else if bulan_nilai = '09' then
        begin
          if ia = 'Indikator' then
            bln9 := bln9 + nilaiInd
          else if ia = 'Aktivitas' then
            bln9 := bln9 + nilaiAkt;
          totbln9 := totbln9 + 1;
        end
        else if bulan_nilai = '10' then
        begin
          if ia = 'Indikator' then
            bln10 := bln10 + nilaiInd
          else if ia = 'Aktivitas' then
            bln10 := bln10 + nilaiAkt;
          totbln10 := totbln10 + 1;
        end
        else if bulan_nilai = '11' then
        begin
          if ia = 'Indikator' then
            bln11 := bln11 + nilaiInd
          else if ia = 'Aktivitas' then
            bln11 := bln11 + nilaiAkt;
          totbln11 := totbln11 + 1;
        end
        else if bulan_nilai = '12' then
        begin
          if ia = 'Indikator' then
            bln12 := bln12 + nilaiInd
          else if ia = 'Aktivitas' then
            bln12 := bln12 + nilaiAkt;
          totbln12 := totbln12 + 1;
        end;
      end;
      if chartSeries = 'chMain0' then
      begin
        if frmMainAdmin.thn_pelajaran <= tahun then
        begin
          if totbln1 <> 0 then
            chMain.Series[0].add((Round(bln1 / totbln1)),
              frmMainAdmin.ubahBulan('01'))
          else
            chMain.Series[0].add((Round(bln1 / 1)),
              frmMainAdmin.ubahBulan('01'));
          if totbln2 <> 0 then
            chMain.Series[0].add((Round(bln2 / totbln2)),
              frmMainAdmin.ubahBulan('02'))
          else
            chMain.Series[0].add((Round(bln2 / 1)),
              frmMainAdmin.ubahBulan('02'));
          if totbln3 <> 0 then
            chMain.Series[0].add((Round(bln3 / totbln3)),
              frmMainAdmin.ubahBulan('03'))
          else
            chMain.Series[0].add((Round(bln3 / 1)),
              frmMainAdmin.ubahBulan('03'));
          if totbln4 <> 0 then
            chMain.Series[0].add((Round(bln4 / totbln4)),
              frmMainAdmin.ubahBulan('04'))
          else
            chMain.Series[0].add((Round(bln4 / 1)),
              frmMainAdmin.ubahBulan('04'));
          if totbln5 <> 0 then
            chMain.Series[0].add((Round(bln5 / totbln5)),
              frmMainAdmin.ubahBulan('05'))
          else
            chMain.Series[0].add((Round(bln5 / 1)),
              frmMainAdmin.ubahBulan('05'));
          if totbln6 <> 0 then
            chMain.Series[0].add((Round(bln6 / totbln6)),
              frmMainAdmin.ubahBulan('06'))
          else
            chMain.Series[0].add((Round(bln6 / 1)),
              frmMainAdmin.ubahBulan('06'));
          if totbln7a <> 0 then
            chMain.Series[0].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chMain.Series[0].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chMain.Series[0].add(0, frmMainAdmin.ubahBulan('07'));
        end
        else
        begin
          if totbln7a <> 0 then
            chMain.Series[0].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chMain.Series[0].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chMain.Series[0].add(0, frmMainAdmin.ubahBulan('07'));
          if totbln8 <> 0 then
            chMain.Series[0].add((Round(bln8 / totbln8)),
              frmMainAdmin.ubahBulan('08'))
          else
            chMain.Series[0].add((Round(bln8 / 1)),
              frmMainAdmin.ubahBulan('08'));
          if totbln9 <> 0 then
            chMain.Series[0].add((Round(bln9 / totbln9)),
              frmMainAdmin.ubahBulan('09'))
          else
            chMain.Series[0].add((Round(bln9 / 1)),
              frmMainAdmin.ubahBulan('09'));
          if totbln10 <> 0 then
            chMain.Series[0].add((Round(bln10 / totbln10)),
              frmMainAdmin.ubahBulan('10'))
          else
            chMain.Series[0].add((Round(bln10 / 1)),
              frmMainAdmin.ubahBulan('10'));
          if totbln11 <> 0 then
            chMain.Series[0].add((Round(bln11 / totbln11)),
              frmMainAdmin.ubahBulan('11'))
          else
            chMain.Series[0].add((Round(bln11 / 1)),
              frmMainAdmin.ubahBulan('11'));
          if totbln12 <> 0 then
            chMain.Series[0].add((Round(bln12 / totbln12)),
              frmMainAdmin.ubahBulan('12'))
          else
            chMain.Series[0].add((Round(bln12 / 1)),
              frmMainAdmin.ubahBulan('12'));
        end;
      end
      else if chartSeries = 'chMain1' then
      begin
        if frmMainAdmin.thn_pelajaran <= tahun then
        begin
          if totbln1 <> 0 then
            chMain.Series[1].add((Round(bln1 / totbln1)),
              frmMainAdmin.ubahBulan('01'))
          else
            chMain.Series[1].add((Round(bln1 / 1)),
              frmMainAdmin.ubahBulan('01'));
          if totbln2 <> 0 then
            chMain.Series[1].add((Round(bln2 / totbln2)),
              frmMainAdmin.ubahBulan('02'))
          else
            chMain.Series[1].add((Round(bln2 / 1)),
              frmMainAdmin.ubahBulan('02'));
          if totbln3 <> 0 then
            chMain.Series[1].add((Round(bln3 / totbln3)),
              frmMainAdmin.ubahBulan('03'))
          else
            chMain.Series[1].add((Round(bln3 / 1)),
              frmMainAdmin.ubahBulan('03'));
          if totbln4 <> 0 then
            chMain.Series[1].add((Round(bln4 / totbln4)),
              frmMainAdmin.ubahBulan('04'))
          else
            chMain.Series[1].add((Round(bln4 / 1)),
              frmMainAdmin.ubahBulan('04'));
          if totbln5 <> 0 then
            chMain.Series[1].add((Round(bln5 / totbln5)),
              frmMainAdmin.ubahBulan('05'))
          else
            chMain.Series[1].add((Round(bln5 / 1)),
              frmMainAdmin.ubahBulan('05'));
          if totbln6 <> 0 then
            chMain.Series[1].add((Round(bln6 / totbln6)),
              frmMainAdmin.ubahBulan('06'))
          else
            chMain.Series[1].add((Round(bln6 / 1)),
              frmMainAdmin.ubahBulan('06'));
          if totbln7a <> 0 then
            chMain.Series[1].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chMain.Series[1].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chMain.Series[1].add(0, frmMainAdmin.ubahBulan('07'));
        end
        else
        begin
          if totbln7a <> 0 then
            chMain.Series[1].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chMain.Series[1].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chMain.Series[1].add(0, frmMainAdmin.ubahBulan('07'));
          if totbln8 <> 0 then
            chMain.Series[1].add((Round(bln8 / totbln8)),
              frmMainAdmin.ubahBulan('08'))
          else
            chMain.Series[1].add((Round(bln8 / 1)),
              frmMainAdmin.ubahBulan('08'));
          if totbln9 <> 0 then
            chMain.Series[1].add((Round(bln9 / totbln9)),
              frmMainAdmin.ubahBulan('09'))
          else
            chMain.Series[1].add((Round(bln9 / 1)),
              frmMainAdmin.ubahBulan('09'));
          if totbln10 <> 0 then
            chMain.Series[1].add((Round(bln10 / totbln10)),
              frmMainAdmin.ubahBulan('10'))
          else
            chMain.Series[1].add((Round(bln10 / 1)),
              frmMainAdmin.ubahBulan('10'));
          if totbln11 <> 0 then
            chMain.Series[1].add((Round(bln11 / totbln11)),
              frmMainAdmin.ubahBulan('11'))
          else
            chMain.Series[1].add((Round(bln11 / 1)),
              frmMainAdmin.ubahBulan('11'));
          if totbln12 <> 0 then
            chMain.Series[1].add((Round(bln12 / totbln12)),
              frmMainAdmin.ubahBulan('12'))
          else
            chMain.Series[1].add((Round(bln12 / 1)),
              frmMainAdmin.ubahBulan('12'));
        end;
      end
      else if chartSeries = 'chIndikator0' then
      begin
        if frmMainAdmin.thn_pelajaran <= tahun then
        begin
          if totbln1 <> 0 then
            chIndikator.Series[0].add((Round(bln1 / totbln1)),
              frmMainAdmin.ubahBulan('01'))
          else
            chIndikator.Series[0].add((Round(bln1 / 1)),
              frmMainAdmin.ubahBulan('01'));
          if totbln2 <> 0 then
            chIndikator.Series[0].add((Round(bln2 / totbln2)),
              frmMainAdmin.ubahBulan('02'))
          else
            chIndikator.Series[0].add((Round(bln2 / 1)),
              frmMainAdmin.ubahBulan('02'));
          if totbln3 <> 0 then
            chIndikator.Series[0].add((Round(bln3 / totbln3)),
              frmMainAdmin.ubahBulan('03'))
          else
            chIndikator.Series[0].add((Round(bln3 / 1)),
              frmMainAdmin.ubahBulan('03'));
          if totbln4 <> 0 then
            chIndikator.Series[0].add((Round(bln4 / totbln4)),
              frmMainAdmin.ubahBulan('04'))
          else
            chIndikator.Series[0].add((Round(bln4 / 1)),
              frmMainAdmin.ubahBulan('04'));
          if totbln5 <> 0 then
            chIndikator.Series[0].add((Round(bln5 / totbln5)),
              frmMainAdmin.ubahBulan('05'))
          else
            chIndikator.Series[0].add((Round(bln5 / 1)),
              frmMainAdmin.ubahBulan('05'));
          if totbln6 <> 0 then
            chIndikator.Series[0].add((Round(bln6 / totbln6)),
              frmMainAdmin.ubahBulan('06'))
          else
            chIndikator.Series[0].add((Round(bln6 / 1)),
              frmMainAdmin.ubahBulan('06'));
          if totbln7a <> 0 then
            chIndikator.Series[0].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chIndikator.Series[0].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chIndikator.Series[0].add(0, frmMainAdmin.ubahBulan('07'));
        end
        else
        begin
          if totbln7a <> 0 then
            chIndikator.Series[0].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chIndikator.Series[0].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chIndikator.Series[0].add(0, frmMainAdmin.ubahBulan('07'));
          if totbln8 <> 0 then
            chIndikator.Series[0].add((Round(bln8 / totbln8)),
              frmMainAdmin.ubahBulan('08'))
          else
            chIndikator.Series[0].add((Round(bln8 / 1)),
              frmMainAdmin.ubahBulan('08'));
          if totbln9 <> 0 then
            chIndikator.Series[0].add((Round(bln9 / totbln9)),
              frmMainAdmin.ubahBulan('09'))
          else
            chIndikator.Series[0].add((Round(bln9 / 1)),
              frmMainAdmin.ubahBulan('09'));
          if totbln10 <> 0 then
            chIndikator.Series[0].add((Round(bln10 / totbln10)),
              frmMainAdmin.ubahBulan('10'))
          else
            chIndikator.Series[0].add((Round(bln10 / 1)),
              frmMainAdmin.ubahBulan('10'));
          if totbln11 <> 0 then
            chIndikator.Series[0].add((Round(bln11 / totbln11)),
              frmMainAdmin.ubahBulan('11'))
          else
            chIndikator.Series[0].add((Round(bln11 / 1)),
              frmMainAdmin.ubahBulan('11'));
          if totbln12 <> 0 then
            chIndikator.Series[0].add((Round(bln12 / totbln12)),
              frmMainAdmin.ubahBulan('12'))
          else
            chIndikator.Series[0].add((Round(bln12 / 1)),
              frmMainAdmin.ubahBulan('12'));
        end;
      end
      else if chartSeries = 'chIndikator1' then
      begin
        if frmMainAdmin.thn_pelajaran <= tahun then
        begin
          if totbln1 <> 0 then
            chIndikator.Series[1].add((Round(bln1 / totbln1)),
              frmMainAdmin.ubahBulan('01'))
          else
            chIndikator.Series[1].add((Round(bln1 / 1)),
              frmMainAdmin.ubahBulan('01'));
          if totbln2 <> 0 then
            chIndikator.Series[1].add((Round(bln2 / totbln2)),
              frmMainAdmin.ubahBulan('02'))
          else
            chIndikator.Series[1].add((Round(bln2 / 1)),
              frmMainAdmin.ubahBulan('02'));
          if totbln3 <> 0 then
            chIndikator.Series[1].add((Round(bln3 / totbln3)),
              frmMainAdmin.ubahBulan('03'))
          else
            chIndikator.Series[1].add((Round(bln3 / 1)),
              frmMainAdmin.ubahBulan('03'));
          if totbln4 <> 0 then
            chIndikator.Series[1].add((Round(bln4 / totbln4)),
              frmMainAdmin.ubahBulan('04'))
          else
            chIndikator.Series[1].add((Round(bln4 / 1)),
              frmMainAdmin.ubahBulan('04'));
          if totbln5 <> 0 then
            chIndikator.Series[1].add((Round(bln5 / totbln5)),
              frmMainAdmin.ubahBulan('05'))
          else
            chIndikator.Series[1].add((Round(bln5 / 1)),
              frmMainAdmin.ubahBulan('05'));
          if totbln6 <> 0 then
            chIndikator.Series[1].add((Round(bln6 / totbln6)),
              frmMainAdmin.ubahBulan('06'))
          else
            chIndikator.Series[1].add((Round(bln6 / 1)),
              frmMainAdmin.ubahBulan('06'));
          if totbln7a <> 0 then
            chIndikator.Series[1].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chIndikator.Series[1].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chIndikator.Series[1].add(0, frmMainAdmin.ubahBulan('07'));
        end
        else
        begin
          if totbln7a <> 0 then
            chIndikator.Series[1].add((Round(bln7a / totbln7a)),
              frmMainAdmin.ubahBulan('07'))
          else if totbln7b <> 0 then
            chIndikator.Series[1].add((Round(bln7b / totbln7b)),
              frmMainAdmin.ubahBulan('07'))
          else
            chIndikator.Series[1].add(0, frmMainAdmin.ubahBulan('07'));
          if totbln8 <> 0 then
            chIndikator.Series[1].add((Round(bln8 / totbln8)),
              frmMainAdmin.ubahBulan('08'))
          else
            chIndikator.Series[1].add((Round(bln8 / 1)),
              frmMainAdmin.ubahBulan('08'));
          if totbln9 <> 0 then
            chIndikator.Series[1].add((Round(bln9 / totbln9)),
              frmMainAdmin.ubahBulan('09'))
          else
            chIndikator.Series[1].add((Round(bln9 / 1)),
              frmMainAdmin.ubahBulan('09'));
          if totbln10 <> 0 then
            chIndikator.Series[1].add((Round(bln10 / totbln10)),
              frmMainAdmin.ubahBulan('10'))
          else
            chIndikator.Series[1].add((Round(bln10 / 1)),
              frmMainAdmin.ubahBulan('10'));
          if totbln11 <> 0 then
            chIndikator.Series[1].add((Round(bln11 / totbln11)),
              frmMainAdmin.ubahBulan('11'))
          else
            chIndikator.Series[1].add((Round(bln11 / 1)),
              frmMainAdmin.ubahBulan('11'));
          if totbln12 <> 0 then
            chIndikator.Series[1].add((Round(bln12 / totbln12)),
              frmMainAdmin.ubahBulan('12'))
          else
            chIndikator.Series[1].add((Round(bln12 / 1)),
              frmMainAdmin.ubahBulan('12'));
        end;
      end;
    end;
  end;
end;

end.
