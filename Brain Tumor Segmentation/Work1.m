%% |Start here!|

clear
close all 
addpath 'C:\Users\Jinhao Ruan\Desktop\ENG\ELEC 408\Assignment 2\Resources handin'
IMaa = imread('Img1.png');
IMbb = imread('Img2.png');
IMcc = imread('Img3.png');
IMdd = imread('Img4.png');
IMee = imread('Img5.png');
IMff = imread('Img6.png');

%% Binary Equalvance

IM1 = imread('Img1_GT.png');
IM2 = imread('Img2_GT.png');
IM3 = imread('Img3_GT.png');
IM4 = imread('Img4_GT.png');
IM5 = imread('Img5_GT.png');
IM6 = imread('Img6_GT.png');

BE1 = imbinarize(IM1,0);
BE2 = imbinarize(IM2,0);
BE3 = imbinarize(IM3,0);
BE4 = imbinarize(IM4,0);
BE5 = imbinarize(IM5,0);
BE6 = imbinarize(IM6,0);
figure(1)
subplot(3,2,1);
imshowpair(IM1,BE1,'montage');
subplot(3,2,2);
imshowpair(IM2,BE2,'montage');
subplot(3,2,3);
imshowpair(IM3,BE3,'montage');
subplot(3,2,4);
imshowpair(IM4,BE4,'montage');
subplot(3,2,5);
imshowpair(IM5,BE5,'montage');
subplot(3,2,6);
imshowpair(IM6,BE6,'montage');

sgtitle('input image vs binary image for GT');
%% Pre processing the input image

IMa = imadjustn(IMaa);
IMb = imadjustn(IMbb);
IMc = imadjustn(IMcc);
IMd = imadjustn(IMdd);
IMe = imadjustn(IMee);
IMf = imadjustn(IMff);

figure(2)
subplot(3,2,1);
imshowpair(IMaa,IMa,'montage');

subplot(3,2,2);
imshowpair(IMbb,IMb,'montage');

subplot(3,2,3);
imshowpair(IMcc,IMc,'montage');

subplot(3,2,4);
imshowpair(IMdd,IMd,'montage');

subplot(3,2,5);
imshowpair(IMee,IMe,'montage');

subplot(3,2,6);
imshowpair(IMff,IMf,'montage');

sgtitle('pre-processing image');
%% Threshold Localization
 IMa = im2double(IMa);
 IMb = im2double(IMb);
 IMc = im2double(IMc);
 IMd = im2double(IMd);
 IMe = im2double(IMe);
 IMf = im2double(IMf);
 
% IMa = rgb2gray(im2double(IMa));
% IMb = rgb2gray(im2double(IMb));
% IMc = rgb2gray(im2double(IMc));
% IMd = rgb2gray(im2double(IMd));
% IMe = rgb2gray(im2double(IMe));
% IMf = rgb2gray(im2double(IMf));

 figure(3)
 [value,IMa] = image_BGT(IMa);
 Toutput_image1 = imbinarize(IMa,value);
 subplot(3,2,1);
 imshowpair(IMa,Toutput_image1,'montage');
 similarity1_1 = jaccard(Toutput_image1,BE1);
 %disp((similarity1_1));
         

 [value,IMb] = image_BGT(IMb);
 Toutput_image2 = imbinarize(IMb,value);
  subplot(3,2,2);
 imshowpair(IMb,Toutput_image2,'montage');
 similarity1_2 = jaccard(Toutput_image2,BE2);
 %disp((similarity1_2));
 
 
  [value,IMc] = image_BGT(IMc);
 Toutput_image3 = imbinarize(IMc,value);
  subplot(3,2,3);
 imshowpair(IMc,Toutput_image3,'montage');
 similarity1_3 = jaccard(Toutput_image3,BE3);
 %disp((similarity1_3));
 
 
  [value,IMd] = image_BGT(IMd);
 Toutput_image4 = imbinarize(IMd,value);
  subplot(3,2,4);
 imshowpair(IMd,Toutput_image4,'montage');
 similarity1_4 = jaccard(Toutput_image4,BE4);
 %disp((similarity1_4));
 
 
  [value,IMe] = image_BGT(IMe);
 Toutput_image5 = imbinarize(IMe,value);
  subplot(3,2,5);
 imshowpair(IMe,Toutput_image5,'montage');
 similarity1_5 = jaccard(Toutput_image5,BE5);
 %disp((similarity1_5));
 
 
  [value,IMf] = image_BGT(IMf);
 Toutput_image6 = imbinarize(IMf,value);
  subplot(3,2,6);
 imshowpair(IMf,Toutput_image6,'montage');
 similarity1_6 = jaccard(Toutput_image6,BE6);
 %disp((similarity1_6));
 
 sgtitle('input image vs threshold image');
 %% MH edge detector detector to realizer edge detection
 % S1 - MH   S2 - Canny
 
 BE1_1 = rgb2gray((im2double(BE1)));
 BE1_2 = rgb2gray((im2double(BE2)));
 BE1_3 = rgb2gray((im2double(BE3)));
 BE1_4 = rgb2gray((im2double(BE4)));
 BE1_5 = rgb2gray((im2double(BE5)));
 BE1_6 = rgb2gray((im2double(BE6)));
%   similarity2_1 = jaccard(S,BE1_1);
%   disp((similarity2_1));
 figure(4)
 subplot(3,2,1);
 [IMa,S1_1,S1_2] = image_MHEDM(IMa);
 imshowpair(S1_1,S1_2,'montage');
 similarity2_1 = jaccard(S1_1,round(BE1_1));
 similarity2_2 = jaccard(S1_2,round(BE1_1));
 
 subplot(3,2,2);
 [IMb,S2_1,S2_2] = image_MHEDM(IMb);
 imshowpair(S2_1,S2_2,'montage');
 similarity2_3 = jaccard(S2_1,round(BE1_2));
 similarity2_4 = jaccard(S2_2,round(BE1_2));

 subplot(3,2,3);
 [IMc,S3_1,S3_2] = image_MHEDM(IMc);
 imshowpair(S3_1,S3_2,'montage');
 similarity2_5 = jaccard(S3_1,round(BE1_3));
 similarity2_6 = jaccard(S3_2,round(BE1_3));
 

 subplot(3,2,4);
 [IMd,S4_1,S4_2] = image_MHEDM(IMd);
 imshowpair(S4_1,S4_2,'montage');
 similarity2_7 = jaccard(S4_1,round(BE1_4));
 similarity2_8 = jaccard(S4_2,round(BE1_4));
 
 subplot(3,2,5);
 [IMe,S5_1,S5_2] = image_MHEDM(IMe);
 imshowpair(S5_1,S5_2,'montage');
 similarity2_9 = jaccard(S5_1,round(BE1_5));
 similarity2_10 = jaccard(S5_2,round(BE1_5));
 
 subplot(3,2,6);
 [IMf,S6_1,S6_2] = image_MHEDM(IMf);
 imshowpair(S6_1,S6_2,'montage');
 similarity2_11 = jaccard(S6_1,round(BE1_6));
 similarity2_12 = jaccard(S6_2,round(BE1_6)); 
 
 sgtitle('Marr-Hilldreth vs Canny');
 %% cluster 
 
 figure(5)
 subplot(3,2,1);
 [IMa,S1,Sa] = Clustering(IMa);
 %a = ones(5);
 %S1 = imopen(S1,a);
 %S1 = bwareaopen(S1,400);
 imshow(S1,[]);
 similarity3_1 = jaccard(S1,round(BE1_1));
 similarity3_2 = jaccard(Sa,round(BE1_1));

 subplot(3,2,2);
 [IMb,S2,Sb] = Clustering(IMb);
 imshow(S2,[]);
 similarity3_3 = jaccard(S2,round(BE1_2));
 similarity3_4 = jaccard(Sb,round(BE1_2));
 
 subplot(3,2,3);
 [IMc,S3,Sc] = Clustering(IMc);
 imshow(S3,[]);
 similarity3_5 = jaccard(S3,round(BE1_3));
 similarity3_6 = jaccard(Sc,round(BE1_3));
 
  subplot(3,2,4);
 [IMd,S4,Sd] = Clustering(IMd);
 imshow(S4,[]);
 similarity3_7 = jaccard(S4,round(BE1_4));
 similarity3_8 = jaccard(Sd,round(BE1_4));
 
   subplot(3,2,5);
 [IMd,S5,Se] = Clustering(IMe);
 imshow(S5,[]);
 similarity3_9 = jaccard(S5,round(BE1_5));
 similarity3_10 = jaccard(Se,round(BE1_5));
 
   subplot(3,2,6);
 [IMd,S6,Sf] = Clustering(IMf);
 imshow(S6,[]);
 similarity3_11 = jaccard(S6,round(BE1_6));
 similarity3_12 = jaccard(Sf,round(BE1_6));
 
 sgtitle('Clustering image');
 %% cluster in cut
 
 figure(6)
 
 subplot(3,2,1);
 imshow(Sa,[]);
 
 subplot(3,2,2);
 imshow(Sb,[]);
 
 subplot(3,2,3);
 imshow(Sc,[]);
 
 subplot(3,2,4);
  imshow(Sd,[]);
  
 subplot(3,2,5);
 imshow(Se,[]);
 
 subplot(3,2,6);
 imshow(Sf,[]);
 
 sgtitle('clustering__ output S == 3');
 