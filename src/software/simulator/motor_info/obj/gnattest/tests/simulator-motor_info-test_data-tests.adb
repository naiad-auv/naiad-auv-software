--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Motor_Info.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.Motor_Info.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_830f62 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/830f62b0ae262c07/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-motor_info.ads:9:4:pxCreate
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
      pxTorqueVector := Math.Vectors.pxCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                     pxRightOperandVector => pxForceVector);

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Condition => pxForceVector'Address /= pxNewMotorInfo.pxForceVector'Address,
                              Message   => "CMotorInfo.pxCreate Failed, Shared adress between force vector parameter and object");
      AUnit.Assertions.Assert(Condition => pxPositionVector'Address /= pxNewMotorInfo.pxPositionVector'Address,
                              Message   => "CMotorInfo.pxCreate Failed, Shared adress between position vector parameter and object");

      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxForceVector, pxNewMotorInfo.pxForceVector),
                              Message   => "CMotorInfo.pxCreate Failed, non correct value on force");
      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxPositionVector, pxNewMotorInfo.pxPositionVector),
                              Message   => "CMotorInfo.pxCreate Failed, non correct value on position");
      AUnit.Assertions.Assert(Condition => Math.Vectors."="(pxTorqueVector, pxNewMotorInfo.pxTorqueVector),
                              Message   => "CMotorInfo.pxCreate Failed, non correct value on torque");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test);
   procedure Test_Equal_260412 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/26041254fe3bedc1/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  simulator-motor_info.ads:14:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNewMotorInfo : pCMotorInfo;
      pxNewMotorInfoTwo : pCMotorInfo;
      pxForceVector : Math.Vectors.pCVector;
      pxPositionVector : Math.Vectors.pCVector;
   begin

      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);

      pxNewMotorInfo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                      pxForceVector    => pxForceVector);
      pxNewMotorInfoTwo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                         pxForceVector    => pxForceVector);
      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo , pxNewMotorInfoTwo ) = true ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison");


      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 1.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 0.0,
                                                fZ => 162.0);
      pxNewMotorInfoTwo := Simulator.Motor_Info.pxCreate(pxPositionVector => pxPositionVector,
                                                         pxForceVector    => pxForceVector);

      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo , pxNewMotorInfoTwo ) = false ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison");

      pxForceVector := Math.Vectors.pxCreate(fX => 5.0,
                                             fY => 10.0,
                                             fZ => -20.0);
      pxPositionVector := Math.Vectors.pxCreate(fX => 15.0,
                                                fY => 1.0,
                                                fZ => 162.0);
      AUnit.Assertions.Assert(Simulator.Motor_Info."="( pxNewMotorInfo , pxNewMotorInfoTwo ) = false ,
                              Message   => "CMotorInfo.Equal Failed, non correct comparison");
--  begin read only
   end Test_Equal;
--  end read only



end Simulator.Motor_Info.Test_Data.Tests;
