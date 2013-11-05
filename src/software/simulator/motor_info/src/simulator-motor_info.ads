with Math.Vectors;
with System; use System;
with Simulator;
with ada.Unchecked_Deallocation;

package Simulator.Motor_Info is
   type CMotorInfo is tagged private;
   type pCMotorInfo is access CMotorInfo;

   procedure Free(pxMotorInfoToDealocate : in out pCMotorInfo);

   function pxCreate(pxPositionVector,pxForceVector:Math.Vectors.pCVector)return pCMotorInfo;
   function pxGet_Force_Vector(this : in CMotorInfo)return Math.Vectors.pCVector;
   function pxGet_Position_Vector(this : in CMotorInfo)return Math.Vectors.pCVector;
   function pxGet_Torque_Vector(this : in CMotorInfo)return Math.Vectors.pCVector;
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
