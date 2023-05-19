function [soundSignalOut1,soundSignalOut2,soundSignalOut3,soundSignalOut4] = Noise(sigma,Fs,soundSignalIn1,Time1,soundSignalIn2,Time2,soundSignalIn3,Time3,soundSignalIn4,Time4)
%This function acts as the Noise addition block in the communication
%system taking in channel signal and returning signal + Noise

%Getting noise signals
Z1 = sigma*randn(length(soundSignalIn1),1);   
Z2 = sigma*randn(length(soundSignalIn2),1);
Z3 = sigma*randn(length(soundSignalIn3),1);
Z4 = sigma*randn(length(soundSignalIn4),1);

%Applying noise to signals
soundSignal1 = soundSignalIn1(:) + Z1;
soundSignal2 = soundSignalIn2(:) + Z2;
soundSignal3 = soundSignalIn3(:) + Z3;
soundSignal4 = soundSignalIn4(:) + Z4;

%Returning noisy signals
soundSignalOut1 = soundSignal1;
soundSignalOut2 = soundSignal2;
soundSignalOut3 = soundSignal3;
soundSignalOut4 = soundSignal4;

%Drawing and playing noisy signals
sound(soundSignal1,Fs);
drawNoisySignal(soundSignal1,Time1,Fs)
pause(Time1(end));

sound(soundSignal2,Fs);
drawNoisySignal(soundSignal2,Time2,Fs)
pause(Time2(end));

sound(soundSignal3,Fs);
drawNoisySignal(soundSignal3,Time3,Fs)
pause(Time3(end));

sound(soundSignal4,Fs);
drawNoisySignal(soundSignal4,Time4,Fs)
pause(Time4(end));

end

function [] = drawNoisySignal(signal,time,Fs)
%transforming to frequency domain
X = fftshift(fft(signal));
Xmag = abs(X);
Xphase = angle(X);
N = length(signal);
f = linspace(-Fs/2,Fs/2,N);
%displaying
figure('name','Noise');
subplot(3,1,1);
plot(f, Xmag);
title('Magnitude in Frequency Domain');
subplot(3,1,2);
plot(f, Xphase);
title('Phase in Frequency Domain');
subplot(3,1,3);
plot(time,signal);
title('Signal in time domain');
end