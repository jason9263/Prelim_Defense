%%
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
X = [];
X = [1;5;13;21;25];
Y = cell(1,5);
Y{1} = [1];
Y{2} = [1 4];
Y{3} = [1 4 8];
Y{4} = [1 4 8 8];
Y{5} = [1 4 8 8 4];

minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(0.01:0.01:0.99, 1:25);

z = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        tmpy = y(i,j);
        
        if tmpy <= 1
            tmp = 1;
        elseif tmpy <= 5
            tmp = 2;
        elseif tmpy <= 13
            tmp = 3;
        elseif tmpy <= 21
            tmp = 4;
        elseif tmp <= 25
            tmp = 5;
        end
        
        tmpline = [];
        
        if tmp == 1
            tmpline = [1];
        else
            tmpline = Y{tmp-1};
            tmpline = [tmpline (tmpy-X(tmp-1))];
        end
        
        B = sigmaB(tmpline);
        A = sigmaA(x(i,j),tmpline);
        
        times = A\B;
        
        z(i,j)  = 1/( times(1));
        
    end
end

surf(x,y,z,'FaceAlpha',0.7);
grid on

xlabel('\sigma','fontweight','bold','FontSize',35);
ylabel('Number of cores','fontweight','bold','FontSize',35);
zlabel('Speedup','fontweight','bold','FontSize',35);
title('Speedup vs \sigma, Number of cores','fontweight','bold','FontSize',35);

colorbar

%%
figure
hold on
x = [0.01,0.1,0.3,0.6,0.99];
y = 1:25;
sx = size(x);
for i = 1:sx(2)
    z = [];
    for j = 1:25
        tmpy = j;
        
        if tmpy <= 1
            tmp = 1;
        elseif tmpy <= 5
            tmp = 2;
        elseif tmpy <= 13
            tmp = 3;
        elseif tmpy <= 21
            tmp = 4;
        elseif tmp <= 25
            tmp = 5;
        end
        
        tmpline = [];
        
        if tmp == 1
            tmpline = [1];
        else
            tmpline = Y{tmp-1};
            tmpline = [tmpline (tmpy-X(tmp-1))];
        end
        
        B = sigmaB_no(tmpline);
        A = sigmaA_no(x(i),tmpline);
        
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
ylim([0,25]);
hold off

