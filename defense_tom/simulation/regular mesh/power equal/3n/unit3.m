clc
% clear
% addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));

zTcm = 1;
wTcp = 1;

sigma = zTcm/wTcp;

%save the times as the ratio of ztcm and wtcp
times= [];

B = [1
    0
    0
    0];

%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;

for sigma = minr:0.01:maxr
    
    tsigma = sigma - 1;
    
    A= [3 3 2 1
        tsigma  1 0 0
        tsigma sigma 1 0
        tsigma sigma sigma 1];
    
    X = A\B;
    
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

ylim([1,10]);