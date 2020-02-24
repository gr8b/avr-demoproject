; Bojarre special edition.
; ATTiny12 8bit power!


.equ	din		= PB2
.equ	clk		= PB3
.equ	cs		= PB4
.def	temp				= r23
.def	byte_register		= r0
.def	command_register	= r16
.def	data_register		= r17



write:
	cbi		PORTB,cs
	mov		byte_register,command_register
	rcall	write_byte
	mov		byte_register,data_register
	rcall	write_byte
	sbi		PORTB,cs
	cbi		PORTB,clk
	ret

write_byte:
	ldi		temp,8
write_byte_loop:
	cbi		PORTB,clk
	lsl		byte_register
	cbi		PORTB,din
	brcc	write_byte_skip
	sbi		PORTB,din
write_byte_skip:
	sbi		PORTB,clk
	dec		temp
	brne	write_byte_loop
	ret

