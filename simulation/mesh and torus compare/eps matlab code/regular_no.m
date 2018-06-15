%%
clear
clc
B = [1
    0
    0];
solution = [];

for sigma = 0.01:0.01:0.99
    t = sigma + 1;
    t = -t;
    
    z = -sigma;
    
    A = [1 2 1
        1 t 0
        1 z t];
    
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
title('Data Fraction on Different Nodes Without Front End');
legend('\alpha_0','\alpha_1','\alpha_3');
%%
clear
clc
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

figure
hold on
plot(sigma,solution(:,1),'r');
plot(sigma,solution(:,2),'g');
plot(sigma,solution(:,3),'b');
plot(sigma,solution(:,4),'k');

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on Different Nodes Without Front End');
legend('\alpha_0','\alpha_1','\alpha_3','\alpha_5');
%%
clear
clc
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

figure
hold on
plot(sigma,solution(:,1),'r');
plot(sigma,solution(:,2),'g');
plot(sigma,solution(:,3),'b');
plot(sigma,solution(:,4),'k');

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on Different Nodes Without Front End');
legend('\alpha_0','\alpha_1','\alpha_4','\alpha_7');
%%
clear
clc
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

figure
hold on
plot(sigma,solution(:,1),'r');
plot(sigma,solution(:,2),'g');
plot(sigma,solution(:,3),'b');

ylabel('Data fraction');
xlabel('\sigma');
title('Data Fraction on Different Nodes Without Front End');
legend('\alpha_0','\alpha_1','\alpha_3');
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
xlabel('\sigma');
title('Data Fraction on different nodes');
legend('\alpha_0','\alpha_1','\alpha_2','\alpha_3','\alpha_4','\alpha_5','\alpha_6');