.Title FinFET & CMOS V-I Characteristic

*LIBRARY*
.protect
.include'7nm_TT.pm'
.unprotect

*Voltage Source*
.global VDD GND
Vvdd VDD GND 0.9V
Vgs g VDD 0
Vds d VDD -0.9V

*Circuit*
* D G S B*

M1 d g VDD VDD pmos_rvt nfin=3

.tran 0.1ns 100ns
.DC Vgs 0 -1 -0.01 

*Simulator Setting*
.option post
.option probe
.probe v(*) i(*)
.option captab
.TEMP 25

.end
