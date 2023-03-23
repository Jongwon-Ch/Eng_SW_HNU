% 비교결과 : 참(true) or 거짓(false)
x =5
y=1
x<y

%행렬의 비교
x = 1:5;
y = [ 1,5 , 3 ,2 10]
x>y

x1 =5 
x1>y

% 논리 연산자
x = [ 1 ,2 ,3 ,4 ,5]
y= [-2 0 2 4 6]
z =[8 8 8 8 8]

z>x & z>y

x>y | x>z

%find function
x = [5, -3, 0, 0, 8];y = [2, 4, 0, 5, 7];
z = find(x&y)

height = [ 63, 67, 65, 72, 69, 78, 75 ];
accept = find ( height >=66 );
 decline = find (height < 66);
height(accept)

%Quiz for using find function
applicants =[ 63,18; 67, 19; 65, 18; 72,20; 69, 36; 78, 34; 75, 12];
pass = find(applicants(:,1)>= 66 & applicants(:,2)>18 &applicants(:,2)<35)
results = [pass, applicants(pass,1),applicants(pass,2)]

%
pass = find(applicants(:,1)== 63 & applicants(:,2)>18 &applicants(:,2)<35)

applicants =[ 63,18; 67, 19; 63, 18; 72,20; 69, 36; 78, 34; 75, 12];
%
pass = find(applicants(:,1)== 63 & applicants(:,2)>17 &applicants(:,2)<35)

temp = [95.3 100.2 98.6; 97.4 99.2 98.9; 100.1 99.3 97]
element = find(temp>98.6)

[row, col] = find(temp>98.6)

%if 
count =0
G = [30 55 10]
if G<50
    count = count+1
    disp(G)
end

%switch / case 문 사용 예
city = input('Enter the name of the city: ')
switch city
    case 'Boston'
     disp('35')
    case 'Newyork'
     disp('45')
    case 'Honolulu'
     disp('145')
     otherwise
     dips('there is no information')
 end
 
 %switch / case 문 사용 예
angle = input('Enter the degree: ')
 switch angle
	case 45
		 disp('북동쪽')
	case 135
		 disp('남동쪽')
	case 225
		 disp('남서쪽')
	case 315
		 disp('북서쪽')
	otherwise
		 disp('방향 알 수 없음')
end
%for vector
for k = 1:5
    a(k) = k^2
end
k = 1:5;
a = k.^2;

 %for loop
 for k = 5:10:35
	x = k^2
end

%while 
k=0;
while k<3
    k =k+1
end

Scores = [76, 45, 98, 97];
count = 0;
k = 0;
while k< 4
    k = k+1;
    if Scores(k)>90
        count++
    end
    
end
disp(count)

pkg load io %for Octave
%
%Account = xlsread('Account.xlsx')
%[Account1, Account2] = xlsread('Account.xlsx')