%TwocoreSimu
function twocoresimu(rA,rB,nA,nB,rC,alpha1,alpha2)

times= [];
basictime = [];
jtime = [];

%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    %%basic model
    B = sigmaB(rC);
    A= sigmaA(sigma,rC);
    X = A\B;
    speedC = 1/X(1);
    
    basictime = [basictime;X(1)];
    %%Jia's model
    B = sigmaB(rA);
    A= sigmaA(sigma,rA);
    X = A\B;
    speedA = 1/X(1);
    
    B = sigmaB(rB);
    A= sigmaA(sigma,rB);
    X = A\B;
    speedB = 1/X(1);

    mintime = min(alpha1/speedA, alpha2/speedB);
    
    finish = (speedA + speedB)*mintime;
    uncomplete = 1 - finish;
    
    totalt = mintime + uncomplete/speedC;
    
    times = [times;totalt];
    %%Jason's model
    
    B = sigmaB(nA);
    A= sigmaA(sigma,nA);
    X = A\B;
    speedA = 1/X(1);
    
    B = sigmaB(nB);
    A= sigmaA(sigma,nB);
    X = A\B;
    speedB = 1/X(1);
    
    
    mintime = min(alpha1/speedA, alpha2/speedB);
    
    finish = (speedA + speedB)*mintime;
    uncomplete = 1 - finish;
    
    totalt = mintime + uncomplete/speedC;    
    jtime = [jtime;totalt];
 
end

X = minr:0.01:maxr;
Y1 = times';
Y2 = basictime';
Y3 = jtime;
figure

hold on
plot(X,Y1);
plot(X,Y2);
plot(X,Y3);

xlabel('zTcm to wTcp');
ylabel('Time');
legend('Jia Time','Basic One Core Time','Jtime');
end
