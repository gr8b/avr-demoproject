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
	cbi		PORTB,cs				;	digitalWrite(MAX7219::cs, LOW);
	mov		byte_register,command_register
	rcall	write_byte				;	put(command_register)
	mov		byte_register,data_register
	rcall	write_byte				;	put(data_register)
	sbi		PORTB,cs				;	digitalWrite(MAX7219::cs, HIGH);
	cbi		PORTB,clk				;	digitalWrite(MAX7219::clk, LOW);
	ret

write_byte:							; put(data)
	ldi		temp,8					;	for(i = 0; i < 8; i++)
write_byte_loop:					;	{
	cbi		PORTB,clk				;		digitalWrite(MAX7219::clk, LOW);
	lsl		byte_register			;		(data & 0x80) ? HIGH : LOW
	brcs	write_high				;
	cbi		PORTB,din				;		digitalWrite(MAX7219::din, LOW);
	rjmp	write_low				;
write_high:							;
	sbi		PORTB,din				;		digitalWrite(MAX7219::din, HIGH);
write_low:							;
	sbi		PORTB,clk				;		digitalWrite(MAX7219::clk, HIGH);
	dec		temp

	nop
	nop
	nop

	brne	write_byte_loop			;	}
	ret

