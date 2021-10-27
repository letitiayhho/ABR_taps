function [freq, amp] = compute_ampltiude(filepath)
    [y, fs] = audioread(filepath);
    y = EP1;
    % y = w;
    % y = AllTones;
    Fs = 25000;
    T = 1/Fs;
    L = length(y);
    t = (0:L-1)*T;

    NFFT = 2^nextpow2(L); % Next power of 2 from length of y
    Y = fft(y,NFFT)/L;
    f = Fs/2*linspace(0,1,NFFT/2+1);

    figure(2),plot(f(10:1000),2*abs(Y(10:1000))) 

    [B,IX] = sort(2*abs(Y(1:NFFT/2+1))); 
    BFloor=0.01; %BFloor is the minimum amplitude value (ignore small values) 
    Amplitudes=B(B>=BFloor); %find all amplitudes above the BFloor 
    Frequencies=f(IX(1+end-numel(Amplitudes):end)); %frequency of the peaks

    Frequencies = Frequencies';
    Amplitudes = Amplitudes';
end
