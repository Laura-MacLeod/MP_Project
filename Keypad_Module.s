	#include <xc.inc>
	

global  keypad_setup, keypad_read_row, keypad_read_column, combine, interpret
	
extrn	SIGNAL, duty_cycle_upper
extrn	A_note, Asharp, B_note, C_note, Csharp, D_note, Dsharp, E_note

	
psect	udata_acs
delay_count:	ds 1
row:	    ds    1	    ; reserve 1 byte for variable UART_counter
column:	    ds    1
value:	    ds	  1
rowvals:    ds	  1
columnvals: ds	  1
delay_counter:	    ds	  1

	
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


	
	
	
interpret:
	movlw	0xff		    ;NO BUTTON PRESSED
	cpfseq	value		    
	bra	next1
	retlw	0x00		    ;RETURN NULL

next1:
	movlw	0x77	    ;ROW 4 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next2
;	call	Fsharp
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
	call	E_note
	retlw	'8'		    ;RETURN '8'

next8:
	movlw	0xdb	    ;ROW 2 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next9
	call	D_note
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
	call	Csharp
	retlw	'5'		    ;RETURN '5'

next12:
	movlw	0xBE	    ;ROW 3 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next13
	call	Dsharp
	retlw	'7'		    ;RETURN '7'

next13:
	movlw	0xEB	    ;ROW 1 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next14
	call	B_note
	retlw	'3'		    ;RETURN '3'

next14:
	movlw	0xED	    ;ROW 1 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next15
	call	Asharp
	retlw	'2'		    ;RETURN '2'

next15:
	movlw	0xDE	    ;ROW 2 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next16
	call	C_note
	retlw	'4'		    ;RETURN '4'

next16:
	movlw	0xEE	    ;ROW 1 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	errorfunc
	call	A_note
	retlw	'1'		    ;RETURN '1'

errorfunc:
	retlw	0xff		    ;ERROR
	return
    
    
delay_seq:
	movlw	0x46		    ; 70 operations
	movwf	delay_counter, A
delay:
	decfsz	delay_counter, A	; 70 * 2 + 4 operations = 144 operations = 9us (including call)
	bra	delay
	return

 
	
	
	
	
	
	
	
	
	
	
	
	

END