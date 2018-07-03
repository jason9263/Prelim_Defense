clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
avg = 0;
totaltime = 1;
totalnum = 0;
for scale = 50
    for time = 1:totaltime
        scale = 0;
        numseed = 0;
        mcolor = [];
        pos = [];
        neighbor = [];
        maxv = [];
        scale = 35;
        %setup the location of seed
        numseed = 10;
        mcolor = rand(numseed,3);
        pos = randi([1,scale],numseed,2);
        neighbor = zeros(numseed,2*scale);
        maxv = zeros(numseed,1);
        
        [neighbor,maxv] = getneighbor_maxv(pos,scale,numseed,mcolor,neighbor,maxv,0);
        [S] = getS(scale,numseed,neighbor);
        
        
        [savrpro] = voronoi_cell_s(scale,pos,scale,numseed,mcolor,neighbor,maxv,1);
        
        %3 is showing S
        %1 is show virtul cut through
        voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,3,1);
        savepro/(scale*scale)
        
    end

end

%%
X = [35 40 45 50 55 60];
Y = [0.3780 0.3726 0.3890 0.3504  0.3464 0.3835 ];
Z = [7.8400 9.2200 10.0800 11.9900 13.1900 14.0400];

figure
hold on
grid on
plot(X,Y);
xlabel('Longitude number of cores');
ylabel('Saved Percentage');
title('RVDA Saved Percentage');
ylim([0,0.5]);
hold off

%%
figure
hold on
plot(X,Z);
xlabel('number of core on each edge');
ylabel('avg length of the mindepth');
ylim([5,15]);
hold off

%plot(X,Z);
%%