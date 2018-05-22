
m = 5;
n = 5;

%%
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    B = sigmaB(sigma,m,n);
    A= sigmaA(sigma,m,n);
    X = A\B;
    times = [times;1/X(1)];
end
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
    B = sigmaB_no(sigma,m,n);
    A= sigmaA_no(sigma,m,n);
    X = A\B;
    times = [times;1/X(1)];
end

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
    A= [1 2 3 4 2
        1 -1 0 0 0
        0 sigma-1 1 0 0
        0 sigma-1 sigma 1 0
        0 sigma-1 sigma sigma 1];
    X = A\B;
    times = [times;1/X(1)];
end
times = times * 2;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');

axis on
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
    A= [1 2 3 4 2
        1 -tsigma 0 0 0
        1 -sigma -tsigma 0 0
        1 -sigma -sigma -tsigma 0
        1 -sigma -sigma -sigma -tsigma];
    
    X = A\B;
    times = [times;1/X(1)];
end

times = times * 2;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');
axis on

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
        0
        0];
    
    A= [1 2 3 4 5 4 3 
        1 -1 0 0 0 0 0
        0 sigma-1 1 0 0 0 0
        0 sigma-1 sigma 1 0 0 0 
        0 sigma-1 sigma sigma 1 0 0 
        0 sigma-1 sigma sigma sigma 1 0
        0 sigma-1 sigma sigma sigma sigma 1];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');

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
        0
        0];
    tsigma = (sigma + 1);
    A= [1 2 3 4 5 4 3
        1 -tsigma 0 0 0 0 0
        1 -sigma -tsigma 0 0 0 0
        1 -sigma -sigma -tsigma 0 0 0
        1 -sigma -sigma -sigma -tsigma 0 0
        1 -sigma -sigma -sigma -sigma -tsigma 0
        1 -sigma -sigma -sigma -sigma -tsigma -tsigma];
    
    X = A\B;
    times = [times;1/X(1)];
end
times = times * acc;

X = minr:0.01:maxr;
Y = times';
plot(X,Y);

legend('1-0','1-0 no','2-balance','2-balance no', '2-dig','2-dig no','2-1','2-1 no','2-2','2-2 no');
%%


