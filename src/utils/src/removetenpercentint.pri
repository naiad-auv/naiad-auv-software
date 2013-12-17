primitive RemoveTenPercentInt is

	iOperand : in integer;

	iResult : out integer;

	procedure main is
	begin
		iResult := iOperand - (iOperand / 10);
	end main;

end RemoveTenPercentInt;
