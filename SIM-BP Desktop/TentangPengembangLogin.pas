unit TentangPengembangLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmTentangPengembangLogin = class(TForm)
    Isi: TRectangle;
    Layout3: TLayout;
    lbNmPanggilan: TLabel;
    crFoto: TCircle;
    lbNmLengkap: TLabel;
    lbNISN: TLabel;
    lbJK: TLabel;
    lbAlamat: TLabel;
    lbTglLahir: TLabel;
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
    namaSiswa: TLabel;
    rectBack: TRectangle;
    Image1: TImage;
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTentangPengembangLogin: TfrmTentangPengembangLogin;

implementation

{$R *.fmx}

uses Login;

procedure TfrmTentangPengembangLogin.rectBackClick(Sender: TObject);
begin
  frmLogin.Show;
  frmTentangPengembangLogin.Hide;
end;

end.
