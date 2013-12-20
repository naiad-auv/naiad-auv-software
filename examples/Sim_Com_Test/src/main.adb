with simulator.Comunication;
with ada.Text_IO;
with math.Matrices;
with math.Vectors;
with simulator.submarine;
procedure Main is
   -- xMatrix : math.Matrices.CMatrix;
   -- xRawMatrix : math.Matrices.TMatrix;
   MotorPower : simulator.submarine.TMotorForce;
begin
   delay(3.0);
   simulator.Comunication.Intialize_And_Reset("127.0.0.1", 1337);
   delay(10.0);
   MotorPower := simulator.Comunication.xGet_Motor_Power;
   --xRawMatrix := simulator.Comunication.xGet_Current_Orientation.tfGet_Raw_Matrix;
   for i in 1..6 loop
      ada.Text_IO.Put_Line(MotorPower(i)'img);
   end loop;
--     for i in 1..3 loop
--        for j in 1..3 loop
--           ada.Text_IO.put(xRawMatrix(i,j)'img);
--        end loop;
--        ada.Text_IO.New_Line;
--     end loop;
   delay(10.0);
end Main;
