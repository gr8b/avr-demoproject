;
; 8bit power
;
;

.cseg
.nolist
	.include "tn12def.inc"
	.include "macro.asm"
.list

	.org	0
		rjmp RESET ; Reset handler
;		rjmp EXT_INT0 ; IRQ0 handler
;		rjmp PIN_CHANGE ; Pin change handler
;		rjmp TIM0_OVF ; Timer0 overflow handler
;		rjmp ANA_COMP ; Analog Comparator handler

	.org	0x60
RESET:
	; set PORTB pins to output
	ser		r29
	out		DDRB,r29
	wait


; Magic starts here.
start:
	cbi				PORTB,clk	// digitalWrite(MAX7219::clk, LOW);

	send_command	0x09, 0x00	// Decode mode: led matrix
	send_command	0x0a, 0x08	// Intensity 50%
	send_command	0x0b, 0x07	// Scan limit
	send_command	0x0c, 0x01	// Shutdown mode: no
	send_command	0x0f, 0x00	// Display test: no

	send_data		image_data, 8
/*
	ldi		ZL,low(test_data*2)
	ldi  	ZH,high(test_data*2)
	ldi		data_loop_register,8
	ldi		data_loop_index_register,1
send_data_loop:
	mov		byte_register,data_loop_index_register
	rcall	write_byte
	lpm
	inc		ZL
	rcall	write_byte
	inc		data_loop_index_register
	dec		data_loop_register
	brne	send_data_loop
*/

end:
	rjmp	end
; Magic ends here

	.include "portbsender.asm"


; image sprite 8x8 pixels
image_data:	.db 0b00100000, 0b01001110, 0b10001110, 0b10000000, 0b10000000, 0b10001110, 0b01001110, 0b00100000
