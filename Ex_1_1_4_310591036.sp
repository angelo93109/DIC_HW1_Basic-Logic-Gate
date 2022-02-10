.TITLE PMOS Ids Vds

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
Vgs g VDD 0
Vds d VDD -0.9V
*****************************
**      Your Circuit       **
*****************************
**  D   G   S    X **

M1  d  g  VDD VDD  pmos W=16n L=16n

.tran 0.1ns 100ns
.DC Vgs 0 -1.0 -0.01

*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe			*with I/V in .lis
.probe v(*) i(*)
.option captab			*with cap value in .lis
.TEMP 25

.end



