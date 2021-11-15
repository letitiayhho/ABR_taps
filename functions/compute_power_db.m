% function compute_power_db(actual, ref)
ref = 1;
actual = 3;
condition = 40;
    data_path = 'intermediate/440hz_peaks.csv';
    df = readtable(data_path);
    df = df(df.condition == condition, :);
%     segments = [1, 2, 3];
%     segments(segments == ref) = [];
    
%     new_df = []
    amp_ref = df.peak(df.segment == ref, :);
%     for segment = segments
        amp = df.peak(df.segment == actual, :);
        power_db = 20 .* log10(amp ./ amp_ref);
%     end
%     amp = df(df.segment == 1, :);
%     ref = df(df.segment == 3, :);
% end

hist(power_db)