	;; Linear-feedback shift register
	;;	
	;; Loop cycle =  26 clock cycles = 3.25 microseconds

DDRB  = 0x04
PINB  = 0x05
SREG  = 0x3F
TMP   = 0x00
CLKPR = 0x61
	
.org 0
	ldi	r18,0
	ldi	r24,0x80
	in	TMP,SREG 
	cli
	sts	CLKPR,r24
	sts	CLKPR,r18
	out	SREG,TMP

	sbi	DDRB,0
	eor	r0,r0
	eor	r1,r1
	
loop:
	mov	r16,r0
	andi	r16,0x01

	mov	r17,r0
	
	lsr	r1
	ror	r0
	
	eor	r18,r18
	
	lsl	r17
	lsl	r17
	eor	r18,r17
	lsl	r17
	lsl	r17
	eor 	r18,r17
	lsl	r17
	eor	r18,r17
	lsl	r17
	lsl	r17
	eor	r18,r17
	
	com	r18
	
	bst	r18,7
	bld	r1,7
	
	tst	r16
	breq	clear

set:	
	sbi	PINB,0
	rjmp	loop

clear:	
	cbi	PINB,0
	nop
	rjmp	loop

