	#include <xc.inc>

;EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower
EXTRN PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL	

psect	udata_acs
	
delay_count:	ds 1

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
    
    GOTO    MAIN
    
    
MAIN:

    ; Set duty cycle

    MOVLW   0xFF		; (random)
    MOVWF   duty_cycle_upper
    
    ;MOVLW   0x00111100 		;must be 0b00xx1100 
    ;MOVWF   duty_cycle_lower

    
    
    CALL	    DELAY
    
    MOVLW   0xEF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xDF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    
    CALL	    DELAY
    
    MOVLW   0xCF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xBF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xAF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x9F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x8F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x7F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x6F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x5F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x4F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x3F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x2F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x1F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x2F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x3F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x4F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x5F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL    DELAY
    
    MOVLW   0x6F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x7F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x8F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x9F		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xAF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xBF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xCF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xDF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xEF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xFF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    
    
    
    
    
    
    
    
    
   ; CALL    SIGNAL
    BRA	    MAIN

    
DELAY:	
	MOVLW   0XFF
	MOVWF   delay_count
	
	decfsz	delay_count, A	; decrement until zero
	bra	DELAY
	return
    
    

END	RST   