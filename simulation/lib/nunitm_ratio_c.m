function nunitm_ratio_c(aline,bline,bc)
%aline maximal line
%bline test line
%bc the color of b line

warning off;

alinetimes = [];
blinetimes = [];
rtimes = [];

minr = 0.01;
maxr = 0.99;

for sigma = minr:0.01:maxr
    
    alineB = sigmaB(aline);
    alineA = sigmaA(sigma,aline);
    alineX = alineA\alineB;
    alinetmp = 1/alineX(1);
    alinetimes = [alinetimes;alinetmp];
    
    
    blineB = sigmaB(bline);
    blineA = sigmaA(sigma,bline);
    blineX = blineA\blineB;
    blinetmp = 1/blineX(1);
    blinetimes = [blinetimes;blinetmp];
    
    rtmp = blinetmp/alinetmp;
    
    rtimes = [rtimes;rtmp];
    
end

X = minr:0.01:maxr;
Y = rtimes';
hold on
plot(X,Y,'color',bc);
grid on
xlabel('\sigma','fontweight','bold','FontSize',25);
ylabel('Speedup Ratio','FontSize',20);
title('Bottleneck vs Speedup_{max}','FontSize',16);
legend('Sp_{max}','Bottleneck');
end
