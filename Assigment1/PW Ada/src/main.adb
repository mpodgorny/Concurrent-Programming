with Ada.Text_IO;
use  Ada.Text_IO;
with Company;
use Company;
with Ada.Containers; use Ada.Containers;
with Ada.Integer_Text_IO;
with Parameters;
use Parameters;

procedure Main is
   IntegerInput : Integer;
      begin
         Put_Line("Choose company working mode: ");
         Put_Line("[1] Silent");
         Put_Line("[2] Loud");
         Ada.Integer_Text_IO.Get(IntegerInput);
         case IntegerInput is
      when 1 =>
         silentMode := true;
            Put_Line("RYZYKO");
      when 2 =>
         silentMode := False;
            printBoss := True;
            printClient := True;
            printWorker := True;
            printWarehouse := True;
         when others =>
            Put_Line("Wrong Input! 1 or 2 needed.");

         end case;
         Ada.Text_IO.Put(ASCII.ESC & "[2J");
         startUpProcedure;


      end Main;




