#include <at89c5131.h>
#include "endsem.h"

char S_str[6]= {0,0,0,0,0,0};   //String for Balance Sita
char G_str[6] = {0,0,0,0,0,0};  //String for Balance Gita
char n500_s[3]= {0,0,0};    // STRING FOR 500RS NOTE
char n100_s[3]= {0,0,0};    // STRING FOR 100RS NOTE

char password[5] = {0,0,0,0,0} ;   //PASSWORD ARRAY
//Main function
char str;
char str2;
char str3;
int val;
int val1;
int val2;
int note1;
int note2;

//-------------------------------------------------
void main(void)
{
	unsigned char ch=0;
	uart_init();            // Please finish this function in endsem.h 
	transmit_string("Press A for Account display and W for withdrawing cash\r\n");
	
    while (1)
    {
      //Receive a character
			ch = receive_char();
			switch(ch)
			{
				case 'A':
								 transmit_string("Hello, Please enter Account Number\r\n");
								 ch = receive_char();
								 switch(ch)
								 {
									 case '1':
										 transmit_string("Account Holder: Sita\r\n");
									   transmit_string("Account Balance: 10000\r\n");
									   break;
									 
									 case '2':
										 transmit_string("Account Holder: Gita\r\n");
									   transmit_string("Account Balance: 10000\r\n");
									   break;
									 
									 default:transmit_string("No such Account. Please enter valid details\r\n");
														break;
								 }
						main();
				
				case 'W':
								 transmit_string("Withdraw state, enter account number\r\n");
								 ch = receive_char();
				       
								 switch(ch)
								 {
									 case '1':
										 transmit_string("Account Holder: Sita\r\n");
									   transmit_string("Account Balance: 10000\r\n");
										 transmit_string("Enter Amount: In Hundreds\r\n");
									     ch = receive_char();
											 val1 = ch;
									     ch = receive_char();
											 val2 = ch;
											 
									     val = val1*10 + val2;
											 val = val*100;
									     if (val > 10000){
												 transmit_string("Insufficient Funds\r\n");}
											 else {
												 val = 10000 - val ;
												 note1= val/500;
												 note2= val%500;
												 int_to_string1(val ,str);
												 int_to_string2(note1, str2);
												 int_to_string2(note2, str3);
												 
												 transmit_string("Remaining Balance :\r\n");
												 transmit_string(str);
											   transmit_string("500 notes: \r\n");
											   transmit_string(str2);
											   transmit_string("100 notes: \r\n");
											   transmit_string(str3);}
		                     main();
									 
									 case '2':
										 transmit_string("Account Holder: Gita\r\n");
									   transmit_string("Account Balance: 10000\r\n");
									   transmit_string("Enter Amount: In Hundreds\r\n");
									   ch = receive_char();
											 val1 = ch;
									     ch = receive_char();
											 val2 = ch;
							
									     val = val1*10 + val2;
											 val = val*100;
									     if (val > 10000){
												 transmit_string("Insufficient Funds\r\n");}
											 
											 else {
												 val = 10000 - val ;
												 note1= val/500;
												 note2= val%500;
												 int_to_string1(val ,str);
												 int_to_string2(note1, str2);
												 int_to_string2(note2, str3);
												 
												 transmit_string("Remaining Balance :\r\n");
											   transmit_string(str);
											   transmit_string("500 notes: \r\n");
											   transmit_string(str2);
											   transmit_string("100 notes: \r\n");
											   transmit_string(str3);}}
		                     main();
									 
									  default:transmit_string("No such Account. Please enter valid details\r\n");
														main();}				
			}
			
			/* code */
        // YOUR CODE GOES HERE
    }
}
