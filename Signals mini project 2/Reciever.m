function [] = Reciever(Fs,soundSignalIn1,Time1,soundSignalIn2,Time2,soundSignalIn3,Time3,soundSignalIn4,Time4)
%This function acts as the Reciever block in the communication
%system taking in noisy signal and applying a low pass filter to it
%then displaying and playing it

%Filtering recieved signals
[recievedSignal1,f1] = filterSignal(Fs,soundSignalIn1);
[recievedSignal2,f2] = filterSignal(Fs,soundSignalIn2);
[recievedSignal3,f3] = filterSignal(Fs,soundSignalIn3);
[recievedSignal4,f4] = filterSignal(Fs,soundSignalIn4);

%getting time domain signals
timeDomainSignal(Fs,recievedSignal1,Time1,recievedSignal2,Time2,recievedSignal3,Time3,recievedSignal4,Time4)

%Plotting filtered signals
figure("name",'Reciever Frequency Domain')
subplot(4,2,1)
plot(f1,abs(recievedSignal1));
title('filtered signal 1 magnitude');
subplot(4,2,5)
plot(f1,angle(recievedSignal1));
title('filtered signal 1 Phase');

subplot(4,2,2)
plot(f2,abs(recievedSignal2));
title('filtered signal 2 magnitude');
subplot(4,2,6)
plot(f2,angle(recievedSignal2));
title('filtered signal 2 Phase');

subplot(4,2,3)
plot(f3,abs(recievedSignal3));
title('filtered signal 3 magnitude');
subplot(4,2,7)
plot(f3,angle(recievedSignal3));
title('filtered signal 3 Phase');

subplot(4,2,4)
plot(f4,abs(recievedSignal4));
title('filtered signal 4 magnitude');
subplot(4,2,8)
plot(f4,angle(recievedSignal4));
title('filtered signal 4 Phase');
end

function [recievedSignal,f] = filterSignal(Fs,signal)
%converting to frequency domain and preparing filter bands
Ns = length(signal);
n=Ns/Fs;
recievedSignal = fftshift(fft(signal));
f=linspace(-Fs/2,Fs/2,Ns);
rightBand=round(n*(Fs/2 -3400));
leftBand=(length(recievedSignal)-(rightBand+1));
%filtering the unwanted frequency in the spectrum
recievedSignal([1:rightBand   leftBand:length(recievedSignal)])=0;
end

function [] = timeDomainSignal(Fs,signal1,time1,signal2,time2,signal3,time3,signal4,time4)
%Making new figure
figure("name",'Reciever Time Domain')
%getting the time domian of each signal then plotting it
signal1 = ifftshift(signal1);
signal1 = ifft(signal1);
signal1 = real(signal1);
sound(signal1, Fs);
subplot(2,2,1)
plot(time1,signal1)
pause(time1(end));

signal2 = ifftshift(signal2);
signal2 = ifft(signal2);
signal2 = real(signal2);
sound(signal2, Fs);
subplot(2,2,2)
plot(time2,signal2)
pause(time1(end));

signal3 = ifftshift(signal3);
signal3 = ifft(signal3);
signal3 = real(signal3);
sound(signal3, Fs);
subplot(2,2,3)
plot(time3,signal3)
pause(time1(end));

signal4 = ifftshift(signal4);
signal4 = ifft(signal4);
signal4 = real(signal4);
sound(signal4, Fs);
subplot(2,2,4)
plot(time4,signal4)
pause(time1(end));
end