unit IndikatorAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.Ani, FMX.Edit,
  FMX.Effects, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, System.JSON,
  System.Threading;

type
  TfrmIndikatorAdmin = class(TFrame)
    content: TRectangle;
    VertScrollBox1: TVertScrollBox;
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
    visIndikator: TRectangle;
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
    stgMain_IdIndikator: TStringColumn;
    stgMain_NamaIndikator: TStringColumn;
    stgMain_KelasIndikator: TStringColumn;
    stgMain_IAIndikator: TStringColumn;
    stgMain_StatusIndikator: TStringColumn;
    stgMain_Id: TStringColumn;
    stgMain_Glyph: TStringColumn;
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
    procedure btnSearchClick(Sender: TObject);
    procedure rectHapusClick(Sender: TObject);
    procedure animScaleYFinish(Sender: TObject);
    procedure rectTambahClick(Sender: TObject);
    procedure rectEditClick(Sender: TObject);
    procedure rectDeleteTidakClick(Sender: TObject);
    procedure rectDeleteYaClick(Sender: TObject);
    procedure stgMainCellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    id: String;
    procedure fnClearStg;
    procedure ambilData(keyword: string);
    procedure hapusData;
  end;

var
  frmIndikatorAdmin: TfrmIndikatorAdmin;

implementation

{$R *.fmx}

uses MainAdmin, TambahIndikatorAdmin;

procedure TfrmIndikatorAdmin.animScaleYFinish(Sender: TObject);
begin
  if animScaleY.Inverse = true then
  begin
    deleteMenu.Visible := false;
  end;
end;

procedure TfrmIndikatorAdmin.btnSearchClick(Sender: TObject);
begin
  ambilData(edSearch.Text);
end;

procedure TfrmIndikatorAdmin.fnClearStg;
var
  bar: Integer;
  kol: Integer;
begin
  for bar := 0 to stgMain.RowCount - 1 do
    for kol := 0 to stgMain.ColumnCount - 1 do
      stgMain.Cells[kol, bar] := '';

  stgMain.RowCount := 1;
end;

procedure TfrmIndikatorAdmin.ambilData(keyword: string);
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
        JA := frmMainAdmin.doService('indikatorAdmin.php', 'exe=tampil');
        i := 0;
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            stgMain.RowCount := JA.Count;
          end);

        if JA.ToString <> '[]' then
        begin
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := i + 1;
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('ib_indikator_id', '');
                stgMain.Cells[2, i] := JV.GetValue('ib_indikator', '');
                stgMain.Cells[3, i] := JV.GetValue('k_nm_kelas', '');
                stgMain.Cells[4, i] := JV.GetValue('ib_ia', '');
                stgMain.Cells[5, i] := JV.GetValue('ib_status', '');
                stgMain.Cells[6, i] := JV.GetValue('ib_id', '');
                i := iplus;
                // ShowMessage(JV.GetValue('ib_indikator', ''));
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
        JA := frmMainAdmin.doService('indikatorAdmin.php',
          'exe=cari' + '&keyword=' + keyword);
        i := 0;
        tthread.Synchronize(tthread.CurrentThread,
          procedure
          begin
            stgMain.RowCount := JA.Count;
          end);

        if JA.ToString <> '[]' then
        begin
          for JV in JA do
          begin
            tthread.Synchronize(tthread.CurrentThread,
              procedure
              begin
                iplus := i + 1;
                stgMain.Cells[0, i] := inttostr(iplus);
                stgMain.Cells[1, i] := JV.GetValue('ib_indikator_id', '');
                stgMain.Cells[2, i] := JV.GetValue('ib_indikator', '');
                stgMain.Cells[3, i] := JV.GetValue('k_nm_kelas', '');
                stgMain.Cells[4, i] := JV.GetValue('ib_ia', '');
                stgMain.Cells[5, i] := JV.GetValue('ib_status', '');
                stgMain.Cells[6, i] := JV.GetValue('ib_id', '');
                i := iplus;
                // ShowMessage(JV.GetValue('ib_indikator', ''));
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
      tthread.Synchronize(tthread.CurrentThread,
        procedure
        begin
          Loading.Visible := false;
        end);
    end).Start;
end;

procedure TfrmIndikatorAdmin.hapusData;
var
  JA: TJSONArray;
  JV: TJSONValue;
  ParamList, ParamCobaCok: TStringList;
  status, AA, ResponseBody: String;
  foto: String;
begin
  ParamList := TStringList.Create;
  ParamList.Add('exe=' + 'hapus');
  ParamList.Add('id_lama=' + id);

  ResponseBody := frmMainAdmin.NetHTTPClient1.Post
    ('http://sditulilalbab-kamal.sch.id/api/indikatorAdmin.php', ParamList)
    .ContentAsString;
  if ResponseBody.Equals('Berhasil') then
  begin
    ShowMessage('Kamu ' + ResponseBody +
      ' Menghapus Data Indikator Buku Penghubung');
    frmIndikatorAdmin.ambilData('');
    animTransparan.Inverse := true;
    animScaleX.Inverse := true;
    animScaleY.Inverse := true;
    animTransparan.Start;
    animScaleX.Start;
    animScaleY.Start;
  end
  else
  begin
    ShowMessage('Kamu ' + ResponseBody +
      ' Menghapus Data Indikator Buku Penghubung');
  end;
  ParamList.Free;
end;

procedure TfrmIndikatorAdmin.rectDeleteTidakClick(Sender: TObject);
begin
  animTransparan.Inverse := true;
  animScaleX.Inverse := true;
  animScaleY.Inverse := true;
  animTransparan.Start;
  animScaleX.Start;
  animScaleY.Start;
end;

procedure TfrmIndikatorAdmin.rectDeleteYaClick(Sender: TObject);
begin
  if id <> '' then
    hapusData;
end;

procedure TfrmIndikatorAdmin.rectEditClick(Sender: TObject);
begin
  if id <> '' then
  begin
    if frmTambahIndikatorAdmin = nil then
    begin
      Application.CreateForm(TfrmTambahIndikatorAdmin, frmTambahIndikatorAdmin);
    end;
    frmTambahIndikatorAdmin.exe := 'edit';
    frmTambahIndikatorAdmin.AktifAwal;
    frmTambahIndikatorAdmin.Show;
  end
  else
    ShowMessage('Tabel Belum Di Klik');
end;

procedure TfrmIndikatorAdmin.rectHapusClick(Sender: TObject);
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
    ShowMessage('Tabel Belum Di Klik');
end;

procedure TfrmIndikatorAdmin.rectTambahClick(Sender: TObject);
begin
  if frmTambahIndikatorAdmin = nil then
  begin
    Application.CreateForm(TfrmTambahIndikatorAdmin, frmTambahIndikatorAdmin);
  end;
  frmTambahIndikatorAdmin.exe := 'tambah';
  frmTambahIndikatorAdmin.AktifAwal;
  frmTambahIndikatorAdmin.Show;
end;

procedure TfrmIndikatorAdmin.stgMainCellClick(const Column: TColumn;
const Row: Integer);
begin
  id := stgMain.Cells[6, Row];
end;

end.
