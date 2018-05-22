clc
% clear
% addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));
zTcm = 1;
wTcp = 1;
sigma = zTcm/wTcp;

for n = 3:10
    %save the times as the ratio of ztcm and wtcp
    times= [];
    
    %min ratio
    %max ratio
    minr = 0.01;
    maxr = 0.99;
    for sigma = minr:0.01:maxr
        tsigma = sigma - 1;
        B = sigmaB(sigma,n);
        A= sigmaA(sigma,n);
        
        X = A\B;
        times = [times;1/X(1)];
    end
    
    X = minr:0.01:maxr;
    Y = times';
    hold on
    plot(X,Y);
    
end


