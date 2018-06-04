function boudary3n
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

xlabel('\sigma');
ylabel('Number of cores');
zlabel('Speedup');
title('Speedup vs \sigma and Number of cores');
colorbar
end
