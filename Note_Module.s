	#include <xc.inc>
	
extrn	SIGNAL, duty_cycle_upper
	
	
psect	udata_acs

fsharp_delay_counter:	    ds	  1

	
 psect	pwm_code, class=CODE
    

	
 
Fsharp:			    ; 740 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_FSHARP:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 FSHARP_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	FSHARP_DELAY_SEQ1
FSHARP_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	FSHARP_DELAY_SEQ1
FSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	FSHARP_DELAY_SEQ2
FSHARP_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	FSHARP_DELAY_SEQ2
	return
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

END