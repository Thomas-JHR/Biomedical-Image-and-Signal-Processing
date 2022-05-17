clear all
clc
%% historgram equalization
posimage = imread('chest_x-ray1.jpg')
posimage = double(posimage);
[row col] = size(posimage);
rc = row * col;
a = zeros(1,256);
b = zeros(1,256);

for i = 1:row
    for j = 1:col
        if posimage(i,j) == 0
            posimage(i,j) = 1
        end
    end
end

for i = 1:row
    for j = 1:col
    p = posimage(i,j);
    a(p) = a(p) + 1;
    end
end

pdf = a/rc ;
cdf(1) = pdf(1);
for k = 2 : max(max(posimage));
    cdf(k) = pdf(k) + cdf(k-1);
end

new = round(cdf*max(max(posimage)));
new = new + 1;

for i1 = 1:row
    for j1 = 1:col
        posimage_a = posimage(i1,j1);
        equalimage(i1,j1) = new(posimage_a);
        e = equalimage(i1,j1);
        b(e) = b(e) + 1;
    end
end
e = e - 1;
figure(1)
subplot(1,2,1)
imshow(uint8(posimage));
title('original image');
subplot(1,2,2)
imshow(uint8(equalimage));
title('Equalization image');

figure(2)
x = 0:247;
plot(x,255*cdf)
title('Transformation function');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');


