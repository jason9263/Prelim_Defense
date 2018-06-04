function nunitm(tline)
% clear
%addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));
%save the times as the ratio of ztcm and wtcp
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = sigmaB(tline);
    A= sigmaA(sigma,tline);
    X = A\B;
    times = [times;1/X(1)];
    
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

end




