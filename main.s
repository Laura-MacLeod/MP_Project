
       
    #include "pic18f87k22.inc"
    
; CONFIG1H
  ;CONFIG  FOSC = INTIO67        ; Oscillator Selection bits (Internal oscillator block)
  CONFIG  PLLCFG = OFF          ; 4X PLL Enable (Oscillator used directly)
 ; CONFIG  PRICLKEN = ON         ; Primary clock enable bit (Primary clock is always enabled)
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRTEN = OFF          ; Power-up Timer Enable bit (Power up timer disabled)
  CONFIG  BOREN = SBORDIS       ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG  BORV = 190            ; Brown Out Reset Voltage bits (VBOR set to 1.90 V nominal)

; CONFIG2H
  CONFIG  WDTEN = OFF           ; Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  ;CONFIG  CCP2MX = PORTC1       ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  ;CONFIG  PBADEN = ON           ; PORTB A/D Enable bit (PORTB<5:0> pins are configured as analog input channels on Reset)
  ;CONFIG  CCP3MX = PORTB5       ; P3A/CCP3 Mux bit (P3A/CCP3 input/output is multiplexed with RB5)
  ;CONFIG  HFOFST = ON           ; HFINTOSC Fast Start-up (HFINTOSC output and ready status are not delayed by the oscillator stable status)
  ;CONFIG  T3CMX = PORTC0        ; Timer3 Clock input mux bit (T3CKI is on RC0)
  ;CONFIG  P2BMX = PORTD2        ; ECCP2 B output mux bit (P2B is on RD2)
  ;CONFIG  MCLRE = EXTMCLR       ; MCLR Pin Enable bit (MCLR pin enabled, RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  ;CONFIG  LVP = ON              ; Single-Supply ICSP Enable bit (Single-Supply ICSP enabled if MCLRE is also 1)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection Block 0 (Block 0 (000800-001FFFh) not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection Block 1 (Block 1 (002000-003FFFh) not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection Block 2 (Block 2 (004000-005FFFh) not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection Block 3 (Block 3 (006000-007FFFh) not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection Block 0 (Block 0 (000800-001FFFh) not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection Block 1 (Block 1 (002000-003FFFh) not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection Block 2 (Block 2 (004000-005FFFh) not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection Block 3 (Block 3 (006000-007FFFh) not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot Block (000000-0007FFh) not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not write-protected)

; CONFIG7L
 ; CONFIG  EBTR0 = OFF           ; Table Read Protection Block 0 (Block 0 (000800-001FFFh) not protected from table reads executed in other blocks)
  ;CONFIG  EBTR1 = OFF           ; Table Read Protection Block 1 (Block 1 (002000-003FFFh) not protected from table reads executed in other blocks)
  ;CONFIG  EBTR2 = OFF           ; Table Read Protection Block 2 (Block 2 (004000-005FFFh) not protected from table reads executed in other blocks)
  ;CONFIG  EBTR3 = OFF           ; Table Read Protection Block 3 (Block 3 (006000-007FFFh) not protected from table reads executed in other blocks)

; CONFIG7H
 ; CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot Block (000000-0007FFh) not protected from table reads executed in other blocks)
  
  psect	    example_data
  
  LEFT_DUTY:	ds  1
  RIGHT_DUTY:	ds  1
  
    ;cblock	0x00
	;LEFT_DUTY
	;RIGHT_DUTY
    ;endc
    
    
    ORG	    00h
    GOTO    INIT
    ORG	    08h
    goto    ISR
    
    
INIT:
    CALL    OSC_INIT			;4Mhz
    CALL    PWM_PORT_INIT		
    CALL    TMR2_INITIALIZE		
    CALL    EPWM1_INITIALIZE
    CALL    EPWM2_INITIALIZE
    
MAIN:
    ;MOVLW   0x64
    ;MOVWF   LEFT_DUTY
    ;CALL    LEFT_POLARITY1
    
    ;MOVLW   0x64
    ;MOVWF   RIGHT_DUTY
    ;CALL    RIGHT_POLARITY2
    bra    MAIN
    
ISR:
    RETFIE
    
OSC_INIT:
    MOVLW   0xFFFF
    MOVWF   OSCCON	;Oscillator Speed is 4MHz ; Fosc = 4MHz

    MOVLW   0xFF
    MOVWF   OSCCON
    
    MOVLW   0xFF
    MOVWF   OSCCON
    
    RETURN
    
TMR2_INITIALIZE:
    ;PR2 255 max; 
    MOVLW   0xFF		    ;1KHz with a prescale of 4
    MOVWF   PR2			    ;PR2 = (Fosc/(4*PWMfreq*prescale)) - 1; Equation 14-1
		   ; -----------------------------------------------
		   ; PERIOD
    ;TMR2 0; 
    
    CLRF    TMR2

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
    
    ;CCP1ASE operating; PSS1BD low; PSS1AC low; CCP1AS disabled; 
    ;CLRF    ECCP1AS
	
    ;P1RSEN automatic_restart; P1DC 0;  
    ;MOVLW   0x80		    ;B'10000000'
    ;MOVWF   PWM1CON
	
    ;STR1D P1D_to_port; STR1C P1C_to_port; STR1B P1B_to_CCP1M; STR1A P1A_to_port; STR1SYNC start_at_begin; 
    MOVLW   0x01		    ;B'00000001'
    MOVWF   PSTR1CON
	  
	
    ;CCPR1L 127;
    MOVLW   0x2	    ;DUTY CYCLE
    MOVWF   CCPR1L  ;-----------------------------------------------------------------

    ;Selecting Timer2
    BCF	    CCPTMRS0, 0
    BCF	    CCPTMRS0, 1
    RETURN

EPWM2_INITIALIZE:
    ; CCP2M P2A,P2C: active high; P2B,P2D: active high; DC2B 3; P2M single; 
    MOVLW   0x1C		    ;B'00011100'
    MOVWF   CCP2CON    ;-----------------------------------------------------------------
			; 2LSB OF DUTY CYCLE, PWM MODE
	
    ;CCP2ASE operating; PSS2BD low; PSS2AC low; CCP2AS disabled; 
    ;CLRF    ECCP2AS
	
    ;P2RSEN automatic_restart; P2DC 0;  
    ;MOVLW   0x80		    ;B'10000000'
    ;MOVWF   PWM2CON
	
    ;STR2D P2D_to_port; STR2C P2C_to_port; STR2B P2B_to_CCP2M; STR2A P2A_to_port; STR2SYNC start_at_begin; 
    MOVLW   0x01		    ;B'00000001'
    MOVWF   PSTR2CON
	  
	
    ;CCPR2L 127;
    MOVLW   0x32    ;DUTY CYCLE
    MOVWF   CCPR2L  ;-----------------------------------------------------------------

    ;Selecting Timer2
    BCF	    CCPTMRS0, 3
    BCF	    CCPTMRS0, 4
    RETURN
    
EPWM1_DUTY_CYCLE:
    MOVWF   CCPR1L
    RETURN
    
EPWM2_DUTY_CYCLE:
    MOVWF   CCPR2L
    RETURN
    
LEFT_POLARITY1:
    MOVLW   0x01		    ;B'00000001'
    MOVWF   PSTR1CON
    
    MOVLB   0xF
    BCF	    TRISC, 2
    
    MOVLB   0xF
    BCF	    TRISD, 5
    BCF	    PORTD, 5
    
    MOVFF   LEFT_DUTY, CCPR1L	    ;set up duty cycle
    RETURN
    
LEFT_POLARITY2:
    MOVLW   0x02		    ;B'00000010'
    MOVWF   PSTR1CON		  
    
    MOVLB   0xF
    BCF	    TRISC, 2	    ;make RC2 act as a digital output
    BCF	    PORTC, 2		    ;clear RC2
    
    MOVLB   0xF
    BCF	    TRISD, 5	    ;make RD5 act as a digital output
    
    MOVFF   LEFT_DUTY, CCPR1L	    ;write the duty cycle to the PWM pin
    RETURN
    
RIGHT_POLARITY1:
    MOVLW   0x01		    ;B'00000001'
    MOVWF   PSTR2CON
    
    MOVLB   0xF
    BCF	    TRISC, 1
    
    MOVLB   0xF
    BCF	    TRISD, 2
    BCF	    PORTD, 2
    
    MOVFF   RIGHT_DUTY, CCPR2L
    RETURN
    
RIGHT_POLARITY2:
    MOVLW   0x02		    ;B'00000010'
    MOVWF   PSTR2CON		
    
    MOVLB   0xF
    BCF	    TRISC, 1
    BCF	    PORTC, 1
    
    MOVLB   0xF
    BCF	    TRISD, 2
    
    MOVFF   RIGHT_DUTY, CCPR2L
    RETURN
    
PWM_PORT_INIT:
    MOVLB   0xF
 
    BCF	    TRISC, 2			;P1A
    BCF	    TRISD, 5			;P1B
    BCF	    TRISC, 1			;P2A
    BCF	    TRISD, 2			;P2B
    RETURN
    
    END