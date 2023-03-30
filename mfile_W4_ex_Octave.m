clear all;clc;
close all;
%복습 문제 y의 원소보다 큰 x의 원소를 모두 찾아라
x =[-3 , 0 , 0 , 2, 6, 8];
y = [-5, -2, 0 , 3 ,4 ,10];
result_Idx = find(x>y)

%실전 문제 
%Excel Data load
pkg load io %for Octave
Score_DATA = xlsread('Score.xlsx')
[Score_DATA1, Score_DATA2] = xlsread('Score.xlsx')
[size_row, size_col] = size(Score_DATA)

%idx_att = find(Score_DATA2(1,:)=={'Student'})

% for문을 이용하여서 합계를 계산하세요. (출력 + 중간 + 기말 )
Score_DATA(:,6) = Score_DATA(:,2)+Score_DATA(:,3)+Score_DATA(:,4)+Score_DATA(:,5);
Score_DATA(:,:)
for i = 1:size_row
    Score_DATA(i,6) = Score_DATA(i,2) + Score_DATA(i,3)+ Score_DATA(i,4)+Score_DATA(i,5);
end
Score_DATA(:,:)

%80점 이상 A 65점 이상은 B 50점 이상 C 22점 이상은 D 그리고 나머지는 F로 성적 처리 하세요. (For, if,
%elseif를 사용해서) 
for i = 1:size_row
    if(Score_DATA(i,6)>80)
        Grade(i,:) = 'A';
    elseif(Score_DATA(i,6)>65)
        Grade(i,:) = 'B';
    elseif(Score_DATA(i,6)>50)
        Grade(i,:) = 'C';
    elseif(Score_DATA(i,6)>22)
        Grade(i,:) = 'D';
    else
        Grade(i,:) = 'F';
    end
end

%Q
x1 = find( Score_DATA(:,2)<3 & Grade(:,1)~= 'F')% 출결 점수가 3점 미만인 학생은 학점으로  F를 받야야 한다. 
Grade(x1)
Grade(x1) = 'F';
Grade(x1)

x2 = find(Score_DATA(:,3)<18 & Grade(:,1)== 'A') % 숙제 점수가 18점 미만인 학생은 A학점을 받을 수 없다. 
Grade(x2)
Grade(x2) = 'B';
Grade(x2)

x3 = find(Score_DATA(:,5)<15 & (Grade(:,1)== 'B'|Grade(:,1)== 'A')) % 기말고사가  15점 미만인 학생은 B학점을 이상을 받을 수 없다.
Grade(x3)
Grade(x3) = 'C';
Score_DATA(x3,:)
Grade(x3)

x4 = find(Score_DATA(:,4)<1 & Score_DATA(:,5)<1) % 중간 고사와 기말고사 모두 1미만  학생은 F 처리 한다. 
Grade(x4)
Grade(x4) = 'F';
Score_DATA(x4,:)

% A, B, C, D, F 성적 학생 수를 카운팅 하세요. (for, if, elseif else 사용 ) 
% 그리고 A A grade is the number of students : 14 출력 하세요. 
%ex) disp("A grade is the number of students :")
%disp(count_A)
count_A = 0;
count_B = 0;
count_C = 0;
count_D = 0;
count_F = 0;
for i = 1:size_row
    if Grade(i,1) == 'A'
        count_A = count_A+1;
    elseif Grade(i,1) == 'B'
         count_B = count_B+1;  
    elseif Grade(i,1) == 'C'
         count_C = count_C+1;  
    elseif Grade(i,1) == 'D'
        count_D = count_D+1; 
    else
        count_F = count_F+1; 
    end
end
disp("A grade is the number of students :")
disp(count_A)
disp("B grade is the number of students :")
disp(count_B)
disp("C grade is the number of students :")
disp(count_C)
disp("D grade is the number of students :")
disp(count_D)
disp("F grade is the number of students :")
disp(count_F)

% A, B, C, D, F 성적 학생 수를 카운팅 한 결과를 이용하여서 모두 다 더해서 전체 학생수와 비교 하세요. 
% 결과가 일치하면 Calculation is correct. 이라고 출력 하고 결과가 불일치하면 Calculation is
% incorrect.이라고 출력 하세요. 
if size_row==(count_A+count_B+count_C+count_D+ count_F)
    disp("Calculation is correct.")  
else
    disp("Calculation is incorrect.") 
end

%Grade_fin = Grade
%save CheckGradeResult.mat Grade_fin

load CheckGradeResult.mat
if find(Grade_fin~=Grade)
    disp("Grade calculation is incorrect.")  
else
    disp("Grade calculation is correct.") 
end