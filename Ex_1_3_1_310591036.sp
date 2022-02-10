.title 7nm inverter

***library***
.protect
.include'7nm_TT.pm'

**nfin = 2
*.include'Ex_1_3_2_310591036_2fins.sp'

**nfin = 3
.include'Ex_1_3_3_310591036_3fins.sp'

**nfin = 4
*.include'Ex_1_3_4_310591036_4fins.sp'

**nfin = 5
*.include'Ex_1_3_5_310591036_5fins.sp'

.unprotect

*VOLTAGE SOURCE
.global VDD GND
Vvdd VDD GND 0.7V

*MAIN CIRCUIT
Xinv GND VDD in out INVx1_ASAP7_75t_R
Vin in GND pulse(0v 0.7v 0.1ns 0.1ns 0.1ns 20ns 40ns)

*INPUT SIGNAL
.trans 0.01ns 20ns
*.DC Vin 0V 0.7V 0.005V

**PARTI
.DC Vin 0V 0.7V 0.005V SWEEP Vvdd 0.4 0.7 0.1

.option post
.option probe
.probe v(*) i(*)
.option captab
.TEMP 25
.END