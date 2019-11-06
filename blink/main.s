DDRB = 0x04
PINB = 0x05
	
.org 0
	sbi	DDRB,0
	
loop:
	sbi	PINB,0
	rcall	delay		
	cbi	PINB,0
	rcall	delay
	rjmp	loop

delay:
	ldi	r18,6
	ldi	r19,19
	ldi	r20,174
L1:
	dec	r20
	brne	L1
	dec	r19
	brne	L1
	dec	r18
	brne	L1
	ret
	
