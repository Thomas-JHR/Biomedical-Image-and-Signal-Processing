%% common contrast-stretching output of image
posimage = imread('x-ray_angiogram.jpg');
i = posimage(:,:,1);
r1 = min(i);
rmin = min(r1);

r1 = max(i);
rmax = max(r1);

m = 255/(rmax-rmin);
b = 255 - m*rmax;
% for i = 1:256
%     if i >= rmin && i <= rmax
%         j(i) = (i - rmin)*m;
%     elseif i < rmin
%         j(i) = 0;
%     else
%         j(i) = 255;
%     end
% end
 i0 = 0:1;
 j0 = 47*i0;

j = m*i + b;

figure(1)
subplot(1,2,1)
imshow(posimage);
title('original image');
subplot(1,2,2)
imshow(j);
title('contrast streching image')

% transformation fucntion plot
figure(2)
plot(i,j)
hold on
plot(i0,j0)
line([209 256],[256 256]);
hold off
title('Plot Equation s = m*i+b');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');

