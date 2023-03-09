clear all;clc;
close all;

%% 행렬의 이용
B = [ 1.5 3.1];
S = [3.0 B]

T = [1 2 3 S]

%인덱스 번호의 이용
S(1)
S(1,1)
S(1,2)

%:쿨론 연산자의 활용 
H_1 = 1:8 
H_2 = 1:2:8 

M=[ 1 2 3 4 ; 5 6 7 8 ; 9 10 11 12]
x1 =M(:,1) % rows, cols 1번열 전부다 

x2 =M(:,3) % rows, cols 1번열 전부다 

x3 = M(2:3, 2:3) 
x4 = M(:)
x5 = M(8)
%Quiz1 
%x5와 같은 결과를 얻기 위해여 n,m 값을 찾으세요.
n = 1; %1 is not true
m = 1; %1 is not true
x6 = M(n, m)

x7 = M(1, end)
x8 = M(end, end)
x9 = size(M)

%% 두변수 사이의 연산 
clear all;clc;
x =3;
y =5;
A1 =x*y

x = 1:5
y =5
A2= x*y

y = 1:3
y = 1:5
%A2= x*y
A3_1= x.*y 
A3_2=dot(x,y) %Inner product 

%% 특수 행렬 
clear; clc;
A1 = zeros(2,3)
A2 = ones(3,2)
M=[ 1 2 3 4 ; 5 6 7 8 ; 9 10 11 12]
A3 = diag(M)

B = [ 1 2 3];
C = diag(B)
%% 선형 대수 연립 선형 방정식 
A = [6,-2;10,3;4,7];
B = [9,8;-5,12];
A*B;

A1 = [6,12,4;7,-2,3;2,8,-9];
B1 = [70;5;64];
Solution = A1\B1

A1_AUG = [A1,B1]
RANK_A1 = rank(A1)
A1_REF = rref(A1_AUG)

A2 = [1 -2 3; -1 3 0 ; 2 -5 5];
B2 = [9;-4;17];
Solution = A2\B2

A2_AUG = [A2,B2]
RANK_A2 = rank(A2)
A2_REF = rref(A2_AUG)

A3 = [ 3 2 2 -5 ; 0.6 1.5 1.5 -5.4 ; 1.2 -0.3 -0.3 2.4 ]
B3 = [8;2.7;2.1];
Solution = A3\B3

A3_AUG = [A3,B3]
RANK_A3 = rank(A3)
A3_REF = rref(A3_AUG)
%% 다항식 그래프 
c = poly([1, 3+5i, 3-5i])
x = -10:0.01:10;
f = polyval(c,x);
plot(x,f),xlabel('x'),ylabel('f(x)')

a1 = [1 2  -1];
x1 = -10:0.01:10;
f1 = polyval(a1,x1);
plot(x1,f1),xlabel('x'),ylabel('f(x)')
Root1 = roots(a1)

a2 = [1 2  -10];
x2 = -10:0.01:10;
f2 = polyval(a2,x2);
plot(x2,f2),xlabel('x'),ylabel('f(x)')
Root2 = roots(a2)

%%