primitive RemoveTenPercentInt is

	iOperand : in integer;

	iResult : out integer;

	procedure main is
	begin
		iResult := iResult - (iResult / 10);
	end main;

end RemoveTenPercentInt;
