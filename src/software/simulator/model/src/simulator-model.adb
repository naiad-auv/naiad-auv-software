package body Simulator.Model is

   --------------
   -- pxCreate --
   --------------

   function pxCreate(pOwnerUpdateProcedure : pTProcedure) return pcModel is
      pxModel : Simulator.Model.pCModel;

   begin
      pxModel := new Simulator.Model.CModel;

      pxModel.pxSubmarine := Simulator.submarine.pxCreate_Naiad;
      pxModel.pxMotionControlWrapper := Simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      pxModel.pOwnerUpdateProcedure := pOwnerUpdateProcedure;

      return pxModel;
   end pxCreate;

   -----------------
   -- UpdateModel --
   -----------------

   procedure Update_Model (this : in out CModel) is
   begin
      null;
      --this.pOwnerUpdateProcedure;
   end Update_Model;

   -------------------------------------------
   -- pxGetCurrentSubmarinePositionalVector --
   -------------------------------------------

   function xGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector is
   begin
      return this.pxSubmarine.pxGet_Position_Vector.all;
   end xGet_Current_Submarine_Positional_Vector;

   function xGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector is

   begin
      return this.pxMotionControlWrapper.pxGet_Wanted_Position.all;
   end xGet_Wanted_Submarine_Positional_Vector;

   function xGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.CMatrix is

   begin
      return this.pxMotionControlWrapper.pxGet_Wanted_Orientation.all;
   end xGet_Wanted_Submarine_Orientation_Matrix;


   function xGet_Current_Submarine_Orientation_Matrix(this : in CModel) return math.Matrices.CMatrix is

   begin
      return this.pxSubmarine.pxGet_Orientation_Matrix.all;

   end xGet_Current_Submarine_Orientation_Matrix;

   function xGet_Current_Submarine_Velocity_Vector(this : in CModel) return Math.Vectors.CVector is
   begin
      return this.pxSubmarine.pxGet_Velocity_Vector.all;
   end xGet_Current_Submarine_Velocity_Vector;





end Simulator.Model;
