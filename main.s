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

    
    
MOVLW   111011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1000100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1100011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1010100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   11011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   0 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   11011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1010100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110111 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1100010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1000100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   111011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1001 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   110011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101001 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1001100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   0 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   100011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1011100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110111 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1011011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   100010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   0 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1001101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101000 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   110010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   111100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110001 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1000011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1100011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110110 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1010011 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   11010 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   0 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   11100 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1010101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1110111 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1100001 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   101001 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   10 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1111 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 

 

MOVLW   1000101 

MOVWF   duty_cycle_upper 

 

CALL    SIGNAL 

CALL     DELAY 
    
    
    
    
    
    
;    
;    
;    
;   CALL	    DELAY
;    
;MOVLW   0xA
;MOVWF   duty_cycle_upper
;CALL    SIGNAL
;    
;CALL	DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xC		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xD		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xE
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xE		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xD		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xC		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x8		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x6		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x5		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x4		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x3		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x2		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x2		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x3		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x4		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x5		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x7		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x9		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    
;    
;    
    
    
    
    
    
    
   ; CALL    SIGNAL
    BRA	    MAIN

    
DELAY:	
	MOVLW   0XF
	MOVWF   delay_count, A
	
DELAY2:
	decfsz	delay_count, A	; decrement until zero
	bra	DELAY2
	
	
	return
    
    

END	RST   