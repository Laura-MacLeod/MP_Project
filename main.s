	#include <xc.inc>

;EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower
EXTRN	PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL, KEYPAD_SETUP, keypad_read_row, keypad_read_column, combine, interpret	

extrn	INT_HIGH, INT_ON
	
GLOBAL	Countdown
	
psect	udata_acs
	
delay_counter1:	    ds 1
delay_counter2:	    ds 1   
length:		    ds 1
store:		    ds 1
Countdown:	    ds	1


	
	
psect	code, abs

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
    
    bsf	GIE		; Enable all interrupts
    bsf	TMR0IE		; Enable timer2 interrupt
    
    MOVLW    0x65 
    MOVWF    duty_cycle_upper 
    CALL     SIGNAL
    
 
;    CALL	INT_ON
    
    movlw   0X10
    movwf   Countdown		; Initialise countdown depending on number of samples/periods per sinusoid
    
    GOTO    MAIN
    
    MAIN:
    
;	CALL	INT_ON
    



;	
;    MOVLW   0X63	    ; 0b11111111
;    MOVWF   PR2
;    


	call	keypad_read_row
	call	keypad_read_column
	call	combine
	call	interpret
	
;	
	bra	MAIN
	

END	RST   