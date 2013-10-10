pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_sigset_h;
limited with bits_time_h;
limited with time_h;

package sys_select_h is

   --  unsupported macro: FD_SETSIZE __FD_SETSIZE
   --  unsupported macro: NFDBITS __NFDBITS
   --  arg-macro: procedure FD_SET (fd, fdsetp)
   --    __FD_SET (fd, fdsetp)
   --  arg-macro: procedure FD_CLR (fd, fdsetp)
   --    __FD_CLR (fd, fdsetp)
   --  arg-macro: procedure FD_ISSET (fd, fdsetp)
   --    __FD_ISSET (fd, fdsetp)
   --  arg-macro: procedure FD_ZERO (fdsetp)
   --    __FD_ZERO (fdsetp)
   subtype sigset_t is bits_sigset_h.uu_sigset_t;

   subtype uu_fd_mask is long;  -- /usr/include/sys/select.h:55

   type fd_set_fds_bits_array is array (0 .. 15) of aliased uu_fd_mask;
   type fd_set is record
      fds_bits : aliased fd_set_fds_bits_array;  -- /usr/include/sys/select.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, fd_set);  -- /usr/include/sys/select.h:76

   --  skipped anonymous struct anon_7

   subtype fd_mask is uu_fd_mask;  -- /usr/include/sys/select.h:83

   function c_select
     (uu_nfds : int;
      uu_readfds : access fd_set;
      uu_writefds : access fd_set;
      uu_exceptfds : access fd_set;
      uu_timeout : access bits_time_h.timeval) return int;  -- /usr/include/sys/select.h:107
   pragma Import (C, c_select, "select");

   function pselect
     (uu_nfds : int;
      uu_readfds : access fd_set;
      uu_writefds : access fd_set;
      uu_exceptfds : access fd_set;
      uu_timeout : access constant time_h.timespec;
      uu_sigmask : access constant bits_sigset_h.uu_sigset_t) return int;  -- /usr/include/sys/select.h:119
   pragma Import (C, pselect, "pselect");

end sys_select_h;
