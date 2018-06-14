%%
%draw 20 * 20 point in the plane
%divide the plane into 5 parts
clear
clc
%init the grid and seed info

avg = 0;
totaltime = 100;
totalnum = 0;

for size = 50
    for time = 1:totaltime
        size = 0;
        numseed = 0;
        mcolor = [];
        pos = [];
        neighbor = [];
        maxv = [];
        
        size = 35;
        %setup the location of seed
        numseed = 10;
        mcolor = rand(numseed,3);
        
        pos = randi([1,size],numseed,2);
        
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
        
        
        sumcore = 0;
        totalnum = totalnum + min(maxv);
        
        for i = 1:numseed
            
            title = [];
            
            %title = [1 neighbor(i,1:maxv(i,1))];
            title = [1 neighbor(i,1:min(maxv))];
            
            sumcore = sumcore + sum(neighbor(i, 1:min(maxv)));
            
            nunitm(title);
            %nunitm_no(title);
            
        end
        
        avg = avg + (size*size - sumcore)/(size*size);
    end
    
    avg/totaltime
    
    totalnum/totaltime
    
    
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