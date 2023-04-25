%we set the x array


%stem(n,x);
% Define input sequence x[n]
x = [-1, -2, 4, 6, -5, 8, 10];
l = -4:1:2;
% i. Generate and plot sequence x1[n]
x1 = zeros(1, length(x)); % Initialize x1 with zeros of same length as x

for n = 1:length(x)
    [a,b]= x1valid(n);
    if a && b
        x1(n) = 3*x(n+2) + x(n-4) + 2*x(n);
    elseif a && ~b
        x1(n) = 3*x(n+2) + 2*x(n);
    elseif ~a && b
        x1(n) = x(n-4) + 2*x(n);
    elseif ~a && ~b
        x1(n) = 2*x(n);
    end
end

subplot(2,2,1)
stem(l,x1); title('Sequence x1[n]'); xlabel('n'); ylabel('Amplitude');

% ii. Generate and plot sequence x2[n]
x2 = zeros(1, length(x)); % Initialize x2 with zeros of same length as x

for n = 1:length(x)
    ns = n-5;
    [a,b,c] = x2valid(n);
    if a && b && c
        x2(n) = x(n + 4)*x(n -1) + x(2 - n)*x(n);
    elseif (~a || ~c) && b
        x2(n) = x(8-n)*x(n);
    elseif a && ~b && c
        x2(n) = x(n + 4)*x(n -1);
    end
    
end

subplot(2,2,2)
stem(l,x2); title('Sequence x2[n]'); xlabel('n'); ylabel('Amplitude');

% iii. Generate and plot sequence x3[n]
x3 = zeros(1, length(x)); % Initialize x3 with zeros of same length as x

for n = 1:length(x)
    result = 0;
    for s = 5:-1:1
        if(n-s >= 1)
            result = result + x(n-s);
        end
    end
    x3(n) = n* result;
end

subplot(2,1,2)
stem(x3); title('Sequence x3[n]'); xlabel('n'); ylabel('Amplitude');

function [x,y] = x1valid(ns)
    if ns+2 < 1 || ns+2 > 7
        x = 0;
    else
        x = 1;
    end
    if ns-4 < 1
        y = 0;
    else
        y = 1;        
    end
end

function [x,y,z] = x2valid(ns)
    if ns+4 >7
        x=0;
    else
        x=1;
    end
    if 2-(ns-5) > 2
        y = 0;
    else
        y = 1;
    end
    if ns-1 < 1
        z=0;
    else
        z=1;
    end
end