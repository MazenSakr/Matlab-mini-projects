function [soundSignal,X,Fs,time,f] = Transmitter()
%This function acts as the transmitter block in the
%communication system reading, playing and displaying input signal.

%Reading input signal
[soundSignal,Fs]=audioread('CantinaBand3.wav');

%Getting signal time 
time = linspace(0,length(soundSignal)/Fs,length(soundSignal));

%Transforming signal to frequency domain
X = fftshift(fft(soundSignal));
Xmag = abs(X);
Xphase = angle(X);
N = length(soundSignal);
f = linspace(-Fs/2,Fs/2,N);

%Playing & Displaying input signal
sound(soundSignal,Fs);
figure('name','Transmitter');
subplot(3,1,1);
plot(f, Xmag);
title('Magnitude in Frequency Domain');
subplot(3,1,2);
plot(f, Xphase);
title('Phase in Frequency Domain');
subplot(3,1,3);
plot(time,soundSignal);
title('Signal in time domain');
pause(time(end));
end

