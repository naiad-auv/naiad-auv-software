package body Simulator.Model is

   --------------
   -- pxCreate --
   --------------

   function pxCreate return pcModel is
      pxModel : Simulator.Model.pCModel;

   begin
      pxModel := new Simulator.Model.CModel;

      pxModel.pxSubmarine := Simulator.submarine.pxCreate_Naiad;
      pxModel.pxMotionControlWrapper := Simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;

      return pxModel;
   end pxCreate;

   -----------------
   -- UpdateModel --
   -----------------

   procedure UpdateModel (this : in out CModel) is
   begin
      null;
   end UpdateModel;

   -------------------------------------------
   -- pxGetCurrentSubmarinePositionalVector --
   -------------------------------------------

   function pxGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.pCVector is
   begin
      return this.pxSubmarine.pxGet_Position_Vector;
   end pxGet_Current_Submarine_Positional_Vector;

   function pxGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.pCVector is

   begin
      return this.pxMotionControlWrapper.pxGet_Wanted_Position;
   end pxGet_Wanted_Submarine_Positional_Vector;

   function pxGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.pCMatrix is

   begin
      return this.pxMotionControlWrapper.pxGet_Wanted_Orientation;
   end pxGet_Wanted_Submarine_Orientation_Matrix;


   function pxGet_Current_Submarine_Orientation_Vector(this : in CModel) return math.Matrices.pCMatrix is

   begin
      return this.pxSubmarine.pxGet_Orientation_Matrix;

   end pxGet_Current_Submarine_Orientation_Vector;





end Simulator.Model;
