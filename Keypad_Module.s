	#include <xc.inc>
	

global	Fsharp
global  KEYPAD_SETUP, keypad_read_row, keypad_read_column, combine, interpret
extrn	SIGNAL, duty_cycle_upper
psect	udata_acs
delay_count:	ds 1
row:	    ds    1	    ; reserve 1 byte for variable UART_counter
column:	    ds    1
value:	    ds	  1
rowvals:    ds	  1
columnvals: ds	  1
delay_counter:	    ds	  1
compare_value:	    ds	  1
	
 psect	pwm_code, class=CODE
    

 
 
 KEYPAD_SETUP:
	movlb	15	    ;go to BSR 15
	bsf	REPU	    ;set pullup resistors high
	movlb	0	    ;return t0 access bank
	
	clrf	LATE
	clrf    TRISE
	return
	
	
	
keypad_read_row:
    
	movlw   0xf0
	movwf   TRISE
	
	call	delay_seq  

	movf	PORTE, W
	movff	PORTE, row
	
	movlw	0xf0	    
	cpfseq	row	;Compare keypad inputs to 00001111, if the same, skip
	movff   row, rowvals	;Stores value at row
	return			;Doesn't store value

keypad_read_column:		    ; 1 op

	movlw   0x0f		    ; 1 op
	movwf   TRISE		    ; 1 op
	
	call	delay_seq	    ; 144 ops
	
	movf	PORTE, W	    ; 1 op
	movff	PORTE, column	    ; 1 op
	
	movlw	0x0f		    ; 1 op
	cpfseq	column		    ; 1 op			;Compare keypad inputs to 11110000, if the same, skip
	movff   column, columnvals  ; 1 op			;Stores value at column
	return			    ; 1 op			;Doesn't store value
    
	
 combine:
	movf	column, W
	iorwf	row, W		    ;Combines columns with rows and move to W
	movwf	value
	return

 compare_combine:		    ; 1 op
	movf	column, W	    ; 1 op
	iorwf	row, W		    ; 1 op           ;Combines columns with rows and move to W
	movwf	compare_value	    ; 1 op
	return			    ; 1 op
	
	
	
	
	

    
    
delay_seq:
	movlw	0x46		    ; 70 operations
	movwf	delay_counter, A
delay:
	decfsz	delay_counter, A	; 70 * 2 + 4 operations = 144 operations = 9us (including call)
	bra	delay
	return

 
	
	
	
	
	
	
	
	
	
	
	
	
 
Fsharp:			    ; 740 Hz
    
    MOVLW   0x63     	    ; 1 op
    MOVWF   PR2		    ; 1 op

    
MOVLW    0x32		    ; 1 op

MOVWF    duty_cycle_upper   ; 1 op

CALL     SIGNAL		    ; 3 op

CALL     DELAY		    ; ?

 

;MOVLW    0x3c 
MOVLW    0x55
MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x45 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x4e 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x55 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x5b 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x60 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x63 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x64 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x63 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x60 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x5b 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x55 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x4e 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 
    
CALL     DELAY 

 

MOVLW    0x45 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x3c 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x32 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x28 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x1f 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x16 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0xe 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x8 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x3 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x1 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x0 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x1 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x3 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x8 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0xe 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x16 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x1f 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

MOVLW    0x28 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY
    
;CALL	DELAY_CHECK   
    
    
;    
;    call	keypad_read_row		    ; 153 ops		    ;
;    call	keypad_read_column	    ; 153 ops
;    call	compare_combine		    ; 5 op
;    
;    movf	value, W		    ; 1 op
;    cpfseq	compare_value		    ; 1 op
    return
    
    
    
goto		Fsharp			    ; 1 op


    	

    
DELAY_CHECK:
    
    call	keypad_read_row		    ; 153 ops		    ;
    call	keypad_read_column	    ; 153 ops
    call	compare_combine		    ; 5 op
    
    movf	value, W		    ; 1 op
    cpfseq	compare_value		    ; 1 op
    bra		interpret
    return
    
    
    
    
    
    
 DELAY:

	movlw	0x10		       ; 144 operations = 9us
	movwf	delay_counter, A
	bra	DELAY_SEQ1
DELAY_SEQ1:
	decfsz	delay_counter, A	; decrement until zero
	bra	DELAY_SEQ1
	
	movlw	0x02		    ; 144 operations = 9us
	movwf	delay_counter, A
	bra	DELAY_SEQ2
DELAY_SEQ2:
	decfsz	delay_counter, A	; decrement until zero
	bra	DELAY_SEQ2
;	
;	movlw	0x01		    ; 144 operations = 9us
;	movwf	delay_counter
;	bra	DELAY_SEQ3
;DELAY_SEQ3:
;	decfsz	delay_counter, A	; decrement until zero
;	bra	DELAY_SEQ3	
;	
	
	
	return
 


    bra	Fsharp
    
END