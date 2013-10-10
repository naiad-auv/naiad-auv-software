pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with xlocale_h;

package locale_h is

   --  unsupported macro: LC_CTYPE __LC_CTYPE
   --  unsupported macro: LC_NUMERIC __LC_NUMERIC
   --  unsupported macro: LC_TIME __LC_TIME
   --  unsupported macro: LC_COLLATE __LC_COLLATE
   --  unsupported macro: LC_MONETARY __LC_MONETARY
   --  unsupported macro: LC_MESSAGES __LC_MESSAGES
   --  unsupported macro: LC_ALL __LC_ALL
   --  unsupported macro: LC_PAPER __LC_PAPER
   --  unsupported macro: LC_NAME __LC_NAME
   --  unsupported macro: LC_ADDRESS __LC_ADDRESS
   --  unsupported macro: LC_TELEPHONE __LC_TELEPHONE
   --  unsupported macro: LC_MEASUREMENT __LC_MEASUREMENT
   --  unsupported macro: LC_IDENTIFICATION __LC_IDENTIFICATION
   --  unsupported macro: LC_CTYPE_MASK (1 << __LC_CTYPE)
   --  unsupported macro: LC_NUMERIC_MASK (1 << __LC_NUMERIC)
   --  unsupported macro: LC_TIME_MASK (1 << __LC_TIME)
   --  unsupported macro: LC_COLLATE_MASK (1 << __LC_COLLATE)
   --  unsupported macro: LC_MONETARY_MASK (1 << __LC_MONETARY)
   --  unsupported macro: LC_MESSAGES_MASK (1 << __LC_MESSAGES)
   --  unsupported macro: LC_PAPER_MASK (1 << __LC_PAPER)
   --  unsupported macro: LC_NAME_MASK (1 << __LC_NAME)
   --  unsupported macro: LC_ADDRESS_MASK (1 << __LC_ADDRESS)
   --  unsupported macro: LC_TELEPHONE_MASK (1 << __LC_TELEPHONE)
   --  unsupported macro: LC_MEASUREMENT_MASK (1 << __LC_MEASUREMENT)
   --  unsupported macro: LC_IDENTIFICATION_MASK (1 << __LC_IDENTIFICATION)
   --  unsupported macro: LC_ALL_MASK (LC_CTYPE_MASK | LC_NUMERIC_MASK | LC_TIME_MASK | LC_COLLATE_MASK | LC_MONETARY_MASK | LC_MESSAGES_MASK | LC_PAPER_MASK | LC_NAME_MASK | LC_ADDRESS_MASK | LC_TELEPHONE_MASK | LC_MEASUREMENT_MASK | LC_IDENTIFICATION_MASK )
   --  unsupported macro: LC_GLOBAL_LOCALE ((__locale_t) -1L)
   type lconv is record
      decimal_point : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:58
      thousands_sep : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:59
      grouping : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:65
      int_curr_symbol : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:71
      currency_symbol : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:72
      mon_decimal_point : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:73
      mon_thousands_sep : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:74
      mon_grouping : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:75
      positive_sign : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:76
      negative_sign : Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:77
      int_frac_digits : aliased char;  -- /usr/include/locale.h:78
      frac_digits : aliased char;  -- /usr/include/locale.h:79
      p_cs_precedes : aliased char;  -- /usr/include/locale.h:81
      p_sep_by_space : aliased char;  -- /usr/include/locale.h:83
      n_cs_precedes : aliased char;  -- /usr/include/locale.h:85
      n_sep_by_space : aliased char;  -- /usr/include/locale.h:87
      p_sign_posn : aliased char;  -- /usr/include/locale.h:94
      n_sign_posn : aliased char;  -- /usr/include/locale.h:95
      int_p_cs_precedes : aliased char;  -- /usr/include/locale.h:98
      int_p_sep_by_space : aliased char;  -- /usr/include/locale.h:100
      int_n_cs_precedes : aliased char;  -- /usr/include/locale.h:102
      int_n_sep_by_space : aliased char;  -- /usr/include/locale.h:104
      int_p_sign_posn : aliased char;  -- /usr/include/locale.h:111
      int_n_sign_posn : aliased char;  -- /usr/include/locale.h:112
   end record;
   pragma Convention (C_Pass_By_Copy, lconv);  -- /usr/include/locale.h:54

   function setlocale (uu_category : int; uu_locale : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/locale.h:125
   pragma Import (C, setlocale, "setlocale");

   function localeconv return access lconv;  -- /usr/include/locale.h:128
   pragma Import (C, localeconv, "localeconv");

   function newlocale
     (uu_category_mask : int;
      uu_locale : Interfaces.C.Strings.chars_ptr;
      uu_base : xlocale_h.uu_locale_t) return xlocale_h.uu_locale_t;  -- /usr/include/locale.h:152
   pragma Import (C, newlocale, "newlocale");

   function duplocale (uu_dataset : xlocale_h.uu_locale_t) return xlocale_h.uu_locale_t;  -- /usr/include/locale.h:187
   pragma Import (C, duplocale, "duplocale");

   procedure freelocale (uu_dataset : xlocale_h.uu_locale_t);  -- /usr/include/locale.h:191
   pragma Import (C, freelocale, "freelocale");

   function uselocale (uu_dataset : xlocale_h.uu_locale_t) return xlocale_h.uu_locale_t;  -- /usr/include/locale.h:198
   pragma Import (C, uselocale, "uselocale");

end locale_h;
