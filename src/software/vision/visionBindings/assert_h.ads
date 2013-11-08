pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package assert_h is

   --  arg-macro: function assert (expr)
   --    return (expr) ? __ASSERT_VOID_CAST (0) : __assert_fail (__STRING(expr), __FILE__, __LINE__, __ASSERT_FUNCTION);
   --  arg-macro: function assert_perror (errnum)
   --    return not(errnum) ? __ASSERT_VOID_CAST (0) : __assert_perror_fail ((errnum), __FILE__, __LINE__, __ASSERT_FUNCTION);
end assert_h;
