function [maxa,mina,M,range] = Mean_range(RR)

mina = min(RR);
maxa = max(RR);
M = mean(RR);
range = maxa - mina;
end

