with simulator.Comunication_Prot_Obj; use Simulator.Comunication_Prot_Obj;
with Simulator.submarine;
with TCPWrapper;
with math.Vectors;
with math.Matrices;
with CAN_Defs;
with TCPCANWrapper;
with CAN_Convertions_Math;
with Ada.Text_IO;
with Interfaces;
with Can_Float_Conversions;
package Simulator_Motio_Control_Test is
   procedure Intialize_And_Reset(sIPAdress : String;iPort : integer);

   xProtected_Send_Info : simulator.Comunication_Prot_Obj.tCom_Prot_Obj;
   xProtected_Read_Info : simulator.Comunication_Prot_Obj.tCom_Prot_Obj;

private

   task type TCommunicationReadTask is
      entry Init;
   end TCommunicationReadTask;

   task type TCommunicationSendTask is
      entry Init;
   end TCommunicationSendTask;

   procedure Get_Data_From_Message(xMessage : CAN_Defs.CAN_Message);
   ComunicationReadTask : TCommunicationReadTask;
   CommunicationSendTask : TCommunicationSendTask;
   bConnected : boolean := false;
   xConnection : TCPWrapper.CTCPConnection;
end Simulator_Motio_Control_Test;
