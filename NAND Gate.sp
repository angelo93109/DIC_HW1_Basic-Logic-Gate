.Title NAND

.protect 
.include '7nm_TT.pm'
.unprotect

.global VDD GND
Vvdd VDD GND 1.5V


*OUTPUT LOADING SUBCIRCUIT
.SUBCKT inv vi vo F=3
MN vo vi GND GND nmos_rvt nfin=F 
MP vo vi VDD VDD pmos_rvt nfin=F
.ENDS

*MAIN CIRCUIT
Mn1 out inA 1 GND nmos_rvt nfin=3
Mn2 1 inB GND GND nmos_rvt nfin=3
Mp1 out inA VDD VDD pmos_rvt nfin=3
Mp2 out inB VDD VDD pmos_rvt nfin=3

*OUTPUT LOADING
Xload out GND inv M=4
C0 out GND 10e-15

VA inA GND pwl(0n 0v, 20n 0v, 20.0001n 1.5V, 40n 1.5v, 40.0001n 0v)
VB inB GND pwl(0n 0v, 10n 0v, 10.0001n 1.5v, 30n 1.5v, 30.0001n 0v)
.trans 0.1ns 80ns

.meas tran Tr trig v(out) val=“1.5*0.1” rise=1 targ v(out) val=”1.5*0.9” rise=1
.meas tran Tf trig v(out) val=“1.5*0.9” fall=1 targ v(out) val=”1.5*0.1” fall=1
.meas tran Tplh trig v(inB) val=“1.5*0.5” fall=1 targ v(out) val=”1.5*0.5” rise=1
.meas tran Tphl trig v(inA) val=“1.5*0.5” rise=1 targ v(out) val=”1.5*0.5” fall=1
.meas tran pwr AVG POWER
.option post
.option probe
.probe v(*) i(*)
.option captab
.TEMP 25
.END






