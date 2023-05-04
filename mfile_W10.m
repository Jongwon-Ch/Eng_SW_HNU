clear all;clc;
close all;

pkg load control
num_2 = 1; %numerator
den_2 = [1, 3 , 2]; %denominator
G_2 = tf(num_2,den_2)
figure(1)
step(G_2, 10)
%By default, step chooses an end time that shows the steady state that the response is trending toward.
%This system has fast transients, however, which are obscured on this time scale.
%To get a closer look at the transient response, limit the step plot to t = 1 s.

%hold on
%fh = @(x) 5 - 5*exp(-200*x);
%fplot (fh, [0, 0.05]);
%hold off


Poles_2 = roots(den_2)
Zeros_2 = roots(num_2)

Pole_Real_2  = real(Poles_2)
Pole_Imag_2  = imag(Poles_2)
Zero_Real_2  = real(Zeros_2)
Zero_Imag_2  = imag(Zeros_2)

figure(2)
plot(Pole_Real_2, Pole_Imag_2, 'x', "markersize", 10)
hold on
plot(Zero_Real_2, Zero_Imag_2, 'o', "markersize", 10)
hold off

num_3 = [1 2 1]; %numerator
den_3 = [1, 4 , 6 , 4]; %denominator
G_3 = tf(num_3,den_3)
figure(3)
step(G_3, 10)

Poles_3 = roots(den_3)
Zeros_3 = roots(num_3)

Pole_Real_3  = real(Poles_3)
Pole_Imag_3  = imag(Poles_3)
Zero_Real_3  = real(Zeros_3)
Zero_Imag_3  = imag(Zeros_3)

figure(4)
plot(Pole_Real_3, Pole_Imag_3, 'x', "markersize", 10)
hold on
plot(Zero_Real_3, Zero_Imag_3, 'o', "markersize", 10)
hold off

%figure(2)
%ramp(G_2, 10)

