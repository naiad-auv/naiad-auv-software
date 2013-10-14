pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with bits_pthreadtypes_h;
limited with time_h;
with stddef_h;
limited with bits_sched_h;
with Interfaces.C.Strings;
with bits_setjmp_h;
with bits_types_h;

package pthread_h is

   --  unsupported macro: PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_JOINABLE
   --  unsupported macro: PTHREAD_CREATE_DETACHED PTHREAD_CREATE_DETACHED
   --  unsupported macro: PTHREAD_MUTEX_INITIALIZER { { 0, 0, 0, 0, 0, 0, { 0, 0 } } }
   --  unsupported macro: PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP { { 0, 0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, 0, { 0, 0 } } }
   --  unsupported macro: PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP { { 0, 0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, 0, { 0, 0 } } }
   --  unsupported macro: PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP { { 0, 0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, 0, { 0, 0 } } }
   --  unsupported macro: PTHREAD_RWLOCK_INITIALIZER { { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } }
   --  unsupported macro: PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP { { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP } }
   --  unsupported macro: PTHREAD_INHERIT_SCHED PTHREAD_INHERIT_SCHED
   --  unsupported macro: PTHREAD_EXPLICIT_SCHED PTHREAD_EXPLICIT_SCHED
   --  unsupported macro: PTHREAD_SCOPE_SYSTEM PTHREAD_SCOPE_SYSTEM
   --  unsupported macro: PTHREAD_SCOPE_PROCESS PTHREAD_SCOPE_PROCESS
   --  unsupported macro: PTHREAD_PROCESS_PRIVATE PTHREAD_PROCESS_PRIVATE
   --  unsupported macro: PTHREAD_PROCESS_SHARED PTHREAD_PROCESS_SHARED
   --  unsupported macro: PTHREAD_COND_INITIALIZER { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } }
   --  unsupported macro: PTHREAD_CANCEL_ENABLE PTHREAD_CANCEL_ENABLE
   --  unsupported macro: PTHREAD_CANCEL_DISABLE PTHREAD_CANCEL_DISABLE
   --  unsupported macro: PTHREAD_CANCEL_DEFERRED PTHREAD_CANCEL_DEFERRED
   --  unsupported macro: PTHREAD_CANCEL_ASYNCHRONOUS PTHREAD_CANCEL_ASYNCHRONOUS
   --  unsupported macro: PTHREAD_CANCELED ((void *) -1)

   PTHREAD_ONCE_INIT : constant := 0;  --  /usr/include/pthread.h:209

   PTHREAD_BARRIER_SERIAL_THREAD : constant := -1;  --  /usr/include/pthread.h:216
   --  arg-macro: procedure pthread_cleanup_push (routine, arg)
   --    do { __pthread_cleanup_class __clframe (routine, arg)
   --  arg-macro: procedure pthread_cleanup_pop (execute)
   --    __clframe.__setdoit (execute); } while (0)
   --  arg-macro: procedure pthread_cleanup_push_defer_np (routine, arg)
   --    do { __pthread_cleanup_class __clframe (routine, arg); __clframe.__defer ()
   --  arg-macro: procedure pthread_cleanup_pop_restore_np (execute)
   --    __clframe.__restore (); __clframe.__setdoit (execute); } while (0)

   type u_pthread_cleanup_buffer is record
      uu_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:184
      uu_arg : System.Address;  -- /usr/include/pthread.h:185
      uu_canceltype : aliased int;  -- /usr/include/pthread.h:186
      uu_prev : access u_pthread_cleanup_buffer;  -- /usr/include/pthread.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, u_pthread_cleanup_buffer);  -- /usr/include/pthread.h:182

   function pthread_create
     (uu_newthread : access bits_pthreadtypes_h.pthread_t;
      uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_start_routine : access function (arg1 : System.Address) return System.Address;
      uu_arg : System.Address) return int;  -- /usr/include/pthread.h:225
   pragma Import (C, pthread_create, "pthread_create");

   procedure pthread_exit (uu_retval : System.Address);  -- /usr/include/pthread.h:234
   pragma Import (C, pthread_exit, "pthread_exit");

   function pthread_join (uu_th : bits_pthreadtypes_h.pthread_t; uu_thread_return : System.Address) return int;  -- /usr/include/pthread.h:242
   pragma Import (C, pthread_join, "pthread_join");

   function pthread_tryjoin_np (uu_th : bits_pthreadtypes_h.pthread_t; uu_thread_return : System.Address) return int;  -- /usr/include/pthread.h:247
   pragma Import (C, pthread_tryjoin_np, "pthread_tryjoin_np");

   function pthread_timedjoin_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_thread_return : System.Address;
      uu_abstime : access constant time_h.timespec) return int;  -- /usr/include/pthread.h:255
   pragma Import (C, pthread_timedjoin_np, "pthread_timedjoin_np");

   function pthread_detach (uu_th : bits_pthreadtypes_h.pthread_t) return int;  -- /usr/include/pthread.h:263
   pragma Import (C, pthread_detach, "pthread_detach");

   function pthread_self return bits_pthreadtypes_h.pthread_t;  -- /usr/include/pthread.h:267
   pragma Import (C, pthread_self, "pthread_self");

   function pthread_equal (uu_thread1 : bits_pthreadtypes_h.pthread_t; uu_thread2 : bits_pthreadtypes_h.pthread_t) return int;  -- /usr/include/pthread.h:270
   pragma Import (C, pthread_equal, "pthread_equal");

   function pthread_attr_init (uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int;  -- /usr/include/pthread.h:278
   pragma Import (C, pthread_attr_init, "pthread_attr_init");

   function pthread_attr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int;  -- /usr/include/pthread.h:281
   pragma Import (C, pthread_attr_destroy, "pthread_attr_destroy");

   function pthread_attr_getdetachstate (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_detachstate : access int) return int;  -- /usr/include/pthread.h:285
   pragma Import (C, pthread_attr_getdetachstate, "pthread_attr_getdetachstate");

   function pthread_attr_setdetachstate (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_detachstate : int) return int;  -- /usr/include/pthread.h:290
   pragma Import (C, pthread_attr_setdetachstate, "pthread_attr_setdetachstate");

   function pthread_attr_getguardsize (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_guardsize : access stddef_h.size_t) return int;  -- /usr/include/pthread.h:296
   pragma Import (C, pthread_attr_getguardsize, "pthread_attr_getguardsize");

   function pthread_attr_setguardsize (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_guardsize : stddef_h.size_t) return int;  -- /usr/include/pthread.h:301
   pragma Import (C, pthread_attr_setguardsize, "pthread_attr_setguardsize");

   function pthread_attr_getschedparam (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_param : access bits_sched_h.sched_param) return int;  -- /usr/include/pthread.h:307
   pragma Import (C, pthread_attr_getschedparam, "pthread_attr_getschedparam");

   function pthread_attr_setschedparam (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_param : access constant bits_sched_h.sched_param) return int;  -- /usr/include/pthread.h:313
   pragma Import (C, pthread_attr_setschedparam, "pthread_attr_setschedparam");

   function pthread_attr_getschedpolicy (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_policy : access int) return int;  -- /usr/include/pthread.h:318
   pragma Import (C, pthread_attr_getschedpolicy, "pthread_attr_getschedpolicy");

   function pthread_attr_setschedpolicy (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_policy : int) return int;  -- /usr/include/pthread.h:323
   pragma Import (C, pthread_attr_setschedpolicy, "pthread_attr_setschedpolicy");

   function pthread_attr_getinheritsched (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_inherit : access int) return int;  -- /usr/include/pthread.h:327
   pragma Import (C, pthread_attr_getinheritsched, "pthread_attr_getinheritsched");

   function pthread_attr_setinheritsched (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_inherit : int) return int;  -- /usr/include/pthread.h:332
   pragma Import (C, pthread_attr_setinheritsched, "pthread_attr_setinheritsched");

   function pthread_attr_getscope (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_scope : access int) return int;  -- /usr/include/pthread.h:338
   pragma Import (C, pthread_attr_getscope, "pthread_attr_getscope");

   function pthread_attr_setscope (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_scope : int) return int;  -- /usr/include/pthread.h:343
   pragma Import (C, pthread_attr_setscope, "pthread_attr_setscope");

   function pthread_attr_getstackaddr (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_stackaddr : System.Address) return int;  -- /usr/include/pthread.h:347
   pragma Import (C, pthread_attr_getstackaddr, "pthread_attr_getstackaddr");

   function pthread_attr_setstackaddr (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_stackaddr : System.Address) return int;  -- /usr/include/pthread.h:355
   pragma Import (C, pthread_attr_setstackaddr, "pthread_attr_setstackaddr");

   function pthread_attr_getstacksize (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_stacksize : access stddef_h.size_t) return int;  -- /usr/include/pthread.h:360
   pragma Import (C, pthread_attr_getstacksize, "pthread_attr_getstacksize");

   function pthread_attr_setstacksize (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_stacksize : stddef_h.size_t) return int;  -- /usr/include/pthread.h:367
   pragma Import (C, pthread_attr_setstacksize, "pthread_attr_setstacksize");

   function pthread_attr_getstack
     (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_stackaddr : System.Address;
      uu_stacksize : access stddef_h.size_t) return int;  -- /usr/include/pthread.h:373
   pragma Import (C, pthread_attr_getstack, "pthread_attr_getstack");

   function pthread_attr_setstack
     (uu_attr : access bits_pthreadtypes_h.pthread_attr_t;
      uu_stackaddr : System.Address;
      uu_stacksize : stddef_h.size_t) return int;  -- /usr/include/pthread.h:381
   pragma Import (C, pthread_attr_setstack, "pthread_attr_setstack");

   function pthread_attr_setaffinity_np
     (uu_attr : access bits_pthreadtypes_h.pthread_attr_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_sched_h.cpu_set_t) return int;  -- /usr/include/pthread.h:388
   pragma Import (C, pthread_attr_setaffinity_np, "pthread_attr_setaffinity_np");

   function pthread_attr_getaffinity_np
     (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_sched_h.cpu_set_t) return int;  -- /usr/include/pthread.h:395
   pragma Import (C, pthread_attr_getaffinity_np, "pthread_attr_getaffinity_np");

   function pthread_getattr_np (uu_th : bits_pthreadtypes_h.pthread_t; uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int;  -- /usr/include/pthread.h:404
   pragma Import (C, pthread_getattr_np, "pthread_getattr_np");

   function pthread_setschedparam
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_policy : int;
      uu_param : access constant bits_sched_h.sched_param) return int;  -- /usr/include/pthread.h:413
   pragma Import (C, pthread_setschedparam, "pthread_setschedparam");

   function pthread_getschedparam
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_policy : access int;
      uu_param : access bits_sched_h.sched_param) return int;  -- /usr/include/pthread.h:418
   pragma Import (C, pthread_getschedparam, "pthread_getschedparam");

   function pthread_setschedprio (uu_target_thread : bits_pthreadtypes_h.pthread_t; uu_prio : int) return int;  -- /usr/include/pthread.h:424
   pragma Import (C, pthread_setschedprio, "pthread_setschedprio");

   function pthread_getname_np
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return int;  -- /usr/include/pthread.h:430
   pragma Import (C, pthread_getname_np, "pthread_getname_np");

   function pthread_setname_np (uu_target_thread : bits_pthreadtypes_h.pthread_t; uu_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/pthread.h:435
   pragma Import (C, pthread_setname_np, "pthread_setname_np");

   function pthread_getconcurrency return int;  -- /usr/include/pthread.h:442
   pragma Import (C, pthread_getconcurrency, "pthread_getconcurrency");

   function pthread_setconcurrency (uu_level : int) return int;  -- /usr/include/pthread.h:445
   pragma Import (C, pthread_setconcurrency, "pthread_setconcurrency");

   function pthread_yield return int;  -- /usr/include/pthread.h:453
   pragma Import (C, pthread_yield, "pthread_yield");

   function pthread_setaffinity_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_sched_h.cpu_set_t) return int;  -- /usr/include/pthread.h:458
   pragma Import (C, pthread_setaffinity_np, "pthread_setaffinity_np");

   function pthread_getaffinity_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_sched_h.cpu_set_t) return int;  -- /usr/include/pthread.h:463
   pragma Import (C, pthread_getaffinity_np, "pthread_getaffinity_np");

   function pthread_once (uu_once_control : access bits_pthreadtypes_h.pthread_once_t; uu_init_routine : access procedure) return int;  -- /usr/include/pthread.h:478
   pragma Import (C, pthread_once, "pthread_once");

   function pthread_setcancelstate (uu_state : int; uu_oldstate : access int) return int;  -- /usr/include/pthread.h:490
   pragma Import (C, pthread_setcancelstate, "pthread_setcancelstate");

   function pthread_setcanceltype (uu_type : int; uu_oldtype : access int) return int;  -- /usr/include/pthread.h:494
   pragma Import (C, pthread_setcanceltype, "pthread_setcanceltype");

   function pthread_cancel (uu_th : bits_pthreadtypes_h.pthread_t) return int;  -- /usr/include/pthread.h:497
   pragma Import (C, pthread_cancel, "pthread_cancel");

   procedure pthread_testcancel;  -- /usr/include/pthread.h:502
   pragma Import (C, pthread_testcancel, "pthread_testcancel");

   type uu_pthread_unwind_buf_t_uu_cancel_jmp_buf_array is array (0 .. 0) of aliased anon_73;
   type uu_pthread_unwind_buf_t_uu_pad_array is array (0 .. 3) of System.Address;
   type uu_pthread_unwind_buf_t;
   type anon_73 is record
      uu_cancel_jmp_buf : aliased bits_setjmp_h.uu_jmp_buf;  -- /usr/include/pthread.h:511
      uu_mask_was_saved : aliased int;  -- /usr/include/pthread.h:512
   end record;
   pragma Convention (C_Pass_By_Copy, anon_73);
   type uu_pthread_unwind_buf_t is record
      uu_cancel_jmp_buf : aliased uu_pthread_unwind_buf_t_uu_cancel_jmp_buf_array;  -- /usr/include/pthread.h:513
      uu_pad : aliased uu_pthread_unwind_buf_t_uu_pad_array;  -- /usr/include/pthread.h:514
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_unwind_buf_t);  -- /usr/include/pthread.h:515

   --  skipped anonymous struct anon_72

   type uu_pthread_cleanup_frame is record
      uu_cancel_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:526
      uu_cancel_arg : System.Address;  -- /usr/include/pthread.h:527
      uu_do_it : aliased int;  -- /usr/include/pthread.h:528
      uu_cancel_type : aliased int;  -- /usr/include/pthread.h:529
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_cleanup_frame);  -- /usr/include/pthread.h:524

   package Class_uu_pthread_cleanup_class is
      type uu_pthread_cleanup_class is limited record
         uu_cancel_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:537
         uu_cancel_arg : System.Address;  -- /usr/include/pthread.h:538
         uu_do_it : aliased int;  -- /usr/include/pthread.h:539
         uu_cancel_type : aliased int;  -- /usr/include/pthread.h:540
      end record;
      pragma Import (CPP, uu_pthread_cleanup_class);


   end;
   use Class_uu_pthread_cleanup_class;
   --  skipped empty struct uu_jmp_buf_tag

   function pthread_mutex_init (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t; uu_mutexattr : access constant bits_pthreadtypes_h.pthread_mutexattr_t) return int;  -- /usr/include/pthread.h:733
   pragma Import (C, pthread_mutex_init, "pthread_mutex_init");

   function pthread_mutex_destroy (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:738
   pragma Import (C, pthread_mutex_destroy, "pthread_mutex_destroy");

   function pthread_mutex_trylock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:742
   pragma Import (C, pthread_mutex_trylock, "pthread_mutex_trylock");

   function pthread_mutex_lock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:746
   pragma Import (C, pthread_mutex_lock, "pthread_mutex_lock");

   function pthread_mutex_timedlock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t; uu_abstime : access constant time_h.timespec) return int;  -- /usr/include/pthread.h:751
   pragma Import (C, pthread_mutex_timedlock, "pthread_mutex_timedlock");

   function pthread_mutex_unlock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:757
   pragma Import (C, pthread_mutex_unlock, "pthread_mutex_unlock");

   function pthread_mutex_getprioceiling (uu_mutex : access constant bits_pthreadtypes_h.pthread_mutex_t; uu_prioceiling : access int) return int;  -- /usr/include/pthread.h:762
   pragma Import (C, pthread_mutex_getprioceiling, "pthread_mutex_getprioceiling");

   function pthread_mutex_setprioceiling
     (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_prioceiling : int;
      uu_old_ceiling : access int) return int;  -- /usr/include/pthread.h:769
   pragma Import (C, pthread_mutex_setprioceiling, "pthread_mutex_setprioceiling");

   function pthread_mutex_consistent (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:777
   pragma Import (C, pthread_mutex_consistent, "pthread_mutex_consistent");

   function pthread_mutex_consistent_np (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:780
   pragma Import (C, pthread_mutex_consistent_np, "pthread_mutex_consistent_np");

   function pthread_mutexattr_init (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t) return int;  -- /usr/include/pthread.h:790
   pragma Import (C, pthread_mutexattr_init, "pthread_mutexattr_init");

   function pthread_mutexattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t) return int;  -- /usr/include/pthread.h:794
   pragma Import (C, pthread_mutexattr_destroy, "pthread_mutexattr_destroy");

   function pthread_mutexattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_pshared : access int) return int;  -- /usr/include/pthread.h:798
   pragma Import (C, pthread_mutexattr_getpshared, "pthread_mutexattr_getpshared");

   function pthread_mutexattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_pshared : int) return int;  -- /usr/include/pthread.h:804
   pragma Import (C, pthread_mutexattr_setpshared, "pthread_mutexattr_setpshared");

   function pthread_mutexattr_gettype (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_kind : access int) return int;  -- /usr/include/pthread.h:810
   pragma Import (C, pthread_mutexattr_gettype, "pthread_mutexattr_gettype");

   function pthread_mutexattr_settype (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_kind : int) return int;  -- /usr/include/pthread.h:817
   pragma Import (C, pthread_mutexattr_settype, "pthread_mutexattr_settype");

   function pthread_mutexattr_getprotocol (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_protocol : access int) return int;  -- /usr/include/pthread.h:822
   pragma Import (C, pthread_mutexattr_getprotocol, "pthread_mutexattr_getprotocol");

   function pthread_mutexattr_setprotocol (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_protocol : int) return int;  -- /usr/include/pthread.h:829
   pragma Import (C, pthread_mutexattr_setprotocol, "pthread_mutexattr_setprotocol");

   function pthread_mutexattr_getprioceiling (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_prioceiling : access int) return int;  -- /usr/include/pthread.h:834
   pragma Import (C, pthread_mutexattr_getprioceiling, "pthread_mutexattr_getprioceiling");

   function pthread_mutexattr_setprioceiling (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_prioceiling : int) return int;  -- /usr/include/pthread.h:840
   pragma Import (C, pthread_mutexattr_setprioceiling, "pthread_mutexattr_setprioceiling");

   function pthread_mutexattr_getrobust (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : access int) return int;  -- /usr/include/pthread.h:846
   pragma Import (C, pthread_mutexattr_getrobust, "pthread_mutexattr_getrobust");

   function pthread_mutexattr_getrobust_np (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : access int) return int;  -- /usr/include/pthread.h:850
   pragma Import (C, pthread_mutexattr_getrobust_np, "pthread_mutexattr_getrobust_np");

   function pthread_mutexattr_setrobust (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : int) return int;  -- /usr/include/pthread.h:856
   pragma Import (C, pthread_mutexattr_setrobust, "pthread_mutexattr_setrobust");

   function pthread_mutexattr_setrobust_np (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : int) return int;  -- /usr/include/pthread.h:860
   pragma Import (C, pthread_mutexattr_setrobust_np, "pthread_mutexattr_setrobust_np");

   function pthread_rwlock_init (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t) return int;  -- /usr/include/pthread.h:872
   pragma Import (C, pthread_rwlock_init, "pthread_rwlock_init");

   function pthread_rwlock_destroy (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:877
   pragma Import (C, pthread_rwlock_destroy, "pthread_rwlock_destroy");

   function pthread_rwlock_rdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:881
   pragma Import (C, pthread_rwlock_rdlock, "pthread_rwlock_rdlock");

   function pthread_rwlock_tryrdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:885
   pragma Import (C, pthread_rwlock_tryrdlock, "pthread_rwlock_tryrdlock");

   function pthread_rwlock_timedrdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_abstime : access constant time_h.timespec) return int;  -- /usr/include/pthread.h:890
   pragma Import (C, pthread_rwlock_timedrdlock, "pthread_rwlock_timedrdlock");

   function pthread_rwlock_wrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:896
   pragma Import (C, pthread_rwlock_wrlock, "pthread_rwlock_wrlock");

   function pthread_rwlock_trywrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:900
   pragma Import (C, pthread_rwlock_trywrlock, "pthread_rwlock_trywrlock");

   function pthread_rwlock_timedwrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_abstime : access constant time_h.timespec) return int;  -- /usr/include/pthread.h:905
   pragma Import (C, pthread_rwlock_timedwrlock, "pthread_rwlock_timedwrlock");

   function pthread_rwlock_unlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int;  -- /usr/include/pthread.h:911
   pragma Import (C, pthread_rwlock_unlock, "pthread_rwlock_unlock");

   function pthread_rwlockattr_init (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t) return int;  -- /usr/include/pthread.h:918
   pragma Import (C, pthread_rwlockattr_init, "pthread_rwlockattr_init");

   function pthread_rwlockattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t) return int;  -- /usr/include/pthread.h:922
   pragma Import (C, pthread_rwlockattr_destroy, "pthread_rwlockattr_destroy");

   function pthread_rwlockattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pshared : access int) return int;  -- /usr/include/pthread.h:926
   pragma Import (C, pthread_rwlockattr_getpshared, "pthread_rwlockattr_getpshared");

   function pthread_rwlockattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pshared : int) return int;  -- /usr/include/pthread.h:932
   pragma Import (C, pthread_rwlockattr_setpshared, "pthread_rwlockattr_setpshared");

   function pthread_rwlockattr_getkind_np (uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pref : access int) return int;  -- /usr/include/pthread.h:937
   pragma Import (C, pthread_rwlockattr_getkind_np, "pthread_rwlockattr_getkind_np");

   function pthread_rwlockattr_setkind_np (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pref : int) return int;  -- /usr/include/pthread.h:943
   pragma Import (C, pthread_rwlockattr_setkind_np, "pthread_rwlockattr_setkind_np");

   function pthread_cond_init (uu_cond : access bits_pthreadtypes_h.pthread_cond_t; uu_cond_attr : access constant bits_pthreadtypes_h.pthread_condattr_t) return int;  -- /usr/include/pthread.h:952
   pragma Import (C, pthread_cond_init, "pthread_cond_init");

   function pthread_cond_destroy (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int;  -- /usr/include/pthread.h:957
   pragma Import (C, pthread_cond_destroy, "pthread_cond_destroy");

   function pthread_cond_signal (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int;  -- /usr/include/pthread.h:961
   pragma Import (C, pthread_cond_signal, "pthread_cond_signal");

   function pthread_cond_broadcast (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int;  -- /usr/include/pthread.h:965
   pragma Import (C, pthread_cond_broadcast, "pthread_cond_broadcast");

   function pthread_cond_wait (uu_cond : access bits_pthreadtypes_h.pthread_cond_t; uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int;  -- /usr/include/pthread.h:973
   pragma Import (C, pthread_cond_wait, "pthread_cond_wait");

   function pthread_cond_timedwait
     (uu_cond : access bits_pthreadtypes_h.pthread_cond_t;
      uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_abstime : access constant time_h.timespec) return int;  -- /usr/include/pthread.h:984
   pragma Import (C, pthread_cond_timedwait, "pthread_cond_timedwait");

   function pthread_condattr_init (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t) return int;  -- /usr/include/pthread.h:992
   pragma Import (C, pthread_condattr_init, "pthread_condattr_init");

   function pthread_condattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t) return int;  -- /usr/include/pthread.h:996
   pragma Import (C, pthread_condattr_destroy, "pthread_condattr_destroy");

   function pthread_condattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_condattr_t; uu_pshared : access int) return int;  -- /usr/include/pthread.h:1000
   pragma Import (C, pthread_condattr_getpshared, "pthread_condattr_getpshared");

   function pthread_condattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t; uu_pshared : int) return int;  -- /usr/include/pthread.h:1006
   pragma Import (C, pthread_condattr_setpshared, "pthread_condattr_setpshared");

   function pthread_condattr_getclock (uu_attr : access constant bits_pthreadtypes_h.pthread_condattr_t; uu_clock_id : access bits_types_h.uu_clockid_t) return int;  -- /usr/include/pthread.h:1011
   pragma Import (C, pthread_condattr_getclock, "pthread_condattr_getclock");

   function pthread_condattr_setclock (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t; uu_clock_id : bits_types_h.uu_clockid_t) return int;  -- /usr/include/pthread.h:1017
   pragma Import (C, pthread_condattr_setclock, "pthread_condattr_setclock");

   function pthread_spin_init (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t; uu_pshared : int) return int;  -- /usr/include/pthread.h:1028
   pragma Import (C, pthread_spin_init, "pthread_spin_init");

   function pthread_spin_destroy (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int;  -- /usr/include/pthread.h:1032
   pragma Import (C, pthread_spin_destroy, "pthread_spin_destroy");

   function pthread_spin_lock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int;  -- /usr/include/pthread.h:1036
   pragma Import (C, pthread_spin_lock, "pthread_spin_lock");

   function pthread_spin_trylock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int;  -- /usr/include/pthread.h:1040
   pragma Import (C, pthread_spin_trylock, "pthread_spin_trylock");

   function pthread_spin_unlock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int;  -- /usr/include/pthread.h:1044
   pragma Import (C, pthread_spin_unlock, "pthread_spin_unlock");

   function pthread_barrier_init
     (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t;
      uu_attr : access constant bits_pthreadtypes_h.pthread_barrierattr_t;
      uu_count : unsigned) return int;  -- /usr/include/pthread.h:1052
   pragma Import (C, pthread_barrier_init, "pthread_barrier_init");

   function pthread_barrier_destroy (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t) return int;  -- /usr/include/pthread.h:1058
   pragma Import (C, pthread_barrier_destroy, "pthread_barrier_destroy");

   function pthread_barrier_wait (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t) return int;  -- /usr/include/pthread.h:1062
   pragma Import (C, pthread_barrier_wait, "pthread_barrier_wait");

   function pthread_barrierattr_init (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t) return int;  -- /usr/include/pthread.h:1067
   pragma Import (C, pthread_barrierattr_init, "pthread_barrierattr_init");

   function pthread_barrierattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t) return int;  -- /usr/include/pthread.h:1071
   pragma Import (C, pthread_barrierattr_destroy, "pthread_barrierattr_destroy");

   function pthread_barrierattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_barrierattr_t; uu_pshared : access int) return int;  -- /usr/include/pthread.h:1075
   pragma Import (C, pthread_barrierattr_getpshared, "pthread_barrierattr_getpshared");

   function pthread_barrierattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t; uu_pshared : int) return int;  -- /usr/include/pthread.h:1081
   pragma Import (C, pthread_barrierattr_setpshared, "pthread_barrierattr_setpshared");

   function pthread_key_create (uu_key : access bits_pthreadtypes_h.pthread_key_t; uu_destr_function : access procedure (arg1 : System.Address)) return int;  -- /usr/include/pthread.h:1095
   pragma Import (C, pthread_key_create, "pthread_key_create");

   function pthread_key_delete (uu_key : bits_pthreadtypes_h.pthread_key_t) return int;  -- /usr/include/pthread.h:1100
   pragma Import (C, pthread_key_delete, "pthread_key_delete");

   function pthread_getspecific (uu_key : bits_pthreadtypes_h.pthread_key_t) return System.Address;  -- /usr/include/pthread.h:1103
   pragma Import (C, pthread_getspecific, "pthread_getspecific");

   function pthread_setspecific (uu_key : bits_pthreadtypes_h.pthread_key_t; uu_pointer : System.Address) return int;  -- /usr/include/pthread.h:1106
   pragma Import (C, pthread_setspecific, "pthread_setspecific");

   function pthread_getcpuclockid (uu_thread_id : bits_pthreadtypes_h.pthread_t; uu_clock_id : access bits_types_h.uu_clockid_t) return int;  -- /usr/include/pthread.h:1112
   pragma Import (C, pthread_getcpuclockid, "pthread_getcpuclockid");

   function pthread_atfork
     (uu_prepare : access procedure;
      uu_parent : access procedure;
      uu_child : access procedure) return int;  -- /usr/include/pthread.h:1129
   pragma Import (C, pthread_atfork, "pthread_atfork");

end pthread_h;
