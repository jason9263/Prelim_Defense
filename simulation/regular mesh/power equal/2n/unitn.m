clc
% clear
% addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
zTcm = 1;
wTcp = 1;
sigma = zTcm/wTcp;

%save the times as the ratio of ztcm and wtcp

%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;

for n = 3:10
    times= [];
    for sigma = minr:0.01:maxr
        
        A= sigmaA(sigma,n);
        B = sigmaB(sigma,n);
        X = A\B;
        
        times = [times;1/X(1)];
    end
    
    X = minr:0.01:maxr;
    Y = times';
    hold on
    plot(X,Y);
    
    ylim([1,20]);
end

