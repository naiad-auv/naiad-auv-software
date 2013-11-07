with Math.Vectors;
with System; use System;
with Simulator;
with ada.Unchecked_Deallocation;

package Simulator.Motor_Info is
   type CMotorInfo is tagged private;
   type pCMotorInfo is access CMotorInfo;

   procedure Free(pxMotorInfoToDealocate : in out pCMotorInfo);

   function pxCreate(xPositionVector : Math.Vectors.CVector ; xForceVector : Math.Vectors.CVector)return pCMotorInfo;
   function xGet_Force_Vector(this : in CMotorInfo)return Math.Vectors.CVector;
   function xGet_Position_Vector(this : in CMotorInfo)return Math.Vectors.CVector;
   function xGet_Torque_Vector(this : in CMotorInfo)return Math.Vectors.CVector;
   function pxGet_Copy(this : in CMotorInfo) return pCMotorInfo;
   function "=" (xLeftOperandVector : in CMotorInfo; xRightOperandVector : in CMotorinfo) return boolean;

private
   type CMotorInfo is tagged
      record
         pxForceVector : Math.Vectors.pCVector;
         pxPositionVector: Math.Vectors.pCVector;
         pxTorqueVector: Math.Vectors.pCVector;
      end record;

end Simulator.Motor_Info;
