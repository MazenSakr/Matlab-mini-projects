clc;
clear;
samplingFrequency = 50000;
samplingTime = 1/samplingFrequency;
time = linspace(0,samplingTime*100);

x = xFunction(2000,time);
subplot(1,2,1);
plot(time,x)

[y,ytime] = yfunction(x,time);
subplot(1,2,2);
plot(ytime,y)




function [y,ytime] = yfunction(x,time)
    y = x(2:2:end);
    ytime = time(2:2:end);
end

function [x] = xFunction(frequency, time)
    x = sin(2*pi*frequency*time);
end