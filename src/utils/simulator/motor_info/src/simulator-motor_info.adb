package body Simulator.Motor_Info is


   procedure Free(pxMotorInfoToDealocate : in out pCMotorInfo) is

      procedure Dealloc is new Ada.Unchecked_Deallocation(CMotorInfo, pCMotorInfo);
   begin

      math.Vectors.Free(pxMotorInfoToDealocate.pxForceVector);
      math.Vectors.Free(pxMotorInfoToDealocate.pxPositionVector);
      math.Vectors.Free(pxMotorInfoToDealocate.pxTorqueVector);

      Dealloc(pxMotorInfoToDealocate);

   end;


   --------------
   -- pxCreate --
   --------------

   function pxCreate (xPositionVector:Math.Vectors.CVector;xForceVector:Math.Vectors.CVector) return pCMotorInfo is
      use math.Vectors;
      pxNewMotorInfo:pCMotorInfo;
   begin
      pxNewMotorInfo:=new CMotorInfo;
      pxNewMotorInfo.pxForceVector := xForceVector.pxGet_Allocated_Copy;
      pxNewMotorInfo.pxPositionVector := xPositionVector.pxGet_Allocated_Copy;
      pxNewMotorInfo.pxTorqueVector := math.Vectors.xCross_Product(xPositionVector, xForceVector).pxGet_Allocated_Copy;

      return pxNewMotorInfo;

   end pxCreate;

   -----------------
   -- pxGet_Force --
   -----------------

   function xGet_Force_Vector (this : in CMotorInfo) return Math.Vectors.CVector is
   begin
	return this.pxForceVector.all;
   end xGet_Force_Vector;

   --------------------
   -- pxGet_Position --
   --------------------

   function xGet_Position_Vector(this : in CMotorInfo) return Math.Vectors.CVector is
   begin
 	return this.pxPositionVector.all;
   end xGet_Position_Vector;

   ------------------
   -- pxGet_Torque --
   ------------------

   function xGet_Torque_Vector (this : in CMotorInfo) return Math.Vectors.CVector
   is
   begin
	return this.pxTorqueVector.all;
   end xGet_Torque_Vector;

   function pxGet_Copy(this : in CMotorInfo) return pCMotorInfo is
      pxCopiedMotorInfo : pCMotorInfo;
   begin
      pxCopiedMotorInfo := new CMotorInfo;
      pxCopiedMotorInfo.pxForceVector := this.pxForceVector.pxGet_Allocated_Copy;
      pxCopiedMotorInfo.pxPositionVector := this.pxPositionVector.pxGet_Allocated_Copy;
      pxCopiedMotorInfo.pxTorqueVector := this.pxTorqueVector.pxGet_Allocated_Copy;
      return pxCopiedMotorInfo;
   end pxGet_Copy;

   ---------
   -- "=" --
   ---------

   function "=" (xLeftOperandVector : in CMotorInfo; xRightOperandVector : in CMotorinfo) return boolean is

   begin

      if((math.Vectors."="(xLeftOperandVector.pxForceVector.all,xRightOperandVector.pxForceVector.all)) = false) then
         return false;
      end if;
      if((math.Vectors."="(xLeftOperandVector.pxPositionVector.all,xRightOperandVector.pxPositionVector.all)) = false) then
         return false;
      end if;
      if((math.Vectors."="(xLeftOperandVector.pxTorqueVector.all,xRightOperandVector.pxTorqueVector.all)) = false) then
         return false;
      end if;
      return True;

   exception
      when CONSTRAINT_ERROR =>
         return False;
   end "=";


end Simulator.Motor_Info;
