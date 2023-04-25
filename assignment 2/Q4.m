clc;
clear;
%samplingtime = 2
%noOfSamples = 38/2=19
n = 0:19;
discreteTime = 0:2:38;
continousTime = linspace(0,38);

xdiscrete = cos(2*n/3);
ydiscrete = cos(8*pi*n/38);
xcontinous = cos(continousTime/3);
ycontinous = cos(4*pi*continousTime/38);

substem(discreteTime,xdiscrete,1)
substem(discreteTime,ydiscrete,2)
subPlot(continousTime,xcontinous,3)
subPlot(continousTime,ycontinous,4)

function [] = subPlot(time,func,position)
    subplot(2,2,position);
    plot(time,func)
end

function [] = substem(time,func,position)
    subplot(2,2,position);
    stem(time,func)
end