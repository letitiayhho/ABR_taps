function [f, power] = compute_power_spectrum(filepath)
    [x, fs] = audioread(filepath);
    n = length(x);          % number of samples
    
    %% Simple version
    y = fft(x);             % fft
    f = (0:n-1)*(fs/n);     % frequency range
    power = abs(y).^2/n;    % power of the DFT
    
%     subplot(2, 1, 1)
%     plot_power_spectrum(f, power);
    
    %% Serena's version
%     NFFT = 2^nextpow2(n); % Next power of 2 from length of y
%     power = fft(x, NFFT)/n;
%     f = fs/2*linspace(0,1,NFFT/2+1);
%     
%     % adjust scale
%     f = f(10:1000);
%     power = 2*abs(power(10:1000));
%     
%     subplot(2, 1, 2)
%     plot_power_spectrum(f, power);
end