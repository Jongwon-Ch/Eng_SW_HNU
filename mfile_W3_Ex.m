clear all;clc;
close all;
%% 함수 선언하기 
%복습1 
[max_v, min_v] = MaxMin(1:5)

%복습2 
A2 = [2 5 3; 10 5 2 ; 4 1 20]
[max_v, min_v] = MaxMin(A2(1,:));
R_max2(1,1) = max_v;
R_min2(1,1) = min_v;
[max_v, min_v] = MaxMin(A2(2,:));
R_max2(1,2) = max_v;
R_min2(1,2) = min_v;
[max_v, min_v] = MaxMin(A2(3,:));
R_max2(1,3) = max_v
R_min2(1,3) = min_v

%% 실전 
%Excel Data load
NTC_DATA = xlsread('NTHS0805N02N1002J_Curve')
[NTC_DATA1, NTC_DATA2] = xlsread('NTHS0805N02N1002J_Curve')
[size_row, size_col] = size(NTC_DATA)
NTC_DATA_New(1:(size_row) ,1:2) = NTC_DATA(: ,1:2)
NTC_DATA_New(size_row+1:(size_row*2) ,1:2) = NTC_DATA(: ,3:4)
NTC_DATA_New(size_row*2+1:(size_row*3) ,1:2) = NTC_DATA(: ,5:6)
NTC_DATA_New(size_row*3+1:(size_row*4) ,1:2) = NTC_DATA(: ,7:8)

%Resistance_max = max(NTC_DATA_New(:,2))
%Resistance_min = min(NTC_DATA_New(:,2))
[Resistance_max,Resistance_min] = MaxMin(NTC_DATA_New(:,2))

%Temp_max = max( NTC_DATA_New(:,1) )
%Temp_min = min( NTC_DATA_New(:,1) )
[Temp_max,Temp_min] = MaxMin(NTC_DATA_New(:,1))

%plot(NTC_DATA_New(:,1),NTC_DATA_New(:,2), "o",LineStyle="-"), xlabel( 'Temp °C'), ylabel ('Resistance Ω')
figure(1)
plot(NTC_DATA_New(:,1),NTC_DATA_New(:,2), "o",LineStyle="-"), xlabel( NTC_DATA2{4,1}), ylabel (NTC_DATA2{4,2})
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

figure(2)
plot(NTC_DATA_New(:,1),Vout(:,1), "o",LineStyle="-"), xlabel( NTC_DATA2{4,1}), ylabel ('Voltage out')
hold on 
grid on
axis([Temp_min Temp_max 0 max(Vout)])

Power_Pull_Up = (V_Ref-Vout).*(V_Ref-Vout)/R_pull
Power_NTC = (Vout).*(Vout)./NTC_DATA_New(:,2)
Power_Pull_Up_max = max(Power_Pull_Up)
Power_NTC_max = max(Power_NTC)