function fraction(tline)
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
    A = sigmaA(sigma,tline);
    X = A\B;
    times = [times;X(1)];
    
end

X = minr:0.01:maxr;
Y = times';
hold on

plot(X,Y);
title('Data Fraction vs \sigma');
xlabel('\sigma','fontweight','bold','FontSize',22);
ylabel('Injection Processor Data Fraction');

end