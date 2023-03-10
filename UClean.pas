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
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCleaner = class(TForm)
    tlbOptions: TToolBar;
    btnConfig: TToolButton;
    ilImagesTlb: TImageList;
    pbMemory: TProgressBar;
    lblPorcentage: TLabel;
    tmr: TTimer;
    btnCleanMemo: TButton;
    procedure btnConfigClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCleanMemoClick(Sender: TObject);
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

type
  TLoopThread = class(TThread)
    protected
      procedure Execute; override;
  end;

procedure TLoopThread.Execute;
var

  MemoryStatus : TMemoryStatus;
  usageRam : Integer;

begin
    while not Terminated do
    begin
     MemoryStatus.dwLength := SizeOf(MemoryStatus);
     GlobalMemoryStatus(MemoryStatus);
     usageRam := MemoryStatus.dwMemoryLoad;

     frmCleaner.lblPorcentage.Caption := usageRam.ToString + '%';
     frmCleaner.pbMemory.Position := usageRam;
    end;
end;

procedure TfrmCleaner.btnCleanMemoClick(Sender: TObject);
begin
  ShowMessage('[WIP]Nesse botão irá liberar a memoria RAM do seu PC(Windows)');
end;

procedure TfrmCleaner.btnConfigClick(Sender: TObject);
begin
   frmConfig.ShowModal;
   frmConfig.Free;
end;


procedure TfrmCleaner.FormShow(Sender: TObject);
begin
   TLoopThread.Create(False); //-- marca para iniciar o loop em segundo plano por meio de thread do processador
   TLoopThread.Create(True); //-- marca para liberar o loop do segundo plano
end;

end.
