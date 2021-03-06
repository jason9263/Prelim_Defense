%%
clear
clc
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

mcolor = [    0.1622    0.4505    0.1067
    0.7943    0.0838    0.9619
    0.3112    0.2290    0.0046
    0.5285    0.9133    0.7749
    0.1656    0.1524    0.8173
    0.6020    0.8258    0.8687
    0.2630    0.5383    0.0844
    0.6541    0.9961    0.3998
    0.6892    0.0782    0.2599
    0.7482    0.4427    0.8001];

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
%
xlabel('longitude geographical coordinate');
ylabel('latitude geographical coordinate');
title('Voronoi Division');
hold off

%%
%calculate the subgraph computation power
figure
hold on

sumcore = 0;

for i = 1:numseed
    
    title = [];
    
    title = [1 neighbor(i,1:maxv(i,1))];
    
    %title = [1 neighbor(i,1:min(maxv))];
    sum(title)
    
    sumcore = sumcore + sum(title);
    
    %nunitm(title);
    nunitm_no(title);
    
end
(size*size - sumcore)/(size*size)
legend('1','2','3','4','5','6','7','8','9','10');
hold off

% 0.3028

