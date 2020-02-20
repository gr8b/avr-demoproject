.def	data_loop_register		=	r25
.def	data_loop_index_register =	r24

.equ	SCAN_LIMIT		= 0x0b
.equ	MODE_DECODE		= 0x09
.equ	MODE_SHUTDOWN	= 0x0c
.equ	MODE_TEST		= 0x0f
.equ	INTENSITY		= 0x0a

; -----------------------------------------------
; send bytes:
;	@0	data address in memory
;	@1	bytes to be sent
; -----------------------------------------------
;	send_data	bytes_data_address, bytes_count
; -----------------------------------------------
.macro	send_data
	ldi		ZL,low(@0*2)
	ldi  	ZH,high(@0*2)
	ldi		data_loop_register,@1
	ldi		data_loop_index_register,1
send_data_loop:
	mov		byte_register,data_loop_index_register
	rcall	bitsender
	rcall	send_byte
	inc		data_loop_index_register
	dec		data_loop_register
	brne	send_data_loop
.endmacro

; -----------------------------------------------
; send command:
;	@0	commant to be sent
;	@1	command argument
; -----------------------------------------------
;	send_command	SCAN_LIMIT,	10
; -----------------------------------------------
.macro	send_command
	ldi		command_register,@0
	ldi		data_register,@1
	rcall	send_word
.endmacro
