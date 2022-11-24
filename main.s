	#include <xc.inc>

psect	code, abs
	
	
main:
    goto buzzer
buzzer:
    movlw   0x0		;SETTING PERIOD BY WRITING TO PR2
    movwf   PR2
    movlw   0x0		;SETTING DUTY CYCLE BY WRITING TO CCPR4L
    movwf   CCPR4L
    movlw   0x0F	;SETTING DUTY CYCLE
    movwf   CCP4CON 
    movlw   0x00
    movf    TRISG	;CLEAR TRIS BIT, MAKE CCP4 AN OUTPUT
    movlw   0xff
    movwf   TMR2
    movlw   0xff
    movwf   T2CON
    bra	    buzzer
    

    
    end main


