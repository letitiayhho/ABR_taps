data_name               = '~/Desktop/FFR_50001_Raw Data.eeg';

cfg                     = [];
cfg.trialdef.prestim    = 0.05;
cfg.trialdef.poststim   = 0.250;quit
cfg.trialdef.eventtype  = 'string';
cfg.dataset             = data_name;
cfg_tr_def              = ft_definetrial(cfg);