clear all;clc;
close all;

x = 0:pi/6:2*pi;
v = cos(x);

xq = 0:pi/18:2*pi;

figure(1)
vq1 = interp1(x,v,xq);
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');

figure(2)
vq1 = interp1(x,v,xq,'spline');
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('Spline Interpolation');


pkg load io %for Octave
ESM_DATA = xlsread('ESM_FEM_DATA.xlsx');
ID = [-200:50: -0];
IQ = [0:50: 200];
[X,Y] = meshgrid(ID,IQ)
for col = 1:5
    for row = 1:5
      Lambda_d(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 5.5),5);
      Lambda_q(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 5.5),4);
    end
end

figure(3)
contour(X,Y, Lambda_d)
title("D-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

figure(4)
contour(X,Y, Lambda_q)
title("Q-axis Flux")
xlabel("d-axis current [A]")
ylabel("q-axis current [A]")

ID_i = [-200:1: -0];
IQ_i = [0:1: 200];
[X_i,Y_i] = meshgrid(ID_i,IQ_i);
Zd_i = interp2(ID,IQ,Lambda_d,X_i,Y_i,'spline');
figure(5)
contour(X_i,Y_i,Zd_i)

ID_i = [-200:1: -0];
IQ_i = [0:1: 200];
[X_i,Y_i] = meshgrid(ID_i,IQ_i);
Zq_i = interp2(ID,IQ,Lambda_q,X_i,Y_i,'spline');
figure(6)
contour(X_i,Y_i,Zq_i);

pkg load io %for Octave
NTC_DATA = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[NTC_DATA1, NTC_DATA2] = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[size_row, size_col] = size(NTC_DATA)
NTC_DATA_New(1:(size_row) ,1:2) = NTC_DATA(: ,1:2)
NTC_DATA_New(size_row+1:(size_row*2) ,1:2) = NTC_DATA(: ,3:4)
NTC_DATA_New(size_row*2+1:(size_row*3) ,1:2) = NTC_DATA(: ,5:6)
NTC_DATA_New(size_row*3+1:(size_row*4) ,1:2) = NTC_DATA(: ,7:8)

[Resistance_max,Resistance_min] = MaxMin(NTC_DATA_New(:,2))

[Temp_max,Temp_min] = MaxMin(NTC_DATA_New(:,1))

figure(11)
plot(NTC_DATA_New(:,1),NTC_DATA_New(:,2) )
hold on
grid on
axis([Temp_min Temp_max 0 Resistance_max])
hold off

R_pull = input('Enter the pull up resistance value. [Ohm] : ')
V_Ref = input('Enter the reference voltage value. [V] : ')
disp('Calculate Vout value')
NTC_DATA_New(:,2)*V_Ref*R_pull

R_pull_Vec = ones(204,1)*R_pull;
R_eq = R_pull_Vec+NTC_DATA_New(:,2);
Ratio = NTC_DATA_New(:,2)./R_eq(:,1)

Vout = Ratio*V_Ref;

figure(12)
plot(NTC_DATA_New(:,1),Vout(:,1))
xlabel( NTC_DATA2{4,1})
ylabel ('Voltage out')
hold on
grid on
axis([Temp_min Temp_max 0 max(Vout)])
hold off

Vol_i = [0.2:0.1: 4.8];
Tempi = interp1(Vout(:,1),NTC_DATA_New(:,1),Vol_i,'spline')

figure(13)
plot(Vol_i(:),Tempi(:))
ylabel( NTC_DATA2{4,1})
xlabel ('Voltage ')


V_in = input('Enter the voltage input of MCU')
Temp_1=interp1(Vol_i,Tempi,V_in)
