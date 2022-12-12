	#include <xc.inc>
	

;global	INT_HIGH


	
psect	udata_acs
delay_count:	ds 1

	
 psect	pwm_code, class=CODE
    

INT_ON:
	bsf	TMR2IE		; Enable timer0 interrupt
	bsf	GIE		; Enable all interrupts
	
	MOVLW	0X20
	MOVWF	counterFsharp
	
	return
	
	
INT_OFF:
	bcf	TMR2IE		; Disable timer0 interrupt
	bcf	GIE		; Disable all interrupts
	
	return
 
 
	
	
INT_HIGH:	
	btfss	TMR2IF		; check that this is timer0 interrupt
	retfie	f		; if not then return
	
	call	interpret
	
	
	
	
interpret:
	movlw	0xff		    ;NO BUTTON PRESSED
	cpfseq	value		    
	bra	next1
	retlw	0x00		    ;RETURN NULL

next1:
	movlw	0x77	    ;ROW 4 COLUMN 4 PRESSED
	cpfseq	value		    
	bra	next2
	call	FSHARP
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
	
	
	
	
	
	
	
	
	
	
	

    ; -------- F SHARP DATA -----------
   
FSHARP:
	
    
	lfsr	0, myArray	; Load FSR0 with address in RAM	
	movlw	low highword(myFsharp_Table)	; address of data in PM
	movwf	TBLPTRU, A	; load upper bits to TBLPTRU
	movlw	high(myFsharp_Table)	; address of data in PM
	movwf	TBLPTRH, A	; load high byte to TBLPTRH
	movlw	low(myFsharp_Table)	; address of data in PM
	movwf	TBLPTRL, A	; load low byte to TBLPTRL
	movlw	32		; 32 bytes to read
	movwf 	counterFsharp, A	; our counter register
	
        tblrd*+			; move one byte from PM to TABLAT, increment TBLPRT
	movff	TABLAT, CCPR1L	; move read data from TABLAT to CCP DUTY CYCLE
	decfsz	counterFsharp, A	; count down to zero

	
	
	
	
	
	
	
	
	
END_INT:	
	
	bcf	TMR2IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
    
    
    
END