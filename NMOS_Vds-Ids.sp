.TITLE NMOS Ids Vds

*****************************
**     Library setting     **
*****************************
.protect
.include '16mos.pm'
.unprotect

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.9v
Vgs g GND 0
Vds d GND 0
*****************************
**      Your Circuit       **
*****************************
**  D   G   S    X **

M1  d  g   GND  GND  nmos W=16n L=16n

.tran 0.1ns 80ns
.DC Vds 0 0.9 0.01 SWEEP Vgs 0 0.9 0.1

**Vds-Ids Characteristic graph
*.DC Vds 0 0.9 0.01 SWEEP Vgs 0 0.9 0.1   

*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe			*with I/V in .lis
.probe v(*) i(*)
.option captab			*with cap value in .lis
.TEMP 25

.end



