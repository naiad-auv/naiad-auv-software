pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_pthreadtypes_h;
with time_h;

package cpp_4_7_4_x86_64_pc_linux_gnu_bits_gthr_default_h is

   subtype uu_gthread_t is bits_pthreadtypes_h.pthread_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/gthr-default.h:53

   subtype uu_gthread_key_t is bits_pthreadtypes_h.pthread_key_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/gthr-default.h:54

   subtype uu_gthread_once_t is bits_pthreadtypes_h.pthread_once_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/gthr-default.h:55

   subtype uu_gthread_mutex_t is bits_pthreadtypes_h.pthread_mutex_t;

   subtype uu_gthread_recursive_mutex_t is bits_pthreadtypes_h.pthread_mutex_t;

   subtype uu_gthread_cond_t is bits_pthreadtypes_h.pthread_cond_t;

   subtype uu_gthread_time_t is time_h.timespec;

end cpp_4_7_4_x86_64_pc_linux_gnu_bits_gthr_default_h;
