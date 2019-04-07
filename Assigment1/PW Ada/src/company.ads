with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Ada.Numerics.Discrete_Random;
with Parameters;
use Parameters;


package Company is
   
   
   package R is new Ada.Numerics.Discrete_Random (Random_Range);
   use R;
   

   type Assigment is 
      record
         A : Integer;
         B : Integer;
         idx : Integer;
      end record;
   
   
   
   package Assigment_Vector is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Assigment);
 
   package Warehouse_Vector is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Integer);
    
   use Assigment_Vector;
   use Warehouse_Vector;

   
   type Assigment_acc is access Assigment_Vector.Vector;
   
   type Warehouse_acc is access Warehouse_Vector.Vector;  


   
   Assigments : Assigment_acc := new Assigment_Vector.Vector;
   Warehouse : Warehouse_acc := new Warehouse_Vector.Vector;

   AssigmentsGuard : Boolean := False;
   WarehouseGuard : Boolean := False;
   G : Generator;
   Del : Generator;
   

   procedure boss;
   procedure worker;
   procedure client;
   procedure startUpProcedure;
   procedure warehouseInfo;

   


end Company;
