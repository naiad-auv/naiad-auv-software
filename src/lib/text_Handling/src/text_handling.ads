

package Text_Handling is

   function sGet_Formatted_Float_String(fValue : in float) return string;

   function sGet_Upper_Case(sText : in string) return string;
   function sGet_Lower_Case(sText : in string) return string;

   function iFind_Next (sText : in string; cCharacterToFind : in character; iStartFromIndex : in integer) return integer;
   function sRemove_White_Spaces(sText : in string) return string;

private
   function iCount_White_Spaces(sText : in string) return integer;
   function bIs_White_Space(cCharacter : in character) return boolean;
end Text_Handling;
