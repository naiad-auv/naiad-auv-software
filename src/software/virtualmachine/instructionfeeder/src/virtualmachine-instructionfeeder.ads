with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package VirtualMachine.InstructionFeeder is

   type EInstruction is
     (
      -- Activation record
      INSTR_LINK,
      INSTR_UNLINK,

      -- Jumps
      INSTR_BRF,
      INSTR_BRA,

      -- Subroutines
      INSTR_BRS,
      INSTR_RTS,

      -- Memory allocation
      INSTR_DECLINT,
      INSTR_DECLBOOL,
      INSTR_DECLFLOAT,
      INSTR_DECLMATRIX,
      INSTR_DECLVECTOR,

      -- Memory deallocation
      INSTR_POP,

      -- Constants
      INSTR_PUSHINT,		-- PUSHINT 3
      INSTR_PUSHBOOL,		-- PUSHBOOL TRUE
      INSTR_PUSHFLOAT,		-- PUSHFLOAT 8.34
      INSTR_PUSHMATRIX,		-- PUSHMATRIX [[11.0,12.0,13.0],[21.0,22.0,23.0],[31.0,32.0,33.0]]
      INSTR_PUSHVECTOR,		-- PUSHVECTOR [1.0,2.0,3.0]

      -- Right value (variable values)
      INSTR_RVALINT,
      INSTR_RVALBOOL,
      INSTR_RVALFLOAT,
      INSTR_RVALMATRIX,
      INSTR_RVALVECTOR,

      -- Left value (variable addresses)
      INSTR_LVAL,

      -- Assignments
      INSTR_ASSINT,
      INSTR_ASSBOOL,
      INSTR_ASSFLOAT,
      INSTR_ASSMATRIX,
      INSTR_ASSVECTOR,

      -- Timer
      INSTR_TIMERESET,
      INSTR_TIME,

      -- Conditions for integers
      INSTR_EQINT,
      INSTR_LTINT,
      INSTR_LEINT,

      -- Conditions for floats
      INSTR_EQFLOAT,
      INSTR_LTFLOAT,
      INSTR_LEFLOAT,

      -- Conditions for booleans
      INSTR_NOT,
      INSTR_OR,
      INSTR_AND,
      INSTR_EQBOOL,

      -- Conditions for matrices
      INSTR_EQMATRIX,

      -- Conditions for matrices
      INSTR_EQVECTOR,

      -- Arithmetics for integers
      INSTR_NEGINT,
      INSTR_ADDINT,
      INSTR_SUBINT,
      INSTR_MULTINT,
      INSTR_DIVINT,

      -- Arithmetics for floats
      INSTR_NEGFLOAT,
      INSTR_ADDFLOAT,
      INSTR_SUBFLOAT,
      INSTR_MULTFLOAT,
      INSTR_DIVFLOAT,

      -- Arithmetics for vectors
      INSTR_NEGVECTOR,
      INSTR_ADDVECTOR,
      INSTR_SUBVECTOR,
      INSTR_SCALEVECTOR,
      INSTR_CROSSVECTOR,
      INSTR_DOTVECTOR,

      -- Arithmetics for matrices
      INSTR_MULTMATRIX,
      INSTR_INVERSEMATRIX,
      INSTR_DETERMINANTMATRIX

     );


   type CInstructionFeeder is new Ada.Finalization.Controlled with private;
   type pCInstructionFeeder is access CInstructionFeeder;


   procedure Free(pxInstructionFeederToDeallocate : in out pCInstructionFeeder);

   procedure Set_Program_Counter(this : in out CInstructionFeeder; iNewProgramCounterValue : in integer);
   procedure Feed_Instruction(this : in CInstructionFeeder; eInstr : out EInstruction; sArg : out string);


private

   type CInstructionItem is tagged;
   type pCInstructionItem is access CInstructionItem;
   type CInstructionItem is tagged
      record
         iLineNumber : integer;
         iInstruction : integer;
         sArgument : string (1 .. 100);
         iArgumentLength : integer;
         pxNextInstruction : pCInstructionItem;
         pxPreviousInstruction : pCInstructionItem;
      end record;


   procedure Free(pxInstructionItemToDeallocate : in out pCInstructionItem);
   procedure Destroy(this : in out CInstructionItem);
   function Find_Instruction(this : in CInstructionItem; iLineNumberToFind : in integer) return pCInstructionItem;


   type CInstructionFeeder is new Ada.Finalization.Controlled with
      record
         iProgramCounter : integer;
         pxInstructionList : pCInstructionItem;
      end record;

   procedure Finalize(this : in out CInstructionFeeder);

end VirtualMachine.InstructionFeeder;
