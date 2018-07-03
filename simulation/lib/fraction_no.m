function fraction(tline)
% clear
%addpath(genpath('C:\Google Drive\Prelim-Defense\defense_tom\simulation'));
%save the times as the ratio of ztcm and wtcp
warning off;
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = sigmaB_no(tline);
    A = sigmaA_no(sigma,tline);
    X = A\B;
    times = [times;X(1)];
    
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);
grid on
title('Data Fraction vs \sigma','FontSize',16);
xlabel('\sigma','fontweight','bold','FontSize',25);
ylabel('Injection Processor Data Fraction','FontSize',20);

end