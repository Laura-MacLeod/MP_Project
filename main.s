#include <xc.inc>

psect	buzzer_data   ; reserve data space in access ram
temp1:    ds 1    ; reserve one byte
	
psect	code, abs

	
	
	;CURRENTLY SET FOR CCP6, WHICH IS CONNECTED TO RE6 PIN
	
	;LOOKING AT VIDEO https://www.youtube.com/watch?v=PVX3dtIptKA (WHICH USES ECCP!): 
	;MAY NEED PSTRxCON SO: PxA pin has the PWM waveform with polarity control from CCPxM<1:0>
	;MAY NEED TO CLEAR CCPTMRS0 REGISTER SINCE 2LSBs AT 00 MEAN ECCP1 is based off of TMR1/TMR2
	


	
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
			; bits 7-6 put it in single output mode, bits 5-4 give duty cycle values, bits 3-0 put it in PWM mode
			; may need ECCP so bits 1-0 can be specified as 00 which is PWM mode: PxA and PxC are active-high; PxB and PxD are active-high?
    movlw   0x00
    movf    TRISE	;CLEAR TRIS BIT, MAKE PORT AN OUTPUT
    
    movlw   0x00
    movwf   TMR2	; SET TIMER TO 0?
    
    movlw   0x01
    movwf   T2CON	; prescaler = 4, timer2 is OFF
    
    movff   T2CON, temp1
    movlw   0x04
    iorwf   temp1, W		; OR OPERATION, I THINK THIS TOGGLES THE PRESCALER OR SOMETHING?
    				; THIS OR OPERATION BETWEEN 0x01 AND 0x04 GIVES 0x05. THIS IS CORRECT - 0x05 SETS TIMER ON WITH PRESCALER 4
    movff   temp1, T2CON
    
    bra	    buzzer_loop		; LOOP
    

    
    end main


