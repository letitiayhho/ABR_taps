function [f, amplitude] = compute_power_spectrum(filepath)
    [y, fs] = audioread(filepath);
    n = length(y);          % number of samples

%     % simple frequency spectrum https://www.mathworks.com/matlabcentral/answers/251061-how-to-plot-frequency-spectrum-of-a-signal-in-matlab
%     y = fft(y);             % fft
%     f = (0:n-1)*(fs/n);     % frequency range
%     power = abs(y).^2/n;    % power of the DFT
%     
%     % https://www.mathworks.com/help/signal/ug/power-spectral-density-estimates-using-fft.html
%     xdft = fft(y);
%     xdft = xdft(1:n/2+1);
%     psdx = (1/(fs*n)) * abs(xdft).^2;
%     psdx(2:end-1) = 2*psdx(2:end-1);
%     power = psdx;
%     f = 0:Fs/length(y):fs/2;
%     
%     % compute with welch's, power in dB
%     [pxx, fs] = pwelch(y,'power');
%     power = pow2db(pxx);
    
    % Serena
    T = 1/fs;
    t = (0:n-1)*T;

    NFFT = 2^nextpow2(n); % Next power of 2 from length of y
    Y = fft(y,NFFT)/n;
    f = fs/2*linspace(0,1,NFFT/2+1);

    figure(2),plot(f(10:1000),2*abs(Y(10:1000))) 

    [B,IX] = sort(2*abs(Y(1:NFFT/2+1))); 
    BFloor=0.01; %BFloor is the minimum amplitude value (ignore small values) 
    amplitude=B(B>=BF3loor); %find all amplitudes above the BFloor 
    f=f(IX(1+end-numel(amplitude):end)); %frequency of the peaks

    f = f';
    amplitude = amplitude';
end