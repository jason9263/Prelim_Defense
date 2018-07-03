%%
%draw 20 * 20 point in the plane
%divide the plane into 5 parts
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
%init the grid and seed info
size = 50;
%setup the location of seed
numseed = 10;
mcolor = rand(numseed,3);
pos = randi([1,size],numseed,2);
neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);
[pos,mcolor] = getposcolor();

%%
%manhattan distance
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
        
    end
end
% 0.3028
%%
tmpsum = [];
for i = 1:10
    tmpsum = [tmpsum;sum(neighbor(i,:))];
end

[neitmp,neitmpindex] = min(tmpsum);


S = [];
for i = 1:10
    sumtmp = 0;
    for j = 1:2*size
        sumtmp = sumtmp + neighbor(i,j);
        if sumtmp >= neitmp
            S = [S;j];
            break
        else
            if neighbor(i,j) == 0
                S = [S;j];
                break
            end
        end
    end
    
end
%%
figure
hold on
savepro = 0;

for i = 1:size
    for j = 1:size
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
%show the seed position
for k = 1:numseed
    
    plot(pos(k,1),pos(k,2),'k*');
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
    
end
grid on
xlabel('Longitude geographical coordinate');
ylabel('Latitude geographical coordinate');
title('Reduced Voronoi Division');
hold off

%%
%calculate the subgraph computation power
%voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,type,no)

voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,3,1);

savepro/(size*size)
























