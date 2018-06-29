%%voronoi torus
%
clear
clc
%init the grid and seed info
size = 50*3;
%setup the location of seed
numseed = 10;
S = [];
[pos,mcolor] = initvoronoi;

neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);

R = 5;
r = 1;

for i = 51:100
    for j = 51:100
        dis = [];
        
        for k = 1:numseed*9
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
        else
            if neighbor(i,j) == 0
                S = [S;j];
                break;
            end
        end
    end
end


figure

for i = 51:100
    for j = 51:100
        dis = [];
        
        for k = 1:numseed*9
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
        

        
        u = (i-50)/50;
        v = (j-50)/50;
        
        u = u*2*pi;
        v = v*2*pi;
        
        x=(R+r*cos(v))*cos(u);
        y=(R+r*cos(v))*sin(u);
        z=r*sin(v);
        hold on
        
        if mod(index,10) == 0
            index = 10;
        else
            index = mod(index,10);
        end
        
        if minv <= S(index)
            if mod(index,10) == 0
                plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
            else
                plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
            end
            
        end
        
        
        %         if minv <= S(index)
        %         end
        %         if mod(index,10) == 0
        %             plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
        %         else
        %             plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
        %         end
        
        
        
    end
end

u = [];
v = [];
grid on

for i = 50:100
    for j = 50:100
        tu = (i-50)/50;
        tu = tu * 2* pi;
        
        u = [u tu];
        tv = (j-50)/50;
        tv = tv*2*pi;
        
        v =[v tv];
    end
end

[u,v]=meshgrid(u,v);

x=(R+r.*cos(v)).*cos(u);
y=(R+r.*cos(v)).*sin(u);
z=r.*sin(v);

mesh(x,y,z);
view([-52,64]);

set(gca,'linewidth',1,'fontsize',25,'fontname','Times');

xlabel('Longitude geographical index','fontweight','bold','FontSize',25);
ylabel('Latitudinal geographical index','fontweight','bold','FontSize',25);
title('Placement of Processors','fontweight','bold','FontSize',25);
%%
clear title xlabel ylabel

figure
hold on
grid on
sumcore = 0;

for i = 1:10
    
    title = [];
    title = [1 neighbor(i,1:S(i,1))];
    %title = [1 neighbor(i,1:maxv(i))];
    %title = [1 neighbor(i,1:min(maxv))];
    nunitm_c(title,mcolor(i,:));
    %nunitm_no(title);
    
end

legend('1','2','3','4','5','6','7','8','9','10');
hold off

