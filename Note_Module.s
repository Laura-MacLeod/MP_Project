	#include <xc.inc>
	
global	A_note, Asharp, B_note, C_note, Csharp, D_note, Dsharp, E_note, F_note, Fsharp, G_note, Gsharp

	
extrn	SIGNAL, duty_cycle_upper, LCD_Send_Byte_D

	
	
psect	udata_acs
a_delay_counter:	    ds	  1
asharp_delay_counter:	    ds	  1
b_delay_counter:	    ds	  1
c_delay_counter:	    ds	  1
csharp_delay_counter:	    ds	  1
d_delay_counter:	    ds	  1
dsharp_delay_counter:	    ds	  1
e_delay_counter:	    ds	  1
f_delay_counter:	    ds	  1
fsharp_delay_counter:	    ds	  1
g_delay_counter:	    ds	  1
gsharp_delay_counter:	    ds	  1
letter1:	ds	1
letter2:	ds	1

	
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
	movwf	a_delay_counter, A
	bra	A_DELAY_SEQ1
A_DELAY_SEQ1:
	decfsz	a_delay_counter, A	; decrement until zero
	bra	A_DELAY_SEQ1
A_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	a_delay_counter, A
	bra	A_DELAY_SEQ2
A_DELAY_SEQ2:
	decfsz	a_delay_counter, A	; decrement until zero
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
	movwf	asharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY_SEQ1:
	decfsz	asharp_delay_counter, A	; decrement until zero
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	asharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ2
ASHARP_DELAY_SEQ2:
	decfsz	asharp_delay_counter, A	; decrement until zero
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

	movlw	0xAA		       ; 144 operations = 9us
	movwf	b_delay_counter, A
	bra	B_DELAY_SEQ1
B_DELAY_SEQ1:
	decfsz	b_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ1
B_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	b_delay_counter, A
	bra	B_DELAY_SEQ2
B_DELAY_SEQ2:
	decfsz	b_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ2
	return
 
	; CURRENTLY 230 HZ
	
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
	movwf	c_delay_counter, A
	bra	C_DELAY_SEQ1
C_DELAY_SEQ1:
	decfsz	c_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ1
C_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	c_delay_counter, A
	bra	C_DELAY_SEQ2
C_DELAY_SEQ2:
	decfsz	c_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ2
	return
 
	; CURRENTLY 255HZ
	
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

	movlw	0x8A		       ; 144 operations = 9us
	movwf	csharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY_SEQ1:
	decfsz	csharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	csharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ2
CSHARP_DELAY_SEQ2:
	decfsz	csharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ2
	return
 
	; CURRENTLY 280 Hz
	
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

	movlw	0x7A		       ; 144 operations = 9us
	movwf	d_delay_counter, A
	bra	D_DELAY_SEQ1
D_DELAY_SEQ1:
	decfsz	d_delay_counter, A	; decrement until zero
	bra	D_DELAY_SEQ1
D_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	d_delay_counter, A
	bra	D_DELAY_SEQ2
D_DELAY_SEQ2:
	decfsz	d_delay_counter, A	; decrement until zero
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

	movlw	0x6A		       ; 144 operations = 9us
	movwf	dsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY_SEQ1:
	decfsz	dsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	dsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ2
DSHARP_DELAY_SEQ2:
	decfsz	dsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ2
	return
 
	;CURRENTLY 307 HZ
	
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

	movlw	0x61		       ; 144 operations = 9us
	movwf	e_delay_counter, A
	bra	E_DELAY_SEQ1
E_DELAY_SEQ1:
	decfsz	e_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ1
E_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	e_delay_counter, A
	bra	E_DELAY_SEQ2
E_DELAY_SEQ2:
	decfsz	e_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ2
	return
 
	
	; CURRENTLY 355 HZ
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
F_note:			    ; 622.25 Hz
    
    MOVLW   0xC8     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_F:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0xc1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0xab 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x8a 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x7 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x1d 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
MOVLW    0x3e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 F_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x54		       ; 144 operations = 9us
	movwf	f_delay_counter, A
	bra	F_DELAY_SEQ1
F_DELAY_SEQ1:
	decfsz	f_delay_counter, A	; decrement until zero
	bra	F_DELAY_SEQ1
F_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	f_delay_counter, A
	bra	F_DELAY_SEQ2
F_DELAY_SEQ2:
	decfsz	f_delay_counter, A	; decrement until zero
	bra	F_DELAY_SEQ2
	return
 
	
	; CURRENTLY 420 HZ
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Fsharp:			    ; 622.25 Hz
    
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

	movlw	0x4A		       ; 144 operations = 9us
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
 
	
	; CURRENTLY 471 HZ
	
		
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
G_note:			    ; 622.25 Hz	    ; 1 op
    
    MOVLW   0xff			    ; 1 op	    
    MOVWF   PR2				    ; 1 op

LOOP_G:
    
    

MOVLW    0x68 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x90 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0xb1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0xd0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0xc8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0xb1 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x90 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x68 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x40 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x1e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x8 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x1e 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
MOVLW    0x40 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN			    ; 1 op


    
 G_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE
					
	movlw	0x1a		       ; 144 operations = 9us	    ;1 op
	movwf	g_delay_counter, A				    ;1 op
G_DELAY_SEQ1:
	decfsz	g_delay_counter, A	; decrement until zero	    ;1 op
	bra	G_DELAY_SEQ1					    ;1 op	    2*1*delay_val = num of ops
G_DELAY2:	
	movlw	0x1a		    ; 144 operations = 9us	    ;1 op
	movwf	g_delay_counter, A				    ;1 op
G_DELAY_SEQ2:
	decfsz	g_delay_counter, A	; decrement until zero	    ;1 op
	bra	G_DELAY_SEQ2					    ;1 op	    2*1*delay_val = num of ops
	return							    ;1 op
 
	; total ops = 2 + 2*val1 + 2 + 2*val2 + 2 + 2*val3 + 1 = 7 + 2*val1 + 2*val2 + 2*val3
	
	; total ops to whole programme is 384 ops or 24us
	
	;with 16 samples and frequency 600Hz. PWM period is 0.104ms = 104us = 1664 ops
	
	;need 1280 extra ops so val2 = (1280 - 7 - 2*255 - 2*255)/2 = 127 = 0x7f for val3 and 0xff for vals 1,2
		
		
		;  FREQ CURRENTLY 640HZ
		
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Gsharp:			    ; 622.25 Hz
    
    MOVLW   0xF2     	    ; 1 op
    MOVWF   PR2		    ; 1 op

LOOP_GSHARP:
    

MOVLW    0x79 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

    
	movlw	0x47		    ; hex for 'G' ASCII
	movwf	letter1, A
	movlw	0x23		    ; hex for '#' ASCII
	movwf	letter2, A
    
    
MOVLW    0xc0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0xed 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0xed 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0xc0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

    
movf	letter1, W, A
call	LCD_Send_Byte_D
movf	letter2, W, A
call	LCD_Send_Byte_D
    
    
MOVLW    0x79 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0x32 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0x6 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0x6 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY 
MOVLW    0x32 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 

RETURN


    
 GSHARP_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0x3F		       ; 144 operations = 9us
	movwf	gsharp_delay_counter, A
	bra	GSHARP_DELAY_SEQ1
GSHARP_DELAY_SEQ1:
	decfsz	gsharp_delay_counter, A	; decrement until zero
	bra	GSHARP_DELAY_SEQ1
GSHARP_DELAY2:	
	movlw	0x02		    ; 144 operations = 9us
	movwf	gsharp_delay_counter, A
	bra	GSHARP_DELAY_SEQ2
GSHARP_DELAY_SEQ2:
	decfsz	gsharp_delay_counter, A	; decrement until zero
	bra	GSHARP_DELAY_SEQ2
	return
 
	
	
	
	; CURRENTLY 820HZ ISH, BUT SOUNDS BAD
	
	
	
	
	
	
	

END