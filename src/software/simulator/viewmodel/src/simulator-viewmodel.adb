with Ada.Text_IO;

package body Simulator.ViewModel is

   function pxGet_Local_Axis_Vector(eRotationalComponent : simulator.ViewModel.TVectorComponents) return Math.Vectors.pCVector is

   begin

      case eRotationalComponent is
      when simulator.ViewModel.XRotation =>
           return Math.Vectors.pxCreate(fX => 1.0,
                                       fY => 0.0,
                                       fZ => 0.0);
      when simulator.ViewModel.YRotation =>
         return math.Vectors.pxCreate(fX => 0.0,
                                      fY => 1.0,
                                      fZ => 0.0);
      when simulator.ViewModel.ZRotation =>
         return math.Vectors.pxCreate(fX => 0.0,
                                      fY => 0.0,
                                      fZ => 1.0);

      end case;

   end pxGet_Local_Axis_Vector;


   function fGet_Rotation_In_Degrees_Around_An_Axis(pxRotationalAxis : math.Vectors.pCVector;
                                                    eRotationalComponent : simulator.ViewModel.TVectorComponents;
                                                    pxVectorPerpendicularToAxis : math.Vectors.pCVector;
                                                    eVectorPerpendicularLocalComponent : simulator.ViewModel.TVectorComponents) return float is
      use Math.Matrices;

      pxPlaneWithNormalParallelToInAxis : math.Planes.pCPlane;
      pxPlaneWithNormalParallelToReferenceAxis : math.Planes.pCPlane;
      pxPlanarRotationVector : math.Vectors.pCVector;
      fAngleInDegreesBetweenPlanes : float;
      pxPlanalRotationQuaternion : math.Quaternions.pCQuaternion;
      pxPlanalRotationMatrix : math.Matrices.pCMatrix;
      pxVectorPerpendicularToRefernceAxisRotatedWithPlane : math.Vectors.pCVector;
      fAnglesRotatedAroundAxis : float;

      pxLocalRotationalAxis : Math.Vectors.pCVector := pxGet_Local_Axis_Vector(eRotationalComponent);
      pxLocalVectorPerpendicularToAxis : math.Vectors.pCVector := pxGet_Local_Axis_Vector(eVectorPerpendicularLocalComponent);

   begin
      pxPlaneWithNormalParallelToInAxis := math.Planes.pxCreate(pxNormalVector      => pxRotationalAxis,
                                                                fDistanceFromOrigin => 0.0);
      pxPlaneWithNormalParallelToReferenceAxis := math.Planes.pxCreate(pxNormalVector      => pxLocalRotationalAxis,
                                                                       fDistanceFromOrigin => 0.0);
      pxPlanarRotationVector := math.vectors.pxGet_Copy(math.Planes.xGet_Intersection_Vector_Between(pxLeftOperandPlane  => pxPlaneWithNormalParallelToReferenceAxis,
                                                                                                     pxRightOperandPlane => pxPlaneWithNormalParallelToInAxis));
      fAngleInDegreesBetweenPlanes:= math.Planes.fAngle_Between_In_Degrees(pxLeftOperandPlane => pxPlaneWithNormalParallelToReferenceAxis,pxRightOperandPlane => pxPlaneWithNormalParallelToInAxis);
      pxPlanalRotationQuaternion := math.Quaternions.pxCreate(pxAxisVector     => pxPlanarRotationVector,
                                                             fAngleInDegrees => fAngleInDegreesBetweenPlanes);
      pxPlanalRotationMatrix := math.Matrices.pxGet_Copy(math.Matrices.xCreate_From_Quaternion(pxPlanalRotationQuaternion));
      pxVectorPerpendicularToRefernceAxisRotatedWithPlane := math.Vectors.pxGet_Copy(pxPlanalRotationMatrix*pxLocalVectorPerpendicularToAxis);
      fAnglesRotatedAroundAxis := math.Angles.fRadians_To_Degrees(math.Vectors.fAngle_Between_In_Radians(pxLeftOperandVector  => pxVectorPerpendicularToRefernceAxisRotatedWithPlane,
                                                                                                         pxRightOperandVector => pxVectorPerpendicularToAxis));
      math.Vectors.Free(pxPlanarRotationVector);
      math.Vectors.Free(pxVectorPerpendicularToRefernceAxisRotatedWithPlane);
      math.Planes.Free(pxPlaneWithNormalParallelToReferenceAxis);
      math.Planes.Free(pxPlaneWithNormalParallelToInAxis);
      math.Matrices.Free(pxPlanalRotationMatrix);
      math.Quaternions.Free(pxPlanalRotationQuaternion);

      return fAnglesRotatedAroundAxis;

   end fGet_Rotation_In_Degrees_Around_An_Axis;





   --------------
   -- pxCreate --
   --------------

   function pxCreate return pCViewModel is
      pxNewViewModel : Simulator.ViewModel.pCViewModel;

   begin
      pxNewViewModel := new Simulator.ViewModel.CViewModel;

      pxNewViewModel.pxModel := Simulator.Model.pxCreate;

      return pxNewViewModel;
   end pxCreate;

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxModel : Simulator.Model.pCModel) return pcViewModel is
      pxNewViewModel : Simulator.ViewModel.pCViewModel;

   begin
      pxNewViewModel := new Simulator.ViewModel.CViewModel;

      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
   end pxCreate;

   -----------------------------------
   -- fGetSubmarineCurrentXPosition --
   -----------------------------------

   function fGet_Submarine_Current_X_Position
     (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Current_Submarine_Positional_Vector.fGet_X;
   end fGet_Submarine_Current_X_Position;

   -----------------------------------
   -- fGetSubmarineCurrentYPosition --
   -----------------------------------

   function fGet_Submarine_Current_Y_Position
     (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Current_Submarine_Positional_Vector.fGet_Y;
   end fGet_Submarine_Current_Y_Position;

   -----------------------------------
   -- fGetSubmarineCurrentZPosition --
   -----------------------------------

   function fGet_Submarine_Current_Z_Position
     (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Current_Submarine_Positional_Vector.fGet_Z;
   end fGet_Submarine_Current_Z_Position;

   ----------------------------------
   -- fGetSubmarineWantedXPosition --
   ----------------------------------

   function fGet_Submarine_Wanted_X_Position (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Wanted_Submarine_Positional_Vector.fGet_X;

   end fGet_Submarine_Wanted_X_Position;

   ----------------------------------
   -- fGetSubmarineWantedYPosition --
   ----------------------------------

   function fGet_Submarine_Wanted_Y_Position
     (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Wanted_Submarine_Positional_Vector.fGet_Y;
   end fGet_Submarine_Wanted_Y_Position;

   ----------------------------------
   -- fGetSubmarineWantedZPosition --
   ----------------------------------

   function fGet_Submarine_Wanted_Z_Position
     (this : in CViewModel) return float
   is
   begin
      return this.pxModel.pxGet_Wanted_Submarine_Positional_Vector.fGet_Z;
   end fGet_Submarine_Wanted_Z_Position;

   --------------------------------------
   -- fGetSubmarineCurrentXOrientation --
   --------------------------------------

   function fGet_Submarine_Current_X_Orientation (this : in CViewModel) return float is
      use math.Matrices;
      pxOrientationMatrix : math.Matrices.pCMatrix;
      pxOrientationXVector : math.Vectors.pCVector;
      pxOrientationYVector : math.Vectors.pCVector;
      pxOrientationZVector : math.Vectors.pCVector;
      fAngleInDegrees : float;
   begin
      pxOrientationMatrix := this.pxModel.pxGet_Current_Submarine_Orientation_Vector;
      pxOrientationMatrix := math.Matrices.pxGet_Copy(math.Matrices.xCreate_Rotation_Around_Y_Axis(50.0)*math.Matrices.xCreate_Rotation_Around_Z_Axis(10.0));
      pxOrientationXVector := math.Vectors.pxGet_Copy(pxOrientationMatrix.xGet_X_Vector);
      pxOrientationYVector := math.Vectors.pxGet_Copy(pxOrientationMatrix.xGet_Y_Vector);
      pxOrientationZVector := math.Vectors.pxGet_Copy(pxOrientationMatrix.xGet_Z_Vector);
      fAngleInDegrees :=  fGet_Rotation_In_Degrees_Around_An_Axis(pxRotationalAxis                   => pxOrientationXVector,
                                                                  eRotationalComponent               => simulator.ViewModel.XRotation,
                                                                  pxVectorPerpendicularToAxis        => pxOrientationYVector,
                                                                  eVectorPerpendicularLocalComponent => simulator.ViewModel.YRotation);

      ada.Text_IO.Put_Line("Rotation around X: " & fGet_Rotation_In_Degrees_Around_An_Axis(pxRotationalAxis                   => pxOrientationXVector,
                                                                                           eRotationalComponent               => simulator.ViewModel.XRotation,
                                                                                           pxVectorPerpendicularToAxis        => pxOrientationYVector,
                                                                                           eVectorPerpendicularLocalComponent => simulator.ViewModel.YRotation)
                           'img);
      ada.Text_IO.Put_Line("Rotation around Y: " & fGet_Rotation_In_Degrees_Around_An_Axis(pxRotationalAxis                   => pxOrientationYVector,
                                                                                           eRotationalComponent               => simulator.ViewModel.YRotation,
                                                                                           pxVectorPerpendicularToAxis        => pxOrientationZVector,
                                                                                           eVectorPerpendicularLocalComponent => simulator.ViewModel.ZRotation)
                           'img);
      ada.Text_IO.Put_Line("Rotation around Z: " & fGet_Rotation_In_Degrees_Around_An_Axis(pxRotationalAxis                   => pxOrientationZVector,
                                                                                           eRotationalComponent               => simulator.ViewModel.ZRotation,
                                                                                           pxVectorPerpendicularToAxis        => pxOrientationXVector,
                                                                                           eVectorPerpendicularLocalComponent => simulator.ViewModel.XRotation)
                           'img);

      math.Matrices.Free(pxOrientationMatrix);
      math.Vectors.Free(pxOrientationXVector);
      math.Vectors.Free(pxOrientationYVector);
      return fAngleInDegrees;
   end fGet_Submarine_Current_X_Orientation;

   --------------------------------------
   -- fGetSubmarineCurrentYOrientation --
   --------------------------------------

   function fGet_Submarine_Current_Y_Orientation
     (this : in CViewModel) return float
   is

   begin
      return 7.0;

   end fGet_Submarine_Current_Y_Orientation;

   --------------------------------------
   -- fGetSubmarineCurrentZOrientation --
   --------------------------------------

   function fGet_Submarine_Current_Z_Orientation (this : in CViewModel) return float is
      use Math.Matrices;

      pxOrientationMatrix : math.Matrices.pCMatrix;
      pxOrientationZVector : math.Vectors.pCVector;
      pxZVector : math.Vectors.pCVector := math.Vectors.pxCreate(0.0,0.0,1.0);
      pxPositionPlane : math.Planes.pCPlane;
      pxReferencePositionPlane : math.Planes.pCPlane;
      pxPlaneRotationQuaternion : math.Quaternions.pCQuaternion;
      pxPlaneRotationMatrix : math.Matrices.pCMatrix;
      pxRotationVector : math.Vectors.pCVector;
      pxXVectorRotatedToPlaneOfOrientationMatrix : math.Vectors.pCVector;
   begin
      pxOrientationMatrix := this.pxModel.pxGet_Current_Submarine_Orientation_Vector;
      pxOrientationZVector:= math.Vectors.pxGet_Copy(pxOrientationMatrix.xGet_Z_Vector);
      pxPositionPlane := math.Planes.pxCreate(pxNormalVector       => pxOrientationZVector,
                                              fDistanceFromOrigin => 0.0);
      pxReferencePositionPlane := math.Planes.pxCreate(pxNormalVector      => pxZVector,
                                                       fDistanceFromOrigin => 0.0);
        pxRotationVector := math.vectors.pxGet_Copy(math.Planes.xGet_Intersection_Vector_Between(pxLeftOperandPlane  => pxReferencePositionPlane,
                                                                                                 pxRightOperandPlane => pxPositionPlane));
        pxPlaneRotationQuaternion := math.Quaternions.pxCreate(pxAxisVector     => pxRotationVector,
                                                               fAngleInDegrees => math.Planes.fAngle_Between_In_Degrees(pxReferencePositionPlane,pxPositionPlane));
        pxPlaneRotationMatrix := math.Matrices.pxGet_Copy(math.Matrices.xCreate_From_Quaternion(pxPlaneRotationQuaternion));
        pxXVectorRotatedToPlaneOfOrientationMatrix := math.Vectors.pxGet_Copy(pxPlaneRotationMatrix*math.Vectors.pxCreate(1.0,0.0,0.0));
        return math.Angles.fRadians_To_Degrees(math.Vectors.fAngle_Between_In_Radians(pxLeftOperandVector  => pxXVectorRotatedToPlaneOfOrientationMatrix,
                                               pxRightOperandVector => math.Vectors.pxGet_Copy(pxOrientationMatrix.xGet_X_Vector)));


   end fGet_Submarine_Current_Z_Orientation;

   -------------------------------------
   -- fGetSubmarineWantedXOrientation --
   -------------------------------------

   function fGet_Submarine_Wanted_X_Orientation
     (this : in CViewModel) return float
   is
   begin
       return 7.0;
   end fGet_Submarine_Wanted_X_Orientation;

   -------------------------------------
   -- fGetSubmarineWantedYOrientation --
   -------------------------------------

   function fGet_Submarine_Wanted_Y_Orientation
     (this : in CViewModel) return float
   is
   begin
return 7.0;
   end fGet_Submarine_Wanted_Y_Orientation;

   -------------------------------------
   -- fGetSubmarineWantedZOrientation --
   -------------------------------------


   function fGet_Submarine_Wanted_Z_Orientation
     (this : in CViewModel) return float
   is
   begin
         return 7.0;
   end fGet_Submarine_Wanted_Z_Orientation;

end Simulator.ViewModel;
