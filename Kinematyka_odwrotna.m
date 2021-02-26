
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
theta5=1
theta6=0.3
theta7=0.5
kat=[theta5;theta6]

theta=[0.5;6;0.1]
Z=[-280;-40;-40];

Y=[sqrt(Z(1)^2+Z(2)^2);Z(3)]
theta1=atan2(Z(2),Z(1));

for z=1:1:10
X=[((b+c*cos(theta(1)))+d*cos(theta(2))+e*cos(theta(3)));
    a+c*sin(theta(1))+d*sin(theta(2))+e*sin(theta(3))]
    uchyb=Y-X
J=[(-c*sin(theta(1))), d*(-sin(theta(2))), e*(-sin(theta(3)));
    c*cos(theta(1)), d*cos(theta(2)), e*cos(theta(3))]
theta=theta+J'*inv(J*J')*uchyb
blad(z)=norm(uchyb)
end
figure
plot(blad,'o')
axis([0 11 0 250])
title("Wykres b³êdu bezwzglêdnego")
xlabel("Numer iteracji")
ylabel("B³¹d bezwzglêdny [mm]")
gamma=theta(2)-theta(1)-pi
for z=1:1:10
uchyb_1=i-[f*cos(kat(1))+g*cos(kat(2))-h*cos(gamma) ; f*sin(kat(1))+g*sin(kat(2))-h*sin(gamma)] 
J=[-f*sin(kat(1)),-g*sin(kat(2));f*cos(kat(1)),g*cos(kat(2))]
kat=kat+inv(J)*uchyb_1
end
[f*cos(kat(1))+g*cos(kat(2))-h*cos(gamma) ; f*sin(kat(1))+g*sin(kat(2))-h*sin(gamma)]
kat1=round(theta1*180/pi)
kat2=round(theta(1)*180/pi)
kat3=round(kat(1)*180/pi)
kat4=round(theta(3)*180/pi)

