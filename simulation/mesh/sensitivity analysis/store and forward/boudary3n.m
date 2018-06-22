
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
X = [];
X = [1;3;6;9;12;15;18;21;24];

Y{1} = [1];
Y{2} = [1 2];
Y{3} = [1 3 2];
Y{4} = [1 3 3 2];
Y{5} = [1 3 3 3 2];
Y{6} = [1 3 3 3 3 2];
Y{7} = [1 3 3 3 3 3 2];
Y{8} = [1 3 3 3 3 3 3 2];
Y{9} = [1 3 3 3 3 3 3 3 2];

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(minsig:0.01:maxsig, 1:24);

z = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        tmpy = y(i,j);
        
        if tmpy <= 1
            tmp = 1;
        elseif tmpy <= 3
            tmp = 2;
        elseif tmpy <= 6
            tmp = 3;
        elseif tmpy <= 9
            tmp = 4;
        elseif tmp <= 12
            tmp = 5;
        elseif tmp <= 15
            tmp = 6;
        elseif tmp <= 18
            tmp = 7;
        elseif tmp <= 21
            tmp = 8;
        elseif tmp <= 24
            tmp = 9;
        end
        
        tmpline = [];
        
        if tmp == 1
            tmpline = [1];
        else
            tmpline = Y{tmp-1};
            tmpline = [tmpline (tmpy-X(tmp-1))];
        end
        
        B = sigmaB_no(tmpline);
        A = sigmaA_no(x(i,j),tmpline);
        
        times = A\B;
        
        z(i,j)  = 1/( times(1));
    end
end

colormap default
surf(x,y,z,'FaceAlpha',0.7);
grid on
set(gca,'linewidth',1,'fontsize',30,'fontname','Times');
xlabel('\sigma','fontweight','bold','FontSize',35);
ylabel('Number of cores','fontweight','bold','FontSize',35);
zlabel('Speedup','fontweight','bold','FontSize',35);
title('Speedup vs \sigma, Number of cores','fontweight','bold','FontSize',35);
colorbar
%%
figure
hold on
x = [0.01,0.1,0.3,0.6,0.99];
y = 2:2:24;
sx = size(x);
for i = 1:sx(2)
    z = [];
    for j = 2:2:24
        tmpy = j;
        
        if tmpy <= 1
            tmp = 1;
        elseif tmpy <= 3
            tmp = 2;
        elseif tmpy <= 6
            tmp = 3;
        elseif tmpy <= 9
            tmp = 4;
        elseif tmp <= 12
            tmp = 5;
        elseif tmp <= 15
            tmp = 6;
        elseif tmp <= 18
            tmp = 7;
        elseif tmp <= 21
            tmp = 8;
        elseif tmp <= 24
            tmp = 9;
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
ylim([0,24]);
hold off

