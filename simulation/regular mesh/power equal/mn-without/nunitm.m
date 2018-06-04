%n <= m
clc
% clear
% addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));
for m = 2: 6
    
    for n = m+1:10
        %save the times as the ratio of ztcm and wtcp
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
        
    end
end



