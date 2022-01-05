unit BantuanAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.ScrollBox, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmBantuanAdmin = class(TForm)
    Isi: TRectangle;
    Title: TRectangle;
    lbTitle: TLabel;
    rectBack: TRectangle;
    Image1: TImage;
    A: TLayout;
    label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label35: TLabel;
    Layout2: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Label13: TLabel;
    Layout4: TLayout;
    Image3: TImage;
    Label14: TLabel;
    Label15: TLabel;
    ShadowEffect4: TShadowEffect;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    Label16: TLabel;
    Layout6: TLayout;
    Image4: TImage;
    Label17: TLabel;
    Label18: TLabel;
    ShadowEffect3: TShadowEffect;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Label19: TLabel;
    Layout8: TLayout;
    Image5: TImage;
    Label20: TLabel;
    Label21: TLabel;
    ShadowEffect2: TShadowEffect;
    Layout9: TLayout;
    Rectangle4: TRectangle;
    Label23: TLabel;
    Layout10: TLayout;
    Image6: TImage;
    Label24: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout11: TLayout;
    Rectangle5: TRectangle;
    Label26: TLabel;
    Layout12: TLayout;
    Image7: TImage;
    Label27: TLabel;
    ShadowEffect5: TShadowEffect;
    Layout13: TLayout;
    Rectangle6: TRectangle;
    Label28: TLabel;
    Layout14: TLayout;
    Image8: TImage;
    Label29: TLabel;
    ShadowEffect6: TShadowEffect;
    Layout15: TLayout;
    Rectangle7: TRectangle;
    Label30: TLabel;
    Layout16: TLayout;
    Image9: TImage;
    Label31: TLabel;
    Label32: TLabel;
    ShadowEffect7: TShadowEffect;
    Layout17: TLayout;
    Rectangle8: TRectangle;
    Label33: TLabel;
    Layout18: TLayout;
    Image10: TImage;
    Label34: TLabel;
    ShadowEffect8: TShadowEffect;
    Image2: TImage;
    Layout19: TLayout;
    Rectangle9: TRectangle;
    Label36: TLabel;
    Layout20: TLayout;
    Image11: TImage;
    Label37: TLabel;
    Label38: TLabel;
    ShadowEffect9: TShadowEffect;
    Label25: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Layout1: TLayout;
    Rectangle10: TRectangle;
    Label42: TLabel;
    Layout21: TLayout;
    Image12: TImage;
    Label43: TLabel;
    ShadowEffect10: TShadowEffect;
    VertScrollBox1: TVertScrollBox;
    procedure rectBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    form: TForm;
  end;

var
  frmBantuanAdmin: TfrmBantuanAdmin;

implementation

{$R *.fmx}

procedure TfrmBantuanAdmin.rectBackClick(Sender: TObject);
begin
  frmBantuanAdmin.Hide;
end;

end.
