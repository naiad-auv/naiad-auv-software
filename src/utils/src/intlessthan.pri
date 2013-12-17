primitive IntLessThan is

        iLeft : in integer;
        iRight : in integer;

        bResult : out boolean;

        procedure main is
        begin
                bResult := iLeft < iRight;
        end main;

end IntLessThan;
