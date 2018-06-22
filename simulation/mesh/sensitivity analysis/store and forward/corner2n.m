
%%
%sensitivity analysis of the regular mesh
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
X = [];
X = [2;X];

len = 20;
Y = cell(1,len+1);
Y{1} = [1 1];

for i = 1:len
    tmp = 2 + 2*i;
    X = [X;tmp];
    
    tmpj = [];
    
    for j = 1:i
        tmpj =[tmpj,2];
    end
    
    tmpj = [1,tmpj];
    tmpj = [tmpj,1];
    
    Y{i+1} = tmpj;
    
end

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(0.01:0.01:0.99, 2:2:20);

z = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        B = sigmaB_no(Y{y(i,j)/2});
        A = sigmaA_no(x(i,j),Y{y(i,j)/2});
        times = A\B;
        
        z(i,j)  = 1/( times(1));
    end
end
figure
hold on
grid on
surf(x,y,z,'FaceAlpha',0.7);
set(gca,'linewidth',1,'fontsize',30,'fontname','Times');
xlabel('\sigma','fontweight','bold','FontSize',35);
ylabel('Number of cores','fontweight','bold','FontSize',35);
zlabel('Speedup','fontweight','bold','FontSize',35);
title('Speedup vs \sigma, Number of cores','fontweight','bold','FontSize',35);
colorbar

hold off
%%
figure
hold on
x = [0.01,0.1,0.3,0.6,0.99];
y = 2:2:20;
sx = size(x);
for i = 1:sx(2)
    z = [];
    for j = 2:2:20
        tmp = j/2;
        B = sigmaB_no(Y{tmp});
        A = sigmaA_no(x(i),Y{tmp});
        times = A\B;
        tmpz  = 1/( times(1));
        z = [z;tmpz];
    end
    plot(y,z);
end

grid on
xlabel('Number of cores');
ylabel('Speedup');
title('Speedup vs Number of cores');
legend('\sigma = 0.01','\sigma = 0.1','\sigma = 0.3','\sigma = 0.6','\sigma = 0.99');
ylim([0,20]);
hold off

