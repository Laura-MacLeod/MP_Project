	#include <xc.inc>
	
GLOBAL	    INT_ON, INT_OFF, INT_HIGH
EXTRN	    Countdown
	
psect	udata_acs
delay_count:	    ds	1
   
	
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
	NOP
	
        tblrd*+			; move one byte from PM to TABLAT, increment TBLPRT
	movff	TABLAT, CCPR1L	; move read data from TABLAT to CCP DUTY CYCLE
	decfsz	Countdown, A	; count down to zero
	call	END_INT		; If countdown not zero, just end interrupt
	
	movlw	0X20		; If countdown is zero, reset to original value for continued cycles of sinusoids
	movwf	Countdown
	BRA	END_INT		; Then end

	
END_INT:	
	
	bcf	TMR0IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
    
    
    
END