%% cvt Centroidal Voronoi
%Centroidal Voronoi tessellation
%draw 20 * 20 point in the plane
%divide the plane into 5 parts

clear
clc
%init the grid and seed info
size = 80;
%setup the location of seed
numseed = 15;
mcolor = rand(numseed,3);
pos = randi([1,size],numseed,2);

%%
for m = 1: 20
    
    neighbor = zeros(numseed,2*size);
    
    commsum = zeros(numseed,2);
    
    maxindex = ones(numseed,1)*2;
    maxv = zeros(numseed,1);
    
    
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
            
            if minv == 0
                
            else
                neighbor(index,minv) = neighbor(index,minv) + 1;
            end
            
            commsum(index,1) = commsum(index,1) + i;
            commsum(index,2) = commsum(index,2) + j;
            
            maxindex(index) = maxindex(index) + 1;
            
            maxv(index) = max(maxv(index),minv);
            
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
    
    %%computet the new central coordinates
    
    %pos = randi([1,size],numseed,2);
    
    for k = 1: numseed
        pos(k,1) = fix(commsum(k,1)/maxindex(k));
        pos(k,2) = fix(commsum(k,2)/maxindex(k));
    end
    
end

%%
%calculate the subgraph computation power
figure
hold on

for i = 1:numseed
    
    title = [];
    
    title = [1 neighbor(i,1:maxv(i,1))];
    
    nunitm(title);

    nunitm_no(title);
    
end
hold off
