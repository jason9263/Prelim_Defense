addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
times= [];
minr = 0.01;
maxr = 0.99;

B = [1
    0
    0
    0
    0
    0];

for sigma = minr:0.01:maxr
    t = sigma;
    z = sigma -1;
    A= [4 8 12 10 6 2
        1 -1 0 0 0 0
        0 z 1 0 0 0
        0 z t 1 0 0
        0 z t t 1 0
        0 z t t t 1];
    
    X = A\B;
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';

hold on
grid on
plot(X,Y);
xlabel('\sigma');
ylabel('Speedup');
title('Speedup vs \sigma');