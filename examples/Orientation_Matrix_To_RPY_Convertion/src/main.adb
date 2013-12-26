with ada.Numerics;
with math.Angles;
with Math.Matrices;
with Math.Planes;
with Math.Quaternions;
with Math.Vectors;
procedure Main is
   fRoll : float;
   fPitch : float;
   fYaw : float;
   iLoops : integer := 1000;
begin
   for iRoll in 0..iLoops loop
      for iPitch in 0..iLoops loop
         for iYaw in 0..iLoops loop
            fRoll:=2.0*ada.Numerics.Pi*float(iRoll)/float(iLoops);
            fPitch:=2.0*ada.Numerics.Pi*float(iPitch)/float(iLoops);
            fYaw:=2.0*ada.Numerics.Pi*float(iYaw)/float(iLoops);



         end loop;
      end loop;
   end loop;

end Main;
