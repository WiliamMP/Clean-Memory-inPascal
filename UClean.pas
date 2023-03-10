unit UClean;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.ImageList,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.StdCtrls;

type
  TfrmCleaner = class(TForm)
    btnCleanMemory: TButton;
    tlbOptions: TToolBar;
    btnConfig: TToolButton;
    ilImagesTlb: TImageList;
    procedure btnConfigClick(Sender: TObject);
    procedure btnCleanMemoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCleaner: TfrmCleaner;

implementation

uses
  UConfig;

{$R *.dfm}

procedure TfrmCleaner.btnCleanMemoryClick(Sender: TObject);
begin
  ShowMessage('aqui vai limpar a memorira do seu PC');
end;

procedure TfrmCleaner.btnConfigClick(Sender: TObject);
begin
   frmConfig.ShowModal;
   frmConfig.Free;
end;

end.
