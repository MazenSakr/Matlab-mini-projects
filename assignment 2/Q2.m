clc;
clear;
x = linspace(0,10);

y1 = sin(x)./x;
y2 = (1./(x-1).^2)+x;
y3 = (x.^2+1)./(x.^2-4);
y4 = (((10-x).^1/3)-2)./((4-x.^2).^1/2);

subploty(y1,y2,y3,y4)

function [] = subploty(y1,y2,y3,y4)
    subplot(2,2,1);
    plot(y1)
    title('sin(x)/x');
    subplot(2,2,2);
    plot(y2)
    title('(1/(x-1)^2)+x');
    subplot(2,2,3);
    plot(y3)
    title('(x^2+1)/(x^2-4)');
    subplot(2,2,4);
    plot(y4)
    title('(((10-x)^(1/3))-2)/((4-x^2)^(1/2))');
end