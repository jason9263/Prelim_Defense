%%
%draw 50 * 50 point in the plane
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
%init the grid and seed info
size = 50;
%setup the location of seed
numseed = 10;

mcolor = rand(numseed,3);
pos = randi([1,size],numseed,2);

pos = [16    30
    46    33
    28    30
    9    36
    45    11
    49     6
    25    43
    6    16
    40   40
    20    15];

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
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
end

xlabel('Longitude geographical index');
ylabel('Latitudinal geographical index');
title('Placement of Processors');

hold off
%%
figure
hold on
grid on
sumcore = 0;

for i = 1:10
    title = [];
    title = [1 neighbor(i,1:maxv(i))];
    %title = [1 neighbor(i,1:min(maxv))];
    nunitm_c(title, mcolor(i,:));
    %nunitm_no(title);
end
legend('1','2','3','4','5','6','7','8','9','10');
hold off
clc