%%
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
%init the grid and seed info
size = 100;
%setup the location of seed
numseed = 15;
mcolor = rand(numseed,3);
pos = randi([1,size],numseed,2);
neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);

%%
%manhattan distance
figure
hold on

for i = 1:size
    for j = 1:size
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
        
        if minv > 0
            
            neighbor(index,minv) = neighbor(index,minv) + 1;
            
            maxv(index) = max(maxv(index),minv);
            
        end
        
        plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
        
    end
end
%%
%show the seed position
for k = 1:numseed
    plot(pos(k,1),pos(k,2),'k*');
end
%
hold off

%%
%calculate the subgraph computation power
figure
hold on

for i = 1:numseed
    title = [];
    
    title = [1 neighbor(i,1:maxv(i,1))];
    
    %nunitm(title);
    
    nunitm_no(title);
    
end

hold off

%%


