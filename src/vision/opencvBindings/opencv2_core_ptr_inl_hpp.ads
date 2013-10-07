pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package opencv2_core_ptr_inl_hpp is

   package Class_PtrOwner is
      type PtrOwner is abstract tagged limited record
         refCount : aliased unsigned;  -- /usr/local/include/opencv2/core/ptr.inl.hpp:82
      end record;
      pragma Import (CPP, PtrOwner);

      function New_PtrOwner return PtrOwner is abstract;  -- /usr/local/include/opencv2/core/ptr.inl.hpp:60
      pragma CPP_Constructor (New_PtrOwner, "_ZN2cv6detail8PtrOwnerC1Ev");

      procedure incRef (this : access PtrOwner'Class);  -- /usr/local/include/opencv2/core/ptr.inl.hpp:63
      pragma Import (CPP, incRef, "_ZN2cv6detail8PtrOwner6incRefEv");

      procedure decRef (this : access PtrOwner'Class);  -- /usr/local/include/opencv2/core/ptr.inl.hpp:68
      pragma Import (CPP, decRef, "_ZN2cv6detail8PtrOwner6decRefEv");

      procedure Delete_PtrOwner (this : access PtrOwner);  -- /usr/local/include/opencv2/core/ptr.inl.hpp:76
      pragma Import (CPP, Delete_PtrOwner, "_ZN2cv6detail8PtrOwnerD1Ev");

      procedure deleting_dtor (this : access PtrOwner);  -- /usr/local/include/opencv2/core/ptr.inl.hpp:76
      pragma Import (CPP, deleting_dtor, "_ZN2cv6detail8PtrOwnerD0Ev");

      procedure deleteSelf (this : access PtrOwner) is abstract;  -- /usr/local/include/opencv2/core/ptr.inl.hpp:79

      function operator_as (this : access PtrOwner'Class; arg2 : access constant PtrOwner'Class) return access PtrOwner;  -- /usr/local/include/opencv2/core/ptr.inl.hpp:86
      pragma Import (CPP, operator_as, "_ZN2cv6detail8PtrOwneraSERKS1_");
   end;
   use Class_PtrOwner;
end opencv2_core_ptr_inl_hpp;
