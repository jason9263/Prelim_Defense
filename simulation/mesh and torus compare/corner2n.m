function corner2n
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
        
        B = sigmaB(Y{y(i,j)/2});
        A = sigmaA(x(i,j),Y{y(i,j)/2});
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
