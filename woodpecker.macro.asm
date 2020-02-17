.def	data_loop_register		=	r28



; -----------------------------------------------
; this macro allow to send data
;	$0	data address in memory
;	$1	bytes to be sent
; -----------------------------------------------
;	send_data	bytes_data_address, bytes_count
; -----------------------------------------------
.macro	send_data
	ldi		ZL,low(@0*2)
	ldi  	ZH,high(@0*2)
	ldi		data_loop_register,@1
send_data_loop:
	rcall	send_byte
	dec		data_loop_register
	brne	send_data_loop
.endmacro
