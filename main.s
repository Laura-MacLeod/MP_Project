	#include <xc.inc>

EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower
	
psect	code
	
RST:
    
    ORG	    0x00
    GOTO    INIT
    
    
INIT:
    
    CALL    PORT_INIT
    CALL    CLOCK_INIT
    CALL    TIMER_INIT
    CALL    PWM_INIT
    
    GOTO    MAIN
    
    
MAIN:
    
    ; Set duty cycle

    MOVLW   0x0F		; (random)
    MOVWF   duty_cycle_upper
    
    MOVLW   0x00111100 		;must be 0b00xx1100 
    MOVWF   duty_cycle_lower
	
    BRA	    MAIN
	
	
