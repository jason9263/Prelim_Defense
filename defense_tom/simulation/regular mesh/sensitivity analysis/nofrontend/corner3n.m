function corner3n

%%
%sensitivity analysis of the regular mesh
clear
clc

X = [];
X = [3;X];

len = 20;
Y = cell(1,len+1);
Y{1} = [1 1 1];
Y{2} = [1 2 2 1];

for i = 1:len
    tmp = 3 + 3*i;
    X = [X;tmp];
    
    tmpj = [];
    
    for j = 2:i
        tmpj =[tmpj,3];
    end
    
    tmpj = [1,2,tmpj];
    tmpj = [tmpj,2,1];
    
    Y{i+1} = tmpj;
end

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(0.01:0.01:0.99, 3:3:39);

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

surf(x,y,z,'FaceAlpha',0.7);
xlabel('sigma value zTcm over wTcp');
ylabel('number of cores in the 2*n regular mesh');
zlabel('Speedup');
title('Speedup vs sigma value and number of cores');
colorbar
%%


end
