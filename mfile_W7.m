clear all;clc;
close all;


figure(1)
spacing = 0.2;
[X,Y] = meshgrid(-2:spacing:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,spacing);
quiver(X,Y,DX,DY);
hold on
contour(X,Y,Z);
axis equal
hold off

figure(2)
surf(X,Y,Z)
figure(3)
surfc(X,Y,Z)
figure(4)
waterfall(X,Y,Z)

figure(5)
spacing = 0.1;
[X3,Y3] = meshgrid(-1:spacing:1);
Z3 = (X3).^2+(Y3).^2;
[DX3,DY3] = gradient(Z3,spacing);
quiver(X3,Y3,DX3,DY3);
hold on
contour(X3,Y3,Z3);
axis equal
hold off

figure(6)
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

figure(7)
subplot(2,1,1)
plot(X3(1,:), DX3(1,:))
subplot(2,1,2)
plot(Y3(:,1), DY3(:,1))

figure(8)
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

figure(9)
vq1 = interp1(x,v,xq);
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');

figure(10)
vq2 = interp1(x,v,xq,'spline');
plot(x,v,'o',xq,vq2,':.');
xlim([0 2*pi]);
title('Spline Interpolation');

v = [0  1.41  2  1.41  0  -1.41  -2  -1.41 0];

xq = 1.5:8.5;
vq = interp1(v,xq);
figure(11)
plot((1:9),v,'o',xq,vq,'*');
legend('v','vq');

spacing = 0.5;
[X3,Y3] = meshgrid(-1:spacing:1);
Z3 = (X3).^2+(Y3).^2;
figure(12)
surf(X3,Y3,Z3)
%contour(X3,Y3,Z3)
spacing = 0.1;
[Xq3,Yq3] = meshgrid(-1:spacing:1);
Zq3 = interp2(X3,Y3,Z3,Xq3,Yq3);
figure(13)
surf(Xq3,Yq3,Zq3)
%contour(Xq3,Yq3,Zq3)

Zq4 = interp2(X3,Y3,Z3,Xq3,Yq3,'spline');
figure(14)
surf(Xq3,Yq3,Zq4)

%contour(Xq3,Yq3,Zq4)

pkg load io %for Octave
ESM_DATA = xlsread('ESM_FEM_DATA.xlsx');
ID = [-200:50: -0];
IQ = [0:50: 200];
[X,Y] = meshgrid(ID,IQ)
for col = 1:5
    for row = 1:5
      %Lambda_d(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 6.0),5)
      %Lambda_q(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 6.0),4)
    end
end

for col = 1:5
    for row = 1:5
        for idx = 1:108
            if (ESM_DATA(idx,1)== X(row,col)) && (ESM_DATA(idx,2)== Y(row,col)) && (ESM_DATA(idx,3)== 6.0)
                Lambda_d(row,col) = ESM_DATA(idx ,5);
                Lambda_q(row,col) = ESM_DATA(idx ,4);
            end
        end
    end
end


figure(15)
contour(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

figure(16)
contour(X,Y, Lambda_q)
title("Q-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

ID_i = [-200:1: -0];
IQ_i = [0:1: 200];
[X_i,Y_i] = meshgrid(ID_i,IQ_i)
%Zd_i = interp2(ID,IQ,Lambda_d,X_i,Y_i);
Zd_i = interp2(ID,IQ,Lambda_d,X_i,Y_i,'spline');
figure(17)
%contour(X_i,Y_i,Zd_i)
contour(X_i,Y_i,Zd_i)

figure(18)
%contour(X_i,Y_i,Zd_i)
surf(X_i,Y_i,Zd_i)

