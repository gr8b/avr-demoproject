;
; 8bit power
;
;

.cseg
.nolist
	.include "attiny12.asm"
	.include "woodpecker.macro.asm"
.list



; Magic starts here.
start:
	send_data	smile, $8


; Magic ends here




.nolist
	.include "woodpecker.asm"
.list

.dseg
; bytes to be sent.
smile:	.db 0b00100000, 0b01001110, 0b10001110, 0b10000000, 0b10000000, 0b10001110, 0b01001110, 0b00100000
