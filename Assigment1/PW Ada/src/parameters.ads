package Parameters is
   
   randomizationOfIntervals : Integer := 4;
   clientInterval : Duration := 2.0;
   bossInterval : Duration := 1.4;
   workerInterval : Duration := 2.5;
   printWarehouseInterval : Duration := 8.0;
   warehouseMaxLoad: Integer := 100;
   assigmentsMaxSize : Integer := 20;
   workersNumber : Integer := 3;
   clientsNumber : Integer := 2;
   
   printInfoResourceInUse : Boolean := False;   
   printClient : Boolean := False;
   printWorker : Boolean:= False;
   printBoss : Boolean:= False;
   printWarehouse: Boolean := False;
   silentMode : Boolean :=True;
   
   
   subtype Random_Range is Integer range 5 .. 100;
   

   

end Parameters;
