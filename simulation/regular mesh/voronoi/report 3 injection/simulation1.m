%%
times= [];
minr = 0.01;
maxr = 0.99;
%%green
for sigma = minr:0.01:maxr
    B = [1
        0
        0
        0];
    A= [1 2 3 2
        1 -1 0 0
        0 sigma-1 1 0
        0 sigma-1 sigma 1
        ];
    X = A\B;
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';
Y1 = Y;
%%
%%Purple
times= [];
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0
        0];
    
    A= [1 3 4 1
        1 -1 0 0
        0 sigma-1 1 0
        0 sigma-1 sigma 1];
    
    X = A\B;
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';
Y2 = Y;

hold on

%%
times= [];
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0];
    
    A= [1 4 3
        1 -1 0
        0 sigma-1 1];
    
    X = A\B;
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';
Y3 = Y;

hold on

plot(X,Y1./Y3 ,'g');
plot(X,Y2./Y3,'m');
plot(X,Y3./Y3,'b');

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');

legend('green','purple','blue');
%%





