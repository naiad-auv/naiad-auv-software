with Simulator;

package Simulator.Update_Interface is
   type CWithUpdate is interface;

   procedure Update(this : in CWithUpdate) is abstract;

end Simulator.Update_Interface;
