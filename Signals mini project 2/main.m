%Prep
clc;
clear;

%Transmitter
[soundSignal,X,Fs,time,f] = Transmitter();

%Channel
[soundSignalOut1,Time1,soundSignalOut2,Time2,soundSignalOut3,Time3,soundSignalOut4,Time4] = Channel(soundSignal,Fs,time);

%Taking Noise level input 
NoiseLevel = input("Please input Noise level :");

%Applying noise to channel
[soundSignalOut1,soundSignalOut2,soundSignalOut3,soundSignalOut4] = Noise(NoiseLevel,Fs,soundSignalOut1,Time1,soundSignalOut2,Time2,soundSignalOut3,Time3,soundSignalOut4,Time4);

%Applying reciver filter to signal
Reciever(Fs,soundSignalOut1,Time1,soundSignalOut2,Time2,soundSignalOut3,Time3,soundSignalOut4,Time4)