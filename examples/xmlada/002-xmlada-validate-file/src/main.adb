with Input_Sources.File;
with Sax.Readers;
with DOM.Readers;
with DOM.Core;
with DOM.Core.Documents;
with DOM.Core.Nodes;
with DOM.Core.Attrs;
with Ada.Command_line;
with Ada.Text_IO;
with Schema.Schema_Readers;
with Schema.Validators;

procedure main is
    File_Input : Input_Sources.File.File_Input;
    Reader  : Schema.Schema_Readers.Schema_Reader;
    Doc     : DOM.Core.Document;
    File_Name : String := Ada.Command_Line.Argument(1);
    List : DOM.Core.Node_List;
    N : DOM.Core.Node;
    A : DOM.Core.Attr;

    -- Schema Validation Variables below
    Grammar             : Schema.Validators.XML_Grammar;
    Schema_File_Name    : String := Ada.Command_Line.Argument(2);
    Schema_Reader       : Schema.Schema_Readers.Schema_Reader;
    Input_Schema        : Input_Sources.File.File_Input;
begin
    -- Validation
    Input_Sources.File.Open (Schema_File_Name, Input_Schema);
    Schema.Schema_Readers.Parse (Schema_Reader, Input_Schema);
    Input_Sources.File.Close (Input_Schema);
    Grammar := Schema.Schema_Readers.Get_Grammar (Schema_Reader);

    -- Actual XML file
    Input_Sources.File.Set_Public_Id (File_Input, "test file");
    Input_Sources.File.Open (File_Name, File_Input);

    Schema.Schema_Readers.Set_Grammar (Reader, Grammar);
    -- Set_Feature (My_Reader, Schema_Validation_Feature, True);

    -- DOM.Readers.Set_Feature (Reader, Schema_Validation_Feature, True);
    Schema.Schema_Readers.Set_Feature (Reader, Sax.Readers.Validation_Feature, True);
    Schema.Schema_Readers.Set_Feature (Reader, Sax.Readers.Namespace_Feature, False);

    Schema.Schema_Readers.Parse (Reader, File_Input);
    Input_Sources.File.Close (File_Input);

--     Doc := Schema.Schema_Readers.Get_Tree (Reader);
-- 
--     List := DOM.Core.Documents.Get_Elements_By_Tag_Name (Doc, "test");
-- 
--     for Index in 1 .. DOM.Core.Nodes.Length (List) loop
--         N := DOM.Core.Nodes.Item (List, Index - 1);
--         A := DOM.Core.Nodes.Get_Named_Item (DOM.Core.Nodes.Attributes (N),
--                                             "name");
--         Ada.Text_IO.Put_Line ("Value of """ & DOM.Core.Attrs.Value (A) & """ is "
--             & DOM.Core.Nodes.Node_Value (DOM.Core.Nodes.First_Child (N)));
--     end loop;
-- 
--     DOM.Core.Free (List);
    Schema.Schema_Readers.Free (Reader);

end main;
