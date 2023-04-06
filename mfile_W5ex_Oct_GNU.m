clear all;clc;
close all;

pkg load io %for Octave
NTC_DATA = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[NTC_DATA1, NTC_DATA2] = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[size_row, size_col] = size(NTC_DATA)
NTC_DATA_New(1:(size_row) ,1:2) = NTC_DATA(: ,1:2)
NTC_DATA_New(size_row+1:(size_row*2) ,1:2) = NTC_DATA(: ,3:4)
NTC_DATA_New(size_row*2+1:(size_row*3) ,1:2) = NTC_DATA(: ,5:6)
NTC_DATA_New(size_row*3+1:(size_row*4) ,1:2) = NTC_DATA(: ,7:8)

figure(1)
plot(NTC_DATA_New(:,1), NTC_DATA_New(:,2), 'LineWidth', 4, 'Marker', 'x', 'MarkerSize', 2)
xlabel(NTC_DATA2{4,1});
ylabel(NTC_DATA2{4,2});
grid on
axis ([-50 150 0 400000])

%%
MechPower = input('Enter the maximum mechanical power:[unit:kW]')
BaseSpeed = input('Enter the base speed:[unit:rpm]')
MaxSpeed = input('Enter the Max speed:[unit:rpm]')
Check = input('check')
BaseSpeed_rad_sec = BaseSpeed/60*2*pi;
Max_Tor =  MechPower/BaseSpeed_rad_sec*1000.0

Speed = 0:100:MaxSpeed;
[SizeRow, SizeCol] = size(Speed)

for i = 1:SizeCol
    if(Speed(i)<BaseSpeed)
        %Tor(i) = Max_Tor;
        %Pow(i) = Speed(i)*Max_Tor/60*2*pi/1000.0;
    else
        %Tor(i) = MechPower*1000.0/(Speed(i)/60*2*pi);
        %Pow(i) = MechPower;
    end
end

Cons_Tor_Reg_Idx = find(Speed(:)<BaseSpeed)
Tor(Cons_Tor_Reg_Idx) = Max_Tor;
Pow(Cons_Tor_Reg_Idx) = Speed(Cons_Tor_Reg_Idx)*Max_Tor/60*2*pi/1000.0;

Cons_Pow_Reg_Idx = find(Speed(:)>=BaseSpeed)
Tor(Cons_Pow_Reg_Idx) = MechPower*1000.0./(Speed(Cons_Pow_Reg_Idx)/60*2*pi);
Pow(Cons_Pow_Reg_Idx) = MechPower;

figure(3)
plot(Speed(:), Tor(:))
figure(4)
plot(Speed(:), Pow(:))

figure(5)
[hax, h1, h2] = plotyy(Speed(:), Tor(:),Speed(:), Pow(:))
xlabel('Motor Speed [rev/min]')
ylabel(hax(1),'Motor Torque [N.m]')
ylabel (hax(2), "Motor Power [kW]");
grid on;

ESM_DATA = xlsread('ESM_FEM_DATA.xlsx')

figure(6)
plot(ESM_DATA(1:6,1), ESM_DATA(1:6,5), 'LineWidth', 2, 'Marker', 'x', 'MarkerSize', 8)
hold on
plot(ESM_DATA(7:12,1), ESM_DATA(7:12,5), 'LineWidth', 2, 'Marker', 'o', 'MarkerSize', 8)
plot(ESM_DATA(13:18,1), ESM_DATA(13:18,5), 'LineWidth', 2, 'Marker', '+', 'MarkerSize', 8)
plot(ESM_DATA(19:24,1), ESM_DATA(19:24,5), 'LineWidth', 2, 'Marker', '^', 'MarkerSize', 8)
plot(ESM_DATA(25:30,1), ESM_DATA(25:30,5), 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 8)
plot(ESM_DATA(31:36,1), ESM_DATA(31:36,5), 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 8)
title("d-axis Flux in ESM")
xlabel('d-axis Current [A]')
ylabel('d-axis Flux [Wb]')
hold off
grid on
