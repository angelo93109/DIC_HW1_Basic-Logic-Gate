.Title CMOS Inverter

.protect
.include'7nm_TT.pm'
.unprotect

.global VDD GND
Vvdd VDD GND 1.5V

**CMOS inverter subcircuit
.SUBCKT inv vi vo F=3
MN vo vi GND GND nmos_rvt nfin=F 
MP vo vi VDD VDD pmos_rvt nfin=F
.ENDS 

Xmain in out inv 
Xload out GND inv M=4
C0 out GND 10e-15

.trans 0.1ns 80ns
Vin in 0 pwl(0n 0v, 10n 0v, 10.0001n 2v, 30n 2v, 30.0001n 0v, 40n 0v, 40.0001n 2v, 60n 2v, 60.0001n 0v, 80n 0v,R 0)


.meas tran Tr trig v(out) val=“1.5*0.1” rise=2 targ v(out) val=”1.5*0.9” rise=2
.meas tran Tf trig v(out) val=“1.5*0.9” fall=2 targ v(out) val=”1.5*0.1” fall=2
.meas tran Tplh trig v(in) val=“1.5*0.5” fall=2 targ v(out) val=”1.5*0.5” rise=2
.meas tran Tphl trig v(in) val=“1.5*0.5” rise=2 targ v(out) val=”1.5*0.5” fall=2
.meas tran pwr AVG POWER
.option post
.option probe
.probe v(*) i(*)
.option captab
.TEMP 25
.END