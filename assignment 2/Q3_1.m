clc;
clear;
samplingFrequency = 5000;
samplingTime = 1/samplingFrequency;
time = linspace(0,samplingTime*100);

x1 = xFunction(500,time);
x2 = xFunction(2000,time);
x3 = xFunction(3000,time);
x4 = xFunction(4500,time);
subplotx(x1,x2,x3,x4,time)


function [x] = xFunction(frequency,time)
    x = sin(2*pi*frequency*time);
end
    
function [] = subplotx(x1,x2,x3,x4,time)
    subplot(2,2,1);
    plot(time,x1)
    title('500Hz');
    subplot(2,2,2);
    plot(time,x2)
    title('2KHz');
    subplot(2,2,3);
    plot(time,x3)
    title('3KHz');
    subplot(2,2,4);
    plot(time,x4)
    title('4.5KHz');
end