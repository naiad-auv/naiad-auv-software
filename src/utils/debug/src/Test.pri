procedure Print_Integer(x : integer) is
begin
	smc("PUSHINT 2");
	smc("PUSHFP");
	smc("ADDINT");
	smc("RVALINT");
	smc("PRINTINT");
	smc("POPINT");
end Print_Integer;

procedure Print_Float(x : float) is
begin
	smc("PUSHINT 2");
	smc("PUSHFP");
	smc("ADDINT");
	smc("RVALFLOAT");
	smc("PRINTFLOAT");
	smc("POPFLOAT");
end Print_Float;

procedure Print_Boolean(x : boolean) is
begin
	smc("PUSHINT 2");
	smc("PUSHFP");
	smc("ADDINT");
	smc("RVALBOOL");
	smc("PRINTBOOL");
	smc("POPBOOL");
end Print_Boolean;

procedure Print_Matrix(x : matrix) is
begin
	smc("PUSHINT 2");
	smc("PUSHFP");
	smc("ADDINT");
	smc("RVALMAT");
	smc("PRINTMAT");
	smc("POPMAT");
end Print_Matrix;

procedure Print_Vector(x : vector) is
begin
	smc("PUSHINT 2");
	smc("PUSHFP");
	smc("ADDINT");
	smc("RVALVEC");
	smc("PRINTVEC");
	smc("POPVEC");
end Print_Vector;



function Dot_Product(LeftOperand : vector; RightOperand : vector) return float is
begin
	return (LeftOperand.X * RightOperand.X) + (LeftOperand.Y * RightOperand.Y) + (LeftOperand.Z * RightOperand.Z);
end Dot_Product;

function Length_Squared(Operand : vector) return float is
begin
	return Dot_Product(Operand, Operand);
end Length_Squared;

function Length(Operand : vector) return float is
begin
	return sqrt(Length_Squared(Operand));
end Length;

function Cross_Product(LeftOperand : vector; RightOperand : vector) return vector is
begin
	return [(LeftOperand.Y * RightOperand.Z) - (LeftOperand.Z * RightOperand.Y),
		(LeftOperand.Z * RightOperand.X) - (LeftOperand.X * RightOperand.Z),
		(LeftOperand.X * RightOperand.Y) - (LeftOperand.Y * RightOperand.X)];
end Cross_Product;





procedure Reset_Time is
begin
	smc("TIMERST");
end Reset_Time;

function Get_Time return float is
	x : float;
begin
	smc("PUSHINT -1");
	smc("PUSHFP");
	smc("ADDINT");
	smc("TIME");
	smc("ASSFLOAT");
	return x;
end Get_Time;	


procedure Delay(fTimeInSeconds : float) is
begin
	Reset_Time();
	while fTimeInSeconds - Get_Time() > 0.0 loop
		null;
	end loop;
end Delay;


primitive IntLessThan is

        iLeft : in integer;
        iRight : in integer;

        bResult : out boolean;

        procedure main is
        begin
                bResult := iLeft < iRight;
        end main;

end IntLessThan;


primitive ZeroVector is

        vOutput : out vector;

        procedure main is
        begin
                vOutput := [0.0, 0.0, 0.0];
        end main;

end ZeroVector;


primitive IdentityMatrix is

        mOutput : out matrix;

        procedure main is
        begin
                mOutput := [        [1.0, 0.0, 0.0],
                                [0.0, 1.0, 0.0],
                                [0.0, 0.0, 1.0]                ];
        end main;
        
end IdentityMatrix;


procedure main is

   testVar : integer;
   testVar2 : integer;
   IntLessThan_1_iLeft : integer;
   IntLessThan_1_iRight : integer;
   IntLessThan_1_bResult : boolean;
   ZeroVector_1_vOutput : vector;
   IdentityMatrix_1_mOutput : matrix;
   ZeroVector_2_vOutput : vector;
   IdentityMatrix_2_mOutput : matrix;
   IdentityMatrix_3_mOutput : matrix;
   IdentityMatrix_4_mOutput : matrix;
begin
   IntLessThan_1_iLeft := 3;
   IntLessThan_1_iRight := 5;
   testVar := 6;
   testVar2 := 3;

   << Start >>
   IntLessThan( IntLessThan_1_iLeft, IntLessThan_1_iRight, access(IntLessThan_1_bResult));
   testVar := testVar2;

   << Branch1 >>
   if IntLessThan_1_bResult then

         << ZeroVector1 >>
         ZeroVector( access(ZeroVector_1_vOutput));

         << IdentityMatrix1 >>
         IdentityMatrix( access(IdentityMatrix_1_mOutput));

         << Branch2 >>
         if IntLessThan_1_bResult then

               << ZeroVector2 >>
               ZeroVector( access(ZeroVector_2_vOutput));

               << IdentityMatrix2 >>
               IdentityMatrix( access(IdentityMatrix_2_mOutput));
               goto Start;
         else

               << IdentityMatrix3 >>
               IdentityMatrix( access(IdentityMatrix_3_mOutput));
               goto Start;
         end if;
         goto Start;
   else

         << IdentityMatrix4 >>
         IdentityMatrix( access(IdentityMatrix_4_mOutput));
         goto Start;
   end if;

end main;