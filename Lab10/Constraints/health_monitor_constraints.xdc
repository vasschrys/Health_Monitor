## Clock signal
##Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports  {clk_100MHz}]							
	set_property IOSTANDARD LVCMOS33 [get_ports  {clk_100MHz}]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports  {clk_100MHz}]
	
	
##Bank = 34, Pin name = IO_L16P_T2_34,                        Sch name = DP
set_property PACKAGE_PIN M4 [get_ports dp]                            
set_property IOSTANDARD LVCMOS33 [get_ports dp]

##Pmod Header JA
##Bank = 15, Pin name = IO_L1N_T0_AD0N_15,					Sch name = JA1
set_property PACKAGE_PIN B13 [get_ports {pulse_in}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {pulse_in}]

##7 segment display
#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = CA
set_property PACKAGE_PIN L3 [get_ports {segs_l[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[6]}]
#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = CB
set_property PACKAGE_PIN N1 [get_ports {segs_l[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[5]}]
#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = CC
set_property PACKAGE_PIN L5 [get_ports {segs_l[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[4]}]
#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = CD
set_property PACKAGE_PIN L4 [get_ports {segs_l[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[3]}]
#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = CE
set_property PACKAGE_PIN K3 [get_ports {segs_l[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[2]}]
#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = CF
set_property PACKAGE_PIN M2 [get_ports {segs_l[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[1]}]
#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = CG
set_property PACKAGE_PIN L6 [get_ports {segs_l[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs_l[0]}]


#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
set_property PACKAGE_PIN N6 [get_ports {an_l[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[0]}]
#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = AN1
set_property PACKAGE_PIN M6 [get_ports {an_l[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[1]}]
#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = AN2
set_property PACKAGE_PIN M3 [get_ports {an_l[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[2]}]
#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = AN3
set_property PACKAGE_PIN N5 [get_ports {an_l[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[3]}]
#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = AN4
set_property PACKAGE_PIN N2 [get_ports {an_l[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[4]}]
#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = AN5
set_property PACKAGE_PIN N4 [get_ports {an_l[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[5]}]
#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = AN6
set_property PACKAGE_PIN L1 [get_ports {an_l[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[6]}]
#Bank = 34, Pin name = IO_L1N_T034,							Sch name = AN7
set_property PACKAGE_PIN M1 [get_ports {an_l[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an_l[7]}]
	
	
	
##Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,	Sch name = BTNL
set_property PACKAGE_PIN T16 [get_ports rst]                        
   set_property IOSTANDARD LVCMOS33 [get_ports rst]
##Bank = 14, Pin name = IO_25_14,                            Sch name = BTNR
#set_property PACKAGE_PIN R10 [get_ports en]                        
  #set_property IOSTANDARD LVCMOS33 [get_ports en]
##Bank = 14, Pin name = IO_L21P_T3_DQS_14,                    Sch name = BTND
#set_property PACKAGE_PIN V10 [get_ports lap]                        
  #set_property IOSTANDARD LVCMOS33 [get_ports lap]