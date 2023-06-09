clear all;clc;
close all;

pkg load control

G = tf([1],[1 1 0 ])
K = 10;
G_fd = feedback(G*K,1,-1)

figure(1)
[Resp, Resp_t ]= step(G_fd,10,0.001);
step(G_fd)
hold on
step(tf([1],[1]),'k')
hold on
step(tf([1.05],[1]),'b')
hold on
step(tf([0.95],[1]),'b')
hold off

Overshoot = max(Resp)
Overshoot_time =Resp_t(find(max(Resp)==Resp(:,1)),1)
Idx_Time = find((Resp<1.05)&(Resp>0.95))
Size_all = size(Idx_Time)
Size = Size_all(1,1)

for i= 1: (Size-1)
    Delt_t(i) = Idx_Time(i+1,1) - Idx_Time(i,1);
end

find(Delt_t(:)>1)
Max_idx = max(find(Delt_t(:)>1))
T_settle = Resp_t(Idx_Time(Max_idx+1))

Rise_Time_min = Resp_t(min(find(Resp>0.1)))
Rise_Time_max = Resp_t(min(find(Resp>0.9)))
T_Rise = Rise_Time_max - Rise_Time_min
Overshoot = max(Resp)*100.0
Overshoot_time =Resp_t(find(max(Resp)==Resp(:,1)),1)

