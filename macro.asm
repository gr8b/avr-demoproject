.def	data_loop_register		=	r28
.def	data_loop_index_register =	r27
; commands definition.
.equ	scan_limit		= 0x00
.equ	decode_mode		= 0x02
.equ	shutdown_mode	= 0x04
.equ	test_mode		= 0x06
.equ	intensity		= 0x08


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
; -----------------------------------------------
;	send_command	test_mode
; -----------------------------------------------
.macro	send_command
	ldi		data_loop_register,@0
	mov		byte_register,data_loop_register
	rcall	send_command_word
.endmacro
