clear all;clc;
close all;
x = [0:2:18];
y = [0, 0.33 , 4.13, 6.29, 6.85, 11.19 , 13.19, 13.96, 16.33 18.17];

%Task 1
x1 = 0: pi/180: 2*pi;
y1 = cos(4*x1);
figure(1)
plot(x1, y1)
hold on
y2 = sin(x1);
plot(x1,  y2)
hold off

%Task 2
figure(2)
plot(x,y,':ok') 

figure(3)
plot(x, y, 'LineWidth', 2, 'Marker', 'o', 'MarkerSize', 4)

%Task 3 
figure(4)
polar(x1,y2) %Octave
%polarplot(x1,y2) %Matlab
title('The plot of sine function')

%Task 6
figure(5)
subplot(1,2,1), plot(x1,  y2);
subplot(1,2,2),  polar(x1,y2); %Octave

%Task 7
x1 = 0: pi/180: 2*pi;
x = 0: pi/180: 2*pi;
y1 = sin(x1);
y2 = exp(x1);
figure(6)
ax = plotyy (x1,y1, x-1,y2);
xlabel ("X");
ylabel (ax(1), "Axis 1");
ylabel (ax(2), "Axis 2");

%Task 8
figure(7)
fplot(@(x) sin(x), [-2*pi, 2*pi])
%Ex)
figure(8)
fplot(@(x) sin(x)+cos(x), [-2*pi, 2*pi])



figure(9)
spacing = 0.2;
[X,Y] = meshgrid(-2:spacing:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,spacing);
quiver(X,Y,DX,DY);
hold on
contour(X,Y,Z);
axis equal
hold off

figure(10)
surf(X,Y,Z)
figure(11)
surfc(X,Y,Z)
figure(12)
waterfall(X,Y,Z)

figure(13)
spacing = 0.1;
[X3,Y3] = meshgrid(-1:spacing:1);
Z3 = (X3).^2+(Y3).^2;
[DX3,DY3] = gradient(Z3,spacing);
quiver(X3,Y3,DX3,DY3);
hold on
contour(X3,Y3,Z3);
axis equal
hold off

figure(14)
subplot(2,2,1)
quiver(X3,Y3,DX3,DY3);hold on
contour(X3,Y3,Z3);
axis equal
hold off
subplot(2,2,2)
surf(X3,Y3,Z3)
subplot(2,2,3)
surfc(X3,Y3,Z3)
subplot(2,2,4)
mesh(X3,Y3,Z3)
colorbar

figure(15)
subplot(2,1,1)
plot(X3(1,:), DX3(1,:))
subplot(2,1,2)
plot(Y3(:,1), DY3(:,1))

figure(16)
spacing = 0.1053;
[X3,Y3] = meshgrid(-1:spacing:1);
Z3 = 1./sqrt((X3).^2+(Y3).^2);
[DX3,DY3] = gradient(Z3,spacing);
quiver(X3,Y3,DX3,DY3);
hold on
contour(X3,Y3,Z3);
axis equal
hold off

x = 0:pi/4:2*pi;
v = sin(x);

xq = 0:pi/16:2*pi;

figure(17)
vq1 = interp1(x,v,xq);
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');

figure(18)
vq2 = interp1(x,v,xq,'spline');
plot(x,v,'o',xq,vq2,':.');
xlim([0 2*pi]);
title('Spline Interpolation');

v = [0  1.41  2  1.41  0  -1.41  -2  -1.41 0];

xq = 1.5:8.5;
vq = interp1(v,xq);
figure(19)
plot((1:9),v,'o',xq,vq,'*');
legend('v','vq');

spacing = 0.5;
[X3,Y3] = meshgrid(-1:spacing:1);
Z3 = (X3).^2+(Y3).^2;
figure(20)
surf(X3,Y3,Z3)
spacing = 0.1;
[Xq3,Yq3] = meshgrid(-1:spacing:1);
Zq3 = interp2(X3,Y3,Z3,Xq3,Yq3);
figure(21)
surf(Xq3,Yq3,Zq3)

Zq4 = interp2(X3,Y3,Z3,Xq3,Yq3,'spline');
figure(22)
surf(Xq3,Yq3,Zq4)

