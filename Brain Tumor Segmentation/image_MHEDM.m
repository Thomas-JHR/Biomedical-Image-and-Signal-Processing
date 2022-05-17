function [IMx,S1,S2] = image_MHEDM(IMx)
%% calling
IMx = rgb2gray(im2double(IMx));
S1 = edge(IMx,'log');
S2 = edge(IMx,'canny');
S1 = im2double(S1);
S2 = im2double(S2);
end

