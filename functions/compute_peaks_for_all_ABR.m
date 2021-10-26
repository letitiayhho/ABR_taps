function compute_peaks_for_all_ABR()
    cd('/Users/letitiaho/src/serena/')
    addpath('functions')
    paths = dir('Movement FFR_All Analyses/3Blocks_Data/*/*.wav');

    % Initialize empty data arrays
    peak = [];
    subject = [];
    condition = [];
    segment = [];

    for i = 1:length(paths)
        filepath = fullfile(paths(i).folder, paths(i).name);

        % parse filename into details
        [~, filename, ~] = fileparts(filepath);
        filename = split(filename, '_');
        this_subject = char(filename(1));
        subject(i,:) = string(this_subject(end-1:end));
        this_condition = char(filename(2));
        condition(i,:) = string(this_condition(1:2));
        this_segment = char(filename(3));
        segment(i,:) = string(this_segment(end));

        % Read file and compute frequency spectra
        [f, power] = compute_power_spectrum(filepath);

        % Get peak at 440 Hz
        indexes = f > 430 & f < 450;
        peak(i,:) = max(power(indexes));
    end
    
    df = table(subject, condition, segment, peak);
    writetable(df, 'intermediate/440hz_peaks.csv') 
end