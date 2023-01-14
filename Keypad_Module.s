	#include <xc.inc>
	

global  keypad_setup, keypad_read_row, keypad_read_column, combine, interpret
global	LCD_Send_Byte_I, LCD_delay_ms
	
extrn	A_note, Asharp, B_note, C_note, Csharp, D_note, Dsharp, E_note, F_note, Fsharp, G_note, Gsharp

	
psect	udata_acs
	
delay_count:	ds	1
row:		ds	1	    ; reserve 1 byte for variable UART_counter
column:		ds	1
value:		ds	1
rowvals:	ds	1
columnvals:	ds	1
delay_counter:	ds	1

	
 psect	pwm_code, class=CODE
    

 
 
 keypad_setup:
	movlb	15	    ;go to BSR 15
	bsf	REPU	    ;set pullup resistors high
	movlb	0	    ;return t0 access bank
	
	clrf	LATE	    ;clear relevent port
	clrf    TRISE
	return
	
	
	
keypad_read_row:
    
	movlw   0xf0
	movwf   TRISE
	
	call	delay_seq	    ; Need delay between writing to and reading keypad

	movf	PORTE, W
	movff	PORTE, row
	
	movlw	0xf0	    
	cpfseq	row		    ;Compare keypad inputs to 00001111, if the same, nothing pressed so skip
	movff   row, rowvals	    ;Stores value at row
	return			    ;Doesn't store value

	
keypad_read_column:		    

	movlw   0x0f		  
	movwf   TRISE		    
	
	call	delay_seq	    
	
	movf	PORTE, W	    
	movff	PORTE, column	    
	
	movlw	0x0f		   
	cpfseq	column		    		;Compare keypad inputs to 11110000, if the same, nothing pressed so skip
	movff   column, columnvals  		;Stores value at column
	return			    		;Doesn't store value
    
	
 combine:	

	movf	column, W	  
	iorwf	row, W		      ;Combines columns with rows and moves characteristic value to W
	movwf	value		      ;Stores at 'value'
	return			


	
	
	
interpret:	
    
no_button_pressed:
    
	movlw	0xff		    ;NO BUTTON PRESSED	   
	cpfseq	value					
	bra	next1					    
	
	MOVLW   0xF8			    ; Turn off timer, turns off PWM so no noise when no key is pressed
	MOVWF   T2CON			    
	
	movlw	00000001B		    ; Clear LCD display
	call	LCD_Send_Byte_I
	movlw	2		
	call	LCD_delay_ms
	movlw	00000110B	
	call	LCD_Send_Byte_I
	
	retlw	0x00		    ;RETURN NULL IF NOTHING PRESSED

	
next1:
    
	MOVLW   0xFC	    ; Turn on timer to enable PWM
	MOVWF   T2CON	    
    
	movlw	0x77	    ;ROW 4 COLUMN 4 PRESSED	   
	cpfseq	value					    
	bra	next2					   
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
	call	Gsharp	    ;Play note G sharp
	
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
	call	G_note	    ;Play note G
	
	retlw	'0'		    ;RETURN '0'

	
next6:
	movlw	0xBB	    ;ROW 3 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next7
	call	F_note	    ;Play note F
	
	retlw	'9'		    ;RETURN '9'

	
next7:
	movlw	0xBD	    ;ROW 3 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next8
	call	E_note	    ;Play note E
	
	retlw	'8'		    ;RETURN '8'

	
next8:
	movlw	0xdb	    ;ROW 2 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next9
	call	D_note	    ;Play note D
	
	retlw	'6'		    ;RETURN '6'

	
next9:
	movlw	0x7E	    ;ROW 4 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next10
	call	Fsharp	    ;Play note F sharp
	
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
	call	Csharp	    ;Play note C sharp
	
	retlw	'5'		    ;RETURN '5'

	
next12:
	movlw	0xBE	    ;ROW 3 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next13
	call	Dsharp	    ;Play note D sharp
	
	retlw	'7'		    ;RETURN '7'

	
next13:
	movlw	0xEB	    ;ROW 1 COLUMN 3 PRESSED
	cpfseq	value		    
	bra	next14
	call	B_note	    ;Play note B
	
	retlw	'3'		    ;RETURN '3'

	
next14:
	movlw	0xED	    ;ROW 1 COLUMN 2 PRESSED
	cpfseq	value		    
	bra	next15
	call	Asharp	    ;Play note A sharp
	
	retlw	'2'		    ;RETURN '2'

	
next15:
	movlw	0xDE	    ;ROW 2 COLUMN 1 PRESSED
	cpfseq	value		    
	bra	next16
	call	C_note	    ;Play note C
	
	retlw	'4'		    ;RETURN '4'

	
next16:
	movlw	0xEE	    ;ROW 1 COLUMN 1 PRESSED	   
	cpfseq	value					
	bra	errorfunc
	call	A_note	    ;Play note A
	
	retlw	'1'		    ;RETURN '1'		

	
errorfunc:

	return
    
	
	
    
delay_seq:
	movlw	0x46		    
	movwf	delay_counter, A
delay:
	decfsz	delay_counter, A	; 70 * 2 + 4 operations = 144 operations = 9us (including call)
	bra	delay
	return

	
	
END
