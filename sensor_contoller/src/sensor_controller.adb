

with Interfaces; 		--use Interfaces;
with Temp_Sensor;		--use Temp_Sensor;
with Salinity_Sensor;		--use Salinity_Sensor;
with Pressure_Sensor;		--use Pressure_Sensor;



procedure Sensor_Controller is

   iTemperaturePin 	: Constant Interfaces.Unsigned_8 	:= 0; --which pin the temp sensor is at
   iPressurePin 	: Constant Interfaces.Unsigned_8 	:= 0; --which pin the pressure sensor is at
   UARTPort 		: Salinity_Sensor.USARTID 		:= Salinity_Sensor.USART0;

--     function get_temp_str(pin : Unsigned_8) return String is
--        temp : Integer_16;
--        ret : String := "SXY.Z";
--
--        ret1 : String := "S";
--        ret2 : String := "XXX";
--        ret3 : String := "Z";
--
--     begin
--        --temp := get_temp_int(pin);
--        temp := 2000;
--
--        -- Convert from binary reading to degrees Celsius:
--        -- see the DS18B20 datasheet for information
--
--        -- from -55 to +125 degrees: 16 steps per degree
--        -- the output will be in 0.5 degree steps, leftshift 3 steps = devision by 8
--
--        temp := Integer_16(Shift_Left(Unsigned_16(temp), 3));
--
--        --determine sign, and get temp's abs value
--        if temp > 0 then
--           ret1 := "+";
--        else
--           ret1 := "-";
--           temp := -temp;
--        end if;
--
--        --determine decimal (.0 or .5)
--        if (Unsigned_16(temp) and Unsigned_16(1)) = 1 then
--           ret3 := "5";
--           temp := temp - 1;
--        else
--           ret3 := "0";
--        end if;
--
--        --get string for the two first digits:
--        temp := Integer_16(Shift_Left(Unsigned_16(temp), 1)); --leftshift again to get temp into whole degrees
--        ret2 := Integer'Image(Integer(temp));
--
--        if ret2'Length = 1 then  --add zeros if neccessary
--           ret2 := "00" & ret2;
--        elsif ret2'Length = 2 then
--           ret2 := "0" & ret2;
--        end if;
--
--
--        return ret1 & ret2 & "." & ret3;
--
--     end get_temp_str;


   sTemp : String := "+125.6";
   i16Temp : Interfaces.Integer_16;
   u16Pressure : Interfaces.Unsigned_16;
   u8Salinity : Interfaces.Unsigned_8;

begin

   Temp_Sensor.sGetTempStr(iTemperaturePin, i16Temp, sTemp);

   Salinity_Sensor.Initate_Salinity_Sensor(UARTPort, sTemp(3..6));

   u8Salinity := Salinity_Sensor.Get_Salinity;

   u16Pressure := Pressure_Sensor.u16GetPressure(iPressurePin);


end Sensor_Controller;
