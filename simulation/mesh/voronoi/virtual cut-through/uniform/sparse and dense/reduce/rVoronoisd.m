%%
clear
clc

addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
[mcolor,pos] = init;

size = 50;
numseed = 10;

neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);
spr = 0;
figure
hold on

for i = 1:50
    for j = 1:50
        sd = [];
        for k = 1:10
            
            tmp = pos{k};
            tmpsd = shortest(i,j,tmp);
            sd = [sd; tmpsd];
            
        end
        [minv,index] = min(sd);
        
        if minv > 0
            
            neighbor(index,minv) = neighbor(index,minv) + 1;
            
            maxv(index) = max(maxv(index),minv);
            
        end
        
        plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
        
    end
end



for k = 1:10
    tmp = pos{k};
    hold on
    plot(tmp(:,1), tmp(:,2),'k*');
end

xlim([0 50]);
ylim([0 50]);
grid on

xlabel('latitude index');
ylabel('longitude index');

hold off
%%
figure
S = [];
hold on
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

for i = 1:numseed
    sumtmp = 0;
    for j = 1:2*size
        sumtmp = sumtmp + neighbor(i,j);
        if sumtmp >= neitmp
            S = [S;j];
            break;
        else if neighbor(i,j) == 0
                S = [S;j];
                break;
            end
        end
    end
end

for i = 1:50
    for j = 1:50
        
        sd = [];
        
        for k = 1:10
            
            tmp = pos{k};
            tmpsd = shortest(i,j,tmp);
            sd = [sd; tmpsd];
            
        end
        
        [minv,index] = min(sd);
        
        if minv > 0
            
            neighbor(index,minv) = neighbor(index,minv) + 1;
            
            maxv(index) = max(maxv(index),minv);
            
        end
        
        if minv <= S(index)
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
            
        else
            spr = spr + 1;
        end
        
    end
end

for k = 1:10
    tmp = pos{k};
    hold on
    plot(tmp(:,1), tmp(:,2),'k*');
end

xlim([0 50]);
ylim([0 50]);
grid on

xlabel('latitude index');
ylabel('longitude index');

hold off
%%
figure
hold on
grid on

sumcore = 0;
for i = 1:numseed
    title = [];
    title = [1 neighbor(i,1:S(i))];
    %title = [1 neighbor(i,1:min(maxv))];
    %sum(title)
    %sumcore = sumcore + sum(title);
    nunitm_c(title,mcolor(i,:));
    %nunitm_no(title);
end
legend('1','2','3','4','5','6','7','8','9','10');
hold off
%%

figure
hold on
grid on


sumcore = 0;
for i = 1:numseed
    title = [];
    %title = [1 neighbor(i,1:S(i))];
    title = [1 neighbor(i,1:maxv(i,:))];
    %sum(title)
    %sumcore = sumcore + sum(title);
    nunitm_c(title,mcolor(i,:));
    %nunitm_no(title);
end
legend('1','2','3','4','5','6','7','8','9','10');
hold off
