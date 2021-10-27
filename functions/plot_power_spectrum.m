function plot_power_spectrum(f, power)
    plot(f, power);
    xlim([0 3500])
    xlabel('Frequency')
    ylabel('Power')
end