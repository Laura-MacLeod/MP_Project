
    #include "pic18f87k22.inc"
    
  psect	    example_data
  
  LEFT_DUTY:	ds  1
  RIGHT_DUTY:	ds  1
    
    ORG	    00h
    GOTO    INIT

    
    
INIT:
    CALL    OSC_INIT			;4Mhz
    CALL    PWM_PORT_INIT		
    CALL    TMR2_INITIALIZE		
    CALL    EPWM1_INITIALIZE

    GOTO    MAIN
    
MAIN:
 
    bra    MAIN
    

    
OSC_INIT:
    
    ; INITIALISING OSCCON CLOCK REGISTER
    BCF	    OSCTUNE, 7
    BSF	    OSCCON2, 0
    
    BCF	    OSCCON, 4	;Oscillator Speed is 31.25kHz ; Fosc = 31.25kHz
    BSF	    OSCCON, 5
    BSF	    OSCCON, 6
    
    RETURN
    
TMR2_INITIALIZE:
    
    CLRF    TMR2
    
    ;PR2 255 max; 
    MOVLW   0xFF		    ;1KHz with a prescale of 4
    MOVWF   PR2			    ;PR2 = (Fosc/(4*PWMfreq*prescale)) - 1; Equation 14-1
		   ; -----------------------------------------------
		   ; PERIOD

    

    ;Clearing IF flag.
    BCF	    PIR1, 1
    

    ;T2CKPS 1:1; T2OUTPS 1:1; TMR2ON on; 
    MOVLW   0xFF	    ;B'00000111'
    MOVWF   T2CON   ;-----------------------------------------------------------------
    RETURN	    ; PRESCALER AND TIMER ON/OFF
    
EPWM1_INITIALIZE:	
    ; CCP1M P1A,P1C: active high; P1B,P1D: active high; DC1B 3; P1M single; 
    MOVLW   0x3C		    ;B'00011100'
    MOVWF   CCP1CON    ;-----------------------------------------------------------------
			; 2LSB OF DUTY CYCLE, PWM MODE
    

    ;STR1D P1D_to_port; STR1C P1C_to_port; STR1B P1B_to_CCP1M; STR1A P1A_to_port; STR1SYNC start_at_begin; 
    MOVLW   0x01		    ;B'00000001'
    MOVWF   PSTR1CON
	  
	
    ;CCPR1L 127;
    MOVLW   0x64	    ;DUTY CYCLE
    MOVWF   CCPR1L  ;-----------------------------------------------------------------

    ;Selecting Timer2
    BCF	    CCPTMRS0, 0
    BCF	    CCPTMRS0, 1
    RETURN


    
PWM_PORT_INIT:
 
    BCF	    TRISC, 2			;P1A
    RETURN
    
    
    END