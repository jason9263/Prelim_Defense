clear
clc
B = [1
    0
    0
    0];

solution = [];
for sigma = 0.01:0.01:0.99
    
    A = [1 3 3 2
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

plot(sigma,solution(:,1),'r');
plot(sigma,solution(:,2),'g');
plot(sigma,solution(:,3),'b');
plot(sigma,solution(:,4),'k');

B = [1
    0
    0
    0];
solution = [];

for sigma = 0.01:0.01:0.99
    t = sigma + 1;
    t = -t;
    
    z = -sigma;
    
    A = [1 3 3 2
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

grid on
ylabel('Data fraction','fontweight','bold','FontSize',18);
xlabel('\sigma','fontweight','bold','FontSize',25);
title('Virtual cut-through vs Store and forward');
legend('VCT \alpha_0','VCT \alpha_1','VCT \alpha_4','VCT \alpha_7','SF \alpha_0','SF \alpha_1','SF \alpha_4','SF \alpha_7');


