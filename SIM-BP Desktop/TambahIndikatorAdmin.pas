unit TambahIndikatorAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Ani, FMX.Edit, FMX.ScrollBox, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, System.JSON, System.Threading, FMX.Effects,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TfrmTambahIndikatorAdmin = class(TForm)
    Isi: TRectangle;
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
    lbForm: TLabel;
    Layout1: TLayout;
    rectKlik: TRectangle;
    edID: TEdit;
    lbID: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edNama: TEdit;
    lbNama: TLabel;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    edIndikatorID: TEdit;
    lbIndikatorId: TLabel;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    edKelas: TEdit;
    lbKelas: TLabel;
    Layout5: TLayout;
    Rectangle4: TRectangle;
    edIA: TEdit;
    lbIA: TLabel;
    Layout7: TLayout;
    Rectangle5: TRectangle;
    edStatus: TEdit;
    lbStatus: TLabel;
    btnSimpan: TRectangle;
    lbSimpan: TLabel;
    ColorAnimation1: TColorAnimation;
    cbIA: TComboBox;
    lbiIndikator: TListBoxItem;
    lbiAktivitas: TListBoxItem;
    cbStatus: TComboBox;
    lbiRumah: TListBoxItem;
    lbiSekolah: TListBoxItem;
    cbKelas: TComboBox;
    Loading: TRectangle;
    Arc1: TArc;
    FloatAnimation11: TFloatAnimation;
    FloatAnimation13: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    BlackLoading: TRectangle;
    FloatAnimation12: TFloatAnimation;
    IdHTTP1: TIdHTTP;
    Image12: TImage;
    NetHTTPClient1: TNetHTTPClient;
    VertScrollBox1: TVertScrollBox;
    Image7: TImage;
    procedure rectKlikTap(Sender: TObject; const Point: TPointF);
    procedure rectBackClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exe, id, indikatorId: String;
    arrId, arrNmWK: TStringList;
    procedure ambilData;
    procedure isikelas;
    procedure cleardata;
    procedure simpanData(crud: String);
    procedure cekIndikator;
    procedure AktifAwal;
  end;

var
  frmTambahIndikatorAdmin: TfrmTambahIndikatorAdmin;

implementation

{$R *.fmx}

uses MainAdmin, IndikatorAdmin;

procedure TfrmTambahIndikatorAdmin.AktifAwal;
begin
  isikelas;
  if exe = 'tambah' then
  begin
    lbForm.text := 'Kelola Indikator > ' + 'Tambah Data';
    cleardata;
    edIndikatorID.Enabled := False;
  end
  else if exe = 'edit' then
  begin
    lbForm.text := 'Kelola Indikator > ' + 'Edit Data';
    ambilData;
    edIndikatorID.Enabled := True;
  end
  else if exe = 'hapus' then
    lbForm.text := 'Kelola Indikator > ' + 'Hapus Data'
  else
    lbForm.text := 'Kelola Indikator > ' + '';
end;

procedure TfrmTambahIndikatorAdmin.isikelas;
// begin
// TTask.Run(
// procedure
var
  JA: TJSONArray;
  JV: TJSONValue;
  I, iplus, X: Integer;
  kontenSementara: String;
  content: TStringList;
begin
  // Loading.Visible:=true;
  // fnClearStg;
  cbKelas.Items.Clear;
  JA := frmMainAdmin.doService('kelasAdmin.php', 'exe=tampil');
  // tthread.Synchronize(nil,
  // procedure
  // begin
  // showMessage(JA.ToString);
  // end);
  I := 0;
  // stgMain.RowCount := JA.Count;
  arrId := TStringList.Create;
  arrNmWK := TStringList.Create;

  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      // tthread.Synchronize(nil,
      // procedure
      // begin
      // cbKelas.ListBox.ListItems[I].TextSettings.FontColor := $FF1A4709;
      // cbKelas.ListBox.ListItems[I].TextSettings.Font.Size := 10;
      cbKelas.Items.Add('Kelas: ' + JV.GetValue('k_nm_kelas', '') +
        ' (thn ajaran:' + JV.GetValue('k_thn_ajaran', '') + ')');
      arrNmWK.Add('Kelas: ' + JV.GetValue('k_nm_kelas', '') + ' (thn ajaran:' +
        JV.GetValue('k_thn_ajaran', '') + ')');
      arrId.Add(JV.GetValue('k_id', ''));
      // showMessage('Kelas = ' + JV.GetValue('k_kelas', '') + ' (id:' +
      // JV.GetValue('k_id', '') + ')');
      inc(I);
      // end);
    end;
  end;
  // Loading.Visible:=false;
  // end).Start;
end;

procedure TfrmTambahIndikatorAdmin.rectBackClick(Sender: TObject);
begin
  frmTambahIndikatorAdmin.Hide;
  // freeandnil(frmTambahIndikatorAdmin);
end;

procedure TfrmTambahIndikatorAdmin.rectKlikTap(Sender: TObject;
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

procedure TfrmTambahIndikatorAdmin.btnSimpanClick(Sender: TObject);
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

procedure TfrmTambahIndikatorAdmin.cekIndikator;
// begin
// TTask.Run(
// procedure
var
  JA: TJSONArray;
  JV: TJSONValue;
  I, iplus, X, ibIndikatorId_no, tingkatanKelas: Integer;
  ibIndikatorId_kelas, ibIndikatorId_ia, ia, kelas, status: String;
  content: TStringList;
begin
  if cbIA.ItemIndex = 0 then
    ia := 'Indikator'
  else if cbIA.ItemIndex = 1 then
    ia := 'Aktivitas';
  if cbStatus.ItemIndex = 0 then
    status := 'Rumah'
  else if cbStatus.ItemIndex = 1 then
    status := 'Sekolah';
  kelas := arrId[cbKelas.ItemIndex];

  JA := frmMainAdmin.doService('indikatorAdmin.php',
    'exe=cekindikator' + '&kelas=' + kelas + '&indikator=' + ia + '&status='
    + status);
  I := 0;

  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      try
        // showMessage('max ib_indikator_id = ' + JV.GetValue('max(ib_indikator_id)', '')+'_!!!');
        if JV.GetValue('max(ib_indikator_id)', '') <> '' then
        begin
          // showMessage('cek if max <> null');
          content := TStringList.Create;
          try
            frmMainAdmin.Split('_', JV.GetValue('max(ib_indikator_id)',
              ''), content);
            ibIndikatorId_no := strtoint(content[2]) + 1;
            ibIndikatorId_ia := content[1];
            ibIndikatorId_kelas := content[0];
          finally
            content.Free;
          end;
          indikatorId := ibIndikatorId_kelas + '_' + ibIndikatorId_ia + '_' +
            inttostr(ibIndikatorId_no);
          // showMessage('indikatorID = ' + indikatorId);
        end
        else
        begin
          try
            ibIndikatorId_no := 1;
            if cbIA.ItemIndex = 0 then
              ibIndikatorId_ia := 'I'
            else if cbIA.ItemIndex = 1 then
              ibIndikatorId_ia := 'A';
            tingkatanKelas := strtoint(JV.GetValue('k_kelas', ''));
            if tingkatanKelas < 4 then
            begin
              ibIndikatorId_kelas := 'B';

              indikatorId := ibIndikatorId_kelas + '_' + ibIndikatorId_ia + '_'
                + inttostr(ibIndikatorId_no);
            end
            else
            begin
              ibIndikatorId_kelas := 'A';

              indikatorId := ibIndikatorId_kelas + '_' + ibIndikatorId_ia + '_'
                + inttostr(ibIndikatorId_no);
            end;
            // showMessage('indikatorID = ' + indikatorId);
          except
            on E: exception do
              showMessage('Error Indikator ID = ' + E.ToString);
          end;
        end;
      except
        on E: exception do
          showMessage('Error Indikator ID Luar = ' + E.ToString);
      end;
    end;
  end;
  // showMessage('indikatorID = ' + indikatorId);
  // Loading.Visible:=false;
  // end).Start;
end;

procedure TfrmTambahIndikatorAdmin.cleardata;
begin
  edID.text := '';
  edNama.text := '';
  edIndikatorID.text := '';
  edKelas.text := '';
  cbIA.ItemIndex := -1;
  cbStatus.ItemIndex := -1;
end;

procedure TfrmTambahIndikatorAdmin.ambilData;
// begin
// TTask.Run(
// procedure
var
  JA: TJSONArray;
  JV: TJSONValue;
  I, u, iplus, X: Integer;
  kontenSementara: String;
  content: TStringList;
begin
  // Loading.Visible := true;
  // fnClearStg;
  JA := frmMainAdmin.doService('indikatorAdmin.php',
    'exe=id' + '&id=' + frmIndikatorAdmin.id);
  // I := 0;
  // stgMain.RowCount := JA.Count;

  // showMessage(JA.ToString);

  if JA.ToString <> '[]' then
  begin
    for JV in JA do
    begin
      // tthread.Synchronize(nil,
      // procedure
      // var
      // u:Integer;
      // begin
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
      edID.text := JV.GetValue('ib_id', '');
      id := JV.GetValue('ib_id', '');
      edNama.text := JV.GetValue('ib_indikator', '');
      edIndikatorID.text := JV.GetValue('ib_indikator_id', '');
      edKelas.text := JV.GetValue('k_nm_kelas', '');
      for u := 0 to arrId.Count - 1 do
      begin
        // tthread.Synchronize(nil,
        // procedure
        // begin
        if arrId[u] = JV.GetValue('k_id', '') then
          cbKelas.ItemIndex := u;
        // end);
      end;
      if JV.GetValue('ib_ia', '') = 'Indikator' then
        cbIA.ItemIndex := 0
      else if JV.GetValue('ib_ia', '') = 'Aktivitas' then
        cbIA.ItemIndex := 1
      else
        cbIA.ItemIndex := -1;
      if JV.GetValue('ib_status', '') = 'Rumah' then
        cbStatus.ItemIndex := 0
      else if JV.GetValue('ib_status', '') = 'Sekolah' then
        cbStatus.ItemIndex := 1
      else
        cbStatus.ItemIndex := -1;
      // arrId[cbKelas.ItemIndex];
      // end);
    end;

  end;
  // Loading.Visible := false;
  // end).Start;
end;

procedure TfrmTambahIndikatorAdmin.simpanData(crud: String);
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
  u: Integer;
begin
  if cbKelas.ItemIndex = -1 then
    showMessage('Tingkatan Kelas Belum Dipilih')
  else if edNama.text = '' then
    showMessage('Nama Indikator Belum Diisi')
  else if cbIA.ItemIndex = -1 then
    showMessage('Indikator/Aktivitas Belum Dipilih')
  else if cbStatus.ItemIndex = -1 then
    showMessage('Status Belum Dipilih')
  else
  begin
    if exe = 'tambah' then
    begin
      cekIndikator;
      edIndikatorID.text := indikatorId;
    end;
    ParamList := TStringList.Create;
    ParamList.Add('exe=' + crud);
    ParamList.Add('id_lama=' + id);
    ParamList.Add('id=' + edID.text);
    ParamList.Add('indikator=' + edNama.text);
    ParamList.Add('indikator_id=' + edIndikatorID.text);
    ParamList.Add('kelas=' + arrId[cbKelas.ItemIndex]);

    if cbIA.ItemIndex = 0 then
      ParamList.Add('ia=' + 'Indikator')
    else if cbIA.ItemIndex = 1 then
      ParamList.Add('ia=' + 'Aktivitas');
    if cbStatus.ItemIndex = 0 then
      ParamList.Add('status=' + 'Rumah')
    else if cbStatus.ItemIndex = 1 then
      ParamList.Add('status=' + 'Sekolah');

    ResponseBody := NetHTTPClient1.Post
      ('https://sditulilalbab-kamal.sch.id/api/indikatorAdmin.php', ParamList)
      .ContentAsString;
    if ResponseBody.Equals('Berhasil') then
    begin
      if exe = 'tambah' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Menambah Data Indikator');
      end
      else if exe = 'edit' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Mengubah Data Indikator');
      end;
      frmTambahIndikatorAdmin.Hide;
      frmIndikatorAdmin.ambilData('');
    end
    else
    begin
      if exe = 'tambah' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Menambah Data Indikator');
      end
      else if exe = 'edit' then
      begin
        showMessage('Kamu ' + ResponseBody + ' Mengubah Data Indikator');
      end;
    end;
    ParamList.Free;
  end;
end;

end.
