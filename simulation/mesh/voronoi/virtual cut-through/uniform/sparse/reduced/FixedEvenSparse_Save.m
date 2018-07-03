%%
%draw 20 * 20 point in the plane
%divide the plane into 5 parts
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
%plot_no == 1 draw the core
[neighbor,maxv] = getneighbor_maxv(pos,scale,numseed,mcolor,neighbor,maxv,0);
[S] = getS(numseed,neighbor);
%%
figure
hold on
savepro = 0;

for i = 1:scale
    for j = 1:scale
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
                
        stmp = S(index);
        if minv <= stmp
            savepro = savepro +1;
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
        end
        
    end
end

%%
drawtext(numseed,pos);

xlabel('Longitude geographical coordinate');
ylabel('Latitude geographical coordinate');
title('Reduced Voronoi Division');
hold off

%%
%calculate the subgraph computation power
%voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,type,no)

voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,3,1);

savepro/(scale*scale)
























