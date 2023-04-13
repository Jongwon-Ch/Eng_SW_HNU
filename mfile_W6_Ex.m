clear all;clc;
close all;

figure(1)
spacing = 0.1053;
[X_,Y_] = meshgrid(-1:spacing:1);
Z_ = 0.0001./sqrt((X_).^2+(Y_).^2);
[DX_,DY_] = gradient(-1*Z_,spacing); %Electric field
quiver(X_,Y_,DX_,DY_);
hold on
contour(X_,Y_,Z_);
colorbar
axis equal
hold off

figure(2)
surfc(X_,Y_,Z_);
title("Electric Potential")
xlabel("x [m]")
ylabel("y [m]")

figure(3)
spacing = 0.1053;
[X_,Y_] = meshgrid(-1:spacing:1);
Z_ = -0.0001./sqrt((X_-0.5).^2+(Y_).^2) + -0.0001./sqrt((X_+0.5).^2+(Y_).^2); %Electric Potential
[DX_,DY_] = gradient(-1*Z_,spacing); %Electric field
quiver(X_,Y_,DX_,DY_);
hold on
contour(X_,Y_,Z_);
colorbar
axis equal
hold off

figure(4)
surfc(X_,Y_,Z_);
title("Electric Potential")
xlabel("x [m]")
ylabel("y [m]")

%pkg load io %for Octave
ESM_DATA = xlsread('ESM_FEM_DATA.xlsx');
%ESM_DATA(:,1)

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

figure(5)
contour(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")


figure(6)
contour(X,Y, Lambda_q)
title("Q-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")


figure(7)
surfc(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

figure(8)
surfc(X,Y, Lambda_q)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

figure(9)
subplot(2,2,1)
surfc(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")
subplot(2,2,2)
mesh(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")
subplot(2,2,3)
surfc(X,Y, Lambda_q)
title("Q-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")
subplot(2,2,4)
mesh(X,Y, Lambda_q)
title("Q-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")
colorbar
