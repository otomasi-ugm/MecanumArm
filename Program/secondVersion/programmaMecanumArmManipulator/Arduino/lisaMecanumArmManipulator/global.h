/*----------------------------Motor----------------------------*/
int motorPin[][2] = {
  /* PWM, DIR*/
  {4, 5}, // m1 -> front-right
  {2, 3}, // m2 -> front-left
  {8, 9}, // m3 -> rear-right
  {6, 7}  // m4 -> rear-left
};

/*----------------------------LCD1602----------------------------*/
LiquidCrystal lcd(10, 11, 26, 24, 25, 12);

/*----------------------------Button----------------------------*/
int button[4] = {35, 36, 37, 38};

/*----------------------------LEDRGB----------------------------*/
int ledRgb[3] = {28, 29, 30};

/*-----------------------Compass HMC5883L------------------------*/
float heading;
float declinationAngle = -1.5;
float headingDegrees;

/*-----------------------IMU 6050 Sensor------------------------*/
Kalman kalmanX; // Create the Kalman instances
Kalman kalmanY;

float parameterLowpass = 0;
float filter_low_pass = 0;
float roll = 0;

/* IMU Data */
double accX, accY, accZ;
double gyroX, gyroY, gyroZ;
int16_t tempRaw;

double gyroXangle, gyroYangle; // Angle calculate using the gyro only
double compAngleX, compAngleY; // Calculated angle using a complementary filter
double kalAngleX, kalAngleY; // Calculated angle using a Kalman filter

float raw_pitch = 0;
float lowpass_pitch = 0;
float complementary_pitch = 0;
float kalman_pitch = 0;

float raw_roll = 0;
float lowpass_roll = 0;
float complementary_roll = 0;
float kalman_roll = 0;

uint32_t timer;
uint8_t i2cData[14]; // Buffer for I2C data

/*---------------------RemoteChannel R9DS---------------------*/
const int remoteChannel = 8;
int remoteValue[remoteChannel];
int remotePin[remoteChannel] = {14, 15, 16, 17, 20, 21, 22, 23};
int remoteData[remoteChannel];
#define ROLL 0
#define PITCH 1
#define THROTTLE 2
#define YAW 3
#define SELECTOR 4
#define VRD 5
#define SWD 6
#define VRA 7

PWM ch1(14);
PWM ch2(15);
PWM ch3(16);
PWM ch4(17);
PWM ch5(20);
PWM ch6(21);
PWM ch7(22);
PWM ch8(23);

/*---------------------ARM Variable---------------------*/
// Define arm length in millimeter
const float ARM_L0 = 150;
const float ARM_L1 = 100;
const float ARM_L2 = 100;
struct ARMData {
  float alpha;
  float beta;
  float gamma;
  float delta;
};
float coordX = 50.0;
float coordY = 50.0;
float coordZ = 0.0;
bool torque = false;

/*---------------------Dynamixel Read---------------------*/
int iDyna0, iDyna1, iDyna2, iDyna3, iDyna4;
int vDyna0, vDyna1, vDyna2, vDyna3, vDyna4;
int temp0, temp1, temp2, temp3, temp4;
float rDeg0, rDeg1, rDeg2, rDeg3, rDeg4;

/*-------------------Mecanum Variable-------------------*/
static float matrix[4] = {0, 0, 0, 0};
float *outPWM;
int gain = 0;

/*-------------------Send UART Varialble-------------------*/
char START_BYTE = '*'; //three characters used for Serial communication
char DELIMITER = ',';
char END_BYTE = '#';

/*-------------------Recive UART Varialble-------------------*/
int serial_connect = 0;
boolean buzzerLogic = 0;
#define BUZZER 27

/*-------------------GPS Varialble-------------------*/
TinyGPSPlus gps;
float latitude,longitude;
int gpsDay,gpsMonth,gpsYear;


int i, j, k; // For iteration
