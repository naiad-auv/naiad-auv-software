package body Navigation.Thruster_Configurator is

   function pxCreate return pCThruster_Configurator is
   begin
      return null;
   end pxCreate;



   procedure Configure_Thruster_Effects(this : in out CThruster_Configurator; xThrusterToConfigure : TiThrusterIndex; xThrusterConfiguration : TThrusterConfiguration) is
   begin
      null;
   end Configure_Thruster_Effects;


   function xGet_Final_Thruster_Power_Configuration(this : in CThruster_Configurator) return float is
   begin
      return 0.0;
   end xGet_Final_Thruster_Power_Configuration;


end Navigation.Thruster_Configurator;
