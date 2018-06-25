%%
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
[mcolor,pos] = init;

size = 50;
numseed = 10;

neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);
spr = 0;

for i = 1:50
    for j = 1:50
        
        sd = [];
        
        for k = 1:10
            
            tmp = pos{k};
            tmpsd = shortest(i,j,tmp);
            sd = [sd; tmpsd];
            
        end
        hold on
        [minv,index] = min(sd);
        
        
        if minv > 0
            
            neighbor(index,minv) = neighbor(index,minv) + 1;
            
            maxv(index) = max(maxv(index),minv);
            
        end
        
        if minv <= 13
            
            
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
            
        else
            spr = spr + 1;
        end
        
    end
end
%%
for k = 1:10
    tmp = pos{k};
    hold on
    plot(tmp(:,1), tmp(:,2),'k*');
end

xlim([0 50]);
ylim([0 50]);

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
    title = [1 neighbor(i,1:maxv(i,1))];
    %title = [1 neighbor(i,1:min(maxv))];
    sum(title)
    sumcore = sumcore + sum(title);
    %nunitm(title);
    nunitm_no(title);
end
hold off
%%
figure
hold on
grid on
sumcore = 0;
for i = 1:numseed
    title = [];
    %title = [1 neighbor(i,1:maxv(i,1))];
    title = [1 neighbor(i,1:min(maxv))];
    sum(title)
    sumcore = sumcore + sum(title);
    %nunitm(title);
    nunitm_no(title);
end
hold off
%%
