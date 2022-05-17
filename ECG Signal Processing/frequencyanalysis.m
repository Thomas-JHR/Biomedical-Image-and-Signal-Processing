function [pow,f,f_new,TOT_LF,TOT_HF,ratio] = frequencyanalysis(sig,T_new_s)
NFFT = 2^nextpow2(length(sig));
Y = fft(sig,NFFT)/length(sig);
f = 250/2*linspace(0,1,NFFT/2 + 1);

pow = 2*10*log10(abs(Y(1:NFFT/2+1)));

f_new_s = 1/T_new_s;
f_new = f_new_s/2*linspace(0,1,NFFT/2+1);

LF = [0.04 0.15]; % LF region
HF = [0.15 0.4]; % HF region
 iLF = (pow>=LF(1)) & (pow<=LF(2)); % index value in LF region
 iHF = (pow>=HF(1)) & (pow<=HF(2)); % index value in HF region
% Using numberical integration to obtain tot power in LF and HF region


TOT_LF = abs(trapz(LF(1):LF(2),pow));
TOT_HF = abs(trapz(HF(1):HF(2),pow));
ratio = TOT_LF/TOT_HF; 
end

