;
; 8bit power
;
;

.cseg
.nolist
	.include "attiny12.asm"
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
	

; Magic starts here.
start:
	send_command	SCAN_LIMIT, 7
	send_command	MODE_DECODE, 0
	send_command	MODE_SHUTDOWN, 1
	send_command	MODE_TEST, 0
	send_command	INTENSITY, 0
	send_data		image_data, 8


end:
	rjmp	end
; Magic ends here

	.include "portbsender.asm"


; image sprite 8x8 pixels
image_data:	.db 0b00100000, 0b01001110, 0b10001110, 0b10000000, 0b10000000, 0b10001110, 0b01001110, 0b00100000
