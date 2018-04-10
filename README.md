# pitch_jitter_shimmer
Using praat to get pitch, jitter and shimmer parameters of voice file.

## usage:
praat_file = './praat/praat.praat'
praat_path = './praat'
pjs = PitchJitterShimmer(praat_file, praat_path)
voice_file = './test/001_a1_PCGITA.wav'
print(pjs.calculate(voice_file, True))
