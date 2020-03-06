
.equ	audio_port	= PORTB
.equ	audio_bit	= PB0
.def	temp1		= r20
.def	temp2		= r21


	ldi		temp1,200
wave_loop:
	mov		temp2,temp1
// 12tc single loop from high to low
audio_loop_high:
	sbi		audio_port, audio_bit	; 2
	nop								; 1
	dec		temp2					; 1
	brne	audio_loop_high			; 1/2
	nop								; 1
	mov		temp2,temp1
audio_loop_low:
	cbi		audio_port, audio_bit	; 2
	nop								; 1
	dec		temp2					; 1
	brne	audio_loop_low			; 1/2
	nop								; 1
	rjmp	wave_loop

;  hz
; 262	C4
; 277	C#4
; 294	D4
; 311	D#4
; 330	E4
; 349	F4
; 370	F#4
; 392	G4
; 415	G#4
; 440	A4
; 466	A#4
; 494	B4
; to increment/decrement octave multiply/divide to 2
