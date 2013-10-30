with Gui;
with Database;
with Ada.Text_IO; use Ada.Text_IO;

procedure Simulator is
   DatabaseForRobot : aliased Database.TDatabase;
   pDatabaseForRobot : Database.pTDatabase;
begin
   DatabaseForRobot.bGripperOpen := False;
   DatabaseForRobot.fDepth := 10.14;
   DatabaseForRobot.tfMotor(1) := 75.0;

   pDatabaseForRobot := new Database.TDatabase'(DatabaseForRobot);

   Gui.Start_GUI(pDatabaseForRobot);
end Simulator;
