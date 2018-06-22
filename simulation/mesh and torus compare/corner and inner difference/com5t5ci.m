%%
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
X = [];
X = [1;3;6;10;15;19;22;24;25];
Y = cell(1,9);

Y{1} = [1];
Y{2} = [1 2];
Y{3} = [1 2 3];
Y{4} = [1 2 3 4];
Y{5} = [1 2 3 4 5];
Y{6} = [1 2 3 4 5 4];
Y{7} = [1 2 3 4 5 4 3];
Y{8} = [1 2 3 4 5 4 3 2];
Y{9} = [1 2 3 4 5 4 3 2 1];

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(minsig:0.01:maxsig, 1:25);

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
        elseif tmpy <= 10
            tmp = 4;
        elseif tmp <= 15
            tmp = 5;
        elseif tmp <= 19
            tmp = 6;
        elseif tmp <= 22
            tmp = 7;
        elseif tmp <= 24
            tmp = 8;
        elseif tmp <= 25
            tmp = 9;
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

sz = z;


X = [];
X = [1;5;13;21;25];

Y = cell(1,5);

Y{1} = [1];
Y{2} = [1 4];
Y{3} = [1 4 8];
Y{4} = [1 4 8 8];
Y{5} = [1 4 8 8 4];

%%
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

%corner z - inner z
sz = z - sz;
surf(x,y,sz,'FaceAlpha',0.7);
grid on
set(gca,'linewidth',1,'fontsize',25,'fontname','Times');
xlabel('\sigma','fontweight','bold','FontSize',35);
ylabel('Number of cores','fontweight','bold','FontSize',35);
zlabel('Speedup','fontweight','bold','FontSize',35);
title('Speedup vs \sigma, Number of cores','fontweight','bold','FontSize',35);

colorbar