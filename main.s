	#include <xc.inc>

;EXTRN	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
EXTRN	duty_cycle_upper, duty_cycle_lower
EXTRN	PWM_INIT, TIMER_INIT, CLOCK_INIT, PORT_INIT, SIGNAL	
extrn	keypad_setup, keypad_read_row, keypad_read_column, combine, interpret
extrn	Fsharp
psect	udata_acs
	
delay_counter1:	    ds 1
delay_counter2:	    ds 1
counter:    ds 1    ; reserve one byte for a counter variable
length:	    ds 1
store:	    ds 1


; GIT TEST
	
psect	code,abs

	
RST:
    
    ORG	    0x00
    GOTO    INIT
    
    org 0x100
INIT:
    CALL    PORT_INIT
    CALL    CLOCK_INIT
    CALL    TIMER_INIT
    CALL    PWM_INIT
    CALL    keypad_setup
    
    GOTO    start
    
start:
    nop
	call	keypad_read_row
	call	DELAY1
	nop
	call	keypad_read_column
	call	combine

	nop
	call	interpret
	
	bra	start
	
;	lfsr	0, storage
;	movwf	store
;	
;	movwf	TBLPTRH
;	movff	TABLAT, POSTINC0
;	
;	movlw	length
;	addlw	0xff
;	call	UART_Transmit_Message
;	
;	movlw	length
;	call	LCD_Write_Message
;	bra	start
MAIN:

    ; Set duty cycle

    ;MOVLW   0xFF		; (random)
    ;MOVWF   duty_cycle_upper
    
    ;MOVLW   0x00111100 		;must be 0b00xx1100 
    ;MOVWF   duty_cycle_lower

    
    

    
    
    
    
    
;   CALL	    DELAY
;    
;MOVLW   0xA
;MOVWF   duty_cycle_upper
;CALL    SIGNAL
;    
;CALL	DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xC		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xD		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xE
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xF		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xE		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xD		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xC		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x8		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x6		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x5		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x4		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x3		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x2		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x1		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x2		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x3		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x4		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x5		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x7		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0x9		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    CALL	    DELAY
;    CALL	    DELAY
;    
;    MOVLW   0xA		
;    MOVWF   duty_cycle_upper
;    CALL    SIGNAL
;    
;    
;    
;    
;    
;    
;    
;    MOVLW    111011 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1000001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1000111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1001101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1010010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1011000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1011101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1100001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1100110 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110011 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110110 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110110 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110011 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1110000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1100110 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1100001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1011101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1011000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1010010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1001101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1000111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1000001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    111011 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    110101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    110000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    101010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    100100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    11111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    11010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    0 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    0 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    0 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    1101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10001 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    10101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    11010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    11111 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    100100 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    101010 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    110000 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;
; 
;
;MOVLW    110101 
;
;MOVWF    duty_cycle_upper 
;
; 
;
;CALL     SIGNAL 
;
;CALL     DELAY 
;    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   ; CALL    SIGNAL
    ;BRA	    MAIN

DELAY1:
	movlw	0x90		    ; 144 operations = 9us
	movwf	delay_counter1
	bra	DELAY1_SEQ
DELAY1_SEQ:
	decfsz	delay_counter1, A	; decrement until zero
	bra	DELAY1_SEQ
	return
	
DELAY2:	
	MOVLW   0X11
	MOVWF   delay_counter2, A
	
DELAY2_SEQ:
	decfsz	delay_counter2, A	; decrement until zero
	bra	DELAY2_SEQ
	
	
	return
    
    

END	RST   