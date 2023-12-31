clear
a = 1 + mod(205,3);
audio1 = "piano2.wav";
audio2 = "trumpet2.wav";
audio3 = "violin2.wav";
audio4 = "flute2.wav";
[y1 fs1] = audioread(audio1);
[y2 fs2] = audioread(audio2);
[y3 fs3] = audioread(audio3);
[y4 fs4] = audioread(audio4);

fft1 = fft(y1);
magspec1 = abs(fft1);
len1 = length(y1);
frequency_piano = (0:(len1-1)) * (fs1/len1);
[~,peak1] = max(magspec1);
fundamental_freq_piano = (peak1 - 1)*(fs1/len1) 

fft2 = fft(y2);
magspec2 = abs(fft2);
len2 = length(y2);
frequency_trumpet = (0:(len2-1)) * (fs2/len2);
[~,peak2] = max(magspec2);
fundamental_freq_trumpet = (peak2 - 1)*(fs2/len2) 

fft3 = fft(y3);
magspec3 = abs(fft3);
len3 = length(y3);
frequency_violin = (0:(len3-1)) * (fs3/len3);
[~,peak3] = max(magspec2);
fundamental_freq_violin = (peak3 - 1)*(fs3/len3) 

fft4 = fft(y4);
magspec4 = abs(fft4);
len4 = length(y4);
frequency_flute = (0:(len4-1)) * (fs4/len4);
[~,peak4] = max(magspec4);
fundamental_freq_flute = (peak4 - 1)*(fs4/len4) 

figure;
title("Magnitude Spectrum");
subplot(2,2,1)
plot(frequency_piano,db(magspec1));
ylabel("Magnitude (Piano) in dB");
xlabel("Frequency in Hz");

subplot(2,2,2)
plot(frequency_trumpet,db(magspec2));
ylabel("Magnitude (Trumpet) in dB");
xlabel("Frequency in Hz");

subplot(2,2,3)
plot(frequency_violin,db(magspec3));
ylabel("Magnitude (Violin) in dB");
xlabel("Frequency in Hz");

subplot(2,2,4)
plot(frequency_flute,db(magspec4));
ylabel("Magnitude (Flute) in dB");
xlabel("Frequency in Hz");


clear
audio = "flute2.wav";
audio1 = "piano1.wav";
audio2 = "piano2.wav";
audio3 = "piano3.wav";
audio4 = "piano4.wav";
[y0 fs0] = audioread(audio);
[y1 fs1] = audioread(audio1);
[y2 fs2] = audioread(audio2);
[y3 fs3] = audioread(audio3);
[y4 fs4] = audioread(audio4);

fft0 = fft(y0);
magspec = abs(fft0);
len = length(y0);
frequency_flute2 = (0:(len-1)) * (fs0/len);
[~,peak0] = max(magspec);
fundamental_freq_flute2 = (peak0 - 1)*(fs0/len)

fft1 = fft(y1);
magspec1 = abs(fft1);
len1 = length(y1);
frequency_piano1 = (0:(len1-1)) * (fs1/len1);
[~,peak1] = max(magspec1);
fundamental_freq_piano1 = (peak1 - 1)*(fs1/len1) 

fft2 = fft(y2);
magspec2 = abs(fft2);
len2 = length(y2);
frequency_piano2 = (0:(len2-1)) * (fs2/len2);
[~,peak2] = max(magspec2);
fundamental_freq_piano2 = (peak2 - 1)*(fs2/len2) 

fft3 = fft(y3);
magspec3 = abs(fft3);
len3 = length(y3);
frequency_piano3 = (0:(len3-1)) * (fs3/len3);
[~,peak3] = max(magspec2);
fundamental_freq_piano3 = (peak3 - 1)*(fs3/len3) 

fft4 = fft(y4);
magspec4 = abs(fft4);
len4 = length(y4);
frequency_piano4 = (0:(len4-1)) * (fs4/len4);
[~,peak4] = max(magspec4);
fundamental_freq_piano4 = (peak4 - 1)*(fs4/len4) 


recObj = audiorecorder(44100,16,1);
recDuration = 3;
fs0 = 44100;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")
y0 = getaudiodata(recObj);
fft0 = fft(y0);
magspec = abs(fft0);
len = length(y0);
frequency_wistle_key = (0:(len-1)) * (fs0/len);
[~,peak0] = max(magspec);
fundamental_freq_wistle_key = (peak0 - 1)*(fs0/len)

recObj = audiorecorder(44100,16,1);
recDuration = 3;
fs0 = 44100;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")
y1 = getaudiodata(recObj);
fft1 = fft(y1);
magspec = abs(fft1);
len = length(y1);
frequency_wistle_access = (0:(len-1)) * (fs0/len);
[~,peak1] = max(magspec);
fundamental_freq_access = (peak1 - 1)*(fs0/len)
fn2(fundamental_freq_wistle_key,fundamental_freq_access)



function F = fn2(fundamental_freq_wistle_key ,fundamental_freq_access)
title("Magnitude Spectrum");
subplot(2,1,1)
plot(frequency_wistle_key,fft0)
subplot(2,1,2)
plot(fundamental_freq_access,fft1)
if((abs(fundamental_freq_wistle_key - fundamental_freq_access))/fundamental_freq_wistle_key <= 0.05)
    fprintf('access granted');
else
    fprintf('access denied');
end
end
