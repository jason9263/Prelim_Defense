%%
clc
%init the grid and seed info
size = 50*3;
%setup the location of seed
numseed = 10*9;

[pos, mcolor] = initvoronoi;

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
        
        if mod(index,10) == 0
            plot(i,j,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
        else
            plot(i,j,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
            
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
%

hold on
X = [50 100 100 50 50 ]';
Y = [50 50 100 100 50 ]';

plot(X,Y,'r-');

xlim([50,100]);
ylim([50 100]);

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
    sumcore = sumcore + sum(title);
    nunitm(title);
    %nunitm_no(title);
    
end

(size*size - sumcore)/(size*size)

legend('1','2','3','4','5','6','7','8','9','10');

hold off
%%

