form Directory to analyse and file
	text filename
	integer pitch_range_min
	integer pitch_range_max
	positive maximum_period_factor
	positive maximum_amplitude_factor
	positive silence_threshold
	positive voicing_threshold
endform

pitch_range_min = 75
pitch_range_max = 500
maximum_period_factor = 1.3
maximum_amplitude_factor = 1.6
silence_threshold = 0.03
voicing_threshold = 0.45

sound = Read from file... 'filename$'
selectObject: sound
pitch = To Pitch: 0, pitch_range_min, pitch_range_max
selectObject: sound
pulses = To PointProcess (periodic, cc): pitch_range_min, pitch_range_max
selectObject: sound,pitch,pulses
voiceReport$ = Voice report: 0, 0, pitch_range_min, pitch_range_max, maximum_period_factor, maximum_amplitude_factor, silence_threshold, voicing_threshold

mean_pitch = extractNumber (voiceReport$, "Mean pitch: ")
jitter_local = extractNumber (voiceReport$, "Jitter (local): ")
jitter_abs = extractNumber (voiceReport$, "Jitter (local, absolute): ")
jitter_rap = extractNumber (voiceReport$, "Jitter (rap): ")
jitter_ppq5 = extractNumber (voiceReport$, "Jitter (ppq5): ")
jitter_ddp = extractNumber (voiceReport$, "Jitter (ddp): ")
shimmer_local = extractNumber (voiceReport$, "Shimmer (local): ")
shimmer_local_db = extractNumber (voiceReport$, "Shimmer (local, dB): ")
shimmer_apq3 = extractNumber (voiceReport$, "Shimmer (apq3): ")
shimmer_apq5 = extractNumber (voiceReport$, "Shimmer (apq5): ")
shimmer_apq11 = extractNumber (voiceReport$, "Shimmer (apq11): ")
shimmer_dda = extractNumber (voiceReport$, "Shimmer (dda): ")
writeInfoLine: "mean_pitch = ", mean_pitch
writeInfoLine: "Jitter (local):  = ", jitter_local
writeInfoLine: "Jitter (local, absolute):  = ", jitter_abs
writeInfoLine: "Jitter (rap):  = ", jitter_rap
writeInfoLine: "Jitter (ppq5):  = ", jitter_ppq5
writeInfoLine: "Jitter (ddp):  = ", jitter_ddp
writeInfoLine: "Shimmer (local):  = ", shimmer_local
writeInfoLine: "Shimmer (local, dB):  = ", shimmer_local_db
writeInfoLine: "Shimmer (apq3):  = ", shimmer_apq3
writeInfoLine: "Shimmer (apq5):  = ", shimmer_apq5
writeInfoLine: "Shimmer (apq11):  = ", shimmer_apq11
writeInfoLine: "Shimmer (dda):  = ", shimmer_dda

results_file$ = replace$(filename$,".wav",".csv",0)
if fileReadable (results_file$)
	filedelete 'results_file$'
endif
fileappend "'results_file$'" Mean pitch,Jitter (local),Jitter (local absolute),Jitter (rap),Jitter (ppq5),Jitter (ddp),Shimmer (local),Shimmer (local dB),Shimmer (apq3),Shimmer (apq5),Shimmer (apq11),Shimmer (dda)
fileappend "'results_file$'" 'newline$'

mean_pitch_str$ = string$(mean_pitch)
jitter_local_str$ = string$(jitter_local)
jitter_abs_str$ = string$(jitter_abs)
jitter_rap_str$ = string$(jitter_rap)
jitter_ppq5_str$ = string$(jitter_ppq5)
jitter_ddp_str$ = string$(jitter_ddp)
shimmer_local_str$ = string$(shimmer_local)
shimmer_local_db_str$ = string$(shimmer_local_db)
shimmer_apq3_str$ = string$(shimmer_apq3)
shimmer_apq5_str$ = string$(shimmer_apq5)
shimmer_apq11_str$ = string$(shimmer_apq11)
shimmer_dda_str$ = string$(shimmer_dda)

fileappend "'results_file$'" 'mean_pitch_str$','jitter_local_str$','jitter_abs_str$','jitter_rap_str$','jitter_ppq5_str$','jitter_ddp_str$','shimmer_local_str$','shimmer_local_db_str$','shimmer_apq3_str$','shimmer_apq5_str$','shimmer_apq11_str$','shimmer_dda_str$'

selectObject ( ) ;
exit
