unit img32.VCL;

interface
uses img32,WinApi.Windows,Vcl.Graphics;
type
  TImage32 = class(Img32.TImage32)
  public
    procedure CopyFromBitmap(bmp: TBitmap);
    procedure CopyToBitmap(bmp: TBitmap);
  end;

implementation

{ TImage32 }

procedure TImage32.CopyFromBitmap(bmp: TBitmap);
var
  savedPF: TPixelFormat;
begin
  if not Assigned(bmp) then Exit;
  savedPF := bmp.PixelFormat;
  bmp.PixelFormat := pf32bit;
  SetSize(bmp.Width, bmp.Height);
  GetBitmapBits(bmp.Handle, Width * Height * 4, PixelBase);
  bmp.PixelFormat := savedPF;
end;
//------------------------------------------------------------------------------

procedure TImage32.CopyToBitmap(bmp: TBitmap);
begin
  if not Assigned(bmp) then Exit;
  bmp.PixelFormat := pf32bit;
  bmp.SetSize(Width, Height);
  bmp.AlphaFormat := afDefined;
  SetBitmapBits(bmp.Handle, Width * Height * 4, PixelBase);
end;

end.
