clear all;clc;
close all;

%1
A_1 = 1:3
B_1 = 1:2:7
C_1 = linspace(1,9,5)

%2
A = [6 12 4 10 20 25 ; 7 2 3 10 0 21; 2 8 9 10 0 1]
Sub1 = A(1:3,2:3)
Sub2 = A(1:2,4:6)
Sub3 = A(end,4:end)

%3
A_3 = A(1,2)
B_3 = A(6)
C_3 = A(2,end)

%4
[max_v, min_v] = MaxMin(A(1,:))

%5
apps =[ 63,18; 67, 19; 65, 18; 72,20; 69, 36; 78, 34; 75, 12];
pass = find(apps(:,1)>=65 & apps(:,2)>=16 & apps(:,2)<34)
results = [pass, apps(pass,1),apps(pass,2)]

%6
pkg load io %for Octave
GData= xlsread('Score.xlsx')
[size_r, size_c] = size(GData)

%6-1
%for i=1:size_r
%  GData(i,6) = GData(i,2)+GData(i,4)+GData(i,5);
%end
%6-2
GData(:,6) = GData(:,3)+GData(:,4)+GData(:,5);
%6-3
Grade(find(GData(:,6)>=70),1) = 'A';
Grade(find(GData(:,6)>=50 & GData(:,6)<70 ),1) = 'B';
Grade(find(GData(:,6)<50),1) = 'C';

Grade(find(GData(:,2)<9.0 & Grade(:,1)=='A' ),1)
Grade(find(GData(:,2)<9.0 & Grade(:,1)=='A' ),1) = 'B';
Grade(find(GData(:,2)<9.0),1)
