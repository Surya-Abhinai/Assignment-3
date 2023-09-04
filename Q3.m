[y,Fs] = audioread('Opera.wav'); 
Y = fft(y); 
f = Fs*(0:(length(y)-1)/length(y)); 
plot(f,db(abs(Y)));
xlabel('Frequency (Hz)');
ylabel('Magnitude(dB)');
N = length(y)/10; 
M = floor(length(y)/N); 
for i = 1:M
    y_segment = y((i-1)*N+1:i*N);
    Y_segment = fft(y_segment); 
    f_segment = Fs*(0:N-1)/N; 
    [m,j]=max(db(Y_segment));
    f_segment(j)
    subplot(5,2,i);
    plot(f_segment,db(abs(Y_segment)));
    xlabel('frequency');
    ylabel('magnitude');
end

[y, Fs] = audioread("Opera.wav");

% Define STFT parameters
window_length = 512;  % Length of the analysis window
overlap_length = 256; % Overlap between consecutive windows
nfft = 512;           % Number of FFT points (usually the same as window_length)

% Compute the STFT
[S, F, T] = spectrogram(y, window_length, overlap_length, nfft, Fs);

% S is the STFT matrix, F is the frequency vector, and T is the time vector

% Plot the spectrogram
figure;
imagesc(T, F, 20*log10(abs(S))); % Convert to dB scale
axis xy; % Flip the y-axis
colormap jet; % Choose a colormap
colorbar; % Add a color bar
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram');
