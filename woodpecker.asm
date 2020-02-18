; Bojarre special edition.
; ATTiny12 8bit power!

.def	byte_loop_register		=	r29
.def	byte_register			=	r0


send_command_word:
	add		byte_register,byte_register
	ldi		ZL,low(commands)
	ldi		ZH,high(commands)
	add		ZL,byte_register
	clr		byte_register
	adc		ZH,byte_register
;	ld		byte_register,Z
	lpm
	inc		ZL
; send two bytes from memory at adress Z.
;	Z => Z + 2
send_word:
	rcall	send_byte
; send one byte from memory at address Z.
;	Z => Z + 1
send_byte:
;	ld		byte_register,Z
	lpm
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



.dseg
commands:	.dw	0x0b07, 0x0900, 0x0c01, 0x0f00, 0x0a00
