clc
clear

title = [4 8 9 4];
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
grid on
%nunitm(title);
%fraction(title);

tline = [4 8 9 4];
times= [];

minr = 0.01;
maxr = 0.99;

Y2 = [];
Y3 = [];
Y4 = [];

for sigma = minr:0.01:maxr
    
    B = sigmaB(tline);
    A = sigmaA(sigma,tline);
    X = A\B;
    
    times = [times;X(1)];
    Y2 = [Y2;X(2)];
    Y3 = [Y3;X(3)];
    Y4 = [Y4;X(4)];
end

X = minr:0.01:maxr;
Y = times';

hold on

plot(X,Y);
plot(X,Y2,'k');
plot(X,Y3,'r');
plot(X,Y4,'g');

xlabel('\sigma','fontweight','bold','FontSize',22);
ylabel('Injection Processor Data Fraction');
legend('\alpha_0','\alpha_1','\alpha_2','\alpha_3');

