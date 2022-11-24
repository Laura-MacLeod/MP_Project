	#include <xc.inc>

extrn	buzzer
	
psect	code, abs
	
	;THIS IS A GIT TEST


	
main:
    goto buzzer_loop
buzzer_loop:
    call buzzer
    

    
    end main


