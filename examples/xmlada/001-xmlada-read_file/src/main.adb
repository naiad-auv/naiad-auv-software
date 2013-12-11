with Input_Sources.File;
use Input_Sources.File;
with Sax.Readers;
use Sax.Readers;
with DOM.Readers;
use DOM.Readers;
with DOM.Core;
use DOM.Core;
with Ada.Command_line;
-- with Ada.Strings.Unbounded.Text_IO;
-- use Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
-- with Ada.Strings.Bounded;
-- use Ada.Strings.Bounded;

procedure main is
    Input   : File_Input;
    Reader  : Tree_Reader;
    Doc     : Document;
    File_Name : String := Ada.Command_Line.Argument(1);
begin
    Set_Public_Id (Input, "Preferences file");
    Open (File_Name, Input);

    Set_Feature (Reader, Validation_Feature, False);
    Set_Feature (Reader, Namespace_Feature, False);

    Parse (Reader, Input);
    Close (Input);

    Doc := Get_Tree (Reader);

    Free (Reader);
end main;
