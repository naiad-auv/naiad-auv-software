--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Motor_Info.CMotorInfo_Test_Data.CMotorInfo_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Motor_Info.CMotorInfo_Test_Data.CMotorInfo_Tests.Test_CMotorInfo);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Force_Vector_cab73d : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxGet_Position_Vector_b43fda : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxGet_Torque_Vector_f58fc8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_pxGet_Copy_3bb6df : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Force_Vector_cab73d,
         "simulator-motor_info.ads:10:4:",
         Test_pxGet_Force_Vector_cab73d'Access);
      Runner_1.Create
        (Case_2_1_Test_pxGet_Position_Vector_b43fda,
         "simulator-motor_info.ads:11:4:",
         Test_pxGet_Position_Vector_b43fda'Access);
      Runner_1.Create
        (Case_3_1_Test_pxGet_Torque_Vector_f58fc8,
         "simulator-motor_info.ads:12:4:",
         Test_pxGet_Torque_Vector_f58fc8'Access);
      Runner_1.Create
        (Case_4_1_Test_pxGet_Copy_3bb6df,
         "simulator-motor_info.ads:13:4:",
         Test_pxGet_Copy_3bb6df'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Force_Vector_cab73d'Access);
      Result.Add_Test (Case_2_1_Test_pxGet_Position_Vector_b43fda'Access);
      Result.Add_Test (Case_3_1_Test_pxGet_Torque_Vector_f58fc8'Access);
      Result.Add_Test (Case_4_1_Test_pxGet_Copy_3bb6df'Access);

      return Result'Access;

   end Suite;

end Simulator.Motor_Info.CMotorInfo_Test_Data.CMotorInfo_Tests.Suite;
--  end read only
