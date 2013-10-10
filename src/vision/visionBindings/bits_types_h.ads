pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package bits_types_h is

   subtype uu_u_char is unsigned_char;  -- /usr/include/bits/types.h:31

   subtype uu_u_short is unsigned_short;  -- /usr/include/bits/types.h:32

   subtype uu_u_int is unsigned;  -- /usr/include/bits/types.h:33

   subtype uu_u_long is unsigned_long;  -- /usr/include/bits/types.h:34

   subtype uu_int8_t is signed_char;  -- /usr/include/bits/types.h:37

   subtype uu_uint8_t is unsigned_char;  -- /usr/include/bits/types.h:38

   subtype uu_int16_t is short;  -- /usr/include/bits/types.h:39

   subtype uu_uint16_t is unsigned_short;  -- /usr/include/bits/types.h:40

   subtype uu_int32_t is int;  -- /usr/include/bits/types.h:41

   subtype uu_uint32_t is unsigned;  -- /usr/include/bits/types.h:42

   subtype uu_int64_t is long;  -- /usr/include/bits/types.h:44

   subtype uu_uint64_t is unsigned_long;  -- /usr/include/bits/types.h:45

   subtype uu_quad_t is long;  -- /usr/include/bits/types.h:53

   subtype uu_u_quad_t is unsigned_long;  -- /usr/include/bits/types.h:54

   subtype uu_dev_t is unsigned_long;  -- /usr/include/bits/types.h:134

   subtype uu_uid_t is unsigned;  -- /usr/include/bits/types.h:135

   subtype uu_gid_t is unsigned;  -- /usr/include/bits/types.h:136

   subtype uu_ino_t is unsigned_long;  -- /usr/include/bits/types.h:137

   subtype uu_ino64_t is unsigned_long;  -- /usr/include/bits/types.h:138

   subtype uu_mode_t is unsigned;  -- /usr/include/bits/types.h:139

   subtype uu_nlink_t is unsigned_long;  -- /usr/include/bits/types.h:140

   subtype uu_off_t is long;  -- /usr/include/bits/types.h:141

   subtype uu_off64_t is long;  -- /usr/include/bits/types.h:142

   subtype uu_pid_t is int;  -- /usr/include/bits/types.h:143

   type uu_fsid_t_uu_val_array is array (0 .. 1) of aliased int;
   type uu_fsid_t is record
      uu_val : aliased uu_fsid_t_uu_val_array;  -- /usr/include/bits/types.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, uu_fsid_t);  -- /usr/include/bits/types.h:144

   --  skipped anonymous struct anon_5

   subtype uu_clock_t is long;  -- /usr/include/bits/types.h:145

   subtype uu_rlim_t is unsigned_long;  -- /usr/include/bits/types.h:146

   subtype uu_rlim64_t is unsigned_long;  -- /usr/include/bits/types.h:147

   subtype uu_id_t is unsigned;  -- /usr/include/bits/types.h:148

   subtype uu_time_t is long;  -- /usr/include/bits/types.h:149

   subtype uu_useconds_t is unsigned;  -- /usr/include/bits/types.h:150

   subtype uu_suseconds_t is long;  -- /usr/include/bits/types.h:151

   subtype uu_daddr_t is int;  -- /usr/include/bits/types.h:153

   subtype uu_swblk_t is long;  -- /usr/include/bits/types.h:154

   subtype uu_key_t is int;  -- /usr/include/bits/types.h:155

   subtype uu_clockid_t is int;  -- /usr/include/bits/types.h:158

   type uu_timer_t is new System.Address;  -- /usr/include/bits/types.h:161

   subtype uu_blksize_t is long;  -- /usr/include/bits/types.h:164

   subtype uu_blkcnt_t is long;  -- /usr/include/bits/types.h:169

   subtype uu_blkcnt64_t is long;  -- /usr/include/bits/types.h:170

   subtype uu_fsblkcnt_t is unsigned_long;  -- /usr/include/bits/types.h:173

   subtype uu_fsblkcnt64_t is unsigned_long;  -- /usr/include/bits/types.h:174

   subtype uu_fsfilcnt_t is unsigned_long;  -- /usr/include/bits/types.h:177

   subtype uu_fsfilcnt64_t is unsigned_long;  -- /usr/include/bits/types.h:178

   subtype uu_ssize_t is long;  -- /usr/include/bits/types.h:180

   subtype uu_loff_t is uu_off64_t;  -- /usr/include/bits/types.h:184

   type uu_qaddr_t is access all uu_quad_t;  -- /usr/include/bits/types.h:185

   type uu_caddr_t is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types.h:186

   subtype uu_intptr_t is long;  -- /usr/include/bits/types.h:189

   subtype uu_socklen_t is unsigned;  -- /usr/include/bits/types.h:192

end bits_types_h;
