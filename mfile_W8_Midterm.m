clear all;clc;
close all;

pkg load io %for Octave
ESM_DATA = xlsread('ESM_FEM_DATA.xlsx');
ID = [-200:50: -0];
IQ = [0:50: 200];
[X,Y] = meshgrid(ID,IQ)
for col = 1:5
    for row = 1:5
      Lambda_d(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 6.5),5);
      Lambda_q(row,col) = ESM_DATA(find(ESM_DATA(:,1)== X(row,col) & ESM_DATA(:,2)== Y(row,col) & ESM_DATA(:,3)== 6.5),4);
    end
end

ID_i = [-200:1: -0];
IQ_i = [0:1: 200];
[ID_m,IQ_m] = meshgrid(ID_i,IQ_i);
Lambda_d_m = interp2(ID,IQ,Lambda_d,ID_m,IQ_m,'spline');
figure(1)
contour(ID_m,IQ_m,Lambda_d_m);

Lambda_q_m = interp2(ID,IQ,Lambda_q,ID_m,IQ_m,'spline');
figure(2)
contour(ID_m,IQ_m,Lambda_q_m);

%Q1)
for col = 1:201
    for row = 1:201
      Torque(row,col) =  3/4*8*(Lambda_d_m(row,col)*IQ_m(row,col) - Lambda_q_m(row,col)*ID_m(row,col));
    end
end

figure(3)
contour(ID_m,IQ_m,Torque);

%Q2)
for col = 1:201
    for row = 1:201
      Imag(row,col) =  sqrt(ID_m(row,col)^2 + IQ_m(row,col)^2);
      Lambdamag(row,col) =  sqrt(Lambda_d_m(row,col)^2 + Lambda_q_m(row,col)^2);
    end
end

figure(4)
contour(ID_m,IQ_m,Imag);

figure(5)
contour(ID_m,IQ_m,Lambdamag);

%Q3) Find Maxi Torque and d-q axis
for Imag_idx = 1:20
    Idx_set = find(Imag<Imag_idx*10.0);
    [MTPA_Tor(Imag_idx,1), MTPA_Idqx(Imag_idx,1)] = max(Torque(Idx_set))
    MTPA_Idx(Imag_idx,1) = ID_m(Idx_set(MTPA_Idqx(Imag_idx,1)))
    MTPA_Iqx(Imag_idx,1) = IQ_m(Idx_set(MTPA_Idqx(Imag_idx,1)))
end

figure(6)
contour(ID_m,IQ_m,Torque);
hold on
   plot(MTPA_Idx(:,1),MTPA_Iqx(:,1))
hold off

%Q4) Find Maxi Torque and d-q axis
Fmag = 0.01:0.005:0.2
for Fmag_idx = 1:39
    Idx_set = find((Imag<200.0) & (Lambdamag < Fmag(1,Fmag_idx)));
    [CTPA_Tor(Imag_idx,1), MTPA_Idqx(Imag_idx,1)] = max(Torque(Idx_set))
    CTPA_Idx(Imag_idx,1) = ID_m(Idx_set(MTPA_Idqx(Imag_idx,1)))
    CTPA_Iqx(Imag_idx,1) = IQ_m(Idx_set(MTPA_Idqx(Imag_idx,1)))
end
