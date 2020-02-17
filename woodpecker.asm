; Bojarre special edition.
; ATTiny12 8bit power!

.def	byte_loop_register		=	r29
.def	byte_register			=	r0



; send two bytes from memory at adress Z.
;	Z => Z + 2
send_word:
	rcall	send_byte
; send one byte from memory at address Z.
;	Z => Z + 1
send_byte:
	ld		byte_register,Z
;	lpm		byte_register,Z
	inc		ZL
bitsender:
	ldi		byte_loop_register,$8
bitsender_loop:
	lsl		byte_register
	cbi		PORTB,PB2
	cbi		PORTB,PB0
	brcc	bitsender_skip
	sbi		PORTB,PB0
bitsender_skip:
	sbi		PORTB,PB2
	dec		byte_loop_register
	brne	bitsender_loop
	ret


; commands definition.
.equ	scan_limit		= 0x00
.equ	decode_mode		= 0x02
.equ	shutdown_mode	= 0x04
.equ	test_mode		= 0x06
.equ	intensity		= 0x08
.dseg
commands:
	.dw	0x0b07
	.dw	0x0900
	.dw	0x0c01
	.dw	0x0f00
	.dw	0x0a00
