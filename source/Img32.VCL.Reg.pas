unit Img32.VCL.Reg;

interface

procedure Register;

implementation
uses Classes,Img32.Panels;

procedure Register;
begin
  RegisterComponents('Image32 Panels', [TImage32Panel]);
end;

end.
