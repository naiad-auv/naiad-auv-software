with Ada.Finalization;

package VirtualMachine.InstructionFeeder is
   --pCInstructionFeeder
   type CInstructionFeeder is new Ada.Finalization.Controlled with private;
   type pCInstructionFeeder is access CInstructionFeeder;


private

   type CInstructionFeeder is new Ada.Finalization.Controlled with
      record
         iDummy : integer;
      end record;

   procedure Finalize(this : in out CInstructionFeeder);

end VirtualMachine.InstructionFeeder;
