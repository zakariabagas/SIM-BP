unit KelasAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.JSON, System.Threading, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.ScrollBox, FMX.Edit, FMX.Objects, FMX.Effects, FMX.Ani,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmKelasAdmin = class(TFrame)
    content: TRectangle;
    VertScrollBox1: TVertScrollBox;
    deleteMenu: TRectangle;
    blackScreen: TRectangle;
    animTransparan: TFloatAnimation;
    rectDelete: TRectangle;
    lbDelete: TLabel;
    rectDeleteYa: TRectangle;
    Label13: TLabel;
    ColorAnimation6: TColorAnimation;
    rectDeleteTidak: TRectangle;
    Label14: TLabel;
    ColorAnimation8: TColorAnimation;
    animScaleX: TFloatAnimation;
    animScaleY: TFloatAnimation;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    Image11: TImage;
    lbForm: TLabel;
    rectJudulTabel: TRectangle;
    lbTabelData: TLabel;
    ShadowEffect10: TShadowEffect;
    rectHapusKelas: TRectangle;
    imgHapus: TImage;
    rectEditKelas: TRectangle;
    imgEdit: TImage;
    rectTambahKelas: TRectangle;
    imgTambah: TImage;
    visKelas: TRectangle;
    ShadowEffect9: TShadowEffect;
    btnEditKelas: TRectangle;
    lbCekValue: TLabel;
    ShadowEffect2: TShadowEffect;
    btnHapusKelas: TRectangle;
    Label12: TLabel;
    ShadowEffect4: TShadowEffect;
    btnTambahKelas: TRectangle;
    Label11: TLabel;
    ShadowEffect1: TShadowEffect;
    rectSearch: TRectangle;
    edSearch: TEdit;
    btnSearch: TImage;
    FloatAnimation10: TFloatAnimation;
    stgKelas: TStringGrid;
    stgKelas_No: TStringColumn;
    stgKelas_TahunAjaran: TStringColumn;
    stgKelas_IdKelas: TStringColumn;
    stgKelas_Kelas: TStringColumn;
    stgKelas_NamaKelas: TStringColumn;
    stgKelas_NIP: TStringColumn;
    stgKelas_Nama: TStringColumn;
    procedure rectTambahKelasClick(Sender: TObject);
    procedure rectEditKelasClick(Sender: TObject);
    procedure rectHapusKelasClick(Sender: TObject);
    procedure stgKelasCellClick(const Column: TColumn; const Row: Integer);
    procedure animScaleYFinish(Sender: TObject);
    procedure rectDeleteTidakClick(Sender: TObject);
    procedure rectDeleteYaClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id, id_wk, nis, nip: String;
    procedure ambilData(keyword: string);
    procedure fnClearstgKelas;
    procedure hapusData;
  end;

var
  frmKelasAdmin: TfrmKelasAdmin;

implementation

{$R *.fmx}

uses MainAdmin, TambahDataKelas;

procedure TfrmKelasAdmin.ambilData(keyword: string);
begin
  TTask.Run(
    procedure
    var
      JA: TJSonArray;
      JV: TJSONValue;
      i, iplus, x: Integer;
      kontenSementara: String;
      content: TStringList;
    begin
      tthread.Synchronize(nil,
        procedure
        begin
          Loading.Visible := true;
        end);
      if keyword = '' then
      begin
        JA := frmMainAdmin.doService('kelasAdmin.php', 'exe=tampil');
        i := 0;

        if JA.ToString <> '[]' then
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgKelas.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(nil,
              procedure
              begin
                iplus := i + 1;
                stgKelas.Cells[0, i] := inttostr(i + 1);
                stgKelas.Cells[1, i] := JV.GetValue('k_id', '');
                stgKelas.Cells[2, i] := JV.GetValue('k_kelas', '');
                stgKelas.Cells[3, i] := JV.GetValue('k_nm_kelas', '');
                stgKelas.Cells[4, i] := JV.GetValue('k_thn_ajaran', '');
                stgKelas.Cells[5, i] := JV.GetValue('k_nip', '');
                stgKelas.Cells[6, i] := JV.GetValue('g_nm_lengkap', '');
                i := iplus;
                // ShowMessage(JV.GetValue('ib_indikator', ''));
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(nil,
            procedure
            begin
              showMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end
      else
      begin
        content := TStringList.Create;
        try
          frmMainAdmin.Split(' ', keyword, content);
          for x := 0 to content.Count - 1 do
          begin
            if x = 0 then
              kontenSementara := content[x]
            else
              kontenSementara := kontenSementara + '%20' + content[x];
          end;
        finally
          keyword := kontenSementara;
          content.Free;
        end;
        JA := frmMainAdmin.doService('kelasAdmin.php', 'exe=cari' + '&keyword='
          + keyword);
        i := 0;

        if JA.ToString <> '[]' then
        begin
          // stgKelas.Row := 0;
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgKelas.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(nil,
              procedure
              begin
                iplus := i + 1;
                stgKelas.Cells[0, i] := inttostr(i + 1);
                stgKelas.Cells[1, i] := JV.GetValue('k_id', '');
                stgKelas.Cells[2, i] := JV.GetValue('k_kelas', '');
                stgKelas.Cells[3, i] := JV.GetValue('k_nm_kelas', '');
                stgKelas.Cells[4, i] := JV.GetValue('k_thn_ajaran', '');
                stgKelas.Cells[5, i] := JV.GetValue('k_nip', '');
                stgKelas.Cells[6, i] := JV.GetValue('g_nm_lengkap', '');
                i := iplus;
                // ShowMessage(JV.GetValue('ib_indikator', ''));
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(nil,
            procedure
            begin
              showMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end;
      tthread.Synchronize(nil,
        procedure
        begin
          Loading.Visible := false;
        end);
    end).Start;
end;

procedure TfrmKelasAdmin.animScaleYFinish(Sender: TObject);
begin
  if animScaleY.Inverse = true then
  begin
    deleteMenu.Visible := false;
  end;
end;

procedure TfrmKelasAdmin.btnSearchClick(Sender: TObject);
begin
  ambilData(edSearch.Text);
end;

procedure TfrmKelasAdmin.fnClearstgKelas;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgKelas.RowCount - 1 do
    for kol := 0 to stgKelas.ColumnCount - 1 do
      stgKelas.Cells[kol, bar] := '';

  stgKelas.RowCount := 1;
end;

procedure TfrmKelasAdmin.hapusData;
var
  JA: TJSonArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  ParamList := TStringList.Create;
  ParamList.Add('exe=' + 'hapus');
  ParamList.Add('id_lama=' + id);

  ResponseBody := frmMainAdmin.NetHTTPClient1.Post
    ('http://sditulilalbab-kamal.sch.id/api/kelasAdmin.php', ParamList)
    .ContentAsString;
  if ResponseBody.Equals('Berhasil') then
  begin
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Kelas');
    frmKelasAdmin.ambilData('');
    animTransparan.Inverse := true;
    animScaleX.Inverse := true;
    animScaleY.Inverse := true;
    animTransparan.Start;
    animScaleX.Start;
    animScaleY.Start;
  end
  else
  begin
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Kelas');
  end;
  ParamList.Free;
end;

procedure TfrmKelasAdmin.rectDeleteTidakClick(Sender: TObject);
begin
  animTransparan.Inverse := true;
  animScaleX.Inverse := true;
  animScaleY.Inverse := true;
  animTransparan.Start;
  animScaleX.Start;
  animScaleY.Start;
end;

procedure TfrmKelasAdmin.rectDeleteYaClick(Sender: TObject);
begin
  if id <> '' then
    hapusData;
end;

procedure TfrmKelasAdmin.rectEditKelasClick(Sender: TObject);
begin
  if id <> '' then
  begin
    if frmTambahDataKelas = nil then
    begin
      Application.CreateForm(TfrmTambahDataKelas, frmTambahDataKelas);
    end;
    frmTambahDataKelas.exe := 'edit';
    frmTambahDataKelas.AktifAwal;
    frmTambahDataKelas.Show;
  end
  else
    showMessage('Tabel Belum Di Klik');
end;

procedure TfrmKelasAdmin.rectHapusKelasClick(Sender: TObject);
begin
  if id <> '' then
  begin
    deleteMenu.Visible := true;
    lbDelete.Text := 'Apakah Anda Ingin Menghapus Data Berikut: ' + id;
    animTransparan.Inverse := false;
    animScaleX.Inverse := false;
    animScaleY.Inverse := false;
    animTransparan.Start;
    animScaleX.Start;
    animScaleY.Start;
  end
  else
    showMessage('Tabel Belum Di Klik');
end;

procedure TfrmKelasAdmin.rectTambahKelasClick(Sender: TObject);
begin
  if frmTambahDataKelas = nil then
  begin
    Application.CreateForm(TfrmTambahDataKelas, frmTambahDataKelas);
  end;
  frmTambahDataKelas.exe := 'tambah';
  frmTambahDataKelas.AktifAwal;
  frmTambahDataKelas.ambilDataGuru('');
  frmTambahDataKelas.Show;
end;

procedure TfrmKelasAdmin.stgKelasCellClick(const Column: TColumn;
const Row: Integer);
begin
  id := stgKelas.Cells[1, Row];
end;

end.
