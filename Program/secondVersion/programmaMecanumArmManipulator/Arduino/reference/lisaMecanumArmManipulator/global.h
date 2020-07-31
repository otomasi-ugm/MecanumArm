int motorPin[][2] = {
  /* PWM, DIR*/
  {4, 5}, // m1 -> front-right
  {2, 3}, // m2 -> front-left
  {8, 9}, // m3 -> rear-right
  {6, 7}  // m4 -> rear-left
};


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

static float matrix[4] = {0, 0, 0, 0};
float *outPWM;
int gain = 0;

int i, j, k; // For iteration
