clc;
clear;
n1 = 0:25;
n2 = 0:20;

x1 = x1function();
subplot(2,2,1)
stem(n1,x1)

x2 = x2function();
subplot(2,2,2)
stem(n1,x2)

x3 = x3function();
subplot(2,2,3)
stem(n2,x3)

x4 = x4function();
subplot(2,2,4)
stem(n2,x4)

function [x] = x1function()
    x = zeros(1,26);
    for nShifted = 1:26
        n = nShifted-1;
        for m = 0:10
            x(nShifted) = x(nShifted)+(m+1)*(delta(n,n-2*m)-delta(n,n-2*m-1));
        end
    end
end

function [x] = x2function()
    x = zeros(1,26);
    for nShifted = 1:26
        n = nShifted-1;
        x(nShifted) = n*n*(unitstep(5,n)-unitstep(-6,n))+10*delta(n,n)
        +20*(0.5)^n*(unitstep(-4,n)-unitstep(-10,n));
    end
end
 
function [x] = x3function()
    x = zeros(1,21);
    for nShifted = 1:21
        n = nShifted-1;
        x(nShifted) = (0.9)^n*cos(0.2*pi*n+pi/3);
    end
end

function [x] = x4function()
    x = zeros(1,21);
    for counter = 1:4:17
        x(counter)=1;
        x(counter+1)=2;
        x(counter+2)=3;
        x(counter+3)=2;
    end
end

function [ret] = unitstep(shift,in)
    if in >= -shift
        ret = 1;
    else 
        ret = 0;
    end
end
function [ret] = delta(n,in)
    if n==in
        ret=1;
    else
        ret=0;
    end
end