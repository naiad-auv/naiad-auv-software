with Simulator.Motion_Control_Wrapper;
with Simulator.submarine;
with Math.Vectors;
with math.Matrices;
with math.Planes;

package Simulator.Model is

   type CModel is tagged private;
   type pCModel is access CModel;


   function pxCreate return pcModel;

   procedure UpdateModel(this : in out CModel);

   function pxGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.pCVector;
   function pxGet_Current_Submarine_Orientation_Vector(this : in CModel) return math.Matrices.pCMatrix;
   function pxGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.pCVector;
   function pxGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.pCMatrix;

private
   type CModel is tagged
      record
         pxSubmarine : Simulator.submarine.pCSubmarine;
         pxMotionControlWrapper : Simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      end record;
end Simulator.Model;
