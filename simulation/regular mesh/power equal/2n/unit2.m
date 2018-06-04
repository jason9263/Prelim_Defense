clc
clear
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
zTcm = 1;
wTcp = 1;

sigma = zTcm/wTcp;

%save the times as the ratio of ztcm and wtcp
times= [];

B = [1
    0];

%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;

for sigma = minr:0.01:maxr
    
    A= [3 1
        sigma - 1 1];
    
    X = A\B;
    
    times = [times;1/X(1)];
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);
ylim([1,6]);