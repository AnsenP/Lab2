transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab2/5_Running_Light/RTL {C:/FPGA_Laboratory/Lab2/5_Running_Light/RTL/running_light.v}

vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab2/5_Running_Light/Quartus_prj/../Sim {C:/FPGA_Laboratory/Lab2/5_Running_Light/Quartus_prj/../Sim/tb_running_light.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_running_light

add wave *
view structure
view signals
run 5 us
