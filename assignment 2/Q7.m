clear;
clc;
time = 0:50;

x1 = xfunction(0.01);
x2 = xfunction(0.2);
x3 = xfunction(2);

subplot(2,2,1)
stem(time,x1)
subplot(2,2,2)
stem(time,x2)
subplot(2,1,2)
stem(time,x3)

function [x] = xfunction(sigma)
    x = zeros(1,51);
    w = randn(1,51);
    for n = 0:50
        x(n+1) = cos(0.04*pi*n)+sigma*w(n+1);
    end
end