.Title FinFET & CMOS V-I Characteristic

*LIBRARY*
.protect
.include'7nm_TT.pm'
.unprotect

*Voltage Source*
.global VDD GND
Vvdd VDD GND 0.9V
Vgs g GND 0
Vds d GND 1.5V

*Circuit*
* D G S B*

M1 d g GND GND nmos_rvt nfin=3

.tran 0.1ns 100ns
.DC Vgs 0 1 0.01 

**Vds-Ids Characteristic graph
*.DC Vds 0 0.9 0.01 SWEEP Vgs 0 0.9 0.1   

*Simulator Setting*
.option post
.option probe
.probe v(*) i(*)
.option captab
.TEMP 25

.end
