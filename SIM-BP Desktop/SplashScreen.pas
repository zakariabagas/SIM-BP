unit SplashScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Ani, System.IOUtils;

type
  TfrmSplashScreen = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpacityAnimation: TFloatAnimation;
    UpAnimation: TFloatAnimation;
    BukuOpacityAnimation: TFloatAnimation;
    SDITOpacityAnimation: TFloatAnimation;
    Timer1: TTimer;
    Arc2: TArc;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function cekdata: String;
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.fmx}

uses MainAdmin, Login
//  KelasAdmin, GuruAdmin, SiswaAdmin, dataAdmin, IndikatorAdmin,
//  LihatLaporanAdmin, PenggunaAdmin, WKAdmin
  ;

procedure TfrmSplashScreen.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmSplashScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;

procedure TfrmSplashScreen.FormShow(Sender: TObject);
begin
  OpacityAnimation.Enabled := True;
  OpacityAnimation.Start;
  UpAnimation.Enabled := True;
  UpAnimation.Start;
  BukuOpacityAnimation.Enabled := True;
  BukuOpacityAnimation.Start;
  SDITOpacityAnimation.Enabled := True;
  SDITOpacityAnimation.Start;
end;

function TfrmSplashScreen.cekdata: String;
begin
  try
    if FileExists(System.IOUtils.TPath.GetDocumentsPath +
      System.SysUtils.PathDelim + 'admin.txt') then
      result := 'admin'
    else
      result := 'kosong';
  except
    on e: exception do
      ShowMessage('Error check data ' + e.ToString);
  end;
end;

procedure TfrmSplashScreen.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if cekdata = 'kosong' then
  begin
    // if frmLogin=nil then application.CreateForm(TfrmLogin, frmLogin);
    if frmLogin = nil then
    begin
      Application.CreateForm(TfrmLogin, frmLogin);
    end;
    frmLogin.show;
    frmSplashScreen.Free;
  end
  else if cekdata = 'admin' then
  begin
    if frmMainAdmin = nil then
    begin
      Application.CreateForm(TfrmMainAdmin, frmMainAdmin);
//      Application.CreateForm(TfrmIndikatorAdmin, frmIndikatorAdmin);
//      Application.CreateForm(TfrmDataAdmin, frmDataAdmin);
//      Application.CreateForm(TfrmSiswaAdmin, frmSiswaAdmin);
//      Application.CreateForm(TfrmGuruAdmin, frmGuruAdmin);
//      Application.CreateForm(TfrmKelasAdmin, frmKelasAdmin);
//      Application.CreateForm(TfrmWKAdmin, frmWKAdmin);
//      Application.CreateForm(TfrmLihatLaporanAdmin, frmLihatLaporanAdmin);
//      Application.CreateForm(TfrmPenggunaAdmin, frmPenggunaAdmin);
    end;
    frmMainAdmin.loaddata;
    frmMainAdmin.show;
    frmSplashScreen.Free;
//    frmKelasAdmin.AmbilData('');
//    frmGuruAdmin.AmbilData('');
    // frmCatatanKhususSiswa.tampildata;
    // frmDataSiswaGuru.showdata;
    // frmLihatLaporanGuru.tampildata;
  end
  else
    ShowMessage('Aplikasi Tidak Dapat Mencek Data');
end;

end.
