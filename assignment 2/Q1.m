clc;
clear;
samplingfrequency = 100;
time1 = linspace(-2,0,5*samplingfrequency);
time2 = linspace(0,1,5*samplingfrequency);
time3 = linspace(1,3,5*samplingfrequency);
time = [time1 time2 time3];

signal1 = 4*time1./time1;
signal2 = sin(2*pi*0.25*time2+pi/2)+3;
signal3 = 3*time3./time3;
signal = [signal1 signal2 signal3];

plot(time,signal)