unit HomeAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Effects,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, System.JSON;

type
  TfrmHomeAdmin = class(TFrame)
    content: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Image16: TImage;
    lbForm: TLabel;
    visAdmin: TRectangle;
    Image14: TImage;
    lbVisDataAdmin: TLabel;
    lbVisNilaiAdmin: TLabel;
    ShadowEffect4: TShadowEffect;
    visGrafik: TRectangle;
    lbGrafikPencapaianSiswa: TLabel;
    ShadowEffect5: TShadowEffect;
    chMain: TChart;
    Series1: TAreaSeries;
    visGuru: TRectangle;
    Image11: TImage;
    lbVisDataGuru: TLabel;
    lbVisNilaiGuru: TLabel;
    ShadowEffect1: TShadowEffect;
    visKelas: TRectangle;
    Image13: TImage;
    lbVisDataKelas: TLabel;
    lbVisNilaiKelas: TLabel;
    ShadowEffect3: TShadowEffect;
    visSiswa: TRectangle;
    Image12: TImage;
    lbVisDataSiswa: TLabel;
    lbVisNilaiSiswa: TLabel;
    ShadowEffect2: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    ShadowEffect8: TShadowEffect;
    ShadowEffect9: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ambilData;
  end;

var
  frmHomeAdmin: TFrmHomeAdmin;

implementation

{$R *.fmx}

uses MainAdmin;

procedure TfrmHomeAdmin.ambilData;
var
  JA: TJSONArray;
  JV: TJSONValue;
  currentDate, tglBatas, tglDummy: TDateTime;
  tanggal, bulan, tahunajaran: Word;
  AFormatSettings: TFormatSettings;
begin
  currentDate := Now;
  // ShowMessage('Today     = '+formatdatetime('mm-dd-yyyy', currentDate));
  // currentDate := formatdatetime('mm-dd', currentDate);
  tglBatas := EncodeDate(StrToInt(formatdatetime('yyyy', currentDate)), 07, 05);
  if currentDate >= tglBatas then
  begin
    // ShowMessage('Semester Ganjil / Tahun ajaran');
    tahunajaran := StrToInt(formatdatetime('yyyy', currentDate));
  end
  else if currentDate <= tglBatas then
  begin
    // ShowMessage('Semester Genap / Tahun ajaran-1');
    DecodeDate(currentDate, tahunajaran, bulan, tanggal);
    Dec(tahunajaran);
    // showMessage(inttostr(tahunajaran));
    // tahunajaran := strtoint(tahunajaran)+1;
  end;

  JA := frmMainAdmin.doService('admin.php', 'hitung=guru' + '&tahun=' +
    inttostr(tahunajaran));
  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      lbVisNilaiGuru.Text := JV.GetValue('COUNT(distinct g_nip)', '');
      frmMainAdmin.thn_pelajaran := inttostr(tahunajaran);
    end;
  end;
  JA := frmMainAdmin.doService('admin.php', 'hitung=siswa' + '&tahun=' +
    inttostr(tahunajaran));
  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      lbVisNilaiSiswa.Text := JV.GetValue('COUNT(s_nis)', '');
    end;
  end;
  JA := frmMainAdmin.doService('admin.php', 'hitung=kelas' + '&tahun=' +
    inttostr(tahunajaran));
  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      lbVisNilaiKelas.Text := JV.GetValue('COUNT(distinct k_id)', '');
    end;
  end;
  JA := frmMainAdmin.doService('admin.php', 'hitung=admin' + '&tahun=' +
    inttostr(tahunajaran));
  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      lbVisNilaiAdmin.Text := JV.GetValue('COUNT(a_user)', '');
    end;
  end;
end;

end.
