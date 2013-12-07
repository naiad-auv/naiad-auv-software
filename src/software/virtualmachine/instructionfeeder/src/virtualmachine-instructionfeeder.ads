with Math.Vectors;
with Math.Matrices;

with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Ada.Streams.Stream_IO;

package VirtualMachine.InstructionFeeder is

   type EInstruction is
     (
      INSTR_NULL,
      INSTR_MAIN,

      -- Activation record
      INSTR_LINK,
      INSTR_UNLINK,

      -- Jumps
      INSTR_BRF,	-- int
      INSTR_BRA,	-- int

      -- Subroutines
      INSTR_BSR,
      INSTR_RTS,

      -- Memory allocation
      INSTR_DECLINT,
      INSTR_DECLBOOL,
      INSTR_DECLFLOAT,
      INSTR_DECLMAT,
      INSTR_DECLVEC,

      -- Memory deallocation
      INSTR_POPINT,
      INSTR_POPBOOL,
      INSTR_POPFLOAT,
      INSTR_POPMAT,
      INSTR_POPVEC,

      -- Constants
      INSTR_PUSHFP,
      INSTR_PUSHINT,		-- PUSHINT 3
      INSTR_PUSHBOOL,		-- PUSHBOOL TRUE
      INSTR_PUSHFLOAT,		-- PUSHFLOAT 8.34
      INSTR_PUSHMAT,		-- PUSHMATRIX [[11.0,12.0,13.0],[21.0,22.0,23.0],[31.0,32.0,33.0]]
      INSTR_PUSHVEC,		-- PUSHVECTOR [1.0,2.0,3.0]

      -- Right value (variable values)
      INSTR_RVALINT,
      INSTR_RVALBOOL,
      INSTR_RVALFLOAT,
      INSTR_RVALMAT,
      INSTR_RVALVEC,

      -- Left value (variable addresses)
      INSTR_LVAL,		-- int

      -- Assignments
      INSTR_ASSINT,
      INSTR_ASSBOOL,
      INSTR_ASSFLOAT,
      INSTR_ASSMAT,
      INSTR_ASSVEC,

      -- Timer
      INSTR_TIMERST,
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
      INSTR_EQMAT,

      -- Conditions for matrices
      INSTR_EQVEC,

      -- Arithmetics for integers
      INSTR_NEGINT,
      INSTR_ADDINT,
      INSTR_DIVINT,
      INSTR_MULINT,

      -- Arithmetics for floats
      INSTR_NEGFLOAT,
      INSTR_ADDFLOAT,
      INSTR_DIVFLOAT,
      INSTR_MULFLOAT,

      -- Arithmetics for vectors
      INSTR_NEGVEC,
      INSTR_ADDVEC,
      INSTR_MULVEC,
      INSTR_SCALEVEC,

      -- Getters for vectors
      INSTR_VECCOMP,		-- int

      -- Arithmetics for matrices
      INSTR_MULMAT,
      INSTR_MULMATVEC,

      -- Trigonometry
      INSTR_SIN,
      INSTR_COS,
      INSTR_ARCSIN,
      INSTR_ARCCOS,

      INSTR_ITOF,
      INSTR_FTOI,

      INSTR_PRINTINT,
      INSTR_PRINTBOOL,
      INSTR_PRINTFLOAT,
      INSTR_PRINTVEC,
      INSTR_PRINTMAT,

      INSTR_EOF

     );


   type CInstructionFeeder is new Ada.Finalization.Controlled with private;
   type pCInstructionFeeder is access CInstructionFeeder;


   procedure Free(pxInstructionFeederToDeallocate : in out pCInstructionFeeder);

   procedure Set_Program_Counter(this : in out CInstructionFeeder; iNewProgramCounterValue : in integer);
   procedure Get_Program_Counter(this: in CInstructionFeeder; iCurrentProgramCounterValue : out integer);

   function Feed_Instruction(this : in CInstructionFeeder) return VirtualMachine.InstructionFeeder.EInstruction;

   function Feed_Boolean_Argument(this : in CInstructionFeeder) return boolean;
   function Feed_Integer_Argument(this : in CInstructionFeeder) return integer;
   function Feed_Float_Argument(this : in CInstructionFeeder) return float;
   function Feed_Vector_Argument(this : in CInstructionFeeder) return Math.Vectors.CVector;
   function Feed_Matrix_Argument(this : in CInstructionFeeder) return Math.Matrices.CMatrix;

   procedure Read_Next_Instruction(this : in out CInstructionFeeder; xFileStream : in Ada.Streams.Stream_IO.Stream_Access);
   procedure Go_To_Entry_Point(this : in out CInstructionFeeder; iInstructionAddress : out integer);

private

   type CInstruction is tagged
      record
         iLineNumber : integer;
         eInstr : EInstruction;
      end record;
   type pCInstruction is access CInstruction'Class;
   type CInstructionBooleanArgument is new CInstruction with
      record
         bArgument : boolean;
      end record;
   type CInstructionIntegerArgument is new CInstruction with
      record
         iArgument : integer;
      end record;
   type CInstructionFloatArgument is new CInstruction with
      record
         fArgument : float;
      end record;
   type CInstructionVectorArgument is new CInstruction with
      record
         xArgument : Math.Vectors.CVector;
      end record;
   type CInstructionMatrixArgument is new CInstruction with
      record
         xArgument : Math.Matrices.CMatrix;
      end record;


   type CInstructionItem is tagged;
   type pCInstructionItem is access CInstructionItem;
   type CInstructionItem is tagged
      record
         pxInstruction : pCInstruction;
         pxNextInstruction : pCInstructionItem;
         pxPreviousInstruction : pCInstructionItem;
      end record;

   procedure Free(pxInstructionItemToDeallocate : in out pCInstructionItem);
   procedure Destroy_Element(this : in out CInstructionItem; iStopAt : in integer);
   procedure Destroy(this : in out CInstructionItem);
   function Find_Instruction(this : in CInstructionItem; iLineNumberToFind : in integer) return pCInstructionItem;
   procedure Insert_Instruction(this : in out CInstructionItem; pxNewInstructionItem : in out pCInstructionItem);


   type CInstructionFeeder is new Ada.Finalization.Controlled with
      record
         iProgramCounter : integer;
         pxInstructionList : pCInstructionItem;
      end record;

   procedure Add_Instruction(this : in out CInstructionFeeder; pxNewInstruction : in pCInstruction);
   procedure Finalize(this : in out CInstructionFeeder);
   procedure Initialize(this : in out CInstructionFeeder);

end VirtualMachine.InstructionFeeder;
