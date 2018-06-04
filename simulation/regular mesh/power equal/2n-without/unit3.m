%without front end
clc
clear
addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));

times= [];

minr = 0.01;
maxr = 0.99;

for sigma = minr:0.01:maxr
    
    A = [1 2 2 1
        1 -(sigma+1) 0 0
        1 -sigma -(sigma+1) 0
        1 -sigma -sigma -(sigma+1)];
    
    B = [1
        0
        0
        0];
    
    X = A\B;
    
    times = [times;1/X(1)];
    
end
X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);