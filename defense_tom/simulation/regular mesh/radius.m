r = zeros(12,1);

sx = 4;
sy = 2;
m = 6;
n = 6;


for i = 1:6
    for j = 1:6
        
        tmpx = 0;
        tmpy = 0;
        tmpsum = 0;
        
        tmpx = abs(i - sx);
        rx = min(tmpx,m - tmpx);
        tmpy = abs(j - sy);
        ry = min(tmpy, n - tmpy);
        
        tmpsum = rx + ry;
        if tmpsum > 0
            r(tmpsum,1) = r(tmpsum,1) + 1;
            
        else
            
        end
        
        
    end
end

%%
clear
clc
B = [1
    0
    0
    0
    0
    0
    0];

solution = [];
for sigma = 0.01:0.01:0.99
    
    A = [1 4 8 10 8 4 1
        1 -1 0 0 0 0 0 
        0 sigma-1 1 0 0 0 0
        0 sigma-1 sigma 1 0 0 0
        0 sigma-1 sigma sigma 1 0 0
        0 sigma-1 sigma sigma sigma 1 0
        0 sigma-1 sigma sigma sigma sigma 1];
    
    s = [];
    s = A\B;
    s = s';
    solution = [solution;s];
     
end

sigma = [0.01:0.01:0.99];

figure
hold on

plot(sigma,solution(:,1),'r');
plot(sigma,solution(:,2),'g');
plot(sigma,solution(:,3),'b');
plot(sigma,solution(:,4),'k');
plot(sigma,solution(:,5),'y');
plot(sigma,solution(:,6),'w');
plot(sigma,solution(:,7),'c');

ylabel('Data fraction');
xlabel('zTcm over wTcp');
title('Data Fraction on different nodes');
legend('alpha_0','alpha_1','alpha_2','alpha_3','alpha_4','alpha_5','alpha_6');