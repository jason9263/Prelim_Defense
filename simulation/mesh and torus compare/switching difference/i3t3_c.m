clear
clc
B = [1
    0
    0];

solution = [];
for sigma = 0.01:0.01:0.99
    
    A = [1 4 4 
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

B = [1
    0
    0];
solution = [];

for sigma = 0.01:0.01:0.99
    t = sigma + 1;
    t = -t;
    
    z = -sigma;
    
    A = [1 4 4
        1 t 0
        1 z t];
    
    s = [];
    s = A\B;
    s = s';
    solution = [solution;s];
end

sigma = [0.01:0.01:0.99];
grid on

plot(sigma,solution(:,1),'--r');
plot(sigma,solution(:,2),'--g');
plot(sigma,solution(:,3),'--b');

ylabel('Data fraction','fontweight','bold','FontSize',18);
xlabel('\sigma','fontweight','bold','FontSize',25);
title('Virtual cut-through vs Store and forward');
legend('F \alpha_0','F \alpha_1','F \alpha_5','NF \alpha_0','NF \alpha_1','NF \alpha_5');