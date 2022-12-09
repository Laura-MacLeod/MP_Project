	#include <xc.inc>
	

global	Fsharp
global  keypad_setup, keypad_read_row, keypad_read_column, combine, interpret
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
    

 
 
 keypad_setup:
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

keypad_read_column:

	movlw   0x0f
	movwf   TRISE
	
	call	delay_seq
	
	movf	PORTE, W
	movff	PORTE, column
	
	movlw	0x0f	    
	cpfseq	column		    ;Compare keypad inputs to 11110000, if the same, skip
	movff   column, columnvals  ;Stores value at column
	return			    ;Doesn't store value
    
	
 combine:
	movf	column, W
	iorwf	row, W		    ;Combines columns with rows and move to W
	nop
	movwf	value
	return

 compare_combine:
	movf	column, W
	iorwf	row, W		    ;Combines columns with rows and move to W
	nop
	movwf	compare_value
	return
	
	
	
	
	
interpret:
	movlw	0xff		    ;NO BUTTON PRESSED
	cpfseq	value		    
	bra	next1
	retlw	0x00		    ;RETURN NULL

next1:
	movlw	0x77	    ;ROW 4 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next2
	call	Fsharp
	retlw	'c'		    ;RETURN 'C'
next2:
	movlw	0xB7	    ;ROW 3 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next3
	retlw	'd'		    ;RETURN 'D'

next3:
	movlw	0x7B	    ;ROW 4 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next4
	retlw	'b'		    ;RETURN 'B'

next4:
	movlw	0xD7	    ;ROW 2 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next5
	retlw	'e'		    ;RETURN 'E'

next5:
	movlw	0x7D	    ;ROW 4 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next6
	retlw	'0'		    ;RETURN '0'

next6:
	movlw	0xBB	    ;ROW 3 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next7
	retlw	'9'		    ;RETURN '9'

next7:
	movlw	0xBD	    ;ROW 3 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next8
	retlw	'8'		    ;RETURN '8'

next8:
	movlw	0xdb	    ;ROW 2 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next9
	nop
	retlw	'6'		    ;RETURN '6'
	
	return

next9:
	movlw	0x7E	    ;ROW 4 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next10
	retlw	'a'		    ;RETURN 'A'

next10:
	movlw	0xE7	    ;ROW 1 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next11
	retlw	'f'		    ;RETURN 'F'

next11:
	movlw	0xDD	    ;ROW 2 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next12
	retlw	'5'		    ;RETURN '5'

next12:
	movlw	0xBE	    ;ROW 3 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next13
	retlw	'7'		    ;RETURN '7'

next13:
	movlw	0xEB	    ;ROW 1 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next14
	retlw	'3'		    ;RETURN '3'

next14:
	movlw	0xED	    ;ROW 1 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next15
	retlw	'2'		    ;RETURN '2'

next15:
	movlw	0xDE	    ;ROW 2 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next16
	retlw	'4'		    ;RETURN '4'

next16:
	movlw	0xEE	    ;ROW 1 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	errorfunc
	retlw	'1'		    ;RETURN '1'

errorfunc:
	retlw	0xff		    ;ERROR
	return
    
    
delay_seq:
	movlw	0x90		    ; 144 operations = 9us
	movwf	delay_counter
	bra	delay
delay:
	decfsz	delay_counter, A	; decrement until zero
	bra	delay
	return

 
	
	
	
	
	
	
	
	
	
	
	
	
 
Fsharp:
    
    MOVLW   0x63     	    ; 0b11111100
    MOVWF   PR2

    
    MOVLW    0x32 

MOVWF    duty_cycle_upper 

CALL     SIGNAL 

CALL     DELAY 

 

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

    
    call	keypad_read_row
    call	DELAY
    call	keypad_read_column
    
    call	compare_combine
    
    movf	value, W	   
    cpfseq	compare_value
    return
    bra		Fsharp

    
    	
	
 DELAY:
	movlw	0x20		       ; 144 operations = 9us
	movwf	delay_counter, A
	bra	DELAY_SEQ1
DELAY_SEQ1:
	decfsz	delay_counter, A	; decrement until zero
	bra	DELAY_SEQ1
	
	movlw	0x01		    ; 144 operations = 9us
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
 
;DELAY:
;	movlw	0xff		    ; 144 operations = 9us
;	movwf	delay_counter
;	bra	DELAY_SEQ
;DELAY_SEQ:
;	decfsz	delay_counter, A	; decrement until zero
;	bra	DELAY_SEQ
;	return


    bra	Fsharp
    
END