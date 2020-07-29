#define XPOT A0
#define YPOT A1
#define ZPOT A2
#define LED1 A3
#define LED2 A4
#define LED3 A5
#define LED4 A6
#define LED5 A7

float xVal,yVal,zVal;

int LED[5] = {A3, A4, A5, A6, A7};

const float ARM_A1 = 80;
const float ARM_A2 = 100;
const float ARM_A3 = 100;
const float ARM_A4 = 100;

struct ARMData {
  float Q1;
  float Q2;
  float Q3;
  float Q4;
};

float coordX = 50.0;
float coordY = 50.0;
float coordZ = 50.0;

int i, j, k; // For iteration

/*-------------------Send UART Varialble-------------------*/
char START_BYTE = '*'; //three characters used for Serial communication
char DELIMITER = ',';
char END_BYTE = '#';

/*-------------------Recive UART Varialble-------------------*/
int serial_connect = 0;
boolean LedYellowLogic = 0;
