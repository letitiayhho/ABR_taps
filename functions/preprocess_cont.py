#!/usr/bin/env python3

import os
import numpy as np
import mne
from mne.preprocessing import ICA, create_ego_epochs
from pyprp.prep_pipline import PrepPipeline
from autoreject import get_rejection_threshold, validation_curve

# Import data

folder = "/home/letitiayhho/serena/incomplete_raw_data/raw"
filename = "59_80bpm.vhdr"
filepath = os.path.join(folder, filename) 
raw = mne.io.read_raw_brainvision(filepath)
print(raw.info)

# 1. Filter data

# bandpass filter
raw_bandpass = raw.filter(l_freq=100, h_freq=2000)
 
# notch filter
eeg_picks = mne.pick_types(raw.info, eeg=True)
freqs = (60, 120, 180, 240, 320, 360)
raw_notch = raw_bandpass.notch_filter(freqs=freqs, picks=eeg_picks)

# 2. Reject artifacts

# eog rejection
eog_epochs = mne.preprocessing.creat_eog_epochs(raw_notch, baseline=(-0.05, -0.002))

# 3. Sub-sample inverted and non-inverted stimuli in each condition

# 4. Average

# 5. Comput FFT

print("done")
