primitive IntLessThan is

	iLeftOperand : in integer;
	iRightOperand : in integer;

	bResult : out boolean;

	procedure main is
	begin
		bResult := iLeftOperand < iRightOperand;
	end main;

end IntLessThan;
