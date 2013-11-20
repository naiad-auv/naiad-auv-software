with gyroController;
with Interfaces;

procedure Main is
   yaw : gyroController.gyro_val;
begin
   gyroController.init;
   gyroController.start;
   yaw := gyroController.get_yaw;
   loop
      null;
   end loop;
end Main;
