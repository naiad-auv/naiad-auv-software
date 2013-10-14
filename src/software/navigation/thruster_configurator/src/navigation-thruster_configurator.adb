package body Navigation.Thruster_Configurator is

   function pxCreate return pCThrusterConfigurator is
   begin
      return null;
   end pxCreate;



   function xGet_Final_Thruster_Power_Configuration(this : in CThrusterConfigurator) return float is
   begin
      return 0.0;
   end xGet_Final_Thruster_Power_Configuration;

   function iGet_Number_Of_Thrusters (this : in CThrusterConfigurator) return integer is
   begin
      return this.pxThrusterList.iGet_Count;
   end iGet_Number_Of_Thrusters;

   function tfGet_Thruster_Effects_Matrix (this : in CThrusterConfigurator) return Navigation.Thrusters.TThrusterEffectsMatrix is
   begin
      return this.pxThrusterList.txGet_Thruster_Effects_Matrix;
   end tfGet_Thruster_Effects_Matrix;




end Navigation.Thruster_Configurator;
