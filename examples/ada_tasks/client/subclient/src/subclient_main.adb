pragma Profile(Ravenscar);

with Client.Subclient;

procedure Subclient_Main is
    -- The following is not allowed due to No_Task_Hierarchy in Ravenscar
    -- profile.
    --
    --  ExtraTaskOne : Client.Agent;
    --  ExtraTaskTwo : Client.Agent;

begin
    -- Insert code here.
    null;
end Subclient_Main;
