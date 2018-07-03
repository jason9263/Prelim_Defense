clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
%init the grid and seed info
scale = 50;
%setup the location of seed
numseed = 10;
mcolor = rand(numseed,3);
pos = randi([1,scale],numseed,2);
neighbor = zeros(numseed,2*scale);
maxv = zeros(numseed,1);
[pos,mcolor] = getposcolor();
%%
%manhattan distance
figure
hold on
%plot_no == 1 draw the core
[neighbor,maxv] = getneighbor_maxv(pos,scale,numseed,mcolor,neighbor,maxv,1);
hold off

%%
%speedup curve
%(numseed,mcolor,neighbor, maxv,type,no)
% type == 1 max type == 2 min
% no = 1 is virtual cut through
% no = 2 is modified store and forward
voronoi_speedup(numseed,mcolor,neighbor,maxv,1,1);
% 0.3028

