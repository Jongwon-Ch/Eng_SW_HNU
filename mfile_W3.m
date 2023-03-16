clear all;clc;
close all;

poly(10)
g_multi(1:5,1:5)

%내장함수 max 
A1= [2  5  3]
max(A1)
[max_value, min_value] = max(A1)

%ex)
A2 = [2  5  3; 10  5  2 ; 4  1  20]
%ex1-1) A2 행렬에서 1열에 최대, 최소값 원소값을 찾으세요. 

%ex1-2) A2 행렬에서 열마다 최대, 최소값 원소값을 찾으세요. 그리고 최대값 원소(요소)로만 구성된 열벡터(C_max2) 를 만드세요.  
%그리고 최소값 원소(요소)로만 구성된 열벡터(C_min2) 를 만드세요.  


%지역변수 
%g_multi.m 참고 

%Excel Data load
pkg load io %for Octave
NTC_DATA = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[NTC_DATA1, NTC_DATA2] = xlsread('NTHS0805N02N1002J_Curve.xlsx')
[size_row, size_col] = size(NTC_DATA)



hold off

%% 고유값 
% 두실근 
A1 = [4 2 ; 3 3]
[V1,D1] = eig(A1)
%[V,D,W] = eig(A1)

% 중근 1
A2 = [3 0 ; 0 3]
[V2,D2] = eig(A2)

% 중근 2
A3 = [3 1 ; 0 3]
[V3,D3] = eig(A3)

% 복소근  
A4 = [6 -1 ; 5 4]
[V4,D4] = eig(A4)


