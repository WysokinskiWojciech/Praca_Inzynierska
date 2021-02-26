#include <ThingerESP8266.h>
#include <Servo.h>
#include <BasicLinearAlgebra.h>
using namespace BLA;

#define USERNAME "WojciechWysokinski"
#define DEVICE_ID "Praca_Dyplomowa"
#define DEVICE_CREDENTIAL "Praca_Dyplomowa"
#define SSID "Praca_Przejsciowa"
#define SSID_PASSWORD "123456789"

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

int a=91;
int b=21;
int c=200;
int d=155;
int e=78;
int f=30;
int g=140;
int h=40;
int i=135;
int theta1=90,theta2=90,theta3=0,theta4=90,theta5=45;
int X=150,Y=250,Z=320;
boolean Ster;
ThingerESP8266 thing(USERNAME, DEVICE_ID, DEVICE_CREDENTIAL);

void setup() {

thing.add_wifi(SSID, SSID_PASSWORD);

servo1.attach(16);
servo2.attach(5);
servo3.attach(4);
servo4.attach(2);
servo5.attach(0);
  
thing["theta1"] << inputValue(theta1);
thing["theta2"] << inputValue(theta2);
thing["theta3"] << inputValue(theta3);
thing["theta4"] << inputValue(theta4);
thing["theta5"] << inputValue(theta5);
thing["Ster"] << inputValue(Ster);
thing["X"] << inputValue(X);
thing["Y"] << inputValue(Y);
thing["Z"] << inputValue(Z);
}

void loop() {
thing.handle();
sterowanie();
}
void sterowanie(){
if (Ster==0){
   servo1.write(theta1);
   servo2.write(abs(theta2-180));
   servo3.write(theta3);
   servo4.write(abs(theta4-180));
   servo5.write(theta5);
  } 
else if(Ster==1){
BLA::Matrix<3> theta={0.5,6,0.1};
BLA::Matrix <2> zad1={sqrt(X*X+Y*Y),Z};
  
for (int z=0;z<10;z++){
BLA::Matrix<2,3> 
J1={-c*sin(theta(0)),-d*sin(theta(1)),-e*sin(theta(2)),
c*cos(theta(0)),d*cos(theta(1)),  e*cos(theta(2))};

BLA::Matrix <2>
X1={b+c*cos(theta(0))+d*cos(theta(1))+e*cos(theta(2)),
a+c*sin(theta(0))+d*sin(theta(1))+e*sin(theta(2))};

BLA::Matrix<2> uchyb1={zad1-X1};
BLA::Matrix<3,2> Jt=~J1;
BLA::Matrix<2,2> Z=(J1*Jt);
BLA::Matrix<2,2> P=Invert(Z);
BLA::Matrix <3,2> J_z=Jt*P;
theta=theta+J_z*uchyb1;
  }
double gamma=theta(1)-theta(0)-3.14; 
BLA::Matrix<2> kat={1,0};
for (int z=0;z<10;z++){
BLA::Matrix <2>
X2={f*cos(kat(0))+g*cos(kat(1))-h*cos(gamma),
f*sin(kat(0))+g*sin(kat(1))-h*sin(gamma)};
  
BLA::Matrix<2,2> J2={-f*sin(kat(0)),-g*sin(kat(1)),
f*cos(kat(0)),g*cos(kat(1))};
 
BLA::Matrix<2> zad2={i,0};
BLA::Matrix<2> uchyb2=zad2-X2;
kat=kat+Invert(J2)*uchyb2;
  }
theta1=round(atan2(Y,X)*180/PI);
theta2=round(theta(0)*180/PI);
theta3=round(kat(0)*180/PI);
theta4=round((PI/2+2*PI-theta(1)+theta(2))*180/PI);
if(theta(0)<=PI && theta(1)<=2*PI && theta(2)<=PI ){
servo1.write(theta1);
servo2.write(abs(theta2-180));
servo3.write(theta3);
servo4.write(abs(theta4-180));
servo5.write(theta5);
 } 
else{
 }
 }}
  
