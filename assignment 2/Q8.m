clc;
clear;
time = -10:10;

x = exp((-0.1+0.3*1i)*time);

subplot(2, 2, 1);
stem(time, abs(x));

subplot(2, 2, 2);
stem(time, angle(x));

subplot(2, 2, 3);
stem(time, real(x));

subplot(2, 2, 4);
stem(time, imag(x));

