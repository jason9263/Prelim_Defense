function boudary3n
clear
clc

X = [];
X = [3;X];

len = 20;
Y = cell(1,len+1);
Y{1} = [1 2];
Y{2} = [1 3 2];

for i = 1:len
    tmp = 3 + 3*i;
    X = [X;tmp];
    
    tmpj = [];
    
    for j = 2:i
        tmpj =[tmpj,3];
    end
    
    tmpj = [1,tmpj];
    tmpj = [tmpj,2];
    
    Y{i+1} = tmpj;
end

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(minsig:0.01:maxsig, 3:3:24);

z = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        B = sigmaB_no(Y{y(i,j)/3});
        A = sigmaA_no(x(i,j),Y{y(i,j)/3});
        times = A\B;
        
        z(i,j)  = 1/( times(1));
    end
end
colormap default
surf(x,y,z,'FaceAlpha',0.7);

xlabel('\sigma');
ylabel('Number of cores');
zlabel('Speedup');
title('Speedup vs \sigma and Number of cores');
colorbar
end
