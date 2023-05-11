clear all;clc;
close all;

pkg load control

%pkg load symbolic

% Symbolic
%syms a1 a2 a3 b1 b2 s

%den1 = b1*s + b2
%num1 = a1*s^2 + a2*s + a3

%G = den1/num1

%Negative Feedback
G = tf([2 5 1],[1 2 3],'inputname',"torque",'outputname',"velocity");
C = tf([5,10],[1,10]);
sys1 = feedback(G,C,-1)%

%Positive Feedback
G = tf([2 5 1],[1 2 3],'inputname',"torque",'outputname',"velocity");
C = tf([5,10],[1,10]);
sys2 = feedback(G,C,+1)

figure(1)
step(sys1)
hold on
step(sys2)
axis([0, 10, -1, 1])
hold off

pkg load signal
[z1, p1, k1] = tf2zp(sys1)
[z2, p2, k2] = tf2zp(sys2)

Pole_Real_1  = real(z1)
Pole_Imag_1  = imag(z1)
Zero_Real_1  = real(p1)
Zero_Imag_1  = imag(p1)

Pole_Real_2  = real(z2)
Pole_Imag_2  = imag(z2)
Zero_Real_2  = real(p2)
Zero_Imag_2  = imag(p2)

figure(2)
plot(Pole_Real_1, Pole_Imag_1, 'x', "markersize", 10)
hold on
plot(Zero_Real_1, Zero_Imag_1, 'o', "markersize", 10)
hold off

figure(3)
plot(Pole_Real_2, Pole_Imag_2, 'x', "markersize", 10)
hold on
plot(Zero_Real_2, Zero_Imag_2, 'o', "markersize", 10)
hold off


k = 1
num_3 = [k]; %numerator
den_3 = [1 , 1]; %denominator
G_3 = feedback(tf(num_3,den_3),1,-1)
figure(4)
step(G_3, 2)
hold on

k = 5
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
step(G_3, 2)
hold on

k = 10
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
step(G_3, 2)
hold on
step(tf([1],[1]),'k')
hold off
axis([0, 2, -0.1, 1.1])

k = 1
num_3 = [k]; %numerator
den_3 = [1 , 1]; %denominator
G_3 = feedback(tf(num_3,den_3),1,-1)
figure(5)
ramp(G_3, 2)
hold on

k = 5
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
ramp(G_3, 2)
hold on

k = 10
num_3 = [k]; %numerator
G_3 = feedback(tf(num_3,den_3),1,-1)
ramp(G_3, 2)
hold on
ramp(tf([1],[1]),'k')
hold off
axis([0, 2, -0.1, 1.1])

%k = 10
%num_3 = [k]; %numerator
%G_3 = feedback(tf(num_3,den_3),1,-1)
%rlocusx(G_3,0 ,100)

G = tf([10],[1 1 10],'inputname',"torque",'outputname',"velocity");
figure(6)
[Resp, Resp_t ]= step(G);
step(G)
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')
hold off

Overshoot = max(Resp)
Overshoot_time =Resp_t(find(max(Resp)==Resp(:,1)),1)
find((Resp<1.05)&(Resp>0.95))


