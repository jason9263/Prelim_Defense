function inner5t5
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
%%
%sensitivity analysis of the regular mesh
clear
clc

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
        
        B = sigmaB_no(tmpline);
        A = sigmaA_no(x(i,j),tmpline);
        
        times = A\B;
        
        z(i,j)  = 1/( times(1));
        
    end
end

surf(x,y,z,'FaceAlpha',0.7);
xlabel('\sigma');
ylabel('Number of cores');
zlabel('Speedup');
title('Speedup vs \sigma, Number of cores');
colorbar
%%
end
