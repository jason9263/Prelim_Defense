clc
clear
addpath(genpath('D:\Dropbox\Thomas paper\simulation'));

%%
%x = A\b is computed differently than x = inv(A)*b and is recommended for solving systems of linear equations.
%M = 5 wTcp = 1 zTcm = 1
%1 data source DLT
%1 installment


preA = [ 1 -2 0 0 0 0
    0 1 -2 0 0 0
    0 0 1 -2 0 0
    0 0 0 1 -2 0
    0 0 0 0 1 -2
    1 1 1 1 1 1 ];


preB = [0
    0
    0
    0
    0
    1];

prealpha = preA \ preB;

%%
%5 installment simulation
m = 4;
n = 3;
%
curA = zeros(m*n);
%build the (m*n , m*n) block

for i = 1:m-1
    j = n;
    k = (i-1)*n + j;
    
    curA(k,k) = 1;
    curA(k, i*n +j) = -2;
end

for i = 1:m
    
    for j = 1:n-1
        k = (i-1)*n + j;
        curA(k,(i-1)*n+j) = 1;
        
        tmpi = i+1;
        
        while tmpi <= m
            curA(k, (tmpi-1)*n+ j) = -1;
            tmpi = (tmpi + 1);
        end
        
        curA(k,(i-1)*n+j+1) = -1;
        
        tmpj = j + 1;
        tmpi = i;
        
        while tmpi > 0
            curA(k, (tmpi-1)*n + tmpj)  = -1;
            tmpi = tmpi -1;
        end
        
    end
end


%%
extendA = zeros(m*n,1);
curA = [extendA curA];
curA(m*n,1) = 1;
for i = 2:m*n+1
    curA(m*n,i) = -1;
end
curA;


extendA = zeros(1, m*n + 1) + 1;
curA = [extendA ;curA];

curB = zeros(m*n + 1, 1);
curB(1,1) = 1;

curA
curalpha = curA\curB