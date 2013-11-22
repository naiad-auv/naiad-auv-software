with Interfaces;

package gyroController is

   type gyro_val is array (Integer range 1..3) of Interfaces.Unsigned_8;
   procedure init;
   procedure start;
   function get_yaw return gyro_val;

private
   type reg is new Interfaces.Unsigned_8 range 0 .. 10;
   gyro : gyro_val;
   pragma Volatile(gyro);
   Data_ready :Boolean := False;
   isStarted : Boolean := False;
   procedure init_ext_interrupt;
   procedure read_gyro;

   WRITE_REG : constant Interfaces.Unsigned_8 := 80;
   READ_REG : constant Interfaces.Unsigned_8 := 16;
   CALIBRATE_CMD : constant Interfaces.Unsigned_8 := 16#F0#;
   RDATAC_CMD : constant Interfaces.Unsigned_8 := 16#03#;
end gyroController;
