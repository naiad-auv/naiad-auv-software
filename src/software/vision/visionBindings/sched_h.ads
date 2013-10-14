pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
limited with bits_sched_h;
limited with time_h;
with stddef_h;

package sched_h is

   --  unsupported macro: sched_priority __sched_priority
   --  unsupported macro: CPU_SETSIZE __CPU_SETSIZE
   --  arg-macro: procedure CPU_SET (cpu, cpusetp)
   --    __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_CLR (cpu, cpusetp)
   --    __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_ISSET (cpu, cpusetp)
   --    __CPU_ISSET_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_ZERO (cpusetp)
   --    __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_COUNT (cpusetp)
   --    __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_SET_S (cpu, setsize, c__CPU_SET_S (cpu, setsize, cpusetp)
   --    __CPU_SET_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_CLR_S (cpu, setsize, c__CPU_CLR_S (cpu, setsize, cpusetp)
   --    __CPU_CLR_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_ISSET_S (cpu, setsize, c__CPU_ISSET_S (cpu, setsize, cpusetp)
   --    __CPU_ISSET_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_ZERO_S (setsize, cpuset__CPU_ZERO_S (setsize, cpusetp)
   --    __CPU_ZERO_S (setsize, cpusetp)
   --  arg-macro: procedure CPU_COUNT_S (setsize, cpuset__CPU_COUNT_S (setsize, cpusetp)
   --    __CPU_COUNT_S (setsize, cpusetp)
   --  arg-macro: procedure CPU_EQUAL (cpusetp1, cpuse__CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
   --    __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
   --  arg-macro: procedure CPU_EQUAL_S (setsize, cpuset__CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
   --    __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
   --  arg-macro: procedure CPU_AND (destset, srcset__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, and)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, and)
   --  arg-macro: procedure CPU_OR (destset, srcset__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, or)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, or)
   --  arg-macro: procedure CPU_XOR (destset, srcset__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, xor)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, xor)
   --  arg-macro: procedure CPU_AND_S (setsize, destse__CPU_OP_S (setsize, destset, srcset1, srcset2, and)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, and)
   --  arg-macro: procedure CPU_OR_S (setsize, destse__CPU_OP_S (setsize, destset, srcset1, srcset2, or)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, or)
   --  arg-macro: procedure CPU_XOR_S (setsize, destse__CPU_OP_S (setsize, destset, srcset1, srcset2, xor)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, xor)
   --  arg-macro: procedure CPU_ALLOC_SIZE (count)
   --    __CPU_ALLOC_SIZE (count)
   --  arg-macro: procedure CPU_ALLOC (count)
   --    __CPU_ALLOC (count)
   --  arg-macro: procedure CPU_FREE (cpuset)
   --    __CPU_FREE (cpuset)
   function sched_setparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access constant bits_sched_h.sched_param) return int;  -- /usr/include/sched.h:51
   pragma Import (C, sched_setparam, "sched_setparam");

   function sched_getparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access bits_sched_h.sched_param) return int;  -- /usr/include/sched.h:55
   pragma Import (C, sched_getparam, "sched_getparam");

   function sched_setscheduler
     (uu_pid : bits_types_h.uu_pid_t;
      uu_policy : int;
      uu_param : access constant bits_sched_h.sched_param) return int;  -- /usr/include/sched.h:58
   pragma Import (C, sched_setscheduler, "sched_setscheduler");

   function sched_getscheduler (uu_pid : bits_types_h.uu_pid_t) return int;  -- /usr/include/sched.h:62
   pragma Import (C, sched_getscheduler, "sched_getscheduler");

   function sched_yield return int;  -- /usr/include/sched.h:65
   pragma Import (C, sched_yield, "sched_yield");

   function sched_get_priority_max (uu_algorithm : int) return int;  -- /usr/include/sched.h:68
   pragma Import (C, sched_get_priority_max, "sched_get_priority_max");

   function sched_get_priority_min (uu_algorithm : int) return int;  -- /usr/include/sched.h:71
   pragma Import (C, sched_get_priority_min, "sched_get_priority_min");

   function sched_rr_get_interval (uu_pid : bits_types_h.uu_pid_t; uu_t : access time_h.timespec) return int;  -- /usr/include/sched.h:74
   pragma Import (C, sched_rr_get_interval, "sched_rr_get_interval");

   function sched_setaffinity
     (uu_pid : bits_types_h.uu_pid_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_sched_h.cpu_set_t) return int;  -- /usr/include/sched.h:118
   pragma Import (C, sched_setaffinity, "sched_setaffinity");

   function sched_getaffinity
     (uu_pid : bits_types_h.uu_pid_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_sched_h.cpu_set_t) return int;  -- /usr/include/sched.h:122
   pragma Import (C, sched_getaffinity, "sched_getaffinity");

end sched_h;
