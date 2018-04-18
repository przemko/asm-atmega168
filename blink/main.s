.org 0
	sbi 0x4,0
	
loop:
	sbi 0x5,0
	rcall delay		
	cbi 0x5,0
	rcall delay
	rjmp loop

delay:
	ldi r18,6
	ldi r19,19
	ldi r20,174
L1:
	dec r20
	brne L1
	dec r19
	brne L1
	dec r18
	brne L1
	ret
	
