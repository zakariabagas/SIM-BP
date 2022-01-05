unit TambahDataKelas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Effects, FMX.Ani, FMX.Objects, FMX.Edit, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, System.JSON, System.Threading,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Rtti, FMX.Grid.Style, FMX.Grid, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TfrmTambahDataKelas = class(TForm)
    Isi: TRectangle;
    lbForm: TLabel;
    Layout1: TLayout;
    rectKlik: TRectangle;
    edID: TEdit;
    lbID: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edNmKelas: TEdit;
    lbNmKelas: TLabel;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    edThnAjaran: TEdit;
    lbThnAjaran: TLabel;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    edKelas: TEdit;
    cbKelas: TComboBox;
    lbKelas: TLabel;
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
    kelas1: TListBoxItem;
    kelas2: TListBoxItem;
    kelas3: TListBoxItem;
    kelas4: TListBoxItem;
    kelas5: TListBoxItem;
    kelas6: TListBoxItem;
    IdHTTP1: TIdHTTP;
    Layout5: TLayout;
    rectSearch: TRectangle;
    edSearchGuru: TEdit;
    btnSearchGuru: TImage;
    FloatAnimation10: TFloatAnimation;
    stgGuru: TStringGrid;
    stgMain_No: TStringColumn;
    stgMain_NIP: TStringColumn;
    stgMain_NamaLengkap: TStringColumn;
    stgMain_NamaPanggilan: TStringColumn;
    stgMain_User: TStringColumn;
    stgMain_Pass: TStringColumn;
    stgMain_JK: TStringColumn;
    stgMain_TmpLahir: TStringColumn;
    stgMain_TglLahir: TStringColumn;
    stgMain_Alamat: TStringColumn;
    stgMain_Telp: TStringColumn;
    stgMain_Glyph: TStringColumn;
    lbGuru: TLabel;
    lbNIP: TLabel;
    lbNmGuru: TLabel;
    Image7: TImage;
    NetHTTPClient1: TNetHTTPClient;
    VertScrollBox1: TVertScrollBox;
    procedure rectKlikTap(Sender: TObject; const Point: TPointF);
    procedure stgGuruCellClick(const Column: TColumn; const Row: Integer);
    procedure edSearchGuruKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnSearchGuruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, id, nip: String;
    procedure cleardata;
    procedure ambilData;
    procedure simpanData(crud: String);
    procedure fnClearstgGuru;
    procedure ambilDataGuru(keyword: string);
    procedure AktifAwal;
    // procedure simpanData(crud: String);
  end;

var
  frmTambahDataKelas: TfrmTambahDataKelas;

implementation

{$R *.fmx}

uses MainAdmin, KelasAdmin;

procedure TfrmTambahDataKelas.AktifAwal;
begin
  // Scroll Naik To Top
  // PresentedScrollBox1.ViewportPosition :=
  // PointF(PresentedScrollBox1.Position.X, 0);
  if exe = 'tambah' then
  begin
    lbForm.Text := 'Kelola Data Kelas > ' + 'Tambah Data';
    cleardata;
  end
  else if exe = 'edit' then
  begin
    lbForm.Text := 'Kelola Data Kelas > ' + 'Edit Data';
    ambilData;
  end
  else if exe = 'hapus' then
    lbForm.Text := 'Kelola Data Kelas > ' + 'Hapus Data'
  else
    lbForm.Text := 'Kelola Data Kelas > ' + '';
end;

procedure TfrmTambahDataKelas.btnSearchGuruClick(Sender: TObject);
begin
  ambilDataGuru(edSearchGuru.Text);
end;

procedure TfrmTambahDataKelas.btnSimpanClick(Sender: TObject);
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

procedure TfrmTambahDataKelas.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  if cbKelas.ItemIndex = -1 then
    ShowMessage('Tingkatan Kelas Belum Dipilih')
  else if edNmKelas.Text = '' then
    ShowMessage('Nama Kelas Belum Diisi')
  else if edThnAjaran.Text = '' then
    ShowMessage('Tahun Ajaran Belum Diisi')
  else if nip = '' then
    ShowMessage('Data Guru Belum Dipilih')
  else
  begin
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('id_lama=' + id);
    ParamList.Add('id=' + edID.Text);
    if cbKelas.ItemIndex = 0 then
      ParamList.Add('kelas=' + '1')
    else if cbKelas.ItemIndex = 1 then
      ParamList.Add('kelas=' + '2')
    else if cbKelas.ItemIndex = 2 then
      ParamList.Add('kelas=' + '3')
    else if cbKelas.ItemIndex = 3 then
      ParamList.Add('kelas=' + '4')
    else if cbKelas.ItemIndex = 4 then
      ParamList.Add('kelas=' + '5')
    else if cbKelas.ItemIndex = 5 then
      ParamList.Add('kelas=' + '6');
    ParamList.Add('nm_kelas=' + edNmKelas.Text);
    ParamList.Add('nip=' + nip);
    ParamList.Add('thn_ajaran=' + edThnAjaran.Text);

    ResponseBody := NetHTTPClient1.Post
      ('http://sditulilalbab-kamal.sch.id/api/kelasAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Kelas');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Kelas');
      end;
      frmTambahDataKelas.Hide;
      frmKelasAdmin.ambilData('');
      freeandnil(frmTambahDataKelas);
    end
    else
    begin
      if exe = 'tambah' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Menambah Data Kelas');
      end
      else if exe = 'edit' then
      begin
        ShowMessage('Kamu ' + ResponseBody + ' Mengubah Data Kelas');
      end;
    end;
    ParamList.Free;
  end;
end;

procedure TfrmTambahDataKelas.stgGuruCellClick(const Column: TColumn;
  const Row: Integer);
begin
  nip := stgGuru.Cells[1, Row];
  lbNIP.Text := 'NIP Guru: ' + stgGuru.Cells[1, Row];
  lbNmGuru.Text := 'Nama Guru: ' + stgGuru.Cells[2, Row];
end;

procedure TfrmTambahDataKelas.cleardata;
begin
  edID.Text := '';
  edNmKelas.Text := '';
  edThnAjaran.Text := '';
  cbKelas.ItemIndex := -1;
end;

procedure TfrmTambahDataKelas.edSearchGuruKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  // if Key = vkreturn then
  // ambilDataGuru(edSearchGuru.Text);
end;

procedure TfrmTambahDataKelas.fnClearstgGuru;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgGuru.RowCount - 1 do
    for kol := 0 to stgGuru.ColumnCount - 1 do
      stgGuru.Cells[kol, bar] := '';

  stgGuru.RowCount := 1;
end;

procedure TfrmTambahDataKelas.ambilDataGuru(keyword: string);
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      I, iplus, x: Integer;
      kontenSementara: String;
      content: TStringList;
    begin
      // fnClearstgGuru;
      if keyword = '' then
      begin
        JA := frmMainAdmin.doService('guruAdmin.php', 'exe=tampil');
        I := 0;
        if JA.ToString <> '[]' then
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgGuru.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := I + 1;
                stgGuru.Cells[0, I] := inttostr(iplus);
                stgGuru.Cells[1, I] := JV.GetValue('g_nip', '');
                stgGuru.Cells[2, I] := JV.GetValue('g_nm_lengkap', '');
                stgGuru.Cells[3, I] := JV.GetValue('g_nm_panggilan', '');
                stgGuru.Cells[4, I] := JV.GetValue('g_user', '');
                stgGuru.Cells[5, I] := JV.GetValue('g_pass', '');
                if JV.GetValue('g_jk', '') = '0' then
                  stgGuru.Cells[6, I] := 'P'
                else if JV.GetValue('g_jk', '') = '1' then
                  stgGuru.Cells[6, I] := 'L'
                else
                  stgGuru.Cells[6, I] := '?';
                stgGuru.Cells[7, I] := JV.GetValue('g_tmp_lahir', '');
                stgGuru.Cells[8, I] := JV.GetValue('g_tgl_lahir', '');
                stgGuru.Cells[9, I] := JV.GetValue('g_alamat', '');
                stgGuru.Cells[10, I] := JV.GetValue('g_telepon', '');
                I := iplus;
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              ShowMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end
      else
      begin
        // fnClearstgGuru;
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
        JA := frmMainAdmin.doService('guruAdmin.php', 'exe=cari' + '&keyword='
          + keyword);
        I := 0;
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            stgGuru.RowCount := JA.Count;
          end);

        if JA.ToString <> '[]' then
        begin
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := I + 1;
                stgGuru.Cells[0, I] := inttostr(iplus);
                stgGuru.Cells[1, I] := JV.GetValue('g_nip', '');
                stgGuru.Cells[2, I] := JV.GetValue('g_nm_lengkap', '');
                stgGuru.Cells[3, I] := JV.GetValue('g_nm_panggilan', '');
                stgGuru.Cells[4, I] := JV.GetValue('g_user', '');
                stgGuru.Cells[5, I] := JV.GetValue('g_pass', '');
                if JV.GetValue('g_jk', '') = '0' then
                  stgGuru.Cells[6, I] := 'P'
                else if JV.GetValue('g_jk', '') = '1' then
                  stgGuru.Cells[6, I] := 'L'
                else
                  stgGuru.Cells[6, I] := '?';
                stgGuru.Cells[7, I] := JV.GetValue('g_tmp_lahir', '');
                stgGuru.Cells[8, I] := JV.GetValue('g_tgl_lahir', '');
                stgGuru.Cells[9, I] := JV.GetValue('g_alamat', '');
                stgGuru.Cells[10, I] := JV.GetValue('g_telepon', '');
                I := iplus;
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              ShowMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end;
    end).Start;
end;

procedure TfrmTambahDataKelas.ambilData;
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
      JA := frmMainAdmin.doService('kelasAdmin.php',
        'exe=id' + '&id=' + frmKelasAdmin.id);
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
              edID.Text := JV.GetValue('k_id', '');
              edNmKelas.Text := JV.GetValue('k_nm_kelas', '');
              edThnAjaran.Text := JV.GetValue('k_thn_ajaran', '');
              if JV.GetValue('k_kelas', '') = '1' then
                cbKelas.ItemIndex := 0
              else if JV.GetValue('k_kelas', '') = '2' then
                cbKelas.ItemIndex := 1
              else if JV.GetValue('k_kelas', '') = '3' then
                cbKelas.ItemIndex := 2
              else if JV.GetValue('k_kelas', '') = '4' then
                cbKelas.ItemIndex := 3
              else if JV.GetValue('k_kelas', '') = '5' then
                cbKelas.ItemIndex := 4
              else if JV.GetValue('k_kelas', '') = '6' then
                cbKelas.ItemIndex := 5;
              lbNIP.Text := 'NIP Guru: ' + JV.GetValue('k_nip', '');
              lbNmGuru.Text := 'Nama Guru: ' + JV.GetValue('g_nm_lengkap', '');
            end);
          id := JV.GetValue('k_id', '');
          nip := JV.GetValue('k_nip', '');
        end;
      end;
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          ambilDataGuru('');
          Loading.Visible := false;
        end);
    end).Start;
end;

procedure TfrmTambahDataKelas.rectBackClick(Sender: TObject);
begin
  frmTambahDataKelas.Hide;
end;

procedure TfrmTambahDataKelas.rectKlikTap(Sender: TObject;
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

end.
