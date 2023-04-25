clc;
clear;
samplingFrequency = 5000;
samplingTime = 1/samplingFrequency;
time = linspace(0,samplingTime*100);

x1 = xFunction(500,time);
x2 = xFunction(2000,time);
x3 = xFunction(3000,time);
x4 = xFunction(4500,time);
subplotx(x1,x2,x3,x4)



function [] = subplotx(x1,x2,x3,x4)
    subplot(2,2,1);
    plot(x1)
    subplot(2,2,2);
    plot(x2)
    subplot(2,2,3);
    plot(x3)
    subplot(2,2,4);
    plot(x4)
end