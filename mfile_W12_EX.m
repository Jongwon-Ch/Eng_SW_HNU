clear all;clc;
close all;

%pkg load control
G = tf([1],[1 1 0 ])
K = 1;
G_fd = feedback(G*K,1,-1)

final_time  = 12.0;
figure(1)
[Resp, Resp_t ]= step(G_fd,final_time);
step(G_fd,final_time);
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')

Omega_n = sqrt(K);
zeta = 1/Omega_n/2;
phi = acos(zeta);

Fre = Omega_n*sqrt(1-zeta^2)
T_max = (pi/2-phi)/Omega_n/sqrt(1-zeta^2)
Overshoot = 1/sqrt(1-zeta^2)*exp(-zeta*Omega_n.*T_max)

hold on
x = linspace(0, final_time,1000.0);
y =  1 - 1/sqrt(1-zeta^2).*exp(-zeta*Omega_n.*x).*sin(Omega_n.*sqrt(1-zeta^2).*x+phi);
plot(x,y,'x')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = tf([1],[1 1 0 ])
K = 10;
G_fd = feedback(G*K,1,-1)

final_time  = 12.0;
figure(2)
[Resp, Resp_t ]= step(G_fd,final_time);
step(G_fd,final_time);
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')

Omega_n = sqrt(K);
zeta = 1/Omega_n/2;
phi = acos(zeta);

Fre = Omega_n*sqrt(1-zeta^2)
T_max = (3*pi/2-phi)/Omega_n/sqrt(1-zeta^2)
Overshoot = 1/sqrt(1-zeta^2)*exp(-zeta*Omega_n*T_max) +1

hold on
x = linspace(0, final_time,1000.0);
y =  1 - 1/sqrt(1-zeta^2).*exp(-zeta*Omega_n.*x).*sin(Omega_n.*sqrt(1-zeta^2).*x+phi);
plot(x,y,'x')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = tf([1],[1 1 0 ])
K = 100;
G_fd = feedback(G*K,1,-1)

final_time  = 12.0;
figure(3)
[Resp, Resp_t ]= step(G_fd,final_time);
step(G_fd,final_time);
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')

Omega_n = sqrt(K);
zeta = 1/Omega_n/2;
phi = acos(zeta);

Fre = Omega_n*sqrt(1-zeta^2)
T_max = (3*pi/2-phi)/Omega_n/sqrt(1-zeta^2)
Overshoot = 1/sqrt(1-zeta^2)*exp(-zeta*Omega_n*T_max) +1

hold on
x = linspace(0, final_time,1000.0);
y =  1 - 1/sqrt(1-zeta^2).*exp(-zeta*Omega_n.*x).*sin(Omega_n.*sqrt(1-zeta^2).*x+phi);
plot(x,y,'x')
hold off