pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package bits_sched_h is


   SCHED_OTHER : constant := 0;  --  /usr/include/bits/sched.h:30
   SCHED_FIFO : constant := 1;  --  /usr/include/bits/sched.h:31
   SCHED_RR : constant := 2;  --  /usr/include/bits/sched.h:32

   SCHED_BATCH : constant := 3;  --  /usr/include/bits/sched.h:34
   SCHED_IDLE : constant := 5;  --  /usr/include/bits/sched.h:35

   SCHED_RESET_ON_FORK : constant := 16#40000000#;  --  /usr/include/bits/sched.h:37

   CSIGNAL : constant := 16#000000ff#;  --  /usr/include/bits/sched.h:42
   CLONE_VM : constant := 16#00000100#;  --  /usr/include/bits/sched.h:43
   CLONE_FS : constant := 16#00000200#;  --  /usr/include/bits/sched.h:44
   CLONE_FILES : constant := 16#00000400#;  --  /usr/include/bits/sched.h:45
   CLONE_SIGHAND : constant := 16#00000800#;  --  /usr/include/bits/sched.h:46
   CLONE_PTRACE : constant := 16#00002000#;  --  /usr/include/bits/sched.h:47
   CLONE_VFORK : constant := 16#00004000#;  --  /usr/include/bits/sched.h:48

   CLONE_PARENT : constant := 16#00008000#;  --  /usr/include/bits/sched.h:50

   CLONE_THREAD : constant := 16#00010000#;  --  /usr/include/bits/sched.h:52
   CLONE_NEWNS : constant := 16#00020000#;  --  /usr/include/bits/sched.h:53
   CLONE_SYSVSEM : constant := 16#00040000#;  --  /usr/include/bits/sched.h:54
   CLONE_SETTLS : constant := 16#00080000#;  --  /usr/include/bits/sched.h:55
   CLONE_PARENT_SETTID : constant := 16#00100000#;  --  /usr/include/bits/sched.h:56

   CLONE_CHILD_CLEARTID : constant := 16#00200000#;  --  /usr/include/bits/sched.h:58

   CLONE_DETACHED : constant := 16#00400000#;  --  /usr/include/bits/sched.h:60
   CLONE_UNTRACED : constant := 16#00800000#;  --  /usr/include/bits/sched.h:61

   CLONE_CHILD_SETTID : constant := 16#01000000#;  --  /usr/include/bits/sched.h:63

   CLONE_NEWUTS : constant := 16#04000000#;  --  /usr/include/bits/sched.h:65
   CLONE_NEWIPC : constant := 16#08000000#;  --  /usr/include/bits/sched.h:66
   CLONE_NEWUSER : constant := 16#10000000#;  --  /usr/include/bits/sched.h:67
   CLONE_NEWPID : constant := 16#20000000#;  --  /usr/include/bits/sched.h:68
   CLONE_NEWNET : constant := 16#40000000#;  --  /usr/include/bits/sched.h:69
   CLONE_IO : constant := 16#80000000#;  --  /usr/include/bits/sched.h:70

   type sched_param is record
      uu_sched_priority : aliased int;  -- /usr/include/bits/sched.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, sched_param);  -- /usr/include/bits/sched.h:74

   function clone
     (uu_fn : access function (arg1 : System.Address) return int;
      uu_child_stack : System.Address;
      uu_flags : int;
      uu_arg : System.Address  -- , ...
      ) return int;  -- /usr/include/bits/sched.h:83
   pragma Import (C, clone, "clone");

   function unshare (uu_flags : int) return int;  -- /usr/include/bits/sched.h:87
   pragma Import (C, unshare, "unshare");

   function sched_getcpu return int;  -- /usr/include/bits/sched.h:90
   pragma Import (C, sched_getcpu, "sched_getcpu");

   function setns (uu_fd : int; uu_nstype : int) return int;  -- /usr/include/bits/sched.h:93
   pragma Import (C, setns, "setns");

   type uu_sched_param is record
      uu_sched_priority : aliased int;  -- /usr/include/bits/sched.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, uu_sched_param);  -- /usr/include/bits/sched.h:105

   subtype uu_cpu_mask is unsigned_long;  -- /usr/include/bits/sched.h:120

   type cpu_set_t_uu_bits_array is array (0 .. 15) of aliased uu_cpu_mask;
   type cpu_set_t is record
      uu_bits : aliased cpu_set_t_uu_bits_array;  -- /usr/include/bits/sched.h:129
   end record;
   pragma Convention (C_Pass_By_Copy, cpu_set_t);  -- /usr/include/bits/sched.h:130

   --  skipped anonymous struct anon_61

end bits_sched_h;
