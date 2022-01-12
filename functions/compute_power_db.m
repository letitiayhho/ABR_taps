ref = 2;
actual = 1;
condition = 40;
data_path = 'intermediate/440hz_peaks.csv';
df = readtable(data_path);
df = df(df.condition == condition, :);

amp_ref = df.peak(df.segment == ref, :);
amp = df.peak(df.segment == actual, :);
power_db = 20 .* log10(abs(amp) ./ abs(amp_ref));

hist(power_db)