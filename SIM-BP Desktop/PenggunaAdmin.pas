unit PenggunaAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmPenggunaAdmin = class(TFrame)
    content: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Layout2: TLayout;
    btnMasuk: TRectangle;
    Label14: TLabel;
    Rectangle1: TRectangle;
    Label15: TLabel;
    lbForm: TLabel;
    Layout3: TLayout;
    lbUser: TLabel;
    crFotoProfil: TCircle;
    lbNmLengkap: TLabel;
    lbPass: TLabel;
    lbNoHP: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    procedure btnMasukClick(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user: String;
    procedure ambilData;
  end;

var
  frmPenggunaAdmin: TfrmPenggunaAdmin;

implementation

{$R *.fmx}

uses MainAdmin, TambahDataAdmin;

procedure TfrmPenggunaAdmin.ambilData;
begin
  frmMainAdmin.loadbase64(crFotoProfil.Fill.Bitmap.Bitmap, frmMainAdmin.a_foto);
  lbUser.Text := frmMainAdmin.a_user;
  user := frmMainAdmin.a_user;
  lbPass.Text := frmMainAdmin.a_pass;
  lbNmLengkap.Text := frmMainAdmin.a_nm_lengkap;
  lbNoHP.Text := frmMainAdmin.a_telepon;
end;

procedure TfrmPenggunaAdmin.btnMasukClick(Sender: TObject);
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
    frmTambahDataAdmin.exe := 'edit';
    frmTambahDataAdmin.ubah := 'profil';
    frmTambahDataAdmin.aktifawal;
    frmTambahDataAdmin.Show;
  end;
end;

procedure TfrmPenggunaAdmin.Rectangle1Click(Sender: TObject);
begin
  frmMainAdmin.keluarSystem(frmMainAdmin);
end;

end.
