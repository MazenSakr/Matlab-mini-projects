clear all;
clc;

[y,Fs]=audioread('Test 1.m4a');
Ns=length(y);
n=Ns/Fs;

Recive_sig=fftshift(fft(y));
f=linspace(-Fs/2,Fs/2,Ns);
figure;

right_band=round(n*(Fs/2 -3400));
lift_band=(length(Recive_sig)-(right_band+1));
%filtering the unwanted frequency in the spectrum
Recive_sig([1:right_band   lift_band:length(Recive_sig)])=0;

subplot(2,1,2);
plot(f,Recive_sig);
title('filtered signal');

