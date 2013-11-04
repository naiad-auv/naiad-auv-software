with Simulator.Motion_Control_Wrapper;
with Simulator.submarine;
with Math.Vectors;
with math.Matrices;
with math.Planes;

package Simulator.Model is

   type pTProcedure is access procedure;

   type CModel is tagged private;
   type pCModel is access CModel;


   function pxCreate(pOwnerUpdateProcedure : pTProcedure) return pcModel;

   procedure Update_Model(this : in out CModel);

   function xGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector;
   function xGet_Current_Submarine_Orientation_Matrix(this : in CModel) return math.Matrices.CMatrix;
   function xGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector;
   function xGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.CMatrix;
   function xGet_Current_Submarine_Velocity_Vector(this : in CModel) return Math.Vectors.CVector;

private
   --procedure On_Update;
   type CModel is tagged
      record
         pOwnerUpdateProcedure : pTProcedure;
         pxSubmarine : Simulator.submarine.pCSubmarine;
         pxMotionControlWrapper : Simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      end record;
end Simulator.Model;
