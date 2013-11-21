with Text_Handling;
with Ada.Text_IO;
with Ada.Streams.Stream_IO;
with Math.Matrices;
with Math.Vectors;

package Parser is

   function sGet_Next_Word_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : string := "") return string;
   function sGet_Next_Character_From_File (xFile : in Ada.Text_IO.File_Type) return character;
   function sGet_Vector_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : in string := ""; iState : in integer := 0) return string;
   function sGet_Matrix_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : in string := ""; iState : in integer := 0) return string;
   function xGet_Matrix_From_String (sMatrix : in string) return Math.Matrices.CMatrix;
   function xGet_Vector_From_String (sVector : in string) return Math.Vectors.CVector;
   procedure Unexpected_EOF(xInFile : in out Ada.Text_IO.File_Type; xOutFile : in out Ada.Streams.Stream_IO.File_Type; iLineNumber : in integer);
end Parser;
