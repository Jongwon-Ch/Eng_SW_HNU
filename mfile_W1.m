clear all;clc;
close all;

%% 세션의 예
8/10
5*ans
r=8/10
s = 20*r

%% 우선 순위
8 + 3*5
8 + (3*5)
(8 + 3)*5
3*4^2 + 5
(3*4)^2 + 5
27^(1/3) + 32^(0.2)
27^(1/3) + 32^0.2
27^1/3 + 32^0.2

%% 특별 명령
clc
%clear
%clear r s
who
whos

%% 행렬의 입력 벡터 1
b = 1:5
c = [1:5]
d = [1:2:5]
e = linspace(1,10,3)
f = linspace(1,10)
h = logspace(1,3,3)
i = logspace(10,100, 3)

%제일 많이 사용되는 형태 linspace(초기값, 최종값, 원소의 개수)

%% 행렬의 입력 벡터와 행렬  2
A1 = [ 1, 2, 3 ,4 ]
A2 = [ 1, 2; 3, 4]
A3 = [1 ; 2 ;3 ;4]
A4 = A3' %transpose, 전치행렬 

%% 스칼라와 행렬 사이의 연산
B1 = [6 7 8 9]
A1+B1
B1+A4
B2 = [ 2, 2; 3, 3]
A2*B2
%A2*B1 % 오류 발생용  

%% pi / 전치 (transpose)
%degrees = linspace(0, 360, 37)
degrees = [0: 60: 360]
radians = degrees*pi/180
table = [degrees', radians']

%% Plot figure 
x = 0:0.01:7;
y = 3*cos(2*x);
plot(x,y), xlabel('x'), ylabel ('y')

%% help 사용법
help plot

%% Plot figure using marker 
x = 0:0.01:7;
y = 3*cos(2*x);
plot(x,y, "o"), xlabel('Rad'), ylabel ('Amplitude')

%% Plot figure changing color 
x = 0:0.01:7;
y = 3*cos(2*x);
plot(x,y, "r",'LineWidth', 3), xlabel('Rad'), ylabel ('Amplitude')

%% diary 
%diary on
%diary <save_command>
%% Save variable 
save test.mat A1
clear 

%% Load variable
load test.mat
%% make m-file 
