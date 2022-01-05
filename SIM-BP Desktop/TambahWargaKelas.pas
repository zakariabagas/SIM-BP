unit TambahWargaKelas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.Effects, FMX.Ani, FMX.Objects, FMX.ListBox,
  FMX.Edit, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox,
  System.JSON, System.Threading, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TfrmTambahWargaKelas = class(TForm)
    Isi: TRectangle;
    lbForm: TLabel;
    Layout1: TLayout;
    rectKlik: TRectangle;
    edID: TEdit;
    lbID: TLabel;
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
    Layout3: TLayout;
    Rectangle1: TRectangle;
    edSearchSiswa: TEdit;
    btnSearchSiswa: TImage;
    FloatAnimation1: TFloatAnimation;
    stgSiswa: TStringGrid;
    lbSiswa: TLabel;
    Image7: TImage;
    lbNIS: TLabel;
    lbNmSiswa: TLabel;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    stgMain_NamaOrtu: TStringColumn;
    StringColumn5: TStringColumn;
    stgMain_NIS: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    stgMain_TelpOrtu: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    Image12: TImage;
    IdHTTP1: TIdHTTP;
    NetHTTPClient1: TNetHTTPClient;
    VertScrollBox1: TVertScrollBox;
    procedure stgSiswaCellClick(const Column: TColumn; const Row: Integer);
    procedure edSearchSiswaEnter(Sender: TObject);
    procedure cbKelasChange(Sender: TObject);
    procedure btnSearchSiswaClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, nis, nip, kelas, id, id_wk: String;
    arrId, arrNmWK: TStringList;
    procedure cleardata;
    procedure ambilData;
    // procedure simpanData(crud: String);
    procedure fnClearstgSiswa;
    procedure ambilDataSiswa(keyword: string);
    procedure isikelas;
    procedure simpanData(crud: String);
    procedure AktifAwal;
  end;

var
  frmTambahWargaKelas: TfrmTambahWargaKelas;

implementation

{$R *.fmx}

uses MainAdmin, KelasAdmin, WKAdmin;

procedure TfrmTambahWargaKelas.AktifAwal;
begin
  if exe = 'tambah' then
  begin
    lbForm.Text := 'Kelola Data Warga Kelas > ' + 'Tambah Data';
    cleardata;
  end
  else if exe = 'edit' then
  begin
    lbForm.Text := 'Kelola Data Warga Kelas > ' + 'Edit Data';
    // ambilData;
    isikelas;
  end
  else if exe = 'hapus' then
    lbForm.Text := 'Kelola Data Warga Kelas > ' + 'Hapus Data'
  else
    lbForm.Text := 'Kelola Data Warga Kelas > ' + '';
end;

procedure TfrmTambahWargaKelas.isikelas;
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      I, iplus, X: Integer;
      kontenSementara: String;
      content: TStringList;
    begin
      // Loading.Visible:=true;
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          cbKelas.Items.Clear;
        end);
      JA := frmMainAdmin.doService('kelasAdmin.php', 'exe=tampil');
      I := 0;
      arrId := TStringList.Create;
      arrNmWK := TStringList.Create;

      if JA.ToString <> '[]' then
      begin
        for JV in JA do
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              cbKelas.Items.Add('Kelas: ' + JV.GetValue('k_nm_kelas',
                '') + ' (thn ajaran:' + JV.GetValue('k_thn_ajaran', '') + ')');
            end);
          arrNmWK.Add('Kelas: ' + JV.GetValue('k_nm_kelas', '') +
            ' (thn ajaran:' + JV.GetValue('k_thn_ajaran', '') + ')');
          arrId.Add(JV.GetValue('k_id', ''));
          inc(I);
        end;
      end;
      if exe = 'tambah' then
      begin
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            // frmTambahWargaKelas.ambilDataGuru('');
            frmTambahWargaKelas.ambilDataSiswa('');
          end);
      end
      else if exe = 'edit' then
      begin
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            frmTambahWargaKelas.ambilData;
          end);
      end;
      // Loading.Visible:=false;
    end).Start;
end;

procedure TfrmTambahWargaKelas.cbKelasChange(Sender: TObject);
begin
  if (cbKelas.ItemIndex >= 0) then
  begin
    edKelas.Text := arrNmWK[cbKelas.ItemIndex];
    // showdriver;
  end;
end;

procedure TfrmTambahWargaKelas.cleardata;
begin
  edID.Text := '';
  // lbNIS.Text := 'NIS Siswa : (KLIK DATA PADA TABEL DIBAWAH)';
  // lbNmSiswa.Text := 'Nama Siswa : (KLIK DATA PADA TABEL DIBAWAH)';
  // cbKelas.ItemIndex := -1;
end;

procedure TfrmTambahWargaKelas.edSearchSiswaEnter(Sender: TObject);
begin
  // ambilDataSiswa(edSearchSiswa.Text);
end;

procedure TfrmTambahWargaKelas.ambilData;
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
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := true;
        end);
      JA := frmMainAdmin.doService('wargaKelasAdmin.php',
        'exe=id' + '&id=' + frmWKAdmin.id_wk);
      I := 0;
      if JA.ToString <> '[]' then
      begin
        for JV in JA do
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            var
              u: Integer;
            begin
              edID.Text := JV.GetValue('wk_id', '');
              id := JV.GetValue('wk_id', '');
              // lbNIP.Text := 'NIP Guru : ' + JV.GetValue('k_nip', '');
              // lbNmGuru.Text := 'Nama Guru : ' + JV.GetValue('g_nm_lengkap', '');
              kelas := JV.GetValue('wk_kelas', '');
              nip := JV.GetValue('k_nip', '');
              lbNIS.Text := 'NIS Siswa : ' + JV.GetValue('wk_nis', '');
              lbNmSiswa.Text := 'Nama Siswa : ' +
                JV.GetValue('s_nm_lengkap', '');
              nis := JV.GetValue('wk_nis', '');
              for u := 0 to arrId.Count - 1 do
              begin
                // tthread.Synchronize(tthread.CurrentThread,
                // procedure
                // begin
                if arrId[u] = JV.GetValue('wk_kelas', '') then
                  cbKelas.ItemIndex := u;
                // end);
              end;
            end);
        end;
      end;
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          // frmTambahWargaKelas.ambilDataGuru('');
          Loading.Visible := false;
          frmTambahWargaKelas.ambilDataSiswa('');
        end);
    end).Start;
end;

procedure TfrmTambahWargaKelas.ambilDataSiswa(keyword: string);
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      I, iplus, X: Integer;
      kontenSementara: String;
      content: TStringList;
    begin
      // fnClearstgSiswa;
      if keyword = '' then
      begin
        JA := frmMainAdmin.doService('siswaAdmin.php', 'exe=tampil');
        I := 0;
        if JA.ToString <> '[]' then
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgSiswa.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := I + 1;
                stgSiswa.Cells[0, I] := inttostr(iplus);
                stgSiswa.Cells[1, I] := JV.GetValue('s_nis', '');
                stgSiswa.Cells[2, I] := JV.GetValue('s_nm_lengkap', '');
                stgSiswa.Cells[3, I] := JV.GetValue('s_nm_panggilan', '');
                stgSiswa.Cells[4, I] := JV.GetValue('s_user', '');
                stgSiswa.Cells[5, I] := JV.GetValue('s_pass', '');
                if JV.GetValue('s_jk', '') = '0' then
                  stgSiswa.Cells[6, I] := 'P'
                else if JV.GetValue('s_jk', '') = '1' then
                  stgSiswa.Cells[6, I] := 'L'
                else
                  stgSiswa.Cells[6, I] := '?';
                stgSiswa.Cells[7, I] := JV.GetValue('s_tmp_lahir', '');
                stgSiswa.Cells[8, I] := JV.GetValue('s_tgl_lahir', '');
                stgSiswa.Cells[9, I] := JV.GetValue('s_alamat', '');
                stgSiswa.Cells[10, I] := JV.GetValue('s_nm_ortu', '');
                stgSiswa.Cells[11, I] := JV.GetValue('s_telepon_ortu', '');
                I := iplus;
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              showMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end
      else
      begin
        // fnClearstgSiswa;
        content := TStringList.Create;
        try
          frmMainAdmin.Split(' ', keyword, content);
          for X := 0 to content.Count - 1 do
          begin
            if X = 0 then
              kontenSementara := content[X]
            else
              kontenSementara := kontenSementara + '%20' + content[X];
          end;
        finally
          keyword := kontenSementara;
          content.Free;
        end;
        JA := frmMainAdmin.doService('siswaAdmin.php', 'exe=cari' + '&keyword='
          + keyword);
        I := 0;
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            stgSiswa.RowCount := JA.Count;
          end);
        if JA.ToString <> '[]' then
        begin
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := I + 1;
                stgSiswa.Cells[0, I] := inttostr(iplus);
                stgSiswa.Cells[1, I] := JV.GetValue('s_nis', '');
                stgSiswa.Cells[2, I] := JV.GetValue('s_nm_lengkap', '');
                stgSiswa.Cells[3, I] := JV.GetValue('s_nm_panggilan', '');
                stgSiswa.Cells[4, I] := JV.GetValue('s_user', '');
                stgSiswa.Cells[5, I] := JV.GetValue('s_pass', '');
                if JV.GetValue('s_jk', '') = '0' then
                  stgSiswa.Cells[6, I] := 'P'
                else if JV.GetValue('s_jk', '') = '1' then
                  stgSiswa.Cells[6, I] := 'L'
                else
                  stgSiswa.Cells[6, I] := '?';
                stgSiswa.Cells[7, I] := JV.GetValue('s_tmp_lahir', '');
                stgSiswa.Cells[8, I] := JV.GetValue('s_tgl_lahir', '');
                stgSiswa.Cells[9, I] := JV.GetValue('s_alamat', '');
                stgSiswa.Cells[10, I] := JV.GetValue('s_nm_ortu', '');
                stgSiswa.Cells[11, I] := JV.GetValue('s_telepon_ortu', '');
                I := iplus;
              end);
          end;
        end
        else
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              showMessage('DATA TIDAK DITEMUKAN');
            end);
        end;
      end;
    end).Start;
end;

procedure TfrmTambahWargaKelas.btnSearchSiswaClick(Sender: TObject);
begin
  ambilDataSiswa(edSearchSiswa.Text);
end;

procedure TfrmTambahWargaKelas.btnSimpanClick(Sender: TObject);
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

procedure TfrmTambahWargaKelas.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  idkelas: String;
  u: Integer;
begin
  if cbKelas.ItemIndex = -1 then
    showMessage('Kelas Belum Dipilih')
  else if nis = '' then
    showMessage('Data Siswa Belum Dipilih')
  else
  begin
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('id_lama=' + id);
    ParamList.Add('id=' + edID.Text);
    ParamList.Add('kelas=' + arrId[cbKelas.ItemIndex]);
    idkelas := arrId[cbKelas.ItemIndex];
    ParamList.Add('nis=' + nis);

    ResponseBody := NetHTTPClient1.Post
      ('http://sditulilalbab-kamal.sch.id/api/wargaKelasAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Menambah Data Warga Kelas');
      end
      else if exe = 'edit' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Mengubah Data Warga Kelas');
      end;

      frmWKAdmin.cbKelas.ItemIndex := cbKelas.ItemIndex;
      frmWKAdmin.edKelas.Text := frmWKAdmin.arrNmWK[cbKelas.ItemIndex];
      frmWKAdmin.ambilDataWargaKelas('', frmWKAdmin.arrId[cbKelas.ItemIndex]);
      frmWKAdmin.id := frmWKAdmin.arrId[cbKelas.ItemIndex];

      frmTambahWargaKelas.Hide;
      freeandnil(frmTambahWargaKelas);
    end
    else
    begin
      if exe = 'tambah' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Menambah Data Warga Kelas');
      end
      else if exe = 'edit' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Mengubah Data Warga Kelas');
      end;
    end;
    ParamList.Free;
  end;
end;

procedure TfrmTambahWargaKelas.fnClearstgSiswa;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgSiswa.RowCount - 1 do
    for kol := 0 to stgSiswa.ColumnCount - 1 do
      stgSiswa.Cells[kol, bar] := '';

  stgSiswa.RowCount := 1;
end;

procedure TfrmTambahWargaKelas.rectBackClick(Sender: TObject);
begin
  frmTambahWargaKelas.Hide;
  // freeandnil(frmTambahWargaKelas);
end;

procedure TfrmTambahWargaKelas.stgSiswaCellClick(const Column: TColumn;
const Row: Integer);
begin
  nis := stgSiswa.Cells[1, Row];
  lbNIS.Text := 'NIS Siswa: ' + stgSiswa.Cells[1, Row];
  lbNmSiswa.Text := 'Nama Siswa: ' + stgSiswa.Cells[2, Row];
end;

end.
