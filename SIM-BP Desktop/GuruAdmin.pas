unit GuruAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.Edit, FMX.Objects,
  FMX.Effects, FMX.Ani, FMX.Controls.Presentation, FMX.Layouts, System.JSON,
  System.Threading;

type
  TfrmGuruAdmin = class(TFrame)
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
    lbTabelDataGuru: TLabel;
    ShadowEffect7: TShadowEffect;
    rectHapus: TRectangle;
    imgHapus: TImage;
    rectEdit: TRectangle;
    imgEdit: TImage;
    rectTambah: TRectangle;
    imgTambah: TImage;
    visGuru: TRectangle;
    ShadowEffect5: TShadowEffect;
    btnEdit: TRectangle;
    lbCekValue: TLabel;
    ShadowEffect2: TShadowEffect;
    btnHapus: TRectangle;
    Label12: TLabel;
    ShadowEffect4: TShadowEffect;
    btnTambah: TRectangle;
    Label11: TLabel;
    ShadowEffect1: TShadowEffect;
    rectSearch: TRectangle;
    edSearch: TEdit;
    btnSearch: TImage;
    FloatAnimation10: TFloatAnimation;
    stgMain: TStringGrid;
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
    procedure btnSearchClick(Sender: TObject);
    procedure rectHapusClick(Sender: TObject);
    procedure rectDeleteTidakClick(Sender: TObject);
    procedure rectDeleteYaClick(Sender: TObject);
    procedure animScaleYFinish(Sender: TObject);
    procedure rectTambahClick(Sender: TObject);
    procedure rectEditClick(Sender: TObject);
    procedure stgMainCellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    nip: String;
    procedure ambilData(keyword: string);
    procedure fnClearStg;
    procedure hapusData;
  end;

var
  frmGuruAdmin: TfrmGuruAdmin;

implementation

{$R *.fmx}

uses MainAdmin, TambahGuruAdmin;

procedure TfrmGuruAdmin.ambilData(keyword: string);
begin
  TTask.Run(
    procedure
    var
      JA: TJSONArray;
      JV: TJSONValue;
      i, iplus, x: Integer;
      kontenSementara: String;
      content: TStringList;
    begin
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := true;
        end);
      // fnClearStg;
      if keyword = '' then
      begin
        JA := frmMainAdmin.doService('guruAdmin.php', 'exe=tampil');
        i := 0;

        if JA.ToString <> '[]' then
        begin
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgMain.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := i + 1;
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('g_nip', '');
                stgMain.Cells[2, i] := JV.GetValue('g_nm_lengkap', '');
                stgMain.Cells[3, i] := JV.GetValue('g_nm_panggilan', '');
                stgMain.Cells[4, i] := JV.GetValue('g_user', '');
                stgMain.Cells[5, i] := JV.GetValue('g_pass', '');
                if JV.GetValue('g_jk', '') = '0' then
                  stgMain.Cells[6, i] := 'P'
                else if JV.GetValue('g_jk', '') = '1' then
                  stgMain.Cells[6, i] := 'L'
                else
                  stgMain.Cells[6, i] := '?';
                stgMain.Cells[7, i] := JV.GetValue('g_tmp_lahir', '');
                stgMain.Cells[8, i] := JV.GetValue('g_tgl_lahir', '');
                stgMain.Cells[9, i] := JV.GetValue('g_alamat', '');
                stgMain.Cells[10, i] := JV.GetValue('g_telepon', '');
                // ShowMessage(JV.GetValue('ib_indikator', ''));
                i := iplus;
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
        i := 0;

        if JA.ToString <> '[]' then
        begin
          // stgMain.Row := 0;
          tthread.Synchronize(tthread.CurrentThread,
            procedure
            begin
              stgMain.RowCount := JA.Count;
            end);
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := i + 1;
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('g_nip', '');
                stgMain.Cells[2, i] := JV.GetValue('g_nm_lengkap', '');
                stgMain.Cells[3, i] := JV.GetValue('g_nm_panggilan', '');
                stgMain.Cells[4, i] := JV.GetValue('g_user', '');
                stgMain.Cells[5, i] := JV.GetValue('g_pass', '');
                if JV.GetValue('g_jk', '') = '0' then
                  stgMain.Cells[6, i] := 'P'
                else if JV.GetValue('g_jk', '') = '1' then
                  stgMain.Cells[6, i] := 'L'
                else
                  stgMain.Cells[6, i] := '?';
                stgMain.Cells[7, i] := JV.GetValue('g_tmp_lahir', '');
                stgMain.Cells[8, i] := JV.GetValue('g_tgl_lahir', '');
                stgMain.Cells[9, i] := JV.GetValue('g_alamat', '');
                stgMain.Cells[10, i] := JV.GetValue('g_telepon', '');
                // ShowMessage(JV.GetValue('ib_indikator', ''));
                i := iplus;
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
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := false;
        end);
    end).Start;
end;

procedure TfrmGuruAdmin.animScaleYFinish(Sender: TObject);
begin
  if animScaleY.Inverse = true then
  begin
    deleteMenu.Visible := false;
  end;
end;

procedure TfrmGuruAdmin.btnSearchClick(Sender: TObject);
begin
  ambilData(edSearch.Text);
end;

procedure TfrmGuruAdmin.fnClearStg;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgMain.RowCount - 1 do
    for kol := 0 to stgMain.ColumnCount - 1 do
      stgMain.Cells[kol, bar] := '';

  stgMain.RowCount := 1;
end;

procedure TfrmGuruAdmin.hapusData;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  ParamList := TStringList.Create;
  ParamList.Add('exe=' + 'hapus');
  ParamList.Add('nip_lama=' + nip);

  ResponseBody := frmMainAdmin.NetHTTPClient1.Post
    ('http://sditulilalbab-kamal.sch.id/api/guruAdmin.php', ParamList)
    .ContentAsString;
  if ResponseBody.Equals('Berhasil') then
  begin
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Guru');
    ambilData('');
    animTransparan.Inverse := true;
    animScaleX.Inverse := true;
    animScaleY.Inverse := true;
    animTransparan.Start;
    animScaleX.Start;
    animScaleY.Start;
  end
  else
  begin
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Guru');
  end;
  ParamList.Free;
end;

procedure TfrmGuruAdmin.rectDeleteTidakClick(Sender: TObject);
begin
  animTransparan.Inverse := true;
  animScaleX.Inverse := true;
  animScaleY.Inverse := true;
  animTransparan.Start;
  animScaleX.Start;
  animScaleY.Start;
end;

procedure TfrmGuruAdmin.rectDeleteYaClick(Sender: TObject);
begin
  if nip <> '' then
    hapusData;
end;

procedure TfrmGuruAdmin.rectEditClick(Sender: TObject);
begin
  if nip = '' then
    showMessage('Data Tabel Belum Dipilih')
  else
  begin
    if frmTambahGuruAdmin = nil then
    begin
      Application.CreateForm(TfrmTambahGuruAdmin, frmTambahGuruAdmin);
    end;
    frmTambahGuruAdmin.exe := 'edit';
    frmTambahGuruAdmin.aktifawal;
    frmTambahGuruAdmin.Show;
  end;
end;

procedure TfrmGuruAdmin.rectHapusClick(Sender: TObject);
begin
  if nip <> '' then
  begin
    deleteMenu.Visible := true;
    lbDelete.Text := 'Apakah Anda Ingin Menghapus Data Berikut: ' + nip;
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

procedure TfrmGuruAdmin.rectTambahClick(Sender: TObject);
begin
  if frmTambahGuruAdmin = nil then
  begin
    Application.CreateForm(TfrmTambahGuruAdmin, frmTambahGuruAdmin);
  end;
  frmTambahGuruAdmin.exe := 'tambah';
  frmTambahGuruAdmin.aktifawal;
  frmTambahGuruAdmin.Show;
end;

procedure TfrmGuruAdmin.stgMainCellClick(const Column: TColumn;
const Row: Integer);
begin
  nip := stgMain.Cells[1, Row];
end;

end.
