%%voronoi torus
clear
clc
%init the grid and seed info
size = 45*3;
%setup the location of seed
numseed = 10*9;
%%
ressum = 0;
times = 100;
tres = [];

for i = 1:times
    res = process(size, numseed);
    tres = [tres;res];
    ressum = ressum + res;
end

ressum / times


%50*3 0.3693
