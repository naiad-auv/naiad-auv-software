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

   function pxCreate (pxPositionVector,pxForceVector:Math.Vectors.pCVector) return pCMotorInfo is
      use math.Vectors;
      pxNewMotorInfo:pCMotorInfo;
   begin
      pxNewMotorInfo:=new CMotorInfo;
      pxNewMotorInfo.pxForceVector := pxForceVector.pxGet_Allocated_Copy;
      pxNewMotorInfo.pxPositionVector := pxPositionVector.pxGet_Allocated_Copy;
      pxNewMotorInfo.pxTorqueVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCross_Product(pxPositionVector, pxForceVector));

      return pxNewMotorInfo;

   end pxCreate;

   -----------------
   -- pxGet_Force --
   -----------------

   function pxGet_Force_Vector (this : in CMotorInfo) return Math.Vectors.pCVector is
   begin
	return this.pxForceVector.pxGet_Allocated_Copy;
   end pxGet_Force_Vector;

   --------------------
   -- pxGet_Position --
   --------------------

   function pxGet_Position_Vector(this : in CMotorInfo) return Math.Vectors.pCVector is
   begin
 	return this.pxPositionVector.pxGet_Allocated_Copy;
   end pxGet_Position_Vector;

   ------------------
   -- pxGet_Torque --
   ------------------

   function pxGet_Torque_Vector (this : in CMotorInfo) return Math.Vectors.pCVector
   is
   begin
	return this.pxTorqueVector.pxGet_Allocated_Copy;
   end pxGet_Torque_Vector;

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
