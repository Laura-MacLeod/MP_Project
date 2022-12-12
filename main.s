	#include <xc.inc>

;EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower, counterFsharp
EXTRN	PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL	
extrn	KEYPAD_SETUP, keypad_read_row, keypad_read_column, combine, interpret
extrn	Fsharp ;, INT_HIGH
	
psect	udata_acs
	
delay_counter1:	    ds 1
delay_counter2:	    ds 1
counterFsharp:    ds 1    ; reserve one byte for a counter variable
length:	    ds 1
store:	    ds 1

psect	udata_bank4 ; reserve data anywhere in RAM 
    
Fsharp:    ds 0x80 ; reserve 128 bytes for message data 
   

psect	data    
	; ******* myTable, data in programme memory, and its length *****
Fsharp_Table:
	db	'H','e','l','l','o',' ','W','o','r','l','d','!',0x0a
					; message, plus carriage return
	Fsharp_Table_Len   EQU	32	; length of data
   
	align	2

; MORE TABLES HERE
    
; MORE TABLES HERE
	
; MORE TABLES HERE

	
	
psect	code,abs

RST:
    
    ORG	    0x0000
    GOTO    INIT
    
INTERRUPT:	
    
    org	    0x0008	; high vector, no low vector
    goto    INT_HIGH
    
    
    org 0x100
    
    
INIT:
    CALL    PORT_INIT
    CALL    CLOCK_INIT
    CALL    TIMER_INIT
    CALL    PWM_INIT
    CALL    KEYPAD_SETUP
	
    GOTO    START
    
    
START:

	call	keypad_read_row
	call	keypad_read_column
	call	combine
	call	interpret
	
	bra	START
	


DELAY1:
	movlw	0x90		    ; 144 operations = 9us
	movwf	delay_counter1
	bra	DELAY1_SEQ
DELAY1_SEQ:
	decfsz	delay_counter1, A	; decrement until zero
	bra	DELAY1_SEQ
	return
	
DELAY2:	
	MOVLW   0X11
	MOVWF   delay_counter2, A
	
DELAY2_SEQ:
	decfsz	delay_counter2, A	; decrement until zero
	bra	DELAY2_SEQ
	
	
	return
    
    

END	RST   