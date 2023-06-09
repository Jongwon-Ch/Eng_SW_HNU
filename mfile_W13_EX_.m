clear all;clc;
close all;

pkg load control
pkg load signal

zeta = 0.0;
omega_n= 10;


zeta = zeta ;
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
figure(1)
step(G)
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')

hold on
zeta = zeta+0.1 ;
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1;
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1;
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1;
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold on
zeta = zeta+0.1
G = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2] )
step(G)

hold off

[z1, p1, k1] = tf2zp(G)

Pole_Real_1 = real(p1)
Pole_Imag_1 = imag(p1)
Zero_Real_1 = real(z1)
Zero_Imag_1 = imag(z1)

figure(2)
plot(Pole_Real_1, Pole_Imag_1, 'x', "markersize", 10)
hold on
plot(Zero_Real_1, Zero_Imag_1, 'o', "markersize", 10)
hold off

ra = 0.1;
La = 0.001;
K1 = 2;
G1 = tf([1], [La ra] );
G_fd = feedback(G1*K1,1,-1)
figure(3)
step(G_fd)
[Resp, Resp_t ]= step(G_fd);
Err(:,1) = 1 - Resp(:,1);
hold on
plot(Resp_t, Err)

hold on
fh = @(x) 20/21 - 20/21*exp(-2100.0*x);
fplot (fh, [0, 0.003]);
hold off

figure(4)
ramp(G_fd)
[Resp, Resp_t ]= ramp(G_fd);
Err(:,1) = Resp_t(:,1) - Resp(:,1);
hold on
plot(Resp_t, Err)

hold on
fh = @(x) 20/21*x + 2000/2100/2100*exp(-2100.0*x)-2000/2100/2100;
fplot (fh, [0, 0.003]);
hold off

ra = 0.1;
La = 0.001;
K1 = 2;
K2 = 1102.5;
G1 = tf([1], [La ra] );
G2 = tf([K1 K2], [1 0] );
G_fd = feedback(G1*G2,1,-1)
figure(5)
step(G_fd)
[Resp, Resp_t ]= step(G_fd);
Err(:,1) = 1 - Resp(:,1);
hold on
plot(Resp_t, Err)
hold off


figure(6)
ramp(G_fd)
[Resp, Resp_t ]= ramp(G_fd);
Err(:,1) = Resp_t(:,1) - Resp(:,1);
hold on
plot(Resp_t, Err)
hold off

