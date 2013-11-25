with Ada.Unchecked_Deallocation;
with Navigation.Dispatcher;
with Navigation.Motion_Component;with Ada.Numerics;
with Ada.Text_IO;
with Ada.Exceptions;
with Simulator.Pid_Errors;
package body Simulator.ViewModel_Representation is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Representation is
      pxNewViewModel : pCViewModel_Representation;

   begin
      pxNewViewModel := new CViewModel_Representation;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;
   end pxCreate;

   ----------
   -- Free --
   ----------

   procedure Free (pxViewModel_Representation : in out pCViewModel_Representation) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel_Representation, pCViewModel_Representation);
   begin
      Dealloc(pxViewModel_Representation);
   end Free;

   -------------------------------------
   -- xGet_Submarine_Current_Position --
   -------------------------------------

   function xGet_Submarine_Current_Position (this : in CViewModel_Representation) return math.Vectors.CVector is
      xPositionVector : math.Vectors.CVector;
   begin
      xPositionVector := this.pxModel.xGet_Current_Submarine_Positional_Vector;
      return xPositionVector;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return xPositionVector;
   end xGet_Submarine_Current_Position;

   ------------------------------------
   -- xGet_Submarine_Wanted_Position --
   ------------------------------------

   function xGet_Submarine_Wanted_Position
     (this : in CViewModel_Representation)
      return math.Vectors.CVector
   is
      xWantedPositionVector : math.Vectors.CVector;
   begin
      xWantedPositionVector := this.pxModel.xGet_Wanted_Submarine_Positional_Vector;
      return xWantedPositionVector;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return xWantedPositionVector;
   end xGet_Submarine_Wanted_Position;

   ----------------------------------------
   -- xGet_Submarine_Current_Orientation --
   ----------------------------------------

   function xGet_Submarine_Current_Orientation (this : in CViewModel_Representation) return math.Matrices.CMatrix is
      xCurrentOrientationMatrix : math.Matrices.CMatrix;
   begin
      xCurrentOrientationMatrix := this.pxModel.xGet_Current_Submarine_Orientation_Matrix;
      return xCurrentOrientationMatrix;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return xCurrentOrientationMatrix;
   end xGet_Submarine_Current_Orientation;

   ---------------------------------------
   -- xGet_Submarine_Wanted_Orientation --
   ---------------------------------------

   function xGet_Submarine_Wanted_Orientation
     (this : in CViewModel_Representation)
      return math.Matrices.CMatrix
   is
      xCurrentWantedMatrix : math.Matrices.CMatrix;
   begin
      xCurrentWantedMatrix := this.pxModel.xGet_Wanted_Submarine_Orientation_Matrix;
      return xCurrentWantedMatrix;
         exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return xCurrentWantedMatrix;
   end xGet_Submarine_Wanted_Orientation;

   -------------
   -- Restart --
   -------------

   procedure Restart (this : in CViewModel_Representation) is
   begin
      this.pxModel.Restart;
   end Restart;


   ------------
   -- Update --
   ------------

   procedure Update(this : in CViewModel_Representation; fDeltaTime : in float) is
   begin
      this.pxModel.Update_Model(fDeltaTime => fDeltaTime);
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
   end Update;

   function fGet_Pid_Errors (this : in CViewModel_Representation ; eErrorComponent : in Simulator.Model.EMotionComponent) return float is
      use Simulator.Model;

   begin
      return simulator.Pid_Errors.fCalculate_Error_Component(eErrorComponent             => simulator.Pid_Errors.EMotionComponent(eErrorComponent),
                                                             xCurrentAbsolutePosition    => this.pxModel.xGet_Current_Submarine_Positional_Vector,
                                                             xWantedAbsolutePosition     => this.xGet_Submarine_Wanted_Position,
                                                             xCurrentAbsoluteOrientation => this.xGet_Submarine_Current_Orientation,
                                                             xWantedAbsoluteOrientation  => this.xGet_Submarine_Wanted_Orientation);
   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Message(E));
         Exception_Handling.Unhandled_Exception(E);
         return 0.0;
   end fGet_Pid_Errors;

end Simulator.ViewModel_Representation;
