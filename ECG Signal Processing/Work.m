clc
clear
addpath C:\Users\Jinhao Ruan\Desktop\ENG\ELEC 408\Assignment 3
%% part 1 heart rate interval %%
Fs = 250; % sampling frequency
Fn = 50*pi;
T_new_s = 1;%s
T = 1/Fs; % sampling time
x1 = 0:452323 - 1; % For old
x2 = 0:452696 - 1; % For young
t1 = x1*T; % time vector
t2 = x2*T; % time vector

O = importdata('408_ECG_6O.txt');
Y = importdata('408_ECG_6Y.txt');


%a) remove 8V offset values
O = detrend(O);
Y = detrend(Y);
O = O - mean(O);
Y = Y - mean(Y);
N = 7; % design a Low Pass Filter
Fp = 100;
Ap = 1;
h = fdesign.lowpass('N,Fp,Ap',N,Fp,Ap,Fs);
d = design(h,'cheby1');
xfilter = filter(d,O);
xfiltfilt = filtfilt(d.sosMatrix,d.ScaleValues,O);
yfilter = filter(d,Y);
yfiltfilt = filtfilt(d.sosMatrix,d.ScaleValues,Y);
O = xfiltfilt;
Y = yfiltfilt;

b=[-1/32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1/32]; % design a High Pass Filter
a=[1 -1];
O=filter(b,a,O);
Y=filter(b,a,Y);

figure(1)
subplot(2,1,1)
plot(t1,O);
title('ECG sinal for old');
xlabel('time(s)');
ylabel('Voltage (V)');
subplot(2,1,2)
plot(t2,Y);
title('ECG sinal for young');
xlabel('time(s)');
ylabel('Voltage (V)');
sgtitle('Preprocessed ECG singal');



% b)
figure(2)
subplot(2,2,1)
stem(t1,O);
xlim([0 5]);
title('ECG sinal for old');
xlabel('time(s)');
ylabel('Voltage (V)');
grid on
subplot(2,2,2)
stem(t2,Y);
xlim([0 5]);
grid on
title('ECG sinal for young');
xlabel('time(s)');
ylabel('Voltage (V)');

subplot(2,2,3)
stem(t1,O);
xlim([6 10]);
grid on
title('ECG sinal for old');
xlabel('time(s)');
ylabel('Voltage (V)');
subplot(2,2,4)
stem(t2,Y);
xlim([6 10]);
title('ECG sinal for young');
xlabel('time(s)');
ylabel('Voltage (V)');
grid on

% b) amplitude spectrum
figure(3)
subplot(2,1,1)
dt1 = diff(t1);
nfft1 = length(O);
A1 = fft(O,nfft1);
A1 = A1(1:nfft1/2);
m1 = abs(A1);
f1 = (0:nfft1/2-1)*Fs/nfft1;
plot(f1,m1);
title('Amplitude spectrum of ECG sinal for old');
xlabel('frequency (Hz)');
ylabel('|V(f)|');
grid on

subplot(2,1,2)
dt2 = diff(t2);
nfft2 = length(Y);
A2 = fft(Y,nfft2);
A2 = A2(1:nfft2/2);
m2 = abs(A2);
f2 = (0:nfft2/2-1)*Fs/nfft2;
plot(f2,m2);
title('Amplitude spectrum of ECG sinal for young');
xlabel('freqeuncy (Hz)');
ylabel('|V(f)|');
grid on

% figure(3)
% subplot(2,1,1)
% odft = fft(O);
% odft = odft(1:length(O)/2+1);
% freq = 0:Fs/length(O): Fs/2;
% plot(freq,abs(odft));
% subplot(2,1,2)
% ydft = fft(Y);
% ydft = ydft(1:length(Y)/2+1);
% freq1 = 0:Fs/length(Y): Fs/2;
% plot(freq1,abs(ydft));


% c) NN interval by hand calculation & d) plot RR
int_O = 1.012; % s for old 
int_Y = 0.86; % s for young

[t_QRS_O,QRS_O,RR_O] = find_RR(O,t1,0,300);
[t_QRS_Y,QRS_Y,RR_Y] = find_RR(Y,t2,0,300);

figure(4)
subplot(2,1,1)
plot(t_QRS_O,QRS_O);
title('R peaks indentification represented by line for old');
xlabel('time(s)');
ylabel('Voltage (V)');
subplot(2,1,2)
plot(t_QRS_Y,QRS_Y);
title('R peaks indentification represented by line for young');
xlabel('time(s)');
ylabel('Voltage (V)');

figure(5)
subplot(2,1,1)
plot(RR_O);
title('tochogram of ECG signal for old')
xlabel('beat number');
ylabel('NN interval for Old');
subplot(2,1,2)
plot(RR_Y);
title('tochogram of ECG signal for young')
xlabel('beat number');
ylabel('NN interval for Young');
sgtitle('tachogram');

% e) mean plot & range plot
% old %
[t_QRS_1,QRS_1,RR_1] = find_RR(O,t1,0,300);% segment 1
[max_1,min_1,M_1,range_1] = Mean_range(RR_1);

[t_QRS_2,QRS_2,RR_2] = find_RR(O,t1,300,600);% segment 2
[max_2,min_2,M_2,range_2] = Mean_range(RR_2);

[t_QRS_3,QRS_3,RR_3] = find_RR(O,t1,600,900);% segment 3
[max_3,min_3,M_3,range_3] = Mean_range(RR_3);

[t_QRS_4,QRS_4,RR_4] = find_RR(O,t1,900,1200);% segment 4
[max_4,min_4,M_4,range_4] = Mean_range(RR_4);

[t_QRS_5,QRS_5,RR_5] = find_RR(O,t1,1200,1500);% segment 5
[max_5,min_5,M_5,range_5] = Mean_range(RR_5);


[t_QRS_6,QRS_6,RR_6] = find_RR(O,t1,1500,t1(end));% segment 6
[max_6,min_6,M_6,range_6] = Mean_range(RR_6);

mean_RRo = 1:6;
mean_RRo = ([M_1 M_2 M_3 M_4 M_5 M_6])';
max_RRo = 1:6;
max_RRo = ([max_1 max_2 max_3 max_4 max_5 max_6])';
min_RRo = 1:6;
min_RRo = ([min_1 min_2 min_3 min_4 min_5 min_6])';
RR_rangeo = 1:6;
RR_rangeo =([range_1 range_2 range_3 range_4 range_5 range_6])';
segmento = 1:6;
segmento =([1 2 3 4 5 6])';
intervalo = (["0-300","300-600","600-900","900-1200","1200-1500","1500-end"])';
tablevalue_old = table(segmento,intervalo,RR_rangeo,min_RRo,max_RRo,mean_RRo);
tablevalue_old(1:6,:);

% young %
[t_QRS_1y,QRS_1y,RR_1y] = find_RR(Y,t2,0,300);% segment 1
[max_1y,min_1y,M_1y,range_1y] = Mean_range(RR_1y);

[t_QRS_2y,QRS_2y,RR_2y] = find_RR(Y,t2,300,600);% segment 2
[max_2y,min_2y,M_2y,range_2y] = Mean_range(RR_2y);

[t_QRS_3y,QRS_3y,RR_3y] = find_RR(Y,t2,600,900);% segment 3
[max_3y,min_3y,M_3y,range_3y] = Mean_range(RR_3y);

[t_QRS_4y,QRS_4y,RR_4y] = find_RR(Y,t2,900,1200);% segment 4
[max_4y,min_4y,M_4y,range_4y] = Mean_range(RR_4y);

[t_QRS_5y,QRS_5y,RR_5y] = find_RR(Y,t2,1200,1500);% segment 5
[max_5y,min_5y,M_5y,range_5y] = Mean_range(RR_5y);

[t_QRS_6y,QRS_6y,RR_6y] = find_RR(Y,t2,1500,t2(end));% segment 6
[max_6y,min_6y,M_6y,range_6y] = Mean_range(RR_6y);

mean_RR = 1:6;
mean_RRy = ([M_1y M_2y M_3y M_4y M_5y M_6y])';
max_RRy = 1:6;
max_RRy = ([max_1y max_2y max_3y max_4y max_5y max_6y])';
min_RRy = 1:6;
min_RRy = ([min_1y min_2y min_3y min_4y min_5y min_6y])';
RR_rangey = 1:6;
RR_rangey =([range_1y range_2y range_3y range_4y range_5y range_6y])';
segmenty = 1:6;
segmenty =([1 2 3 4 5 6])';
intervaly = (["0-300","300-600","600-900","900-1200","1200-1500","1500-end"])';
tablevalue_young = table(segmenty,intervaly,RR_rangey,min_RRy,max_RRy,mean_RRy);
tablevalue_young(1:6,:);

figure(7)
subplot(2,2,1)
stem(segmento,mean_RRo);
title('mean value  for old');
xlabel('segment number');
ylabel('mean');
subplot(2,2,2)
stem(segmento,RR_rangeo);
title('range value for old');
xlabel('segment number');
ylabel('range');
subplot(2,2,3)
stem(segmenty,mean_RRy);
title('mean value for young');
xlabel('segment number');
ylabel('mean');
subplot(2,2,4)
stem(segmenty,RR_rangey);
title('range value for young');
xlabel('segment number');
ylabel('range');
%% part 2 time domain anaylsis %%
% old %
so1 = std(RR_1);
so2 = std(RR_2);
so3 = std(RR_3);
so4 = std(RR_4);
so5 = std(RR_5);
so6 = std(RR_6);
so = ([so1 so2 so3 so4 so5 so6])';

sy1 = std(RR_1y);
sy2 = std(RR_2y);
sy3 = std(RR_3y);
sy4 = std(RR_1y);
sy5 = std(RR_5y);
sy6 = std(RR_6y);
sy = ([sy1 sy2 sy3 sy4 sy5 sy6])';

figure(8)
subplot(2,1,1)
stem(segmento,so);
title('standard deviation for old');
xlabel('segment number');
ylabel('SDRR');

subplot(2,1,2)
stem(segmenty,sy);
title('standard deviation for young');
xlabel('segment number');
ylabel('SDRR');
%% part 3 frequency domain analysis %%
% old %
[pow_1,f_1,f_new_1,TOT_LF_1,TOT_HF_1,ratio_1] = frequencyanalysis(RR_1,T_new_s)
figure(9)
subplot(2,1,1)
plot(f_1,pow_1);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_1,pow_1);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 1 time recorded 100-300 s');

[pow_2,f_2,f_new_2,TOT_LF_2,TOT_HF_2,ratio_2] = frequencyanalysis(RR_2,T_new_s)
figure(10)
subplot(2,1,1)
plot(f_2,pow_2);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_2,pow_2);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 2 time recorded 300-600 s');

[pow_3,f_3,f_new_3,TOT_LF_3,TOT_HF_3,ratio_3] = frequencyanalysis(RR_3,T_new_s)
figure(11)
subplot(2,1,1)
plot(f_3,pow_3);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_3,pow_3);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 3 time recorded 600-900 s');

[pow_4,f_4,f_new_4,TOT_LF_4,TOT_HF_4,ratio_4] = frequencyanalysis(RR_4,T_new_s)
figure(12)
subplot(2,1,1)
plot(f_4,pow_4);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_4,pow_4);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 4 time recorded 900-1200 s');

[pow_5,f_5,f_new_5,TOT_LF_5,TOT_HF_5,ratio_5] = frequencyanalysis(RR_5,T_new_s)
figure(13)
subplot(2,1,1)
plot(f_5,pow_5);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_5,pow_5);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 5 time recorded 1200-1500 s');

[pow_6,f_6,f_new_6,TOT_LF_6,TOT_HF_6,ratio_6] = frequencyanalysis(RR_6,T_new_s)
figure(14)
subplot(2,1,1)
plot(f_6,pow_6);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_6,pow_6);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 6 time recorded 1500-1800 s');

% young %

[pow_1y,f_1y,f_new_1y,TOT_LF_1y,TOT_HF_1y,ratio_1y] = frequencyanalysis(RR_1y,T_new_s)
figure(15)
subplot(2,1,1)
plot(f_1y,pow_1y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_1y,pow_1y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 1 time recorded 100-300 s');

[pow_2y,f_2y,f_new_2y,TOT_LF_2y,TOT_HF_2y,ratio_2y] = frequencyanalysis(RR_2y,T_new_s)
figure(16)
subplot(2,1,1)
plot(f_2y,pow_2y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_2y,pow_2y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 2 time recorded 300-600 s');

[pow_3y,f_3y,f_new_3y,TOT_LF_3y,TOT_HF_3y,ratio_3y] = frequencyanalysis(RR_3y,T_new_s)
figure(17)
subplot(2,1,1)
plot(f_3y,pow_3y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_3y,pow_3y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 3 time recorded 600-900 s');

[pow_4y,f_4y,f_new_4y,TOT_LF_4y,TOT_HF_4y,ratio_4y] = frequencyanalysis(RR_4y,T_new_s)
figure(18)
subplot(2,1,1)
plot(f_4y,pow_4y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_4y,pow_4y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 4 time recorded 900-1200 s');

[pow_5y,f_5y,f_new_5y,TOT_LF_5y,TOT_HF_5y,ratio_5y] = frequencyanalysis(RR_5y,T_new_s)
figure(19)
subplot(2,1,1)
plot(f_5y,pow_5y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_5y,pow_5y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 5 time recorded 1200-1500 s');

[pow_6y,f_6y,f_new_6y,TOT_LF_6y,TOT_HF_6y,ratio_6y] = frequencyanalysis(RR_6y,T_new_s)
figure(20)
subplot(2,1,1)
plot(f_6y,pow_6y);
title('Power Spectrum')
xlabel('Frequency (Hz)')
ylabel('Amplitude in dB')
subplot(2,1,2)
plot(f_new_6y,pow_6y);
title('Power Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude in dB');
sgtitle('segment 6 time recorded 1500-1800 s');


%% part 4 additional analysis %%
% old %
[xm_1,xp_1,SD1_1,SD2_1] = Pointcareanalysis(RR_1)
figure(21)
plot(xp_1,xm_1,'.');
title('Poincare Plot for segmentation 1 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_2,xp_2,SD1_2,SD2_2] = Pointcareanalysis(RR_2)
figure(22)
plot(xp_2,xm_2,'.');
title('Poincare Plot for segmentation 2 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_3,xp_3,SD1_3,SD2_3] = Pointcareanalysis(RR_3)
figure(23)
plot(xp_3,xm_3,'.');
title('Poincare Plot for segmentation 3 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_4,xp_4,SD1_4,SD2_4] = Pointcareanalysis(RR_4)
figure(24)
plot(xp_4,xm_4,'.');
title('Poincare Plot for segmentation 4 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_5,xp_5,SD1_5,SD2_5] = Pointcareanalysis(RR_5)
figure(25)
plot(xp_5,xm_5,'.');
title('Poincare Plot for segmentation 5 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_6,xp_6,SD1_6,SD2_6] = Pointcareanalysis(RR_6)
figure(26)
plot(xp_6,xm_6,'.');
title('Poincare Plot for segmentation 6 of old');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

% young %

[xm_1y,xp_1y,SD1_1y,SD2_1y] = Pointcareanalysis(RR_1y)
figure(27)
plot(xp_1y,xm_1y,'.');
title('Poincare Plot for segmentation 1 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_2y,xp_2y,SD1_2y,SD2_2y] = Pointcareanalysis(RR_2y)
figure(28)
plot(xp_2y,xm_2y,'.');
title('Poincare Plot for segmentation 2 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_3y,xp_3y,SD1_3y,SD2_3y] = Pointcareanalysis(RR_3y)
figure(29)
plot(xp_3y,xm_3y,'.');
title('Poincare Plot for segmentation 3 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_4y,xp_4y,SD1_4y,SD2_4y] = Pointcareanalysis(RR_4y)
figure(30)
plot(xp_4y,xm_4y,'.');
title('Poincare Plot for segmentation 4 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_5y,xp_5y,SD1_5y,SD2_5y] = Pointcareanalysis(RR_5y)
figure(31)
plot(xp_5y,xm_5y,'.');
title('Poincare Plot for segmentation 5 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

[xm_6y,xp_6y,SD1_6y,SD2_6y] = Pointcareanalysis(RR_6y)
figure(32)
plot(xp_6y,xm_6y,'.');
title('Poincare Plot for segmentation 6 of young');
xlabel('RR interval(i)');
ylabel('RR interval(i+1)');

