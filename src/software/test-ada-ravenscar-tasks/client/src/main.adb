pragma Profile(Ravenscar);

with Client;
use Client;

procedure Main is
    -- The following is not allowed due to No_Task_Hierarchy in Ravenscar
    -- profile. Just by using "With Client; use Client"; and then trying to
    -- create new "Agent" tasks is affected by the restriction mentioned above.
    --
    --  ExtraTaskOne : Agent;
    --  ExtraTaskTwo : Agent;
begin
    -- Insert code here.
    null;
end Main;
