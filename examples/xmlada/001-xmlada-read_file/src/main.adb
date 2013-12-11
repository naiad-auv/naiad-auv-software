with Input_Sources.File;
use Input_Sources.File;
with Sax.Readers;
use Sax.Readers;
with DOM.Readers;
use DOM.Readers;
with DOM.Core;
use DOM.Core;
with Ada.Command_line;
use Ada.Command_Line;
-- with Ada.Strings.Unbounded.Text_IO;
-- use Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;
-- use Ada.Text_IO;
with Ada.Strings.Bounded;
-- use Ada.Strings.Bounded;

procedure main is

    package Strings_Bounded is new Ada.Strings.Bounded.Generic_Bounded_Length(
                                        Max => 100);
    use Strings_Bounded;

    Input   : File_Input;
    Reader  : Tree_Reader;
    Doc     : Document;
    Current_Argument : Strings_Bounded.Bounded_String;
    File_Name : Strings_Bounded.Bounded_String;
begin
    File_Name := Strings_Bounded.To_Bounded_String(Argument(1));
    Put(File_Name);
    Ada.Text_IO.New_Line;

--    Set_Public_Id (Input, "Preferences file");
--    Open ("xml/pref.xml", Input);
--
--    Set_Feature (Reader, Validation_Feature, False);
--    Set_Feature (Reader, Namespace_Feature, False);
--
--    Parse (Reader, Input);
--    Close (Input);
--
--    Doc := Get_Tree (Reader);
--
--    Free (Reader);
end main;
