--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body VirtualMachine.Interpreter.CInterpreter_Test_Data.CInterpreter_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.VirtualMachine.Interpreter.CInterpreter_Test_Data.CInterpreter_Tests.Test_CInterpreter);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Step_0b2bca : aliased Runner_1.Test_Case;
   Case_2_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Instr_Push_Bool_ab5fc8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Instr_Push_Int_9559ca : aliased Runner_1.Test_Case;
   Case_5_1_Test_Instr_Push_Float_adc1c9 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Instr_Push_Vector_e4b77c : aliased Runner_1.Test_Case;
   Case_7_1_Test_Instr_Push_Matrix_22e731 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Instr_Branch_False_e665a3 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Instr_Branch_Always_1e7c55 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Instr_Branch_Subroutine_0d7af1 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Instr_Pop_59f6bf : aliased Runner_1.Test_Case;
   Case_12_1_Test_Instr_Right_Value_Integer_796e08 : aliased Runner_1.Test_Case;
   Case_13_1_Test_Instr_Right_Value_Boolean_bcc906 : aliased Runner_1.Test_Case;
   Case_14_1_Test_Instr_Right_Value_Float_0cd44c : aliased Runner_1.Test_Case;
   Case_15_1_Test_Instr_Right_Value_Matrix_9f7d18 : aliased Runner_1.Test_Case;
   Case_16_1_Test_Instr_Right_Value_Vector_3f3692 : aliased Runner_1.Test_Case;
   Case_17_1_Test_Instr_Left_Value_bebde6 : aliased Runner_1.Test_Case;
   Case_18_1_Test_Instr_Vector_Component_398f93 : aliased Runner_1.Test_Case;
   Case_19_1_Test_Instr_Link_b4ac2e : aliased Runner_1.Test_Case;
   Case_20_1_Test_Instr_Unlink_c313c4 : aliased Runner_1.Test_Case;
   Case_21_1_Test_Instr_Return_To_Subroutine_108a37 : aliased Runner_1.Test_Case;
   Case_22_1_Test_Instr_Declare_Integer_3cea83 : aliased Runner_1.Test_Case;
   Case_23_1_Test_Instr_Declare_Boolean_a8714b : aliased Runner_1.Test_Case;
   Case_24_1_Test_Instr_Declare_Float_8ac426 : aliased Runner_1.Test_Case;
   Case_25_1_Test_Instr_Declare_Matrix_d682e0 : aliased Runner_1.Test_Case;
   Case_26_1_Test_Instr_Declare_Vector_32e6dc : aliased Runner_1.Test_Case;
   Case_27_1_Test_Instr_Assign_Integer_f22284 : aliased Runner_1.Test_Case;
   Case_28_1_Test_Instr_Assign_Boolean_c79278 : aliased Runner_1.Test_Case;
   Case_29_1_Test_Instr_Assign_Float_cec292 : aliased Runner_1.Test_Case;
   Case_30_1_Test_Instr_Assign_Matrix_a3d7c2 : aliased Runner_1.Test_Case;
   Case_31_1_Test_Instr_Assign_Vector_cc2a4d : aliased Runner_1.Test_Case;
   Case_32_1_Test_Instr_Timer_Reset_0e70b9 : aliased Runner_1.Test_Case;
   Case_33_1_Test_Instr_Timer_00c13e : aliased Runner_1.Test_Case;
   Case_34_1_Test_Instr_Equals_Integer_694bc1 : aliased Runner_1.Test_Case;
   Case_35_1_Test_Instr_Less_Than_Integer_a97859 : aliased Runner_1.Test_Case;
   Case_36_1_Test_Instr_Less_Than_Or_Equal_Integer_df063d : aliased Runner_1.Test_Case;
   Case_37_1_Test_Instr_Equals_Float_66ca61 : aliased Runner_1.Test_Case;
   Case_38_1_Test_Instr_Less_Than_Float_1c9dfb : aliased Runner_1.Test_Case;
   Case_39_1_Test_Instr_Less_Than_Or_Equal_Float_14aabc : aliased Runner_1.Test_Case;
   Case_40_1_Test_Instr_Not_d81004 : aliased Runner_1.Test_Case;
   Case_41_1_Test_Instr_Or_0337dc : aliased Runner_1.Test_Case;
   Case_42_1_Test_Instr_And_b5e66d : aliased Runner_1.Test_Case;
   Case_43_1_Test_Instr_Equals_Boolean_ff60b4 : aliased Runner_1.Test_Case;
   Case_44_1_Test_Instr_Equals_Matrix_fb374c : aliased Runner_1.Test_Case;
   Case_45_1_Test_Instr_Equals_Vector_c5c86e : aliased Runner_1.Test_Case;
   Case_46_1_Test_Instr_Negate_Integer_7a3b2f : aliased Runner_1.Test_Case;
   Case_47_1_Test_Instr_Add_Integer_28aff2 : aliased Runner_1.Test_Case;
   Case_48_1_Test_Instr_Multiply_Integer_541399 : aliased Runner_1.Test_Case;
   Case_49_1_Test_Instr_Negate_Float_576004 : aliased Runner_1.Test_Case;
   Case_50_1_Test_Instr_Add_Float_8f89cb : aliased Runner_1.Test_Case;
   Case_51_1_Test_Instr_Multiply_Float_f7507a : aliased Runner_1.Test_Case;
   Case_52_1_Test_Instr_Negate_Vector_5b639b : aliased Runner_1.Test_Case;
   Case_53_1_Test_Instr_Add_Vector_9c6968 : aliased Runner_1.Test_Case;
   Case_54_1_Test_Instr_Multiply_Vector_8fef86 : aliased Runner_1.Test_Case;
   Case_55_1_Test_Instr_Multiply_Matrix_8dea8d : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Step_0b2bca,
         "virtualmachine-interpreter.ads:20:4:",
         Test_Step_0b2bca'Access);
      Runner_1.Create
        (Case_2_1_Test_Finalize_1d29f1,
         "virtualmachine-interpreter.ads:36:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_3_1_Test_Instr_Push_Bool_ab5fc8,
         "virtualmachine-interpreter.ads:38:4:",
         Test_Instr_Push_Bool_ab5fc8'Access);
      Runner_1.Create
        (Case_4_1_Test_Instr_Push_Int_9559ca,
         "virtualmachine-interpreter.ads:39:4:",
         Test_Instr_Push_Int_9559ca'Access);
      Runner_1.Create
        (Case_5_1_Test_Instr_Push_Float_adc1c9,
         "virtualmachine-interpreter.ads:40:4:",
         Test_Instr_Push_Float_adc1c9'Access);
      Runner_1.Create
        (Case_6_1_Test_Instr_Push_Vector_e4b77c,
         "virtualmachine-interpreter.ads:41:4:",
         Test_Instr_Push_Vector_e4b77c'Access);
      Runner_1.Create
        (Case_7_1_Test_Instr_Push_Matrix_22e731,
         "virtualmachine-interpreter.ads:42:4:",
         Test_Instr_Push_Matrix_22e731'Access);
      Runner_1.Create
        (Case_8_1_Test_Instr_Branch_False_e665a3,
         "virtualmachine-interpreter.ads:44:4:",
         Test_Instr_Branch_False_e665a3'Access);
      Runner_1.Create
        (Case_9_1_Test_Instr_Branch_Always_1e7c55,
         "virtualmachine-interpreter.ads:45:4:",
         Test_Instr_Branch_Always_1e7c55'Access);
      Runner_1.Create
        (Case_10_1_Test_Instr_Branch_Subroutine_0d7af1,
         "virtualmachine-interpreter.ads:46:4:",
         Test_Instr_Branch_Subroutine_0d7af1'Access);
      Runner_1.Create
        (Case_11_1_Test_Instr_Pop_59f6bf,
         "virtualmachine-interpreter.ads:48:4:",
         Test_Instr_Pop_59f6bf'Access);
      Runner_1.Create
        (Case_12_1_Test_Instr_Right_Value_Integer_796e08,
         "virtualmachine-interpreter.ads:50:4:",
         Test_Instr_Right_Value_Integer_796e08'Access);
      Runner_1.Create
        (Case_13_1_Test_Instr_Right_Value_Boolean_bcc906,
         "virtualmachine-interpreter.ads:51:4:",
         Test_Instr_Right_Value_Boolean_bcc906'Access);
      Runner_1.Create
        (Case_14_1_Test_Instr_Right_Value_Float_0cd44c,
         "virtualmachine-interpreter.ads:52:4:",
         Test_Instr_Right_Value_Float_0cd44c'Access);
      Runner_1.Create
        (Case_15_1_Test_Instr_Right_Value_Matrix_9f7d18,
         "virtualmachine-interpreter.ads:53:4:",
         Test_Instr_Right_Value_Matrix_9f7d18'Access);
      Runner_1.Create
        (Case_16_1_Test_Instr_Right_Value_Vector_3f3692,
         "virtualmachine-interpreter.ads:54:4:",
         Test_Instr_Right_Value_Vector_3f3692'Access);
      Runner_1.Create
        (Case_17_1_Test_Instr_Left_Value_bebde6,
         "virtualmachine-interpreter.ads:56:4:",
         Test_Instr_Left_Value_bebde6'Access);
      Runner_1.Create
        (Case_18_1_Test_Instr_Vector_Component_398f93,
         "virtualmachine-interpreter.ads:58:4:",
         Test_Instr_Vector_Component_398f93'Access);
      Runner_1.Create
        (Case_19_1_Test_Instr_Link_b4ac2e,
         "virtualmachine-interpreter.ads:60:4:",
         Test_Instr_Link_b4ac2e'Access);
      Runner_1.Create
        (Case_20_1_Test_Instr_Unlink_c313c4,
         "virtualmachine-interpreter.ads:61:4:",
         Test_Instr_Unlink_c313c4'Access);
      Runner_1.Create
        (Case_21_1_Test_Instr_Return_To_Subroutine_108a37,
         "virtualmachine-interpreter.ads:63:4:",
         Test_Instr_Return_To_Subroutine_108a37'Access);
      Runner_1.Create
        (Case_22_1_Test_Instr_Declare_Integer_3cea83,
         "virtualmachine-interpreter.ads:65:4:",
         Test_Instr_Declare_Integer_3cea83'Access);
      Runner_1.Create
        (Case_23_1_Test_Instr_Declare_Boolean_a8714b,
         "virtualmachine-interpreter.ads:66:4:",
         Test_Instr_Declare_Boolean_a8714b'Access);
      Runner_1.Create
        (Case_24_1_Test_Instr_Declare_Float_8ac426,
         "virtualmachine-interpreter.ads:67:4:",
         Test_Instr_Declare_Float_8ac426'Access);
      Runner_1.Create
        (Case_25_1_Test_Instr_Declare_Matrix_d682e0,
         "virtualmachine-interpreter.ads:68:4:",
         Test_Instr_Declare_Matrix_d682e0'Access);
      Runner_1.Create
        (Case_26_1_Test_Instr_Declare_Vector_32e6dc,
         "virtualmachine-interpreter.ads:69:4:",
         Test_Instr_Declare_Vector_32e6dc'Access);
      Runner_1.Create
        (Case_27_1_Test_Instr_Assign_Integer_f22284,
         "virtualmachine-interpreter.ads:71:4:",
         Test_Instr_Assign_Integer_f22284'Access);
      Runner_1.Create
        (Case_28_1_Test_Instr_Assign_Boolean_c79278,
         "virtualmachine-interpreter.ads:72:4:",
         Test_Instr_Assign_Boolean_c79278'Access);
      Runner_1.Create
        (Case_29_1_Test_Instr_Assign_Float_cec292,
         "virtualmachine-interpreter.ads:73:4:",
         Test_Instr_Assign_Float_cec292'Access);
      Runner_1.Create
        (Case_30_1_Test_Instr_Assign_Matrix_a3d7c2,
         "virtualmachine-interpreter.ads:74:4:",
         Test_Instr_Assign_Matrix_a3d7c2'Access);
      Runner_1.Create
        (Case_31_1_Test_Instr_Assign_Vector_cc2a4d,
         "virtualmachine-interpreter.ads:75:4:",
         Test_Instr_Assign_Vector_cc2a4d'Access);
      Runner_1.Create
        (Case_32_1_Test_Instr_Timer_Reset_0e70b9,
         "virtualmachine-interpreter.ads:77:4:",
         Test_Instr_Timer_Reset_0e70b9'Access);
      Runner_1.Create
        (Case_33_1_Test_Instr_Timer_00c13e,
         "virtualmachine-interpreter.ads:78:4:",
         Test_Instr_Timer_00c13e'Access);
      Runner_1.Create
        (Case_34_1_Test_Instr_Equals_Integer_694bc1,
         "virtualmachine-interpreter.ads:80:4:",
         Test_Instr_Equals_Integer_694bc1'Access);
      Runner_1.Create
        (Case_35_1_Test_Instr_Less_Than_Integer_a97859,
         "virtualmachine-interpreter.ads:81:4:",
         Test_Instr_Less_Than_Integer_a97859'Access);
      Runner_1.Create
        (Case_36_1_Test_Instr_Less_Than_Or_Equal_Integer_df063d,
         "virtualmachine-interpreter.ads:82:4:",
         Test_Instr_Less_Than_Or_Equal_Integer_df063d'Access);
      Runner_1.Create
        (Case_37_1_Test_Instr_Equals_Float_66ca61,
         "virtualmachine-interpreter.ads:84:4:",
         Test_Instr_Equals_Float_66ca61'Access);
      Runner_1.Create
        (Case_38_1_Test_Instr_Less_Than_Float_1c9dfb,
         "virtualmachine-interpreter.ads:85:4:",
         Test_Instr_Less_Than_Float_1c9dfb'Access);
      Runner_1.Create
        (Case_39_1_Test_Instr_Less_Than_Or_Equal_Float_14aabc,
         "virtualmachine-interpreter.ads:86:4:",
         Test_Instr_Less_Than_Or_Equal_Float_14aabc'Access);
      Runner_1.Create
        (Case_40_1_Test_Instr_Not_d81004,
         "virtualmachine-interpreter.ads:88:4:",
         Test_Instr_Not_d81004'Access);
      Runner_1.Create
        (Case_41_1_Test_Instr_Or_0337dc,
         "virtualmachine-interpreter.ads:89:4:",
         Test_Instr_Or_0337dc'Access);
      Runner_1.Create
        (Case_42_1_Test_Instr_And_b5e66d,
         "virtualmachine-interpreter.ads:90:4:",
         Test_Instr_And_b5e66d'Access);
      Runner_1.Create
        (Case_43_1_Test_Instr_Equals_Boolean_ff60b4,
         "virtualmachine-interpreter.ads:92:4:",
         Test_Instr_Equals_Boolean_ff60b4'Access);
      Runner_1.Create
        (Case_44_1_Test_Instr_Equals_Matrix_fb374c,
         "virtualmachine-interpreter.ads:93:4:",
         Test_Instr_Equals_Matrix_fb374c'Access);
      Runner_1.Create
        (Case_45_1_Test_Instr_Equals_Vector_c5c86e,
         "virtualmachine-interpreter.ads:94:4:",
         Test_Instr_Equals_Vector_c5c86e'Access);
      Runner_1.Create
        (Case_46_1_Test_Instr_Negate_Integer_7a3b2f,
         "virtualmachine-interpreter.ads:96:4:",
         Test_Instr_Negate_Integer_7a3b2f'Access);
      Runner_1.Create
        (Case_47_1_Test_Instr_Add_Integer_28aff2,
         "virtualmachine-interpreter.ads:97:4:",
         Test_Instr_Add_Integer_28aff2'Access);
      Runner_1.Create
        (Case_48_1_Test_Instr_Multiply_Integer_541399,
         "virtualmachine-interpreter.ads:98:4:",
         Test_Instr_Multiply_Integer_541399'Access);
      Runner_1.Create
        (Case_49_1_Test_Instr_Negate_Float_576004,
         "virtualmachine-interpreter.ads:100:4:",
         Test_Instr_Negate_Float_576004'Access);
      Runner_1.Create
        (Case_50_1_Test_Instr_Add_Float_8f89cb,
         "virtualmachine-interpreter.ads:101:4:",
         Test_Instr_Add_Float_8f89cb'Access);
      Runner_1.Create
        (Case_51_1_Test_Instr_Multiply_Float_f7507a,
         "virtualmachine-interpreter.ads:102:4:",
         Test_Instr_Multiply_Float_f7507a'Access);
      Runner_1.Create
        (Case_52_1_Test_Instr_Negate_Vector_5b639b,
         "virtualmachine-interpreter.ads:104:4:",
         Test_Instr_Negate_Vector_5b639b'Access);
      Runner_1.Create
        (Case_53_1_Test_Instr_Add_Vector_9c6968,
         "virtualmachine-interpreter.ads:105:4:",
         Test_Instr_Add_Vector_9c6968'Access);
      Runner_1.Create
        (Case_54_1_Test_Instr_Multiply_Vector_8fef86,
         "virtualmachine-interpreter.ads:106:4:",
         Test_Instr_Multiply_Vector_8fef86'Access);
      Runner_1.Create
        (Case_55_1_Test_Instr_Multiply_Matrix_8dea8d,
         "virtualmachine-interpreter.ads:108:4:",
         Test_Instr_Multiply_Matrix_8dea8d'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "virtualmachine-interpreter.ads:36:4: inherited at virtualmachine-interpreter.ads:24:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_Step_0b2bca'Access);
      Result.Add_Test (Case_2_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_3_1_Test_Instr_Push_Bool_ab5fc8'Access);
      Result.Add_Test (Case_4_1_Test_Instr_Push_Int_9559ca'Access);
      Result.Add_Test (Case_5_1_Test_Instr_Push_Float_adc1c9'Access);
      Result.Add_Test (Case_6_1_Test_Instr_Push_Vector_e4b77c'Access);
      Result.Add_Test (Case_7_1_Test_Instr_Push_Matrix_22e731'Access);
      Result.Add_Test (Case_8_1_Test_Instr_Branch_False_e665a3'Access);
      Result.Add_Test (Case_9_1_Test_Instr_Branch_Always_1e7c55'Access);
      Result.Add_Test (Case_10_1_Test_Instr_Branch_Subroutine_0d7af1'Access);
      Result.Add_Test (Case_11_1_Test_Instr_Pop_59f6bf'Access);
      Result.Add_Test (Case_12_1_Test_Instr_Right_Value_Integer_796e08'Access);
      Result.Add_Test (Case_13_1_Test_Instr_Right_Value_Boolean_bcc906'Access);
      Result.Add_Test (Case_14_1_Test_Instr_Right_Value_Float_0cd44c'Access);
      Result.Add_Test (Case_15_1_Test_Instr_Right_Value_Matrix_9f7d18'Access);
      Result.Add_Test (Case_16_1_Test_Instr_Right_Value_Vector_3f3692'Access);
      Result.Add_Test (Case_17_1_Test_Instr_Left_Value_bebde6'Access);
      Result.Add_Test (Case_18_1_Test_Instr_Vector_Component_398f93'Access);
      Result.Add_Test (Case_19_1_Test_Instr_Link_b4ac2e'Access);
      Result.Add_Test (Case_20_1_Test_Instr_Unlink_c313c4'Access);
      Result.Add_Test (Case_21_1_Test_Instr_Return_To_Subroutine_108a37'Access);
      Result.Add_Test (Case_22_1_Test_Instr_Declare_Integer_3cea83'Access);
      Result.Add_Test (Case_23_1_Test_Instr_Declare_Boolean_a8714b'Access);
      Result.Add_Test (Case_24_1_Test_Instr_Declare_Float_8ac426'Access);
      Result.Add_Test (Case_25_1_Test_Instr_Declare_Matrix_d682e0'Access);
      Result.Add_Test (Case_26_1_Test_Instr_Declare_Vector_32e6dc'Access);
      Result.Add_Test (Case_27_1_Test_Instr_Assign_Integer_f22284'Access);
      Result.Add_Test (Case_28_1_Test_Instr_Assign_Boolean_c79278'Access);
      Result.Add_Test (Case_29_1_Test_Instr_Assign_Float_cec292'Access);
      Result.Add_Test (Case_30_1_Test_Instr_Assign_Matrix_a3d7c2'Access);
      Result.Add_Test (Case_31_1_Test_Instr_Assign_Vector_cc2a4d'Access);
      Result.Add_Test (Case_32_1_Test_Instr_Timer_Reset_0e70b9'Access);
      Result.Add_Test (Case_33_1_Test_Instr_Timer_00c13e'Access);
      Result.Add_Test (Case_34_1_Test_Instr_Equals_Integer_694bc1'Access);
      Result.Add_Test (Case_35_1_Test_Instr_Less_Than_Integer_a97859'Access);
      Result.Add_Test (Case_36_1_Test_Instr_Less_Than_Or_Equal_Integer_df063d'Access);
      Result.Add_Test (Case_37_1_Test_Instr_Equals_Float_66ca61'Access);
      Result.Add_Test (Case_38_1_Test_Instr_Less_Than_Float_1c9dfb'Access);
      Result.Add_Test (Case_39_1_Test_Instr_Less_Than_Or_Equal_Float_14aabc'Access);
      Result.Add_Test (Case_40_1_Test_Instr_Not_d81004'Access);
      Result.Add_Test (Case_41_1_Test_Instr_Or_0337dc'Access);
      Result.Add_Test (Case_42_1_Test_Instr_And_b5e66d'Access);
      Result.Add_Test (Case_43_1_Test_Instr_Equals_Boolean_ff60b4'Access);
      Result.Add_Test (Case_44_1_Test_Instr_Equals_Matrix_fb374c'Access);
      Result.Add_Test (Case_45_1_Test_Instr_Equals_Vector_c5c86e'Access);
      Result.Add_Test (Case_46_1_Test_Instr_Negate_Integer_7a3b2f'Access);
      Result.Add_Test (Case_47_1_Test_Instr_Add_Integer_28aff2'Access);
      Result.Add_Test (Case_48_1_Test_Instr_Multiply_Integer_541399'Access);
      Result.Add_Test (Case_49_1_Test_Instr_Negate_Float_576004'Access);
      Result.Add_Test (Case_50_1_Test_Instr_Add_Float_8f89cb'Access);
      Result.Add_Test (Case_51_1_Test_Instr_Multiply_Float_f7507a'Access);
      Result.Add_Test (Case_52_1_Test_Instr_Negate_Vector_5b639b'Access);
      Result.Add_Test (Case_53_1_Test_Instr_Add_Vector_9c6968'Access);
      Result.Add_Test (Case_54_1_Test_Instr_Multiply_Vector_8fef86'Access);
      Result.Add_Test (Case_55_1_Test_Instr_Multiply_Matrix_8dea8d'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end VirtualMachine.Interpreter.CInterpreter_Test_Data.CInterpreter_Tests.Suite;
--  end read only
