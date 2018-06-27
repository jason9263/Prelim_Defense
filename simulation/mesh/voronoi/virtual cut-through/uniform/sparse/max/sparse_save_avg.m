%%
%draw 20 * 20 point in the plane
clear
clc

avg = 0;
totaltime = 1;
totalnum = 0;

for size = 50:50
    for time = 1:totaltime

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
        neitmp = sum(neighbor(itmp,:));
        S = [];
        
        for i = 1:numseed
            sumtmp = 0;
            for j = 1:2*size
                sumtmp = sumtmp + neighbor(i,j);
                if sumtmp >= neitmp
                    S = [S;j];
                    break;
                else
                    if neighbor(i,j) == 0
                        S = [S;j];
                        break;
                    end
                end
            end
        end
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
                
                if minv > 0
                    
                    neighbor(index,minv) = neighbor(index,minv) + 1;
                    
                    maxv(index) = max(maxv(index),minv);
                    
                end
                
                stmp = S(index);
                if minv <= stmp
                    savepro = savepro +1;
                    plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
                end
                
            end
        end
        %show the seed position
        for k = 1:numseed
            
            plot(pos(k,1),pos(k,2),'k*');
            
            txt = num2str(k);
            
            text(pos(k,1)+ 1,pos(k,2),txt);
            
        end
        grid on
        xlabel('longitude geographical coordinate');
        ylabel('latitude geographical coordinate');
        hold off
        
        figure
        hold on
        grid on
        
        sumcore = 0;
        
        for i = 1:numseed
            title = [];
            %title = [1 neighbor(i,1:maxv(i,1))];
            title = [1 neighbor(i,1: S(i))];
            nunitm_c(title,mcolor(i,:));
            %nunitm_no(title);
        end
        
        legend('1','2','3','4','5','6','7','8','9','10');
        hold off
        
        savepro/(size*size)
        
    end
end

%%
X = [35 40 45 50 55 60];
Y = [ 0.4057 0.4099  0.4431 0.4124 0.3887 0.4043];

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