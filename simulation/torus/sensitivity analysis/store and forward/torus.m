addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
tline = [1 4 8 10 8 4 1];

times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
Y1 = [];
Y2 = [];
Y3 = [];
Y4 = [];
Y5 = [];
Y6 = [];
Y7 = [];
for sigma = minr:0.01:maxr
    
    B = sigmaB(tline);
    A = sigmaA(sigma,tline);
    X = A\B;
    
    Y1 =[Y1;X(1)];
    Y2 =[Y2;X(2)];
    Y3 =[Y3;X(3)];
    Y4 =[Y4;X(4)];
    Y5 =[Y5;X(5)];
    Y6 =[Y6;X(6)];
    Y7 =[Y7;X(7)];
    
end

X = minr:0.01:maxr;

figure
hold on
grid on

plot(X,Y1,'r');
plot(X,Y2,'g');
plot(X,Y3,'b');
plot(X,Y4,'k');
plot(X,Y5,'y');
plot(X,Y6,'m');
plot(X,Y7,'c');

title('Virtual Cut-through Toroidal Network Data Fraction vs \sigma');
xlabel('\sigma','fontweight','bold','FontSize',22);
ylabel('Data Fraction');

legend('\alpha_{0}', '\alpha_{1}','\alpha_{2}','\alpha_{3}', '\alpha_{4}','\alpha_{5}', '\alpha_{6}');
