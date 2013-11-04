--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Motor_Info.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.Motor_Info.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_4a5087 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/4a5087a1818726d7/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  simulator-motor_info.ads:10:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotorInfo : simulator.Motor_Info.pCMotorInfo := simulator.Motor_Info.pxCreate(pxPositionVector => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.1,3.5,0.9)),
                                                                                      pxForceVector    => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(3.1,1.5,4.9)));
   begin

      motor_info.Free(pxMotorInfo);
      Aunit.Assertions.Assert(Condition => pxMotorInfo = null,
                              Message   => "PositionVector not dealocated");



--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_830f62 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/830f62b0ae262c07/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
      use Math.Vectors;
   --  simulator-motor_info.ads:12:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewMotorInfo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
      pxTorqueVector : Math.Vectors.pCVector;
   begin

      pxForceVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0));
      pxPositionVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0));
      pxTorqueVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector));

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Condition => pxForceVector'Address /= pxNewMotorInfo.pxForceVector'Address,
                              Message   => "CMotorInfo.pxCreate Failed, Shared adress between force vector parameter and object");
      AUnit.Assertions.Assert(Condition => pxPositionVector'Address /= pxNewMotorInfo.pxPositionVector'Address,
                              Message   => "CMotorInfo.pxCreate Failed, Shared adress between position vector parameter and object");

      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxForceVector.all, pxNewMotorInfo.pxForceVector.all),
                              Message   => "CMotorInfo.pxCreate Failed, Incorrect value on force");
      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxPositionVector.all, pxNewMotorInfo.pxPositionVector.all),
                              Message   => "CMotorInfo.pxCreate Failed, Incorrect value on position");
      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxTorqueVector.all, pxNewMotorInfo.pxTorqueVector.all),
                              Message   => "CMotorInfo.pxCreate Failed, Incorrect value on torque");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test);
   procedure Test_Equal_260412 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/26041254fe3bedc1/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  simulator-motor_info.ads:17:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNewMotorInfo : pCMotorInfo;
      pxNewMotorInfoTwo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
   begin

      pxForceVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0));
      pxPositionVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0));


      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);
      pxNewMotorInfoTwo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                         pxForceVector    => pxForceVector);
      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo.all , pxNewMotorInfoTwo.all ) = true ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison1");


      pxForceVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0));
      pxPositionVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 161.0));


      pxNewMotorInfoTwo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                         pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo.all , pxNewMotorInfoTwo.all ) = false ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison2");

      pxForceVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0));
      pxPositionVector := math.Vectors.pxGet_Allocated_Copy(Math.Vectors.xCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0));

      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo.all , pxNewMotorInfoTwo.all ) = false ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison");
--  begin read only
   end Test_Equal;
--  end read only

end Simulator.Motor_Info.Test_Data.Tests;
