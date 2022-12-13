	#include <xc.inc>
	
GLOBAL	    INT_ON, INT_OFF, INT_HIGH
EXTRN	    Countdown, SIGNAL, duty_cycle_upper
	
psect	udata_bank4 ; reserve data anywhere in RAM (here at 0x400)
    
Fsharp_Array:    ds 0x80
	
psect	udata_acs
delay_count:	    ds	1

    
;psect	data    
;	
;	; ******* myTable, data in programme memory, and its length *****
;Fsharp_Table:
;;	db	0x32, 0x3c, 0x45, 0x4e, 0x55, 0x5b, 0x60, 0x63, 0x64, 0x63, 0x60, 0x5b, 0x55, 0x4e, 0x45, 0x3c, 0x32, 0x28, 0x1f, 0x16, 0xe, 0x8, 0x3, 0x1, 0x0, 0x1, 0x3, 0x8, 0xe, 0x16, 0x1f, 0x28
;	db	0x64, 0x8a, 0xab, 0xc1, 0xc8, 0xc1, 0xab, 0x8a, 0x64, 0x3e, 0x1d, 0x7, 0x0, 0x7, 0x1d, 0x3e 
;;	db	0x19, 0x1b, 0x1e, 0x20, 0x22, 0x25, 0x27, 0x29, 0x2a, 0x2c, 0x2e, 0x2f, 0x30, 0x31, 0x31, 0x32, 0x32, 0x32, 0x31, 0x31, 0x30, 0x2f, 0x2e, 0x2c, 0x2a, 0x29, 0x27, 0x25, 0x22, 0x20, 0x1e, 0x1b, 0x19, 0x16, 0x14, 0x11, 0xf, 0xd, 0xb, 0x9, 0x7, 0x5, 0x4, 0x3, 0x2, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x7, 0x9, 0xb, 0xd, 0xf, 0x11, 0x14, 0x16 
;	; message, plus carriage return
;	Fsharp_Table_Len   EQU	0x10	; length of data
;   
;	align	2
	
 psect	pwm_code, class=CODE
    

INT_ON:
	bsf	GIE		; Enable all interrupts
	bsf	TMR2IE		; Enable timer2 interrupt
	
	
	return
	
	
INT_OFF:
	bcf	TMR2IE		; Disable timer2 interrupt
	bcf	GIE		; Disable all interrupts
	
	return
 
; INT_HIGH:
;
;	btfss	TMR0IF		; check that this is timer0 interrupt
;	retfie	f		; if not then return
;	incf	LATJ, F, A	; increment PORTJ
;	bcf	TMR0IF		; clear interrupt flag
;	retfie	f		; fast return from interrupt
	

INT_HIGH:	
	btfss	TMR0IF		; check that this is timer2 interrupt
	retfie	f		; if not then return
	
	MOVLW    0xc8 
	MOVWF    PR2 
	
        tblrd*+			; move one byte from PM to TABLAT, increment TBLPRT
	movff	TABLAT, CCPR1L	; move read data from TABLAT to CCP DUTY CYCLE
	
	
;	lfsr	0, Fsharp_Array			; Load FSR0 with address in RAM	
;	movlw	low highword(Fsharp_Table)	; address of data in PM
;	movwf	TBLPTRU, A			; load upper bits to TBLPTRU
;	movlw	high(Fsharp_Table)		; address of data in PM
;	movwf	TBLPTRH, A			; load high byte to TBLPTRH
;	movlw	low(Fsharp_Table)		; address of data in PM
;	movwf	TBLPTRL, A			; load low byte to TBLPTRL
;	
;	
	
	decfsz	Countdown, A	; count down to zero
	bra	END_INT		; If countdown not zero, just end interrupt
	
	movlw	0X10		; If countdown is zero, reset to original value for continued cycles of sinusoids
	movwf	Countdown
	bra	END_INT		; Then end
	
	
	

	
	
	
	
END_INT:	
	
	bcf	TMR0IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
    
    
    
END