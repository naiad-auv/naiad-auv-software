--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.submarine.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with math.Vectors; use Math.Vectors;
with math.Matrices; use math.Matrices;
with simulator.Motor_Info; use Simulator.Motor_Info;

package body simulator.submarine.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate_Naiad (Gnattest_T : in out Test);
   procedure Test_pxCreate_Naiad_b9ce65 (Gnattest_T : in out Test) renames Test_pxCreate_Naiad;
--  id:2.1/b9ce651936ac2ef1/pxCreate_Naiad/1/0/
   procedure Test_pxCreate_Naiad (Gnattest_T : in out Test) is
   --  simulator-submarine.ads:15:4:pxCreate_Naiad
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
   begin
      pxSubmarine := submarine.pxCreate_Naiad;
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxPositionVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set position");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxVelocityVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set Velocity");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxOrientationMatrix /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set Orientation");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxAngularVelocityVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set AngularVelocity");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxInertiaMatrix /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set InertiaMatrix");
      AUnit.Assertions.Assert(Condition => pxSubmarine.txMotorInfo(1) /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set MotorInfo");
      AUnit.Assertions.Assert(Condition => pxSubmarine.txMotorForce(1) = 0.0,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set Motor Force");
      AUnit.Assertions.Assert(Condition => pxSubmarine.fWeight = 28.0,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set Weight");
      Aunit.Assertions.Assert(Condition => pxSubmarine.fBuoyancyForce = 30.0*9.82,
                              Message => "Simulator.Submarine.pxCreateNaiad failed, didn't set BouyancyForce");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxBuoyancyForcePositionVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set Bouyancy Force Position Vector");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxRotationFrictionVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set rotation friction");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxVelocityFrictionVector /=null,
                              Message   => "Simulator.Submarine.pxCreateNaiad failed, didn't set velocity friction");


--  begin read only
   end Test_pxCreate_Naiad;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_1cb11e (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/1cb11e6e0984d753/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-submarine.ads:17:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
   begin
      pxSubmarine := submarine.pxCreate;
      AUnit.Assertions.Assert(Condition => pxSubmarine /= NULL,
                              Message   => "Simulator.Submarine.pxCreate failed, Pointer is still 0");


--  begin read only
   end Test_pxCreate;
--  end read only

end simulator.submarine.Test_Data.Tests;
