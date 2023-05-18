clear all;clc;
close all;

pkg load control

%1
Js = 0.2;
Bs = 0.01;
num_mec = 1; %numerator
den_mec = [Js, Bs]; %denominator
G_mec = tf(num_mec,den_mec)
figure(1)
step(G_mec, 100)

hold on
fh = @(x) 100 - 100*exp(-0.05*x);
fplot (fh, [0, 100]);

PLECS_DATA_RL = csvread('Mecdata_EX.csv');

plot(PLECS_DATA_RL(1,:), PLECS_DATA_RL(2,:))
hold off

%2
%Negative Feedback
G = tf([1],[1 2 3],'inputname',"torque",'outputname',"velocity");
C = tf([10 500],[1,100]);
sys1 = feedback(G,C,-1)%

%Positive Feedback
G = tf([1],[1 2 3],'inputname',"torque",'outputname',"velocity");
C = tf([10 500],[1,100]);
sys2 = feedback(G,C,+1)

figure(2)
step(sys1,10)
hold on
step(sys2,10)
axis([0, 10, -1, 10])
hold off

pkg load signal
[z1, p1, k1] = tf2zp(sys1)
[z2, p2, k2] = tf2zp(sys2)

Pole_Real_1  = real(p1)
Pole_Imag_1  = imag(p1)
Zero_Real_1  = real(z1)
Zero_Imag_1  = imag(z1)

Pole_Real_2  = real(p2)
Pole_Imag_2  = imag(p2)
Zero_Real_2  = real(z2)
Zero_Imag_2  = imag(z2)

figure(3)
plot(Pole_Real_1, Pole_Imag_1, 'x', "markersize", 10)
hold on
plot(Zero_Real_1, Zero_Imag_1, 'o', "markersize", 10)
hold off

figure(4)
plot(Pole_Real_2, Pole_Imag_2, 'x', "markersize", 10)
hold on
plot(Zero_Real_2, Zero_Imag_2, 'o', "markersize", 10)
hold off


k = 1
num_3 = [k]; %numerator
den_3 = [0.001 , 0.2]; %denominator
G_3 = feedback(tf(num_3,den_3),1,-1)
figure(5)
step(G_3, 0.01)
hold on

k = 5
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
step(G_3, 0.01)
hold on

k = 10
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
step(G_3, 0.01)
hold on
step(tf([1],[1]),'k')
hold off
axis([0, 0.005, -0.1, 1.1])

%k = 10
%num_3 = [k]; %numerator
%G_3 = feedback(tf(num_3,den_3),1,-1)
%rlocusx(G_3,0 ,100)



