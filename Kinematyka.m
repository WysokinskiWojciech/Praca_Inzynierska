clear all
close all
clc
a=91;
b=21
c=200
d=155
e=78
f=30
g=140
h=40
i=[135;0]
theta5=pi
theta6=0.5
theta7=1
theta=[theta6;theta7]
for z=1:1:10
 uchyb=i-[f*cos(theta5)+g*cos(theta(1))-h*cos(theta(2)) ; f*sin(theta5)+g*sin(theta(1))-h*sin(theta(2))] 
 J=[-g*sin(theta(1)),h*sin(theta(2));g*cos(theta(1)),-h*cos(theta(2))]
 theta=theta+inv(J)*uchyb
 blad(z)=norm(uchyb) 
end
figure
plot(blad,'o')
axis([0 11 0 100])
title("B³¹d bezwglêdny")
xlabel("Numer iteracji")
ylabel("B³¹d bezwglêdny[mm]")
grid on

theta2=0
gamma=0.591:0.01:2.3446
x=a*cos(pi/2)+b*cos(theta2)+c*cos(theta2)+d*cos(theta2+gamma+pi)+e*cos(theta2+gamma+pi)
y=a*sin(pi/2)+b*sin(theta2)+c*sin(theta2)+d*sin(theta2+gamma+pi)+e*sin(theta2+gamma+pi)
figure
plot(x(1,:),y(1,:))
hold on
theta2=0:0.01:pi
gamma=2.3446
x=a*cos(pi/2)+b*cos(theta2)+c*cos(theta2)+d*cos(theta2+gamma+pi)+e*cos(theta2+gamma+pi)
y=a*sin(pi/2)+b*sin(theta2)+c*sin(theta2)+d*sin(theta2+gamma+pi)+e*sin(theta2+gamma+pi)
plot(x(1,:),y(1,:))
hold on
theta2=pi
gamma=2.3446:-0.01:0.591
x=a*cos(pi/2)+b*cos(theta2)+c*cos(theta2)+d*cos(theta2+gamma+pi)+e*cos(theta2+gamma+pi)
y=a*sin(pi/2)+b*sin(theta2)+c*sin(theta2)+d*sin(theta2+gamma+pi)+e*sin(theta2+gamma+pi)
plot(x(1,:),y(1,:))
hold on
theta2=pi:-0.01:0
gamma=0.591
x=a*cos(pi/2)+b*cos(theta2)+c*cos(theta2)+d*cos(theta2+gamma+pi)+e*cos(theta2+gamma+pi)
y=a*sin(pi/2)+b*sin(theta2)+c*sin(theta2)+d*sin(theta2+gamma+pi)+e*sin(theta2+gamma+pi)
plot(x(1,:),y(1,:))
title("Przestrzeñ robocza manipulatora")
xlabel("X [mm]")
ylabel("Z [mm]")
axis([-150 450 -150 450])