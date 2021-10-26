function [f, power] = compute_power_spectrum(filepath)
    [y, fs] = audioread(filepath);
    n = length(y);          % number of samples
    y = fft(y);             % fft
    f = (0:n-1)*(fs/n);     % frequency range
    power = abs(y).^2/n;    % power of the DFT
end