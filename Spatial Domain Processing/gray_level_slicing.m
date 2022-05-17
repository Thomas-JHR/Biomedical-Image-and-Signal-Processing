clear all
clc

%% output image of bit plane slicing
posimage = imread('x-ray_angiogram.jpg');
posimage_a = double(posimage);
posimage_b = double(posimage);

posimage_a = posimage;
posimage_b = double(posimage);
[r,c] = size(posimage_a);

for i =1:r
    for j = 1:c
        if (posimage_a(i,j) > 50) && (posimage_a(i,j) < 150) %the first threshold value is 50, while the second threshold value is 150
            posimage_a(i,j) = posimage(i,j);
            posimage_b(i,j) = 255;
        else
            posimage_a(i,j) = 0; 
            posimage_b(i,j) = 0;
        end
    end
end

figure(1)
subplot(1,3,1);
imshow(posimage)
title('Original image'); 

subplot(1,3,2);
imshow(posimage_a,[]);
title('slicing with background')

subplot(1,3,3);
imshow(posimage_b,[]);
title('slicing without background')


figure(2)
r = 0:255;
subplot(1,2,1)
s1 = r;
s1(50:150) = 255;
plot(r,s1)
title('function of slicing with background');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');

subplot(1,2,2)
s = ones(size(r));
s(50:150) = 255;
plot(r,s)
title('function of slicing without background');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');









