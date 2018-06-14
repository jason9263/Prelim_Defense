addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
tline = [1 4 4];

times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
Y1 = [];
Y2 = [];
Y3 = [];
Y4 = [];

for sigma = minr:0.01:maxr
    
    B = sigmaB_no(tline);
    A = sigmaA_no(sigma,tline);
    X = A\B;
    
    Y1 =[Y1;X(1)];
    Y2 =[Y2;X(2)];
    Y3 =[Y3;X(3)];
    
end

X = minr:0.01:maxr;

figure
hold on
grid on

plot(X,Y1,'r');
plot(X,Y2,'g');
plot(X,Y3,'b');

title('Store and Froward Different Level Data Fraction vs \sigma');
xlabel('\sigma','fontweight','bold','FontSize',22);
ylabel('Data Fraction');

legend('\alpha_{0}', '\alpha_{1}','\alpha_{5}');
