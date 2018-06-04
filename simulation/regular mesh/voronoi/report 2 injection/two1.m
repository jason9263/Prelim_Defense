%%
acc = 1/0.9;
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0
        0
        0];
    
    A= [1 2 3 4 5
        1 -1 0 0 0
        0 sigma-1 1 0 0
        0 sigma-1 sigma 1 0
        0 sigma-1 sigma sigma 1];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);
%%
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0
        0
        0];
    tsigma = (sigma + 1);
    A= [1 2 3 4 5
        1 -tsigma 0 0 0
        1 -sigma -tsigma 0 0
        1 -sigma -sigma -tsigma 0
        1 -sigma -sigma -sigma -tsigma];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);
%%
acc = 1/0.9;
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0
        0
        0
        0];
    
    A= [1 2 3 4 5 4
        1 -1 0 0 0 0
        0 sigma-1 1 0 0 0
        0 sigma-1 sigma 1 0 0
        0 sigma-1 sigma sigma 1 0
        0 sigma-1 sigma sigma sigma 1 ];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);
%%
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0
        0
        0
        0];
    tsigma = (sigma + 1);
    A= [1 2 3 4 5 4
        1 -tsigma 0 0 0 0
        1 -sigma -tsigma 0 0 0
        1 -sigma -sigma -tsigma 0 0
        1 -sigma -sigma -sigma -tsigma 0
        1 -sigma -sigma -sigma -sigma -tsigma];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
plot(X,Y);

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');

legend('2-dig','2-dig no','2-1','2-1 no');
