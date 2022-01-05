unit DataAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.Edit, FMX.Objects,
  FMX.Effects, FMX.Ani, FMX.Controls.Presentation, FMX.Layouts, System.JSON,
  System.Threading;

type
  TfrmDataAdmin = class(TFrame)
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
    rectHapus: TRectangle;
    imgHapus: TImage;
    rectEdit: TRectangle;
    imgEdit: TImage;
    rectTambah: TRectangle;
    imgTambah: TImage;
    visAdmin: TRectangle;
    ShadowEffect5: TShadowEffect;
    rectSearch: TRectangle;
    edSearch: TEdit;
    btnSearch: TImage;
    FloatAnimation10: TFloatAnimation;
    stgMain: TStringGrid;
    stgMain_No: TStringColumn;
    stgMain_NIP: TStringColumn;
    stgMain_NamaLengkap: TStringColumn;
    stgMain_NamaPanggilan: TStringColumn;
    stgMain_Telp: TStringColumn;
    stgMain_Glyph: TStringColumn;
    btnEdit: TRectangle;
    lbCekValue: TLabel;
    ShadowEffect2: TShadowEffect;
    btnHapus: TRectangle;
    Label12: TLabel;
    ShadowEffect4: TShadowEffect;
    btnTambah: TRectangle;
    Label11: TLabel;
    ShadowEffect1: TShadowEffect;
    procedure btnSearchClick(Sender: TObject);
    procedure rectHapusClick(Sender: TObject);
    procedure animScaleYFinish(Sender: TObject);
    procedure rectTambahClick(Sender: TObject);
    procedure rectEditClick(Sender: TObject);
    procedure stgMainCellClick(const Column: TColumn; const Row: Integer);
    procedure rectDeleteTidakClick(Sender: TObject);
    procedure rectDeleteYaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user: String;
    procedure ambilData(keyword: string);
    procedure fnClearStg;
    procedure hapusData;
  end;

var
  frmDataAdmin: TfrmDataAdmin;

implementation

{$R *.fmx}

uses MainAdmin, TambahDataAdmin;

procedure TfrmDataAdmin.ambilData(keyword: string);
begin
  // fnClearStg;
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
      if keyword = '' then
      begin
        JA := frmMainAdmin.doService('dataAdmin.php', 'exe=tampil');
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
            iplus := i + 1;
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('a_user', '');
                stgMain.Cells[2, i] := JV.GetValue('a_pass', '');
                stgMain.Cells[3, i] := JV.GetValue('a_nm_lengkap', '');
                stgMain.Cells[4, i] := JV.GetValue('a_telepon', '');
              end);
            i := iplus;
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
        JA := frmMainAdmin.doService('dataAdmin.php', 'exe=cari' + '&keyword='
          + keyword);
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
            iplus := i + 1;
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('a_user', '');
                stgMain.Cells[2, i] := JV.GetValue('a_pass', '');
                stgMain.Cells[3, i] := JV.GetValue('a_nm_lengkap', '');
                stgMain.Cells[4, i] := JV.GetValue('a_telepon', '');
              end);
            i := iplus;
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

procedure TfrmDataAdmin.animScaleYFinish(Sender: TObject);
begin
  if animScaleY.Inverse = true then
  begin
    deleteMenu.Visible := false;
  end;
end;

procedure TfrmDataAdmin.btnSearchClick(Sender: TObject);
begin
  ambilData(edSearch.Text);
end;

procedure TfrmDataAdmin.fnClearStg;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgMain.RowCount - 1 do
    for kol := 0 to stgMain.ColumnCount - 1 do
      stgMain.Cells[kol, bar] := '';

  stgMain.RowCount := 1;
end;

procedure TfrmDataAdmin.hapusData;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  ParamList := TStringList.Create;
  ParamList.Add('exe=' + 'hapus');
  ParamList.Add('user_lama=' + user);

  ResponseBody := frmMainAdmin.NetHTTPClient1.Post
    ('http://sditulilalbab-kamal.sch.id/api/dataAdmin.php', ParamList)
    .ContentAsString;
  if ResponseBody.Equals('Berhasil') then
  begin
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Admin');
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
    showMessage('Kamu ' + ResponseBody + ' Menghapus Data Admin');
  end;
  ParamList.Free;
end;

procedure TfrmDataAdmin.rectDeleteTidakClick(Sender: TObject);
begin
  animTransparan.Inverse := true;
  animScaleX.Inverse := true;
  animScaleY.Inverse := true;
  animTransparan.Start;
  animScaleX.Start;
  animScaleY.Start;
end;

procedure TfrmDataAdmin.rectDeleteYaClick(Sender: TObject);
begin
  if user <> '' then
    hapusData;
end;

procedure TfrmDataAdmin.rectEditClick(Sender: TObject);
begin
  if user = '' then
    showMessage('Data Tabel Belum Dipilih')
  else
  begin
    if frmTambahDataAdmin = nil then
    begin
      Application.CreateForm(TfrmTambahDataAdmin, frmTambahDataAdmin);
    end;
    frmTambahDataAdmin.user := user;
    frmTambahDataAdmin.ubah := 'data';
    frmTambahDataAdmin.exe := 'edit';
    frmTambahDataAdmin.aktifawal;
    frmTambahDataAdmin.Show;
  end;
end;

procedure TfrmDataAdmin.rectHapusClick(Sender: TObject);
begin
  if user <> '' then
  begin
    deleteMenu.Visible := true;
    lbDelete.Text := 'Apakah Anda Ingin Menghapus Data Berikut: ' + user;
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

procedure TfrmDataAdmin.rectTambahClick(Sender: TObject);
begin
  if frmTambahDataAdmin = nil then
  begin
    Application.CreateForm(TfrmTambahDataAdmin, frmTambahDataAdmin);
  end;
  frmTambahDataAdmin.ubah := 'data';
  frmTambahDataAdmin.exe := 'tambah';
  frmTambahDataAdmin.aktifawal;
  frmTambahDataAdmin.Show;
end;

procedure TfrmDataAdmin.stgMainCellClick(const Column: TColumn;
const Row: Integer);
begin
  user := stgMain.Cells[1, Row];
end;

end.
