	#include <xc.inc>
	
global	A_note, Asharp, B_note, C_note, Csharp, D_note, Dsharp, E_note

	
extrn	SIGNAL, duty_cycle_upper

	
	
psect	udata_acs

fsharp_delay_counter:	    ds	  1

	
 psect	pwm_code, class=CODE
    

;---------------------------------------------------------------------------------------------------------------------------------
 
 
A_note:			    ; 440 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_A:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 A_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x4f		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	A_DELAY_SEQ1
A_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	A_DELAY_SEQ1
A_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	A_DELAY_SEQ2
A_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	A_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Asharp:			    ; 466.16 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_ASHARP:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 ASHARP_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x4A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ2
ASHARP_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	ASHARP_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
B_note:			    ; 493.88 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_B:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 B_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	B_DELAY_SEQ1
B_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ1
B_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	B_DELAY_SEQ2
B_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
C_note:			    ; 523.25 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_C:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 C_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	C_DELAY_SEQ1
C_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ1
C_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	C_DELAY_SEQ2
C_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Csharp:			    ; 554.37 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_CSHARP:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 CSHARP_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ2
CSHARP_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
D_note:			    ; 587.33 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_D:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 D_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	D_DELAY_SEQ1
D_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	D_DELAY_SEQ1
D_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	D_DELAY_SEQ2
D_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	D_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Dsharp:			    ; 622.25 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_DSHARP:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 DSHARP_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ2
DSHARP_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
E_note:			    ; 659.25 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_E:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 E_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x9A		       ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	E_DELAY_SEQ1
E_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ1
E_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	fsharp_delay_counter, A
	bra	E_DELAY_SEQ2
E_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
	
		
	
		
		
	
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	

END