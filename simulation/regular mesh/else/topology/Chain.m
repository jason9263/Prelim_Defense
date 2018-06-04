clc
clear
addpath(genpath('D:\Dropbox\Thomas paper\simulation'));
%%
%x = A\b is computed differently than x = inv(A)*b and is recommended for solving systems of linear equations.
%M = 5 wTcp = 1 zTcm = 1
%1 data source DLT
preA = [2 -1 0 0 0
    1 2 -1 0 0
    1 1 2 -1 0
    1 1 1 2 -1
    1 1 1 1 1];

preB = [1
    1
    1
    1
    1];

prealpha = preA\preB;

%%
%2 source for data injection
%DLT
curA = [2 -1 0
    1 2 -1
    1 1 1];

curB = [1
    1
    1];

curalpha = curA \ curB;
curalpha = curalpha * 0.5;

