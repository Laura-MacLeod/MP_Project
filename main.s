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

    ;MOVLW   0xFF		; (random)
    ;MOVWF   duty_cycle_upper
    
    ;MOVLW   0x00111100 		;must be 0b00xx1100 
    ;MOVWF   duty_cycle_lower

    
    
    CALL	    DELAY
    
    MOVLW   0xA		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xC		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    
    CALL	    DELAY
    
    MOVLW   0xD		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xE
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xF		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xE		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xD		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xC		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xA		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x8		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x6		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x5		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x4		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x3		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x2		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x1		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL    DELAY
    
    MOVLW   0x1		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x1		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x2		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x3		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x4		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x5		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
   
    MOVLW   0x7		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0x9		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xA		
    MOVWF   duty_cycle_upper
    CALL    SIGNAL
    
    CALL	    DELAY
    
    MOVLW   0xA		
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