unit BantuanLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.ScrollBox, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmBantuanLogin = class(TForm)
    Isi: TRectangle;
    Title: TRectangle;
    lbTitle: TLabel;
    rectBack: TRectangle;
    Image1: TImage;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Label13: TLabel;
    Layout4: TLayout;
    Image3: TImage;
    Label14: TLabel;
    Label15: TLabel;
    ShadowEffect4: TShadowEffect;
    Image2: TImage;
    VertScrollBox1: TVertScrollBox;
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBantuanLogin: TfrmBantuanLogin;

implementation

{$R *.fmx}

uses Login;

procedure TfrmBantuanLogin.rectBackClick(Sender: TObject);
begin
  frmLogin.Show;
  frmBantuanLogin.Hide;
end;

end.
