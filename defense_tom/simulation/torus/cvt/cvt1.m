%% cvt Centroidal Voronoi
%Centroidal Voronoi tessellation
%draw 20 * 20 point in the plane
%divide the plane into 5 parts
clear
clc

R = 5;
r = 1;
%init the grid and seed info
size = 50*3;
%setup the location of seed
numseed = 10*9;
%%
[pos, mcolor] = initvoronoi;
%%
tail = 10;

for m = 1: tail
    
    neighbor = [];
    commsum = [];
    maxindex = [];
    maxv = [];
    
    neighbor = zeros(numseed,2*size);
    commsum = zeros(numseed,2);
    maxindex = ones(numseed,1)*2;
    maxv = zeros(numseed,1);
    
    %manhattan distance
    
    if m == tail
        figure
        hold on
    end
    
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
            
            if m == tail
                if mod(index,10) == 0
                    plot(i,j,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
                else
                    plot(i,j,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
                end
            end
        end
    end
    %%
    %show the seed position
    %%computet the new central coordinates
    %pos = randi([1,size],numseed,2);
    
    for k = 1: numseed
        pos(k,1) = fix(commsum(k,1)/maxindex(k));
        pos(k,2) = fix(commsum(k,2)/maxindex(k));
    end
    
    
    if  m == tail
        hold on
        for k = 1:numseed
            
            plot(pos(k,1),pos(k,2),'k*');
            txt = num2str(k);
            text(pos(k,1)+ 1,pos(k,2),txt);
            
        end
        
        X = [50 100 100 50 50 ]';
        Y = [50 50 100 100 50 ]';
        
        plot(X,Y,'r-');
        xlim([50 100]);
        ylim([50 100]);
        hold off
    end
    
end
%%



