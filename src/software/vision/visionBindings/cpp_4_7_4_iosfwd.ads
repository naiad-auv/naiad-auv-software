pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_basic_ios_h;
with cpp_4_7_4_streambuf;
with cpp_4_7_4_istream;
with cpp_4_7_4_ostream;
with cpp_4_7_4_sstream;

package cpp_4_7_4_iosfwd is

   subtype ios is cpp_4_7_4_bits_basic_ios_h.Class_basic_ios.basic_ios;

   subtype streambuf is cpp_4_7_4_streambuf.Class_basic_streambuf.basic_streambuf;

   subtype istream is cpp_4_7_4_istream.Class_basic_istream.basic_istream;

   subtype ostream is cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;

   subtype iostream is cpp_4_7_4_istream.Class_basic_iostream.basic_iostream;

   subtype stringbuf is cpp_4_7_4_sstream.Class_basic_stringbuf.basic_stringbuf;

   subtype istringstream is cpp_4_7_4_sstream.Class_basic_istringstream.basic_istringstream;

   subtype ostringstream is cpp_4_7_4_sstream.Class_basic_ostringstream.basic_ostringstream;

   subtype stringstream is cpp_4_7_4_sstream.Class_basic_stringstream.basic_stringstream;

   --  skipped empty struct filebuf

   --  skipped empty struct ifstream

   --  skipped empty struct ofstream

   --  skipped empty struct fstream

   subtype wios is cpp_4_7_4_bits_basic_ios_h.Class_basic_ios.basic_ios;

   subtype wstreambuf is cpp_4_7_4_streambuf.Class_basic_streambuf.basic_streambuf;

   subtype wistream is cpp_4_7_4_istream.Class_basic_istream.basic_istream;

   subtype wostream is cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;

   subtype wiostream is cpp_4_7_4_istream.Class_basic_iostream.basic_iostream;

   subtype wstringbuf is cpp_4_7_4_sstream.Class_basic_stringbuf.basic_stringbuf;

   subtype wistringstream is cpp_4_7_4_sstream.Class_basic_istringstream.basic_istringstream;

   subtype wostringstream is cpp_4_7_4_sstream.Class_basic_ostringstream.basic_ostringstream;

   subtype wstringstream is cpp_4_7_4_sstream.Class_basic_stringstream.basic_stringstream;

   --  skipped empty struct wfilebuf

   --  skipped empty struct wifstream

   --  skipped empty struct wofstream

   --  skipped empty struct wfstream

end cpp_4_7_4_iosfwd;
