with Navigation.Dispatcher;
with math.Vectors;
with Math.Matrices;
with Simulator.submarine;
with Navigation.Motion_Component;
with Navigation.Thrusters;
with Math.Angles;
with math.Vectors;

package simulator.Motion_Control_Wrapper is

   type CWrapDispatcher is tagged private;
   type pCWrapDispatcher is access CWrapDispatcher;

   function pxCreate_Wrap_Dispatcher return pCWrapDispatcher;

   procedure Update_Values(this : in out CWrapDispatcher;
                           pxNewCurrentAbsolutePosition : in math.Vectors.pCVector;
                           pxNewCurrentOrientation : in math.Matrices.pCMatrix ;
                           tfMotorValuesSubmarine : out simulator.submarine.TMotorForce ;
                           fDeltaTime : in float);

   procedure Update_Wanted_Position(this : in out CWrapDispatcher;
                                    pxWantedPosition : in math.Vectors.pCVector ;
                                    pxWantedOrientation : in math.Matrices.pCMatrix );
   function pxGet_Wanted_Position(this : in CWrapDispatcher) return math.Vectors.pCVector;
   function pxGet_Wanted_Orientation(this : in CWrapDispatcher) return math.Matrices.pCMatrix;


private

   type CWrapDispatcher is tagged
      record
         pxDispatcher : navigation.Dispatcher.pCDispatcher;
         pxWantedPositionVector : math.Vectors.pCVector;
         pxWantedOrientationMatrix : math.Matrices.pCMatrix;
      end record;


end simulator.Motion_Control_Wrapper;
