--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Motor_Info.CMotorInfo_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.Motor_Info.CMotorInfo_Test_Data.CMotorInfo_Tests is


--  begin read only
   procedure Test_pxGet_Force_Vector (Gnattest_T : in out Test_CMotorInfo);
   procedure Test_pxGet_Force_Vector_cab73d (Gnattest_T : in out Test_CMotorInfo) renames Test_pxGet_Force_Vector;
--  id:2.1/cab73de8dccf866f/pxGet_Force_Vector/1/0/
   procedure Test_pxGet_Force_Vector (Gnattest_T : in out Test_CMotorInfo) is
   --  simulator-motor_info.ads:13:4:pxGet_Force_Vector
--  end read only


      pragma Unreferenced (Gnattest_T);
      pxNewMotorInfo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
      pxTorqueVector : Math.Vectors.pCVector;
   begin
      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);
      pxTorqueVector := Math.Vectors.pxGet_Copy(Math.Vectors.xCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector));

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxGet_Force_Vector'Address /= pxNewMotorInfo.pxForceVector'Address,
                              Message   => "CMotorInfo.pxGet_Force_Vector Failed, Pointer from object and return pointers adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxGet_Force_Vector.all, pxNewMotorInfo.pxForceVector.all),
                              Message   => "CMotorInfo.pxGet_Force_Vector Failed, Incorrect Value");




--  begin read only
   end Test_pxGet_Force_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Position_Vector (Gnattest_T : in out Test_CMotorInfo);
   procedure Test_pxGet_Position_Vector_b43fda (Gnattest_T : in out Test_CMotorInfo) renames Test_pxGet_Position_Vector;
--  id:2.1/b43fda0accda7ff4/pxGet_Position_Vector/1/0/
   procedure Test_pxGet_Position_Vector (Gnattest_T : in out Test_CMotorInfo) is
   --  simulator-motor_info.ads:14:4:pxGet_Position_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNewMotorInfo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
      pxTorqueVector : Math.Vectors.pCVector;
   begin
      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);
      pxTorqueVector := math.Vectors.pxGet_Copy(Math.Vectors.xCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector));

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxGet_Position_Vector'Address /= pxNewMotorInfo.pxPositionVector'Address,
                              Message   => "CMotorInfo.pxGet_Position_Vector Failed, Pointer from object and return pointers adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxGet_Position_Vector.all, pxNewMotorInfo.pxPositionVector.all),
                              Message   => "CMotorInfo.pxGet_Position_Vector Failed, Incorrect Value");



--  begin read only
   end Test_pxGet_Position_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Torque_Vector (Gnattest_T : in out Test_CMotorInfo);
   procedure Test_pxGet_Torque_Vector_f58fc8 (Gnattest_T : in out Test_CMotorInfo) renames Test_pxGet_Torque_Vector;
--  id:2.1/f58fc8726d7015dc/pxGet_Torque_Vector/1/0/
   procedure Test_pxGet_Torque_Vector (Gnattest_T : in out Test_CMotorInfo) is
   --  simulator-motor_info.ads:15:4:pxGet_Torque_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNewMotorInfo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
      pxTorqueVector : Math.Vectors.pCVector;
   begin
      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);
      pxTorqueVector := math.Vectors.pxGet_Copy(Math.Vectors.xCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector));

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxGet_Torque_Vector'Address /= pxNewMotorInfo.pxTorqueVector'Address,
                              Message   => "CMotorInfo.pxGet_Torque_Vector Failed, Pointer from object and return pointers adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxGet_Torque_Vector.all, pxNewMotorInfo.pxTorqueVector.all),
                              Message   => "CMotorInfo.pxGet_Torque_Vector Failed, Incorrect Value");



--  begin read only
   end Test_pxGet_Torque_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMotorInfo);
   procedure Test_pxGet_Copy_3bb6df (Gnattest_T : in out Test_CMotorInfo) renames Test_pxGet_Copy;
--  id:2.1/3bb6df02c40964cb/pxGet_Copy/1/0/
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMotorInfo) is
   --  simulator-motor_info.ads:16:4:pxGet_Copy
--  end read only
      pxNewMotorInfo : pCMotorInfo;
      pxCopyNewMotorInfo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
      pxTorqueVector : Math.Vectors.pCVector;
   begin
      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);
      pxTorqueVector := Math.Vectors.pxGet_Copy(Math.Vectors.xCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector));

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);
      pxCopyNewMotorInfo := pxNewMotorInfo.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxForceVector'Address /= pxCopyNewMotorInfo.pxForceVector'Address,
                              Message   => "CMotorInfo.pxGet_Copy Failed, Pointer adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxForceVector.all, pxCopyNewMotorInfo.pxForceVector.all),
                              Message   => "CMotorInfo.pxGet_Copy Failed, Incorrect Value");


      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxPositionVector'Address /= pxCopyNewMotorInfo.pxPositionVector'Address,
                              Message   => "CMotorInfo.pxGet_Copy Failed, Pointer adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxPositionVector.all, pxCopyNewMotorInfo.pxPositionVector.all),
                              Message   => "CMotorInfo.pxGet_Copy Failed, Incorrect Value");


      AUnit.Assertions.Assert(Condition => pxNewMotorInfo.pxTorqueVector'Address /= pxCopyNewMotorInfo.pxTorqueVector'Address,
                              Message   => "CMotorInfo.pxGet_Copy Failed, Pointer adresses match");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxNewMotorInfo.pxTorqueVector.all, pxCopyNewMotorInfo.pxTorqueVector.all),
                              Message   => "CMotorInfo.pxGet_Copy Failed, Incorrect Value");


--  begin read only
   end Test_pxGet_Copy;
--  end read only

end Simulator.Motor_Info.CMotorInfo_Test_Data.CMotorInfo_Tests;
