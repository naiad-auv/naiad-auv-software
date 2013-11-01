with Simulator;
with Simulator.Model;
with Math.Matrices;
with Math.Vectors;
with Math.Planes;
with Math.Quaternions;
with Math.Angles;
with Navigation.Thrusters;

package Simulator.ViewModel is

   type CViewModel is tagged private;
   type pCViewModel is access CViewModel;

   type TVectorComponents is new Navigation.Thrusters.EThrusterEffectsComponents range Navigation.Thrusters.XRotation .. Navigation.Thrusters.ZRotation;

   function pxCreate return pCViewModel;
   function pxCreate (pxModel : Simulator.Model.pCModel) return pcViewModel;

   function fGet_Submarine_Current_X_Position(this : in CViewModel) return float;
   function fGet_Submarine_Current_Y_Position(this : in CViewModel) return float;
   function fGet_Submarine_Current_Z_Position(this : in CViewModel) return float;

   function fGet_Submarine_Wanted_X_Position(this : in CViewModel) return float;
   function fGet_Submarine_Wanted_Y_Position(this : in CViewModel) return float;
   function fGet_Submarine_Wanted_Z_Position(this : in CViewModel) return float;

   function fGet_Submarine_Current_X_Orientation(this : in CViewModel) return float;
   function fGet_Submarine_Current_Y_Orientation(this : in CViewModel) return float;
   function fGet_Submarine_Current_Z_Orientation(this : in CViewModel) return float;

   function fGet_Submarine_Wanted_X_Orientation(this : in CViewModel) return float;
   function fGet_Submarine_Wanted_Y_Orientation(this : in CViewModel) return float;
   function fGet_Submarine_Wanted_Z_Orientation(this : in CViewModel) return float;

private
   type CViewModel is tagged
      record

         pxModel : Simulator.Model.pCModel;

      end record;

end Simulator.ViewModel;
