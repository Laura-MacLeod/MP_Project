	#include <xc.inc>
	
global	A_note, Asharp, B_note, C_note, Csharp, D_note, Dsharp, E_note, F_note, Fsharp, G_note, Gsharp

	
extrn	SIGNAL, duty_cycle_upper, LCD_Send_Byte_D, LCD_Send_Byte_I

	
	
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
 
 
A_note:			    ; 220 Hz ACHIEVED
    
    MOVLW   0xC8     	  
    MOVWF   PR2		    ; Set PWM period

LOOP_A:

; ----------- COMMENTED OUT, THIS USES A SINE BUT NEW VALUES USE COSINE, BOTH WORK ----------
    

;MOVLW    0x64 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;    
;    	movlw	0x41		    ; hex for 'A' ASCII
;	movwf	letter1, A
;	
;MOVLW    0x8a 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0xab 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0xc1 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0xc8 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;	
;	movf	letter1, W, A
;	call	LCD_Send_Byte_D
;	
;MOVLW    0xc1 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0xab 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x8a 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x64 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x3e 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x1d 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x7 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x01 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x7 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x1d 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     A_DELAY 
;MOVLW    0x3e 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;
;	

    
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
    
movlw	0x41			; hex for 'A' ASCII
movwf	letter1, A   
    
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
CALL     A_DELAY 
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     A_DELAY 
    
movf	letter1, W, A
call	LCD_Send_Byte_D		; Send letter to LCD
    
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
    
    
	
RETURN


 
 A_DELAY:					; THE LONGER THE DELAY, THE LOWER THE FREQUENCY
					; BUT GETS TOO DISTORTED BELOW AROUND 0X20 DELAY FOR DELAY1 SO HIGH FREQUENCIES WORSE

	movlw	0xa5		     
	movwf	a_delay_counter, A
	bra	A_DELAY_SEQ1
A_DELAY_SEQ1:
	decfsz	a_delay_counter, A	; decrement until zero
	bra	A_DELAY_SEQ1
A_DELAY2:	
	movlw	0x02		    
	movwf	a_delay_counter, A
	bra	A_DELAY_SEQ2
A_DELAY_SEQ2:
	decfsz	a_delay_counter, A	; decrement until zero
	bra	A_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Asharp:			 
    
    MOVLW   0xC8     	    
    MOVWF   PR2		    ; Set PWM period

LOOP_ASHARP:
    
MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     ASHARP_DELAY 
    
movlw	0x41		    ; hex for 'A' ASCII
movwf	letter1, A
movlw	0x23		    ; hex for '#' ASCII
movwf	letter2, A
	
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
	
movf	letter1, W, A
call	LCD_Send_Byte_D		; Send letter to LCD
movf	letter2, W, A
call	LCD_Send_Byte_D		; Send letter to LCD
	
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


    
 ASHARP_DELAY:					

	movlw	0x8A		      
	movwf	asharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY_SEQ1:
	decfsz	asharp_delay_counter, A	; decrement until zero
	bra	ASHARP_DELAY_SEQ1
ASHARP_DELAY2:	
	movlw	0x02		  
	movwf	asharp_delay_counter, A
	bra	ASHARP_DELAY_SEQ2
ASHARP_DELAY_SEQ2:
	decfsz	asharp_delay_counter, A	; decrement until zero
	bra	ASHARP_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
B_note:			   
    
    MOVLW   0xC8     
    MOVWF   PR2		    ; Set PWM period

LOOP_B:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     B_DELAY 
    
movlw	 0x42		    ; hex for 'B' ASCII
movwf	 letter1, A
    
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

movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
    
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


    
 B_DELAY:				

	movlw	0x90		    
	movwf	b_delay_counter, A
	bra	B_DELAY_SEQ1
B_DELAY_SEQ1:
	decfsz	b_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ1
B_DELAY2:	
	movlw	0x02		  
	movwf	b_delay_counter, A
	bra	B_DELAY_SEQ2
B_DELAY_SEQ2:
	decfsz	b_delay_counter, A	; decrement until zero
	bra	B_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
C_note:			    
    
    MOVLW   0xC8     
    MOVWF   PR2		    ; Set PWM period

LOOP_C:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     C_DELAY 
    
movlw	 0x43		    ; hex for 'C' ASCII
movwf	 letter1, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
    
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


    
 C_DELAY:				

	movlw	0x85		       
	movwf	c_delay_counter, A
	bra	C_DELAY_SEQ1
C_DELAY_SEQ1:
	decfsz	c_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ1
C_DELAY2:	
	movlw	0x02		   
	movwf	c_delay_counter, A
	bra	C_DELAY_SEQ2
C_DELAY_SEQ2:
	decfsz	c_delay_counter, A	; decrement until zero
	bra	C_DELAY_SEQ2
	return
 

	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Csharp:			    
    
    MOVLW   0xC8   
    MOVWF   PR2		    ; Set PWM period

LOOP_CSHARP:
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     CSHARP_DELAY 
    
movlw	 0x43		    ; hex for 'C' ASCII
movwf	 letter1, A
movlw	 0x23		    ; hex for '#' ASCII
movwf	 letter2, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
movf	 letter2, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
    
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


    
 CSHARP_DELAY:					

	movlw	0x6c	
	movwf	csharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY_SEQ1:
	decfsz	csharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ1
CSHARP_DELAY2:	
	movlw	0x02		
	movwf	csharp_delay_counter, A
	bra	CSHARP_DELAY_SEQ2
CSHARP_DELAY_SEQ2:
	decfsz	csharp_delay_counter, A	; decrement until zero
	bra	CSHARP_DELAY_SEQ2
	return
 

	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
D_note:			
    
    MOVLW   0xC8     
    MOVWF   PR2		    ; Set PWM period

LOOP_D:
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     D_DELAY 
    
movlw	 0x44		    ; hex for 'D' ASCII
movwf	 letter1, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
 
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


    
 D_DELAY:				

	movlw	0x73		      
	movwf	d_delay_counter, A
	bra	D_DELAY_SEQ1
D_DELAY_SEQ1:
	decfsz	d_delay_counter, A	; decrement until zero
	bra	D_DELAY_SEQ1
D_DELAY2:	
	movlw	0x02		    
	movwf	d_delay_counter, A
	bra	D_DELAY_SEQ2
D_DELAY_SEQ2:
	decfsz	d_delay_counter, A	; decrement until zero
	bra	D_DELAY_SEQ2
	return
 
	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Dsharp:			 
    
    MOVLW   0xC8   
    MOVWF   PR2		    ; Set PWM period

LOOP_DSHARP:
    
    

MOVLW    0x63 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     DSHARP_DELAY 
    
movlw	 0x44		    ; hex for 'D' ASCII
movwf	 letter1, A
movlw	 0x23		    ; hex for '#' ASCII
movwf	 letter2, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
movf	 letter2, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
    
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


    
 DSHARP_DELAY:			

	movlw	0x5B		    
	movwf	dsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY_SEQ1:
	decfsz	dsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ1
DSHARP_DELAY2:	
	movlw	0x02		  
	movwf	dsharp_delay_counter, A
	bra	DSHARP_DELAY_SEQ2
DSHARP_DELAY_SEQ2:
	decfsz	dsharp_delay_counter, A	; decrement until zero
	bra	DSHARP_DELAY_SEQ2
	return
 

	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
E_note:			 
    
    MOVLW   0xC8
    MOVWF   PR2		    ; Set PWM period

LOOP_E:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     E_DELAY 
    
movlw	 0x45		    ; hex for 'E' ASCII
movwf	 letter1, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
    
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


    
 E_DELAY:				

	movlw	0x63		   
	movwf	e_delay_counter, A
	bra	E_DELAY_SEQ1
E_DELAY_SEQ1:
	decfsz	e_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ1
E_DELAY2:	
	movlw	0x02		  
	movwf	e_delay_counter, A
	bra	E_DELAY_SEQ2
E_DELAY_SEQ2:
	decfsz	e_delay_counter, A	; decrement until zero
	bra	E_DELAY_SEQ2
	return
 
	

	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
F_note:			  
    
    MOVLW   0xC8   
    MOVWF   PR2		    ; Set PWM period

LOOP_F:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     F_DELAY 
    
movlw	 0x46		    ; hex for 'F' ASCII
movwf	 letter1, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
    
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


    
 F_DELAY:				

	movlw	0x5B		     
	movwf	f_delay_counter, A
	bra	F_DELAY_SEQ1
F_DELAY_SEQ1:
	decfsz	f_delay_counter, A	; decrement until zero
	bra	F_DELAY_SEQ1
F_DELAY2:	
	movlw	0x02		   
	movwf	f_delay_counter, A
	bra	F_DELAY_SEQ2
F_DELAY_SEQ2:
	decfsz	f_delay_counter, A	; decrement until zero
	bra	F_DELAY_SEQ2
	return
 
	

	
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Fsharp:			   
    
    MOVLW   0xC8
    MOVWF   PR2		    ; Set PWM period

LOOP_FSHARP:
    
    

MOVLW    0x64 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     FSHARP_DELAY 
    
movlw	 0x46		    ; hex for 'F' ASCII
movwf	 letter1, A
movlw	 0x23		    ; hex for '#' ASCII
movwf	 letter2, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD
movf	 letter2, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
    
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


    
 FSHARP_DELAY:				

	movlw	0x44		   
	movwf	fsharp_delay_counter, A
	bra	FSHARP_DELAY_SEQ1
FSHARP_DELAY_SEQ1:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	FSHARP_DELAY_SEQ1
FSHARP_DELAY2:	
	movlw	0x02		   
	movwf	fsharp_delay_counter, A
	bra	FSHARP_DELAY_SEQ2
FSHARP_DELAY_SEQ2:
	decfsz	fsharp_delay_counter, A	; decrement until zero
	bra	FSHARP_DELAY_SEQ2
	return
 
	

	
		
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
G_note:		
    
    MOVLW   0xff	    
    MOVWF   PR2		    ; Set PWM period

LOOP_G:
    
    

MOVLW    0x68 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     G_DELAY 
    
movlw	 0x47		    ; hex for 'G' ASCII
movwf	 letter1, A
    
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
    
movf	 letter1, W, A
call	 LCD_Send_Byte_D		; Send letter to LCD    
    
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

RETURN			


    
 G_DELAY:					
					
	movlw	0x37		       
	movwf	g_delay_counter, A			
G_DELAY_SEQ1:
	decfsz	g_delay_counter, A	; decrement until zero	 
	bra	G_DELAY_SEQ1					   	    ;2*1*delay_val = num of ops
G_DELAY2:	
	movlw	0x1a		   	  
	movwf	g_delay_counter, A				  
G_DELAY_SEQ2:
	decfsz	g_delay_counter, A	; decrement until zero	   
	bra	G_DELAY_SEQ2					   	    ;2*1*delay_val = num of ops
	return							  
 
	; total ops = 2 + 2*val1 + 2 + 2*val2 + 2 + 2*val3 + 1 = 7 + 2*val1 + 2*val2 + 2*val3
	
	; total ops to whole programme is 384 ops or 24us
	
	;with 16 samples and frequency 600Hz. PWM period is 0.104ms = 104us = 1664 ops
	
	;need 1280 extra ops so val2 = (1280 - 7 - 2*255 - 2*255)/2 = 127 = 0x7f for val3 and 0xff for vals 1,2
		
		
		
	
;---------------------------------------------------------------------------------------------------------------------------------
	
	
	
Gsharp:			   
    
    MOVLW   0xF2   
    MOVWF   PR2		    ; Set PWM period

LOOP_GSHARP:

; ----------- COMMENTED OUT, THIS USES A SINE BUT NEW VALUES USE COSINE, BOTH WORK ----------

;MOVLW    0x79 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL
;    
;movlw	0x47		    ; hex for 'G' ASCII
;movwf	letter1, A
;movlw	0x23		    ; hex for '#' ASCII
;movwf	letter2, A
;    
;MOVLW    0xc0 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0xed 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0xed 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0xc0 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;	
;MOVLW    0x79 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;	
;movf	letter1, W, A
;call	LCD_Send_Byte_D
;movf	letter2, W, A
;call	LCD_Send_Byte_D	
;	
;MOVLW    0x32 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0x6 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0x6 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
;CALL     GSHARP_DELAY 
;MOVLW    0x32 
;MOVWF    duty_cycle_upper 
;CALL     SIGNAL 
	
	
	
	
MOVLW    0x0 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
	
movlw	0x47		    ; hex for 'G' ASCII
movwf	letter1, A
movlw	0x23		    ; hex for '#' ASCII
movwf	letter2, A

	
MOVLW    0x17 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0x54 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0x9f 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0xdb 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
MOVLW    0xf3 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
	
movf	letter1, W, A
call	LCD_Send_Byte_D		; Send letter to LCD
movf	letter2, W, A
call	LCD_Send_Byte_D		; Send letter to LCD		
	
MOVLW    0xdb 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0x9f 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0x54 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
CALL     GSHARP_DELAY
MOVLW    0x17 
MOVWF    duty_cycle_upper 
CALL     SIGNAL 
	
RETURN


    
 GSHARP_DELAY:					

	movlw	0x7d		     
	movwf	gsharp_delay_counter, A
	bra	GSHARP_DELAY_SEQ1
GSHARP_DELAY_SEQ1:
	decfsz	gsharp_delay_counter, A	; decrement until zero
	bra	GSHARP_DELAY_SEQ1
GSHARP_DELAY2:	
	movlw	0x02		
	movwf	gsharp_delay_counter, A
	bra	GSHARP_DELAY_SEQ2
GSHARP_DELAY_SEQ2:
	decfsz	gsharp_delay_counter, A	; decrement until zero
	bra	GSHARP_DELAY_SEQ2
	return
 
	

END
