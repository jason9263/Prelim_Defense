%%voronoi torus
clear
clc
%init the grid and seed info
size = 35*3;
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

%55*5 0.3492
%50*3 0.3693
%45*3 0.3301
%40*3 0.3651
%35*3 0.3702


%%
X = 35:5:55;
Y =[37.02 36.51 33.01 36.93 34.92];
plot(X',Y');
grid on
xlabel('Number of Processors');
ylabel('Percentage Saved Processors');
ylim([0 50]);
title('Percentage Saved Processors vs Number of Processors ');
%%