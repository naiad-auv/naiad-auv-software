pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with wchar_h;

package uG_config_h is

   type u_G_fpos_t is record
      uu_pos : aliased bits_types_h.uu_off_t;  -- /usr/include/_G_config.h:24
      uu_state : aliased wchar_h.uu_mbstate_t;  -- /usr/include/_G_config.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos_t);  -- /usr/include/_G_config.h:26

   --  skipped anonymous struct anon_21

   type u_G_fpos64_t is record
      uu_pos : aliased bits_types_h.uu_off64_t;  -- /usr/include/_G_config.h:29
      uu_state : aliased wchar_h.uu_mbstate_t;  -- /usr/include/_G_config.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos64_t);  -- /usr/include/_G_config.h:31

   --  skipped anonymous struct anon_22

   subtype u_G_int16_t is short;  -- /usr/include/_G_config.h:53

   subtype u_G_int32_t is int;  -- /usr/include/_G_config.h:54

   subtype u_G_uint16_t is unsigned_short;  -- /usr/include/_G_config.h:55

   subtype u_G_uint32_t is unsigned;  -- /usr/include/_G_config.h:56

end uG_config_h;
