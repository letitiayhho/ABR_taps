function [f, power] = compute_power_spectrum(filepath)
    [y, fs] = audioread(filepath);
    n = length(y);          % number of samples

%     % simple frequency spectrum https://www.mathworks.com/help/matlab/math/basic-spectral-analysis.html
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
    
    %% compute power
    % simple version
    y = fft(y);             % fft
    f = (0:n-1)*(fs/n);     % frequency range
    power = abs(y).^2/n;    % power of the DFT
    
    % serena's version
%     NFFT = 2^nextpow2(n); % Next power of 2 from length of y
%     power = fft(y, NFFT)/n;
%     f = fs/2*linspace(0,1,NFFT/2+1);
%     f = (0:n-1)*(fs/n);

%     figure(2),plot(f(10:1000),2*abs(Y(10:1000))) 

    plot_power_spectrum(f, power);
end