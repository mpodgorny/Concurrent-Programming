pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180523-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#b5754509#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#35869f17#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00005, "ada__containersS");
   u00006 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#77a38a8e#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#87be2c0f#;
   pragma Export (C, u00011, "system__secondary_stackB");
   u00012 : constant Version_32 := 16#77347921#;
   pragma Export (C, u00012, "system__secondary_stackS");
   u00013 : constant Version_32 := 16#b11c5006#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#2ccb9557#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00017, "system__exceptionsB");
   u00018 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00018, "system__exceptionsS");
   u00019 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00019, "system__exceptions__machineB");
   u00020 : constant Version_32 := 16#3bad9081#;
   pragma Export (C, u00020, "system__exceptions__machineS");
   u00021 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00021, "system__exceptions_debugB");
   u00022 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00022, "system__exceptions_debugS");
   u00023 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00023, "system__img_intB");
   u00024 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00024, "system__img_intS");
   u00025 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00025, "system__storage_elementsB");
   u00026 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00026, "system__storage_elementsS");
   u00027 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00027, "system__tracebackB");
   u00028 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00028, "system__tracebackS");
   u00029 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00029, "system__traceback_entriesB");
   u00030 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00030, "system__traceback_entriesS");
   u00031 : constant Version_32 := 16#9ad5ad12#;
   pragma Export (C, u00031, "system__traceback__symbolicB");
   u00032 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00032, "system__traceback__symbolicS");
   u00033 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00033, "ada__exceptions__tracebackB");
   u00034 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00034, "ada__exceptions__tracebackS");
   u00035 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00035, "system__bounded_stringsB");
   u00036 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00036, "system__bounded_stringsS");
   u00037 : constant Version_32 := 16#74f70e62#;
   pragma Export (C, u00037, "system__crtlS");
   u00038 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00038, "system__parametersB");
   u00039 : constant Version_32 := 16#7a4cd513#;
   pragma Export (C, u00039, "system__parametersS");
   u00040 : constant Version_32 := 16#d5de7583#;
   pragma Export (C, u00040, "system__dwarf_linesB");
   u00041 : constant Version_32 := 16#f4013fc9#;
   pragma Export (C, u00041, "system__dwarf_linesS");
   u00042 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00042, "ada__charactersS");
   u00043 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00043, "ada__characters__handlingB");
   u00044 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00044, "ada__characters__handlingS");
   u00045 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00045, "ada__characters__latin_1S");
   u00046 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00046, "ada__stringsS");
   u00047 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00047, "ada__strings__mapsB");
   u00048 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00048, "ada__strings__mapsS");
   u00049 : constant Version_32 := 16#a21ad5cd#;
   pragma Export (C, u00049, "system__bit_opsB");
   u00050 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00050, "system__bit_opsS");
   u00051 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00051, "system__unsigned_typesS");
   u00052 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00052, "ada__strings__maps__constantsS");
   u00053 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00053, "interfacesS");
   u00054 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00054, "system__address_imageB");
   u00055 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00055, "system__address_imageS");
   u00056 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00056, "system__img_unsB");
   u00057 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00057, "system__img_unsS");
   u00058 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00058, "system__ioB");
   u00059 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00059, "system__ioS");
   u00060 : constant Version_32 := 16#3080f2ca#;
   pragma Export (C, u00060, "system__mmapB");
   u00061 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00061, "system__mmapS");
   u00062 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00062, "ada__io_exceptionsS");
   u00063 : constant Version_32 := 16#a82e20f9#;
   pragma Export (C, u00063, "system__mmap__os_interfaceB");
   u00064 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00064, "system__mmap__os_interfaceS");
   u00065 : constant Version_32 := 16#35737c3a#;
   pragma Export (C, u00065, "system__os_libB");
   u00066 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00066, "system__os_libS");
   u00067 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00067, "system__case_utilB");
   u00068 : constant Version_32 := 16#0d75376c#;
   pragma Export (C, u00068, "system__case_utilS");
   u00069 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00069, "system__stringsB");
   u00070 : constant Version_32 := 16#52b6adad#;
   pragma Export (C, u00070, "system__stringsS");
   u00071 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#40d3d043#;
   pragma Export (C, u00073, "system__object_readerB");
   u00074 : constant Version_32 := 16#ec38df4d#;
   pragma Export (C, u00074, "system__object_readerS");
   u00075 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00075, "system__val_lliB");
   u00076 : constant Version_32 := 16#a8846798#;
   pragma Export (C, u00076, "system__val_lliS");
   u00077 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00077, "system__val_lluB");
   u00078 : constant Version_32 := 16#7cd4aac9#;
   pragma Export (C, u00078, "system__val_lluS");
   u00079 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00079, "system__val_utilB");
   u00080 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00080, "system__val_utilS");
   u00081 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00081, "system__exception_tracesB");
   u00082 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00082, "system__exception_tracesS");
   u00083 : constant Version_32 := 16#d178f226#;
   pragma Export (C, u00083, "system__win32S");
   u00084 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00084, "system__wch_conB");
   u00085 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00085, "system__wch_conS");
   u00086 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00086, "system__wch_stwB");
   u00087 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00087, "system__wch_stwS");
   u00088 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00088, "system__wch_cnvB");
   u00089 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00089, "system__wch_cnvS");
   u00090 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00090, "system__wch_jisB");
   u00091 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00091, "system__wch_jisS");
   u00092 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00092, "system__soft_links__initializeB");
   u00093 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00093, "system__soft_links__initializeS");
   u00094 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00094, "system__stack_checkingB");
   u00095 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00095, "system__stack_checkingS");
   u00096 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00096, "ada__integer_text_ioB");
   u00097 : constant Version_32 := 16#082ea75f#;
   pragma Export (C, u00097, "ada__integer_text_ioS");
   u00098 : constant Version_32 := 16#927a893f#;
   pragma Export (C, u00098, "ada__text_ioB");
   u00099 : constant Version_32 := 16#25015822#;
   pragma Export (C, u00099, "ada__text_ioS");
   u00100 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00100, "ada__streamsB");
   u00101 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00101, "ada__streamsS");
   u00102 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00102, "ada__tagsB");
   u00103 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00103, "ada__tagsS");
   u00104 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00104, "system__htableB");
   u00105 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00105, "system__htableS");
   u00106 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00106, "system__string_hashB");
   u00107 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00107, "system__string_hashS");
   u00108 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00108, "interfaces__c_streamsB");
   u00109 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00109, "interfaces__c_streamsS");
   u00110 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00110, "system__file_ioB");
   u00111 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00111, "system__file_ioS");
   u00112 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00112, "ada__finalizationS");
   u00113 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00113, "system__finalization_rootB");
   u00114 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00114, "system__finalization_rootS");
   u00115 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00115, "system__file_control_blockS");
   u00116 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00116, "ada__text_io__integer_auxB");
   u00117 : constant Version_32 := 16#09097bbe#;
   pragma Export (C, u00117, "ada__text_io__integer_auxS");
   u00118 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00118, "ada__text_io__generic_auxB");
   u00119 : constant Version_32 := 16#16b3615d#;
   pragma Export (C, u00119, "ada__text_io__generic_auxS");
   u00120 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00120, "system__img_biuB");
   u00121 : constant Version_32 := 16#c00475f6#;
   pragma Export (C, u00121, "system__img_biuS");
   u00122 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00122, "system__img_llbB");
   u00123 : constant Version_32 := 16#81c36508#;
   pragma Export (C, u00123, "system__img_llbS");
   u00124 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00124, "system__img_lliB");
   u00125 : constant Version_32 := 16#23efd4e9#;
   pragma Export (C, u00125, "system__img_lliS");
   u00126 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00126, "system__img_llwB");
   u00127 : constant Version_32 := 16#28af469e#;
   pragma Export (C, u00127, "system__img_llwS");
   u00128 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00128, "system__img_wiuB");
   u00129 : constant Version_32 := 16#ae45f264#;
   pragma Export (C, u00129, "system__img_wiuS");
   u00130 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00130, "system__val_intB");
   u00131 : constant Version_32 := 16#7a05ab07#;
   pragma Export (C, u00131, "system__val_intS");
   u00132 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00132, "system__val_unsB");
   u00133 : constant Version_32 := 16#168e1080#;
   pragma Export (C, u00133, "system__val_unsS");
   u00134 : constant Version_32 := 16#b2c1f1f9#;
   pragma Export (C, u00134, "companyB");
   u00135 : constant Version_32 := 16#bdb3beb5#;
   pragma Export (C, u00135, "companyS");
   u00136 : constant Version_32 := 16#357666d8#;
   pragma Export (C, u00136, "ada__calendar__delaysB");
   u00137 : constant Version_32 := 16#a808adf5#;
   pragma Export (C, u00137, "ada__calendar__delaysS");
   u00138 : constant Version_32 := 16#b8719323#;
   pragma Export (C, u00138, "ada__calendarB");
   u00139 : constant Version_32 := 16#41508869#;
   pragma Export (C, u00139, "ada__calendarS");
   u00140 : constant Version_32 := 16#24ec69e6#;
   pragma Export (C, u00140, "system__os_primitivesB");
   u00141 : constant Version_32 := 16#355de4ce#;
   pragma Export (C, u00141, "system__os_primitivesS");
   u00142 : constant Version_32 := 16#05c60a38#;
   pragma Export (C, u00142, "system__task_lockB");
   u00143 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00143, "system__task_lockS");
   u00144 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00144, "system__win32__extS");
   u00145 : constant Version_32 := 16#c04d61ca#;
   pragma Export (C, u00145, "ada__real_timeB");
   u00146 : constant Version_32 := 16#69ea8064#;
   pragma Export (C, u00146, "ada__real_timeS");
   u00147 : constant Version_32 := 16#a568828d#;
   pragma Export (C, u00147, "system__taskingB");
   u00148 : constant Version_32 := 16#d2a71b20#;
   pragma Export (C, u00148, "system__taskingS");
   u00149 : constant Version_32 := 16#c71f56c0#;
   pragma Export (C, u00149, "system__task_primitivesS");
   u00150 : constant Version_32 := 16#c5a5fe3f#;
   pragma Export (C, u00150, "system__os_interfaceS");
   u00151 : constant Version_32 := 16#1d638357#;
   pragma Export (C, u00151, "interfaces__c__stringsB");
   u00152 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00152, "interfaces__c__stringsS");
   u00153 : constant Version_32 := 16#c1984f17#;
   pragma Export (C, u00153, "system__task_primitives__operationsB");
   u00154 : constant Version_32 := 16#0af41c2b#;
   pragma Export (C, u00154, "system__task_primitives__operationsS");
   u00155 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00155, "system__float_controlB");
   u00156 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00156, "system__float_controlS");
   u00157 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00157, "system__interrupt_managementB");
   u00158 : constant Version_32 := 16#0f60a80c#;
   pragma Export (C, u00158, "system__interrupt_managementS");
   u00159 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00159, "system__multiprocessorsB");
   u00160 : constant Version_32 := 16#0a0c1e4b#;
   pragma Export (C, u00160, "system__multiprocessorsS");
   u00161 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00161, "system__task_infoB");
   u00162 : constant Version_32 := 16#e54688cf#;
   pragma Export (C, u00162, "system__task_infoS");
   u00163 : constant Version_32 := 16#e5a48551#;
   pragma Export (C, u00163, "system__tasking__debugB");
   u00164 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00164, "system__tasking__debugS");
   u00165 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00165, "system__concat_2B");
   u00166 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00166, "system__concat_2S");
   u00167 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00167, "system__concat_3B");
   u00168 : constant Version_32 := 16#39d0dd9d#;
   pragma Export (C, u00168, "system__concat_3S");
   u00169 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00169, "system__img_enum_newB");
   u00170 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00170, "system__img_enum_newS");
   u00171 : constant Version_32 := 16#6ec3c867#;
   pragma Export (C, u00171, "system__stack_usageB");
   u00172 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00172, "system__stack_usageS");
   u00173 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00173, "gnatS");
   u00174 : constant Version_32 := 16#a79e599e#;
   pragma Export (C, u00174, "gnat__os_libS");
   u00175 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00175, "system__concat_4B");
   u00176 : constant Version_32 := 16#4cc4aa18#;
   pragma Export (C, u00176, "system__concat_4S");
   u00177 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00177, "system__concat_5B");
   u00178 : constant Version_32 := 16#b5fec216#;
   pragma Export (C, u00178, "system__concat_5S");
   u00179 : constant Version_32 := 16#0fc99b06#;
   pragma Export (C, u00179, "system__tasking__rendezvousB");
   u00180 : constant Version_32 := 16#f242aaf9#;
   pragma Export (C, u00180, "system__tasking__rendezvousS");
   u00181 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00181, "system__restrictionsB");
   u00182 : constant Version_32 := 16#79d25869#;
   pragma Export (C, u00182, "system__restrictionsS");
   u00183 : constant Version_32 := 16#40317118#;
   pragma Export (C, u00183, "system__tasking__entry_callsB");
   u00184 : constant Version_32 := 16#c7180c67#;
   pragma Export (C, u00184, "system__tasking__entry_callsS");
   u00185 : constant Version_32 := 16#ff0ade79#;
   pragma Export (C, u00185, "system__tasking__initializationB");
   u00186 : constant Version_32 := 16#f7885a93#;
   pragma Export (C, u00186, "system__tasking__initializationS");
   u00187 : constant Version_32 := 16#f29e7e8b#;
   pragma Export (C, u00187, "system__soft_links__taskingB");
   u00188 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00188, "system__soft_links__taskingS");
   u00189 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00189, "ada__exceptions__is_null_occurrenceB");
   u00190 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00190, "ada__exceptions__is_null_occurrenceS");
   u00191 : constant Version_32 := 16#a067942c#;
   pragma Export (C, u00191, "system__tasking__task_attributesB");
   u00192 : constant Version_32 := 16#4c40320c#;
   pragma Export (C, u00192, "system__tasking__task_attributesS");
   u00193 : constant Version_32 := 16#f24a7f45#;
   pragma Export (C, u00193, "system__tasking__protected_objectsB");
   u00194 : constant Version_32 := 16#b15a1586#;
   pragma Export (C, u00194, "system__tasking__protected_objectsS");
   u00195 : constant Version_32 := 16#50b90464#;
   pragma Export (C, u00195, "system__tasking__protected_objects__entriesB");
   u00196 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00196, "system__tasking__protected_objects__entriesS");
   u00197 : constant Version_32 := 16#a11c264c#;
   pragma Export (C, u00197, "system__tasking__protected_objects__operationsB");
   u00198 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00198, "system__tasking__protected_objects__operationsS");
   u00199 : constant Version_32 := 16#ec3cf692#;
   pragma Export (C, u00199, "system__tasking__queuingB");
   u00200 : constant Version_32 := 16#c9e0262c#;
   pragma Export (C, u00200, "system__tasking__queuingS");
   u00201 : constant Version_32 := 16#70d5a0df#;
   pragma Export (C, u00201, "system__tasking__utilitiesB");
   u00202 : constant Version_32 := 16#332a5557#;
   pragma Export (C, u00202, "system__tasking__utilitiesS");
   u00203 : constant Version_32 := 16#7724692c#;
   pragma Export (C, u00203, "system__tasking__stagesB");
   u00204 : constant Version_32 := 16#fb9a8375#;
   pragma Export (C, u00204, "system__tasking__stagesS");
   u00205 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00205, "ada__containers__helpersB");
   u00206 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00206, "ada__containers__helpersS");
   u00207 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00207, "system__atomic_countersB");
   u00208 : constant Version_32 := 16#86fcacb5#;
   pragma Export (C, u00208, "system__atomic_countersS");
   u00209 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00209, "ada__numericsS");
   u00210 : constant Version_32 := 16#5b30ac9e#;
   pragma Export (C, u00210, "parametersS");
   u00211 : constant Version_32 := 16#d96e3c40#;
   pragma Export (C, u00211, "system__finalization_mastersB");
   u00212 : constant Version_32 := 16#695cb8f2#;
   pragma Export (C, u00212, "system__finalization_mastersS");
   u00213 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00213, "system__img_boolB");
   u00214 : constant Version_32 := 16#c779f0d3#;
   pragma Export (C, u00214, "system__img_boolS");
   u00215 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00215, "system__storage_poolsB");
   u00216 : constant Version_32 := 16#114d1f95#;
   pragma Export (C, u00216, "system__storage_poolsS");
   u00217 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00217, "system__pool_globalB");
   u00218 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00218, "system__pool_globalS");
   u00219 : constant Version_32 := 16#5dc07a5a#;
   pragma Export (C, u00219, "system__memoryB");
   u00220 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00220, "system__memoryS");
   u00221 : constant Version_32 := 16#ec9cfed1#;
   pragma Export (C, u00221, "system__random_numbersB");
   u00222 : constant Version_32 := 16#f1b831a2#;
   pragma Export (C, u00222, "system__random_numbersS");
   u00223 : constant Version_32 := 16#650caaea#;
   pragma Export (C, u00223, "system__random_seedB");
   u00224 : constant Version_32 := 16#69b0a863#;
   pragma Export (C, u00224, "system__random_seedS");
   u00225 : constant Version_32 := 16#2e260032#;
   pragma Export (C, u00225, "system__storage_pools__subpoolsB");
   u00226 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00226, "system__storage_pools__subpoolsS");
   u00227 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00227, "system__storage_pools__subpools__finalizationB");
   u00228 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00228, "system__storage_pools__subpools__finalizationS");
   u00229 : constant Version_32 := 16#039168f8#;
   pragma Export (C, u00229, "system__stream_attributesB");
   u00230 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00230, "system__stream_attributesS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.case_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  ada.exceptions.last_chance_handler%s
   --  system.secondary_stack%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  ada.containers%s
   --  system.case_util%b
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.wch_stw%b
   --  system.val_util%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  interfaces.c%s
   --  system.win32%s
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  interfaces.c%b
   --  ada.strings.maps%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.numerics%s
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  gnat.os_lib%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking%b
   --  system.task_primitives.operations%b
   --  system.tasking.debug%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.initialization%b
   --  system.tasking.task_attributes%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  parameters%s
   --  company%s
   --  company%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
