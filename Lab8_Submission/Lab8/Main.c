#include <at89c5131.h>
#include "lcd.h"				//Header file with LCD interfacing functions
#include "MorseCode.h"	//Header file for Morse Code 

sbit LED=P1^7;

/*
Port P0.7 is used for the audio signal output
*/	
//Main function
void loop (void){
	unsigned int i=1;
	while(i==1){
		i=1;}
	}
void main(void)
{
		
	//Call initialization functions
	lcd_init();
	
	
	// Read input nibble here
	
	if (P1_0){
		lcd_write_string("A");
		morsea();
	//	reset();
		loop();
	}
	else if (P1_1){
		lcd_write_string("B");
		morseb();
	//	reset();
		loop();
	}
	else if (P1_2){
		lcd_write_string("C");
		morsec();
	//	reset();
		loop();
	}
	else if (P1_3){
		lcd_write_string("D");
		morsed();
	//	reset();
		loop();
	}
	else {
		lcd_write_string("E");
		morsee();
	//	reset();
		loop();
	}
	
	// Insert Priority Logic
	// Inside each condition, call the functions from MorseCode.h. Fill functions in MorseCode.h
	// Write to LCD using function lcd_write_string() in side the condition as well
}

