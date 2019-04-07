with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with GNAT.OS_Lib;

package body Company is
   
  
   procedure boss is
      New_Assigment : Assigment;
      Task add;
      task body add is
      begin
         While True loop
            Reset(Del);
            delay bossInterval * ((Random(Del) mod randomizationOfIntervals) + 1); 
            Reset (G);
            if(WarehouseGuard) then
               if(printInfoResourceInUse) then
                  Put_Line("Boss: Assigments in use!");
               end if;
            else 
               WarehouseGuard := True;
               if(Integer(Assigments.Length) >= assigmentsMaxSize) then
                  if(printBoss) then
                     Put_Line("BHP alert: too much assigments!");
                  end if;
               else 
                  New_Assigment.A := Integer(Random(G));
                  New_Assigment.B := Integer(Random(G));
                  New_Assigment.idx := Integer(Random(G)) mod 3;
                  Assigments.Append(New_Assigment);
                  if(printBoss) then
                     Put_Line("Boss created new assigment!");
                  end if;
               end if;
               WarehouseGuard := False;
            end if;
         end loop;

      end add;      
      
   begin
      null;    
   end boss;

   
   procedure worker is 
      Materials : Assigment;
      result : Integer;
      task type work is 
         entry setId (myNumber : in  Integer);
      end work;
      task body work is
         Id : Integer;
      begin
         accept setId (myNumber : in Integer) do
            Id := myNumber;
         end setId;
         While True loop
            Reset(Del);
            delay workerInterval * ((Random(Del) mod randomizationOfIntervals) + 1); 
            if ( AssigmentsGuard or WarehouseGuard) then
               if(printInfoResourceInUse) then
                  Put_Line("Worker nr " & Integer'Image(Id) & ": Assigments or warehouse in use!");
               end if;
            else 
               AssigmentsGuard:=True;
               WarehouseGuard:=True;
                     
               if (Assigments.Length=0) then
                  if(printWorker) then
                     Put_Line("Worker " & Integer'Image(Id) & " has nothing to work on.");
                  end if;
               elsif(Integer(Warehouse.Length) >=warehouseMaxLoad) then
                  if(printWorker) then

                     Put_Line("Warehouse is full.");
                  end if;
               else 
                  Materials := Assigments.Last_Element;
                  Assigments.Delete_Last;
                  case Materials.idx is
                     when 0 =>
                        result := Materials.A + Materials.B;
                     when 1 =>
                        result := Materials.A - Materials.B;
                     when others =>
                        result := Materials.A * Materials.B;
               
                  end case;
                  Warehouse.Append(result);
                  if(printWorker) then
                     Put_Line("Worker " & Integer'Image(Id) & " created number " & Integer'Image(result) & ".");
                  end if;

               end if;
               AssigmentsGuard:=False;
               WarehouseGuard:=False;
            end if;
         end loop;

      end work;
      workers: array(1 .. workersNumber) of work;   

   begin
      for I in workers'Range loop
         workers(I).setId(I);
      end loop;
   end worker;
   
   
   procedure client is
      task type newClient is
         entry setId (myNumber : in  Integer);
      end newClient;
      searchedIdx : Integer;
      task body newClient is 
         Id: Integer;
      begin
         accept setId(myNumber : in Integer) do
            Id := myNumber;
         end setId;
         While True loop
            
            Reset(Del);
            delay clientInterval * ((Random(Del) mod randomizationOfIntervals) + 1); 
            Reset(G);
            if(WarehouseGuard) then
               if(printInfoResourceInUse) then
                  Put_Line("client nr " & Integer'Image(Id) & ": Warehouse in use!");
               end if;
            else
               WarehouseGuard :=True;
               if (Warehouse.Length=0) then
                  if(printClient) then
                     Put_Line("Client nr " & Integer'Image(Id) & ": No pruducts!");
                  end if;
               else
                  searchedIdx := Integer(Integer(Random(G)) mod Integer(Warehouse.Length));
                  if (printClient) then
                     Put_Line("Client " & Integer'Image(Id) & " bought number " & Integer'Image(Warehouse.Element(searchedIdx)) & ".");
                  end if;
                  Warehouse.Delete(searchedIdx);
               end if;
               WarehouseGuard := False;
            end if;
         end loop;
      end newClient;

      clients : array(1 .. clientsNumber) of newClient;
   begin 
      for I in clients'Range loop
         clients(I).setId(I);
      end loop;
   end client;
   
   procedure warehouseInfo is 
      task printInfo;
      task body printInfo is
      begin
         while true loop
            delay printWarehouseInterval;
            if(printWarehouse) then
               Put_Line("Tasks to do: " & Count_Type'Image(Assigments.Length) & " products to sell: " & Count_Type'Image(Warehouse.Length));
            end if;
         end loop;
      end printInfo;
   begin
      null;
   end warehouseInfo;
         
   
   procedure startUpProcedure is
      task createClients;
      task createWorkers;
      task createPrinting;
      task menu;
      task body createClients is
      begin
         client;
      end createClients;
      task body createWorkers is
      begin
         worker;
      end createWorkers;
      task body createPrinting is
      begin
         warehouseInfo;
      end createPrinting;
   
      task  body menu is
         IntegerInput : Integer;
      begin
         while true loop
            if(silentMode) then
               Put_Line("[SILENT] Press turn ON/OFF [1] for boss information, [2] for workers info, [3] for clients info, [4] for warehouse info, [5] for cleaning console, [6] for resource blockage info, [0] to EXIT, any other to enter loud mode.");
               Ada.Integer_Text_IO.Get(IntegerInput);

               while IntegerInput in 0 .. 6 loop
                  case IntegerInput is
                     when 1 =>
                        printBoss := not printBoss;
                     when 2 =>
                        printWorker := not printWorker;
                     when 3 =>
                        printClient := not printClient;
                     when 4 =>
                        printWarehouse := not printWarehouse;
                     when 5 =>
                        Ada.Text_IO.Put(ASCII.ESC & "[2J");
                     when 6 =>
                        printInfoResourceInUse := not printInfoResourceInUse;
                     when 0 =>
                        GNAT.OS_Lib.OS_Exit (0);

                     when others =>
                        
                        silentMode := false;
                  end case;
                  Ada.Integer_Text_IO.Get(IntegerInput);
               end loop;
               silentMode := false;
            else
               Put_Line("[LOUD] You can exit by writing [0] and change mode to silent by sending any other character. Starting company in loud mode: ");
               printBoss := True;
               printClient := True;
               printWorker := True;
               printWarehouse := True;
               silentMode := False;
               Ada.Integer_Text_IO.Get(IntegerInput);
               printInfoResourceInUse := True;
               if(IntegerInput = 0) then 
                  GNAT.OS_Lib.OS_Exit (0);
               end if;  
               silentMode := True;
               printBoss := False;
               printClient := False;
               printWorker := False;
               printWarehouse := False;
               printInfoResourceInUse := False;
            end if;
         end loop;
      end menu;
   
   begin
      boss;  
   end startUpProcedure;
        
   
end Company;
