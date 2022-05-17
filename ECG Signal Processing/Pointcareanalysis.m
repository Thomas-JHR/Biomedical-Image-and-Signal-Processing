function [xm,xp,SD1,SD2] = Pointcareanalysis(ECG)
xp = ECG;
xp(end) = [];
xm = ECG;
xm(1) = [];
%SD1
SD1 = std(xp-xm)/sqrt(2);
%SD2
%SD2 = std(xp+xm)/sqrt(2);
SD2 = sqrt((2*std(ECG)^2) - SD1^2);
end

