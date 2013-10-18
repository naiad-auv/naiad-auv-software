package body Simulator.Motor_Info is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxPositionVector,pxForceVector:Math.Vectors.pCVector) return pCMotorInfo is
      pxNewMotorInfo:pCMotorInfo;
   begin
      pxNewMotorInfo:=new CMotorInfo;
      pxNewMotorInfo.pxForceVector:=pxForceVector.pxGet_Copy;
      pxNewMotorInfo.pxPositionVector:=pxPositionVector.pxGet_Copy;
      pxNewMotorInfo.pxTorqueVector:=Math.Vectors.pxCross_Product(pxLeftOperandVector  => pxPositionVector,
                                                                  pxRightOperandVector => pxForceVector);

      return pxNewMotorInfo;

   end pxCreate;

   -----------------
   -- pxGet_Force --
   -----------------

   function pxGet_Force_Vector (this : in CMotorInfo) return Math.Vectors.pCVector is
   begin
	return this.pxForceVector.pxGet_Copy;
   end pxGet_Force_Vector;

   --------------------
   -- pxGet_Position --
   --------------------

   function pxGet_Position_Vector(this : in CMotorInfo) return Math.Vectors.pCVector is
   begin
 	return this.pxPositionVector.pxGet_Copy;
   end pxGet_Position_Vector;

   ------------------
   -- pxGet_Torque --
   ------------------

   function pxGet_Torque_Vector (this : in CMotorInfo) return Math.Vectors.pCVector
   is
   begin
	return this.pxTorqueVector.pxGet_Copy;
   end pxGet_Torque_Vector;

   function pxGet_Copy(this : in CMotorInfo) return pCMotorInfo is
      pxCopiedMotorInfo : pCMotorInfo;
   begin
      pxCopiedMotorInfo := new CMotorInfo;
      pxCopiedMotorInfo.pxForceVector := this.pxForceVector.pxGet_Copy;
      pxCopiedMotorInfo.pxPositionVector := this.pxPositionVector.pxGet_Copy;
      pxCopiedMotorInfo.pxTorqueVector := this.pxTorqueVector.pxGet_Copy;
      return pxCopiedMotorInfo;
   end pxGet_Copy;

   ---------
   -- "=" --
   ---------

   function "=" (pxLeftOperandVector : in pCMotorInfo; pxRightOperandVector : in pCMotorinfo) return boolean is

      function CheckIfBothNull(pxLeftOperandVector : in pCMotorInfo; pxRightOperandVector : in pCMotorInfo) return boolean is
         f : float;
      begin
         f := pxRightOperandVector.pxGet_Force_Vector.fGet_X;
         return false;
      exception
            when CONSTRAINT_ERROR =>
            begin
               f :=  pxLeftOperandVector.pxGet_Force_Vector.fGet_X;
               return false;
            exception
               when CONSTRAINT_ERROR =>
                  return true;
            end;
      end;

   begin

      if(CheckIfBothNull(pxLeftOperandVector,pxRightOperandVector)) then
         return true;
      end if;
      if((math.Vectors."="(pxLeftOperandVector.pxForceVector,pxRightOperandVector.pxForceVector)) = false) then
         return false;
      end if;
      if((math.Vectors."="(pxLeftOperandVector.pxPositionVector,pxRightOperandVector.pxPositionVector)) = false) then
         return false;
      end if;
      if((math.Vectors."="(pxLeftOperandVector.pxTorqueVector,pxRightOperandVector.pxTorqueVector)) = false) then
         return false;
      end if;
      return True;

   exception
      when CONSTRAINT_ERROR =>
         return False;
   end "=";


end Simulator.Motor_Info;
