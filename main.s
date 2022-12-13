	#include <xc.inc>

;EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower
EXTRN	PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL	
extrn	keypad_setup, keypad_read_row, keypad_read_column, combine, interpret
psect	udata_acs
	
delay_counter1:	    ds 1
delay_counter2:	    ds 1
counter:    ds 1    ; reserve one byte for a counter variable
length:	    ds 1
store:	    ds 1


; GIT TEST
	
psect	code,abs

	
RST:
    
    ORG	    0x00
    GOTO    INIT
    
    
    
    
    
    
    org 0x100
INIT:
    CALL    PORT_INIT
    CALL    CLOCK_INIT
    CALL    TIMER_INIT
    CALL    PWM_INIT
    CALL    keypad_setup
    
    GOTO    start
    
start:
	call	keypad_read_row
	call	keypad_read_column
	call	combine
	call	interpret
	
	bra	start
	


DELAY1:
	movlw	0x90		    ; 144 operations = 9us
	movwf	delay_counter1, A
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