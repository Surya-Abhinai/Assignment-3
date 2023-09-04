recObj = audiorecorder(44100,16,1);
recDuration = 3;
fs0 = 44100;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")
y0 = getaudiodata(recObj);
fft0 = fft(y0);
magspec0 = abs(fft0);
len = length(y0);
frequency_wistle_key = (0:(len-1)) * (fs0/len);
[~,peak0] = max(magspec0);
fundamental_freq_wistle_key = (peak0 - 1)*(fs0/len)

recObj1 = audiorecorder(44100,16,1);
recDuration1 = 3;
fs1 = 44100;
disp("Begin speaking.")
recordblocking(recObj1,recDuration);
disp("End of recording.")
y1 = getaudiodata(recObj1);
fft1 = fft(y1);
magspec1 = abs(fft1);
len = length(y1);
frequency_wistle_access = (0:(len-1)) * (fs1/len);
[~,peak1] = max(magspec1);
fundamental_freq_access = (peak1 - 1)*(fs1/len)
fn2(fundamental_freq_wistle_key,fundamental_freq_access)

subplot(2,1,1)
plot(frequency_wistle_key,db(magspec0))
ylabel("Magnitude (key) in dB");
xlabel("Frequency in Hz");
subplot(2,1,2)
plot(frequency_wistle_access,db(magspec1))
ylabel("Magnitude (attempt) in dB");
xlabel("Frequency in Hz");
