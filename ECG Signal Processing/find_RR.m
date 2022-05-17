function [t_QRS,QRS,RR] = find_RR(sig,t1,L1,L2)
%Fixing threshold to find QRS complex that is peak point
Fs = 250;
T = 1/Fs;
range = find((t1>=L1) & (t1 <= L2));
t1_new = t1(range);
O_new = sig(range);

th = abs(max(O_new));
th = 0.5*th;
c = 0;
% peaks are defined as pulses
for i = 1:length(O_new)
    if O_new(i) > th
        QRS(i) = 1;
        c = c+1;
        i = i+15;
    else
        QRS(i) = 0;
    end
end


t_QRS = (1:length(QRS)) * T

% figure(4)
% plot(t_QRS,QRS);
% xlim([0 5]);

t_QRS_Real = t_QRS;
t_QRS_Real(QRS == 0) = []; % no zero points
%t_QRS_Real(2:2:end) = [];
b_num = 0;

for j = 1:length(t_QRS_Real) - 1
        RR(j) = t_QRS_Real(j+1) - t_QRS_Real(j);
        b_num = j;
end

 %t_QRS(RR < 0.03) = [];
 RR(RR < 0.03) = [];
 b_num = 292;
end

