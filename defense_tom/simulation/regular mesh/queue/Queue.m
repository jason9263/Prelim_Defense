%MM1
%[meanlength, meantime] = MM1(6,4.4,500);
clc
clear
addpath(genpath('D:\Dropbox\Thomas paper\simulation'));


meanlen = [];
[alpha,mu] = meshgrid(1:0.2:10,1:0.2:10);
i = 0;
j = 1;
for x = 1:0.2:10
    i = i + 1;
    j = 0 ;
    for y = 1:0.2:10
        j = j + 1;
        [meanlength, meantime] = MM1(x,y,500);
        meanlen(i,j) = meanlength;
    end
end
figure
hold on
grid on
surf(alpha,mu,meanlen');
xlabel('alpha : vehicle comes gap (s/unit vehicle)');
ylabel('mu : service rate (s/unit vehicle)');
zlabel('mean length of the queue(the total vehicle amount is 500 vehicles)');
hold off
%MMk

meanlen = [];
[alpha,mu] = meshgrid(1:0.5:5,1:0.2:30);
i = 0;
j = 1;
for x = 1:0.5:5
    i = i + 1;
    j = 0 ;
    for y = 1:0.2:30
        j = j + 1;
        [meanlength] = MMK(x,y,3,900);
        meanlen(i,j) = meanlength;
    end
end
figure
hold on
grid on
surf(alpha,mu,meanlen');
xlabel('alpha : vehicle comes gap (s/unit vehicle)');
ylabel('mu : K = 3 service workstation rate (s/unit vehicle)');
zlabel('mean length of the queue(the total vehicle amount is 500 vehicles)');
hold off