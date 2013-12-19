-- Written by: Aseem Rastogi for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-16 by Aseem Rastogi

with Interfaces;

package Board_and_Mode_Defs is

   pragma Suppress(All_Checks);

   type Boards is (THRUSTER_CONTROLLER_1, THRUSTER_CONTROLLER_2, THRUSTER_CONTROLLER_3,
                   THRUSTER_CONTROLLER_4, THRUSTER_CONTROLLER_5, THRUSTER_CONTROLLER_6,
                   BBB_CONTROLLER_1, BBB_CONTROLLER_2, BBB_CONTROLLER_3,
                   INS_CONTROLLER, SENSOR_CONTROLLER, PNUMATICS_CONTROLLER,
                   POWER_SUPPLY_CONTROLLER,HYDROPHONE_CONTROLLER, UNDEFINED);

   type board_map_type is array (Interfaces.Unsigned_8) of Boards;
   Board_Map : constant board_map_type:= (1 => INS_CONTROLLER,
                                          2 => SENSOR_CONTROLLER,
                                          4 => PNUMATICS_CONTROLLER,
                                          8 => POWER_SUPPLY_CONTROLLER,
                                          16 => HYDROPHONE_CONTROLLER,
                                          32 => THRUSTER_CONTROLLER_1,
                                          33 => THRUSTER_CONTROLLER_2,
                                          34 => THRUSTER_CONTROLLER_3,
                                          36 => THRUSTER_CONTROLLER_4,
                                          40 => THRUSTER_CONTROLLER_5,
                                          48 => THRUSTER_CONTROLLER_6,
                                          64 => BBB_CONTROLLER_1,
                                          65 => BBB_CONTROLLER_2,
                                          66 => BBB_CONTROLLER_3,
                                          others => UNDEFINED);

   type Modes is (NORMAL,BOOTLOADER_MODE,SIMULATION_MODE,UNDEFINED);

   type mode_map_type is array (Interfaces.Unsigned_8) of Modes;

   Mode_Map : constant mode_map_type :=(0 => NORMAL,
                                        1 => BOOTLOADER_MODE,
                                        2 => SIMULATION_MODE,
                                        others => UNDEFINED);

   type State_type is record
      Send : Boolean;
      Receive : Boolean;
   end record;

   RECEIVE_ONLY : constant State_type := (Send => False, Receive => True);
   SEND_ONLY : constant State_type := (Send => True, Receive => False);
   SEND_AND_RECEIVE : constant State_type := (Send => True, Receive => True);
   NO_SEND_AND_RECEIVE : constant State_type := (Send => False, Receive => False);

   type mode_state_array is array (Modes) of State_type;

   type mode_def_array is array (Boards) of mode_state_array;

   board_mode_definitions : constant mode_def_array := (INS_CONTROLLER	=> (NORMAL => SEND_AND_RECEIVE,
                                                                           BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                           SIMULATION_MODE => RECEIVE_ONLY),
                                                        SENSOR_CONTROLLER	=> (NORMAL => SEND_AND_RECEIVE,
                                                                              BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                              SIMULATION_MODE => RECEIVE_ONLY),
                                                        PNUMATICS_CONTROLLER=> (NORMAL => SEND_AND_RECEIVE,
                                                                                BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                SIMULATION_MODE => RECEIVE_ONLY),
                                                        POWER_SUPPLY_CONTROLLER=> (NORMAL => SEND_AND_RECEIVE,
                                                                                   BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                   SIMULATION_MODE => RECEIVE_ONLY),
                                                        HYDROPHONE_CONTROLLER=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_1=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_2=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_3=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_4=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_5=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        THRUSTER_CONTROLLER_6=> (NORMAL => SEND_AND_RECEIVE,
                                                                                 BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                                 SIMULATION_MODE => RECEIVE_ONLY),
                                                        BBB_CONTROLLER_1=> (NORMAL => SEND_AND_RECEIVE,
                                                                            BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                            SIMULATION_MODE => RECEIVE_ONLY),
                                                        BBB_CONTROLLER_2=> (NORMAL => SEND_AND_RECEIVE,
                                                                            BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                            SIMULATION_MODE => RECEIVE_ONLY),
                                                        BBB_CONTROLLER_3=> (NORMAL => SEND_AND_RECEIVE,
                                                                            BOOTLOADER_MODE => RECEIVE_ONLY,
                                                                            SIMULATION_MODE => RECEIVE_ONLY)
                                                       );



end Board_and_Mode_Defs;
