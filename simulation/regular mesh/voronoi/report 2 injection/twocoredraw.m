function coredraw(n , m)
%%
%draw lines
figure
subplot(2,1,1)
grid minor
for k = 1:m
    X = 1:1:n;
    Y = ones(1,n)*k;
    hold on
    
    plot(X,Y,'ro');
    plot(X,Y,'r');
end

%draw col
for k = 1:n
    X = ones(1,m)*k;
    Y = 1:1:m;
    plot(X,Y,'r');
end

xlabel('Noc or workstation x coordinate');
ylabel('Noc or workstation y coordinate');
plot(n,m,'k*');
plot(1,1,'k*');
hold off
axis on

%%
subplot(2,1,2);
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

legend('Speedup with two Data Injection with frontend','Speedup with two Data Injection without frontend','Speedup with frontend','Speedup without frontup');


end