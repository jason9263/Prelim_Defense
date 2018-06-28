clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));

sparse_save;
[posmatrix,sumS] = initmatrix(50,50,pos,S);

S_ext = S;

[v,index] = min(sumS);

x = pos(index,1);
y = pos(inedx,2);
dis = S(index) + 1;
upos = dispos_ext(x,y,dis,m,n)
