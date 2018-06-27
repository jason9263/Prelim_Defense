%%
%draw 20 * 20 point in the plane
clear
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));

avg = 0;
totaltime = 10;
totalnum = 0;

for size = 50
    for time = 1:totaltime
        
        numseed = 0;
        mcolor = [];
        pos = [];
        neighbor = [];
        maxv = [];
        
        S = [];
        size = 35;
        %setup the location of seed
        numseed = 10;
        mcolor = rand(numseed,3);
        pos = randi([1,size],numseed,2);
        neighbor = zeros(numseed,2*size);
        maxv = zeros(numseed,1);
        
        
        pos = [   19     9
            34     8
            23    24
            34    30
            9    13
            24    28
            11    24
            24     1
            25    22
            3    14];
        
        mcolor = [
            0.4229    0.5309    0.7788
            0.0942    0.6544    0.4235
            0.5985    0.4076    0.0908
            0.4709    0.8200    0.2665
            0.6959    0.7184    0.1537
            0.6999    0.9686    0.2810
            0.6385    0.5313    0.4401
            0.0336    0.3251    0.5271
            0.0688    0.1056    0.4574
            0.3196    0.6110    0.8754];
        
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
        
        [v,itmp] = min(maxv);
        neitmp = size*size;
        
        for i = 1:numseed
            if maxv(i) == v
                tmpneitmp = sum(neighbor(i,:));
                if tmpneitmp < neitmp
                    neitmp = tmpneitmp;
                end
            end
        end
        
        neitmp
        
        for i = 1:numseed
            sumtmp = 0;
            for j = 1:2*size
                sumtmp = sumtmp + neighbor(i,j);
                if sumtmp >= neitmp
                    S = [S;j];
                    break
                end
            end
        end
        
        savepro = 0;
        
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
        
        avg = avg + savepro/(size*size);
        
    end
    
    avg = avg/totaltime
end

%%
X = [35 40 45 50 55 60];
Y = [ ];

figure
hold on
grid on
plot(X,Y);
xlabel('Longitude number of cores');
ylabel('Saved Percentage');
title('RVDA Saved Percentage');
ylim([0,0.5]);
hold off

%plot(X,Z);
%%