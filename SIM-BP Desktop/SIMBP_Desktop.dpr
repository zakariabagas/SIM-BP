program SIMBP_Desktop;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainAdmin in 'MainAdmin.pas' {frmMainAdmin},
  Login in 'Login.pas' {frmLogin},
  SplashScreen in 'SplashScreen.pas' {frmSplashScreen},
  BantuanLogin in 'BantuanLogin.pas' {frmBantuanLogin},
  TentangPengembangLogin in 'TentangPengembangLogin.pas' {frmTentangPengembangLogin},
  HomeAdmin in 'HomeAdmin.pas' {frmHomeAdmin: TFrame},
  IndikatorAdmin in 'IndikatorAdmin.pas' {frmIndikatorAdmin: TFrame},
  DataAdmin in 'DataAdmin.pas' {frmDataAdmin: TFrame},
  GuruAdmin in 'GuruAdmin.pas' {frmGuruAdmin: TFrame},
  SiswaAdmin in 'SiswaAdmin.pas' {frmSiswaAdmin: TFrame},
  KelasAdmin in 'KelasAdmin.pas' {frmKelasAdmin: TFrame},
  PenggunaAdmin in 'PenggunaAdmin.pas' {frmPenggunaAdmin: TFrame},
  LihatLaporanAdmin in 'LihatLaporanAdmin.pas' {frmLihatLaporanAdmin: TFrame},
  BantuanAdmin in 'BantuanAdmin.pas' {frmBantuanAdmin},
  TambahIndikatorAdmin in 'TambahIndikatorAdmin.pas' {frmTambahIndikatorAdmin},
  TambahDataKelas in 'TambahDataKelas.pas' {frmTambahDataKelas},
  WKAdmin in 'WKAdmin.pas' {frmWKAdmin: TFrame},
  TambahWargaKelas in 'TambahWargaKelas.pas' {frmTambahWargaKelas},
  TambahDataAdmin in 'TambahDataAdmin.pas' {frmTambahDataAdmin},
  TambahGuruAdmin in 'TambahGuruAdmin.pas' {frmTambahGuruAdmin},
  TambahSiswaAdmin in 'TambahSiswaAdmin.pas' {frmTambahSiswaAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
  Application.CreateForm(TfrmTambahDataKelas, frmTambahDataKelas);
  Application.CreateForm(TfrmTambahWargaKelas, frmTambahWargaKelas);
  Application.CreateForm(TfrmTambahDataAdmin, frmTambahDataAdmin);
  Application.CreateForm(TfrmTambahGuruAdmin, frmTambahGuruAdmin);
  Application.CreateForm(TfrmTambahSiswaAdmin, frmTambahSiswaAdmin);
  Application.CreateForm(TfrmTambahIndikatorAdmin, frmTambahIndikatorAdmin);
  Application.Run;
end.
