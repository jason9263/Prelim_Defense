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

pos = [    22    43
    46    32
    10    18
    14    26
    8    21
    7     4
    44    12
    29     7
    28    10
    8    12
    ];

mcolor = [
    0.5181    0.2548    0.9160
    0.9436    0.2240    0.0012
    0.6377    0.6678    0.4624
    0.9577    0.8444    0.4243
    0.2407    0.3445    0.4609
    0.6761    0.7805    0.7702
    0.2891    0.6753    0.3225
    0.6718    0.0067    0.7847
    0.6951    0.6022    0.4714
    0.0680    0.3868    0.0358
    ];


neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);

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
figure
hold on
grid on

sumcore = 0;

for i = 1:numseed
    
    title = [];
    %title = [1 neighbor(i,1:maxv(i,1))];
    %title = [1 neighbor(i,1:min(maxv))];
    title = [1 neighbor(i,1: S(i))];
    tmpt = sum(title);
    sumcore = sumcore + tmpt;
    
    %nunitm_c(title,mcolor(i,:));
    nunitm_no_c(title,mcolor(i,:));
    
end

legend('1','2','3','4','5','6','7','8','9','10');
hold off

1-sumcore/(size*size)



