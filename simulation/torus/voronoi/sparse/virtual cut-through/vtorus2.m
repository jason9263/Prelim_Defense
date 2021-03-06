%%voronoi torus
clear
clc
%init the grid and seed info
size = 50*3;
%setup the location of seed
numseed = 10*9;
[pos,mcolor] = initvoronoi;
neighbor = zeros(10,2*size);
maxv = zeros(10,1);
savetmp = 0;
S = [];
for i = 51:100
    for j = 51:100
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
        
        if minv > 0
            if mod(index,10) == 0
                neighbor(10,minv) = neighbor(10,minv) + 1;
                maxv(10) = max(maxv(10),minv);
            else
                tmpindex = mod(index,10);
                neighbor(tmpindex,minv) = neighbor(tmpindex,minv) + 1;
                tmp = maxv(tmpindex);
                maxv(tmpindex) = max(tmp,minv);
            end
        end
        
    end
end


[v,itmp] = min(maxv);
neitmp = size*size;

numseed = 10;

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

numseed = 9 * 10;
figure
hold on
for i = 51:100
    for j = 51:100
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
        
        if mod(index,10) == 0
            tmpindex = 10;
        else
            tmpindex = mod(index,10);
        end
        
        index = tmpindex;
        
        if minv <= S(index)
            if mod(index,10) == 0
                plot(i,j,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
            else
                plot(i,j,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
            end
        end
        
        
        %         if minv <= S(index)
        %         end
        %         if mod(index,10) == 0
        %             plot(i,j,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
        %         else
        %             plot(i,j,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
        %         end
        
    end
end
%%
%show the seed position
numseed = 10*9;

for k = 1:numseed
    plot(pos(k,1),pos(k,2),'k*');
    
    tmpk = k;
    if mod(tmpk,10) == 0
        tmpk = 10;
    else
        tmpk = mod(tmpk,10);
    end
    
    txt = num2str(tmpk);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
end
%

X = [50 100 100 50 50 ]';
Y = [50 50 100 100 50 ]';

plot(X,Y,'r-');

xlim([50,100]);
ylim([50 100]);
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
    title = [1 neighbor(i,1:S(i))];
    %title = [1 neighbor(i,1:min(maxv))];
    nunitm_c(title, mcolor(i,:));
    %nunitm_no(title);
end
legend('1','2','3','4','5','6','7','8','9','10');
hold off
clc


