	#include <xc.inc>
	
GLOBAL	PORT_INIT, CLOCK_INIT, TIMER_INIT, PWM_INIT, SIGNAL
GLOBAL	duty_cycle_upper, duty_cycle_lower
	
psect	udata_acs
	
duty_cycle_upper:	ds  1
duty_cycle_lower:	ds  1
clock_speed_bits:	ds  1

;GIT TEST 2
    
 psect	pwm_code, class=CODE
    
PORT_INIT:

    BCF	    TRISC, 2	    ; Set P1A/RC2 pin to output
    
    RETURN
    
    
CLOCK_INIT:
			    ; INITIALISING OSCCON CLOCK REGISTER
    BCF	    OSCTUNE, 7
    BSF	    OSCCON2, 0
    
    BSF	    OSCCON, 6	    ; 1  ;Oscillator Speed is 1MHz ; Fosc = 1MHz
    BSF	    OSCCON, 5	    ; 1	
    BCF	    OSCCON, 4	    ; 0
    
    MOVLW   00000110		    ; Store three bits OSCCON<6:4> was set to like 00000<6:4>
    MOVWF   clock_speed_bits	    ; This is for calculating the clock frequency and thus 
    
    RETURN
    
    
    
TIMER_INIT:
    
    CLRF    TMR2	    ; Clearing timer2/counter
    
    MOVLW   0xFF	    ; 0b11111111
    MOVWF   PR2		    ; Set period of signal,  PR2 = (Fosc/(4*PWMfreq*prescale)) - 1; Equation 19-1
    
    MOVLW   0xFF	    ; 0b11111111
    MOVWF   T2CON	    ; Timer control register - <6:3> postscale control, <2> timer on/off, <1:0> prescale control
    
    RETURN
    
    
    
PWM_INIT:
    
    MOVLW   0x3C	    ; 0b00111100 
    MOVWF   CCP1CON	    ; <7:6> output mode set 00, <5:4> duty cycle 2 LSBs, <3:0> set 11xx for PWM mode, ideally 1100
    
    MOVLW   0x64	    ; 0b00000011
    MOVWF   CCPR1L	    ; Set duty cycle,   (CCPR1L:CCP1CON<5:4>) = PWM Duty Cycle /  (TOSC • (TMR2 Prescale Value)); Equation 19-2
    
    MOVLW   0x01	    ; 0b00000001
    MOVWF   PSTR1CON	    ; To steer pulse to RC2/P1A pin only, set to 00000001
    
    BCF	    CCPTMRS0, 2	    
    BCF	    CCPTMRS0, 1
    BCF	    CCPTMRS0, 0	    ; Timer used for ECCP1 is TMR2
    
    RETURN

    
 
SIGNAL:
    ; Duty cycle value should be prewritten to 'duty_cycle'
    
    MOVFF   duty_cycle_upper, CCPR1L	    ;set new duty cycle (8 MSBs)
    ;MOVFF   duty_cycle_lower, CCP1CON	    ;set new duty cycle (2 LSBs), might not be necessary
    
    RETURN
    
    
CALC_PERIOD:
    ; PR2 = (Fosc/(4*PWMfreq*prescale)) - 1
    
	
END