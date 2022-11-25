#include <xc.inc>
	
global	buzzer


	
	;THIS IS A GIT TEST
	
psect	buzzer_code, class=CODE

buzzer:
    movlw   0xF9		;SETTING PERIOD BY WRITING TO PR2
    movwf   PR2
    
    ; PWM duty cycle = 10 bit value (CCPR1L:CCP1CON<5:4>) * TOSC * (TMR2 Prescale Value)
    
    movlw   0x3E    	;SETTING DUTY CYCLE BY WRITING TO CCPR4L
    movwf   CCPR4L	; CCPR4L is 8 MSBs of duty cycle
    
    movlw   0x1C	;SETTING DUTY CYCLE
    movwf   CCP4CON	; CCP4CON register bits 7-6 are 0, bits 5-4 are LSBs of duty cycle
			; bits 3-0 are 11xx (try 1100, 0x0C) for PWM mode
    movlw   0x00
    movf    TRISG	;CLEAR TRIS BIT, MAKE CCP4 AN OUTPUT
    
    movlw   0x00
    movwf   TMR2
    
    movlw   0x04
    movwf   T2CON
    
    bra	    buzzer
    return

    
    end


