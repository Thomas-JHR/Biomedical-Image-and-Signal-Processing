clear all
close all

%% output negative of image
posimage = imread('x-ray_angiogram.jpg');
negimage = 255 - posimage; % funtion to get negative image formula
posimage = negimage;

for row = 1:size(posimage,1)
    for col = 1:size(posimage,2)
        negimage(row,col,:) = 255 - posimage(row,col,:);
    end
end

figure(1)
imshow([posimage,negimage]); 
title('original image && negative image')

figure(2)
r = 0:255;
s = 255 - r;
plot(r,s)
title('Plot Equation s = 255 - r');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');
