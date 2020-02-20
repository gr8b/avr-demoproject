; Bojarre special edition.
; ATTiny12 8bit power!

.def	temp				= r23
.def	byte_register		= r0
.def	command_register	= r16
.def	data_register		= r17


send_word:
	cbi		PORTB,PB3
	mov		byte_register,command_register
	rcall	bitsender
	mov		byte_register,data_register
	rcall	bitsender
	sbi		PORTB,PB3
	ret

send_byte:
	lpm
	inc		ZL
bitsender:
	ldi		temp,$8
bitsender_loop:
	lsl		byte_register
	cbi		PORTB,PB2
	cbi		PORTB,PB0
	brcc	bitsender_skip
	sbi		PORTB,PB0
bitsender_skip:
	sbi		PORTB,PB2
	dec		temp
	brne	bitsender_loop
	ret

