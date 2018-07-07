%%
%draw 20 * 20 point in the plane
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));

avg = 0;
totaltime = 100;
totalnum = 0;

for scale = 60:5:60
    for time = 1:totaltime
        
        numseed = 0;
        mcolor = [];
        pos = [];
        neighbor = [];
        maxv = [];
        
        S = [];
        
        %setup the location of seed
        numseed = 10;
        mcolor = rand(numseed,3);
        pos = randi([1,scale],numseed,2);
        neighbor = zeros(numseed,2*scale);
        maxv = zeros(numseed,1);
        
        [neighbor,maxv] = getneighbor_maxv(pos,scale,numseed,mcolor,neighbor,maxv,0);
        [S] = getS(scale,numseed,neighbor);
        
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
                    %plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
                end
                hold on
            end
        end
        %show the seed position
        for i = 1:numseed
            title = [];
            %title = [1 neighbor(i,1:maxv(i,1))];
            title = [1 neighbor(i,1: S(i))];
            %nunitm_c(title,mcolor(i,:));
            %nunitm_no_c(title);
        end
        
        avg = avg + savepro/(scale*scale);
        
    end
    
    avg = avg/totaltime
    
end

%%
clear title xlabel ylabel
figure
hold on

X = [35 40 45 50 55 60];
Y = [40.57 40.99  44.31 41.24 38.87 40.43];

plot(X,Y);
grid on

xlabel('Longitude number of cores');
ylabel('Percentage Processors Saved');
title('RVDA Saved Percentage');
ylim([0,50]);

hold off
%%