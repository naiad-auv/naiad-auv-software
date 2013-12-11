with Input_Sources.File;
with Sax.Readers;
with DOM.Readers;
with DOM.Core;
with DOM.Core.Documents;
with DOM.Core.Nodes;
with DOM.Core.Attrs;
with Ada.Command_line;
with Ada.Text_IO;

procedure main is
    Input   : Input_Sources.File.File_Input;
    Reader  : DOM.Readers.Tree_Reader;
    Doc     : DOM.Core.Document;
    File_Name : String := Ada.Command_Line.Argument(1);
    List : DOM.Core.Node_List;
    N : DOM.Core.Node;
    A : DOM.Core.Attr;
begin
    Input_Sources.File.Set_Public_Id (Input, "Preferences file");
    Input_Sources.File.Open (File_Name, Input);

    DOM.Readers.Set_Feature (Reader, Sax.Readers.Validation_Feature, False);
    DOM.Readers.Set_Feature (Reader, Sax.Readers.Namespace_Feature, False);

    DOM.Readers.Parse (Reader, Input);
    Input_Sources.File.Close (Input);

    Doc := DOM.Readers.Get_Tree (Reader);

    List := DOM.Core.Documents.Get_Elements_By_Tag_Name (Doc, "pref");

    for Index in 1 .. DOM.Core.Nodes.Length (List) loop
        N := DOM.Core.Nodes.Item (List, Index - 1);
        A := DOM.Core.Nodes.Get_Named_Item (DOM.Core.Nodes.Attributes (N),
                                            "name");
        Ada.Text_IO.Put_Line ("Value of """ & DOM.Core.Attrs.Value (A) & """ is "
            & DOM.Core.Nodes.Node_Value (DOM.Core.Nodes.First_Child (N)));
    end loop;

    DOM.Core.Free (List);
    DOM.Readers.Free (Reader);

end main;
