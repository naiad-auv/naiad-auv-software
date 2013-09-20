--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Vectors.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Vectors.Test_Data.Tests is


--  begin read only
   procedure Test_Create (Gnattest_T : in out Test);
   procedure Test_Create_af4d33 (Gnattest_T : in out Test) renames Test_Create;
--  id:2.1/af4d339d88f94d4a/Create/1/0/
   procedure Test_Create (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:7:4:Create
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => Navigation.Vectors.Create(fX => 10.0,
                                                                     fY => 0.0,
                                                                     fZ => 0.0).fX = 10.0,
                              Message   => "X-value set to 10.0 on creation failed");
      AUnit.Assertions.Assert(Condition => Navigation.Vectors.Create(fX => 0.0,
                                                                     fY => 10.0,
                                                                     fZ => 0.0).fY = 10.0,
                              Message   => "Y-value set to 10.0 on creation failed");
      AUnit.Assertions.Assert(Condition => Navigation.Vectors.Create(fX => 0.0,
                                                                     fY => 0.0,
                                                                     fZ => 10.0).fZ = 10.0,
                              Message   => "Z-value set to 10.0 on creation failed");

      AUnit.Assertions.Assert(Condition => Navigation.Vectors.Create(fX => 1000000000000000000000000.0**2,
                                                                     fY => 0.0,
                                                                     fZ => 0.0).fX = 1000000000000000000000000.0**2,
                              Message   => "Overflow");


--  begin read only
   end Test_Create;
--  end read only

end Navigation.Vectors.Test_Data.Tests;
