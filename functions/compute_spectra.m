function compute_peaks_for_all_ABR()
    condition = "40BPM";
    cd('/Users/letitiaho/src/serena/Movement FFR_All Analyses/')
    paths = dir('3Blocks_Data/*/*' + condition + '*.wav');
    secs = zeros(length(paths), 1);
    file_order = [];
    
    % Initialize empty data arrays
    peak = [];
    subject = [];
    condition = [];
    segment = [];
    
    for i = 1:length(paths)
        filepath = fullfile(paths(i).folder, paths(i).name);
        
        % Extract file information
%         path_parts = split(paths(1).folder, '/');
%         subject = char(path_parts(end));
%         subject = subject(end-1:end)
        [~, filename, ~] = fileparts(filepath);
        
        % parse filename into details
        filename = split(filename, '_');
        this_subject = char(filename(1));
        subject(i,:) = string(this_subject(end-1:end));
        this_condition = char(filename(2));
        condition(i,:) = string(this_condition(1:2));
        this_segment = char(filename(3));
        segment(i,:) = string(this_segment(end));
        
        % Read file and compute frequency spectra
        [f, power] = compute_power_spectrum(filepath)
        
        % Get peak at 440 Hz
        indexes = f > 430 & f < 450;
        peak(i,:) = max(power(indexes));
        
        % Plot
%         filename = split(filename, '_');
%         filename = strjoin(filename, "-");
%         figure(1)
%         subplot(5, 2, i)
%         plot_frequency_spectrum(f, power)
%         title(string(filename))
    end
end

table(subject, condition, segment, peak)


function plot_frequency_spectrum(f, power)
    plot(f, power)
    xlim([0 1000])
    xlabel('Frequency')
    ylabel('Power')
end