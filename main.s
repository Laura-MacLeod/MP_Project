#include <xc.inc>

psect	buzzer_data   ; reserve data space in access ram
temp1:    ds 1    ; reserve one byte
	
psect	code, abs

	
	
	;CURRENTLY SET FOR CCP6, WHICH IS CONNECTED TO RE6 PIN


	
main:
    goto buzzer_loop
buzzer_loop:
    
    movlw   0xF9		;SETTING PERIOD BY WRITING TO PR2
    movwf   PR2
    
    ; PWM duty cycle = 10 bit value (CCPR1L:CCP1CON<5:4>) * TOSC * (TMR2 Prescale Value)
    
    movlw   0x3E    	;SETTING DUTY CYCLE BY WRITING TO CCPR4L
    movwf   CCPR6L	; CCPR4L is 8 MSBs of duty cycle
    
    movlw   0x1C	;SETTING DUTY CYCLE
    movwf   CCP6CON	; CCP4CON register bits 7-6 are 0, bits 5-4 are LSBs of duty cycle
			; bits 3-0 are 11xx (try 1100, 0x0C) for PWM mode
    movlw   0x00
    movf    TRISE	;CLEAR TRIS BIT, MAKE PORT AN OUTPUT
    
    movlw   0x00
    movwf   TMR2	; SET TIMER TO 0?
    
    movlw   0x01
    movwf   T2CON	; prescaler = 4?
    
    movff   T2CON, temp1
    movlw   0x04
    xorwf   temp1, W		; OR OPERATION, I THINK THIS TOGGLES THE PRESCALER OR SOMETHING?
    movff   temp1, T2CON
    
    bra	    buzzer_loop		; LOOP
    

    
    end main


