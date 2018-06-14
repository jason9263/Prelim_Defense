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


B = [1
    0
    0
    0
    0
    0
    0];

solution = [];

for sigma = 0.01:0.01:0.99
    t = sigma + 1;
    t = -t;
    
    z = -sigma;
    A = [1 4 8 10 8 4 1
        1 t 0 0 0 0 0
        1 z t 0 0 0 0
        1 z z t 0 0 0
        1 z z z t 0 0
        1 z z z z t 0
        1 z z z z z t];
    
    s = [];
    s = A\B;
    s = s';
    solution = [solution;s];
    
end

sigma = [0.01:0.01:0.99];

plot(sigma,solution(:,1),'--r');
plot(sigma,solution(:,2),'--g');
plot(sigma,solution(:,3),'--b');
plot(sigma,solution(:,4),'--k');
plot(sigma,solution(:,5),'--y');
plot(sigma,solution(:,6),'--w');
plot(sigma,solution(:,7),'--c');

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on different nodes');
%legend('F \alpha_0','F \alpha_1','F \alpha_2','F \alpha_3','F \alpha_4','F \alpha_5','F \alpha_6','NF \alpha_0','NF \alpha_1','NF \alpha_2','NF \alpha_3','NF \alpha_4','NF \alpha_5','NF \alpha_6');


