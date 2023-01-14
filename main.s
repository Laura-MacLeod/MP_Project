	#include <xc.inc>

EXTRN	PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL, LCD_Setup	
extrn	keypad_setup, keypad_read_row, keypad_read_column, combine, interpret

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
    CALL    LCD_Setup
	
    GOTO    start
    
    
start:

	call	keypad_read_row		
	call	keypad_read_column	    
	call	combine		    ; Combine values read from keypad into characteristic byte for specific key

	call	interpret	    ; Interpret input from keypad, including varying correct duty cycles for one period of output sinusoid  

	bra	start			  

	return
    
    

END	RST   
