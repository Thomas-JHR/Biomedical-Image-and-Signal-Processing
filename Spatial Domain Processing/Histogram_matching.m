clear all
clc
%% histogram matching or specification

 posimage_1 = imread('chest_x-ray2.jpeg');
 posimage_2 = imread('chest_x-ray3.jpeg');
 a = zeros(256,1,'uint8');
 hist1 = imhist(posimage_1);
 hist2 = imhist(posimage_2);
 
 cdf1 = cumsum(hist1)/numel(posimage_1);
 cdf2 = cumsum(hist2)/numel(posimage_2);
 
 for i = 1:256
     diff = abs(cdf1(i)-cdf2);
     [~,ind] = min(diff);
     a(i) = ind - 1;
 end
 
 matched_image = a(double(posimage_1 + 1));
 
figure(1)
subplot(1,3,1)
imshow(posimage_1);
title('chest_x-ray2')

subplot(1,3,2)
imshow(posimage_2);
title('chest_x-ray3');
subplot(1,3,3)
imshow(matched_image);
title('specified image');

figure(2)
x = 0:255;
plot(x,255*cdf1,'o');
hold on
plot(x,255*cdf2,'-');
hold off
title('transformation function cdf')
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');    
legend('cdf1','cdf2');
        
        
        
        
   
        
        
        
        
        
        




