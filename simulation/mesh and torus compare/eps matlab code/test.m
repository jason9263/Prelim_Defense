%%
clear
clc
B = [1
    0
    0];
solution = [];

for sigma = 1.01:0.01:1.99
    A = [1 2 1
        1 -1 0
        0 sigma-1 1];
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

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on different nodes');
legend('\alpha_0','\alpha_1','\alpha_3');