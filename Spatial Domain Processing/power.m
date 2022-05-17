clear all
close all

%% output power image of image
posimage = imread('x-ray_angiogram.jpg');

posimage = im2double(posimage); % change in double format 
[m n] = size(posimage); 
c = 2;
%g = 0.6;
g = 1.8;

    for p = 1:m
        for q = 1:n
            powerimage(p,q) = c .*posimage(p,q).^g;
        end
    end
    figure(1)
    subplot(1,2,1)
    imshow(posimage);
    title('original image');
    subplot(1,2,2)
    imshow(powerimage);
    title('power-law image')

 %% transformation function
 figure(2)
 r = 0:255;
 Y = c*(r.^(g));
 a = 256/Y(256);
 s = a*Y;
plot(r,s,'r-o')
title('Plot Equation s = c*r^g');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');
hold off