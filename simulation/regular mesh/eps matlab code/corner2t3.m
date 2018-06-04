clear
clc
B = [1
    0
    0
    0];

solution = [];
for sigma = 0.01:0.01:0.99
    
    A = [1 2 2 1
        1 -1 0 0
        0 sigma-1 1 0
        0 sigma-1 sigma 1];
    
    s = [];
    s = A\B;
    s = s';
    solution = [solution;s];
    
end

sigma = [0.01:0.01:0.99];

figure
hold on
plot(sigma,solution(:,1),'-r');
plot(sigma,solution(:,2),'-g');
plot(sigma,solution(:,3),'-b');
plot(sigma,solution(:,4),'-k');


B = [1
    0
    0
    0];

solution = [];
for sigma = 0.01:0.01:0.99
    t = sigma + 1;
    t = -t;
    
    z = -sigma;
    
    A = [1 2 2 1
        1 t 0 0
        1 z t 0
        1 z z t];
    
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

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on Different Nodes Front End Vs Without Front End');
legend('F \alpha_0','F \alpha_1','F \alpha_3','F \alpha_5','NF \alpha_0','NF \alpha_1','NF \alpha_3','NF \alpha_5');