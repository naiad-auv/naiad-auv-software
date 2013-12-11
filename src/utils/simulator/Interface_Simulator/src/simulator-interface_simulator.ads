with simulator;
with math.vectors;
with math.matrices;
with simulator.Motor_Info;

package Simulator.Interface_Simulator is
   type tSimulatorInterface is interface;

   function xGet_Position_Vector(this : in tSimulatorInterface) return math.Vectors.CVector is abstract;
   function xGet_Velocity_Vector(this : in tSimulatorInterface) return math.Vectors.CVector is abstract;
   function xGet_Orientation_Matrix(this : in tSimulatorInterface) return math.Matrices.CMatrix is abstract;
   function xGet_Angular_Velocity_Vector(this : in tSimulatorInterface) return math.Vectors.CVector is abstract;
   function xGet_Motor_Values(this : in tSimulatorInterface) return TMotorForce is abstract;

   procedure Time_Step_Motor_Force_To_Integrate(this : in out tSimulatorInterface ; txMotorForce : in TmotorForce; fDeltaTime : in float) is abstract;


end Simulator.InterFace_Simulator;
