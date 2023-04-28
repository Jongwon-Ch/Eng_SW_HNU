clear all;clc;
close all;

Rs = 0.1;
La = 0.001;
Rf = 1;
Lf =0.1;
Laf= 0.1;
if0 = 1;

J = 0.05;
B = 0.001;
%Root Locus
%1. In the DC motor, construct a current control using PELCS simulation. Then, calculate kp, ki using root locus.
%Then,  check the control performance with the step response.. (Rise time = 1ms, overshoot < 1.05)

pkg load control
num_RL = 1; %numerator
den_RL = [La, Rs]; %denominator
G_RL = tf(num_RL,den_RL)
figure(1)
step(G_RL, 0.1)
%By default, step chooses an end time that shows the steady state that the response is trending toward.
%This system has fast transients, however, which are obscured on this time scale.
%To get a closer look at the transient response, limit the step plot to t = 1 s.

hold on
fh = @(x) 10 - 10*exp(-100*x);
fplot (fh, [0, 0.1]);


pkg load io %for Octave
PLECS_DATA_RL = csvread('RLdata.csv');

plot(PLECS_DATA_RL(1,:), PLECS_DATA_RL(2,:))
hold off

Js = 0.1;
Bs = 0.01;
num_mec = 1; %numerator
den_mec = [Js, Bs]; %denominator
G_mec = tf(num_mec,den_mec)
figure(2)
step(G_mec, 50)

hold on
fh = @(x) 100 - 100*exp(-0.1*x);
fplot (fh, [0, 50]);

PLECS_DATA_RL = csvread('Mecdata.csv');

plot(PLECS_DATA_RL(1,:), PLECS_DATA_RL(2,:))
hold off

