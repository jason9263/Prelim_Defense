function diffcornerboun
%%boundary
addpath(genpath('D:\Dropbox\Prelim_Defense\defense_tom\simulation\lib'));

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
    tmpj
    
    Y{i+1} = tmpj;
end

%%
minsig = 0.01;
maxsig = 0.99;

[x,y] = meshgrid(0.01:0.01:0.99, 3:3:39);

z1 = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        B = sigmaB(Y{y(i,j)/3});
        A = sigmaA(x(i,j),Y{y(i,j)/3});
        times = A\B;
        
        z1(i,j)  = 1/( times(1));
    end
end



%%Corner
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

z2 = zeros(size(x));
sizex = size(x);

for i = 1: sizex(1)
    for j = 1:sizex(2)
        
        B = sigmaB(Y{y(i,j)/3});
        A = sigmaA(x(i,j),Y{y(i,j)/3});
        times = A\B;
        
        z2(i,j)  = 1/( times(1));
    end
end


%%z1 boundary z2 corner


surf(x,y,z1-z2);
xlabel('\sigma');
ylabel('Number of cores in the 2*n regular mesh');
zlabel('Speedup');
colorbar

end