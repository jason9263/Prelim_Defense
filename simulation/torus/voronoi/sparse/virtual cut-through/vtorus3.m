%%voronoi torus
%
clear
clc
%init the grid and seed info
size = 50*3;
%setup the location of seed
numseed = 10*9;
[pos,mcolor] = initvoronoi;
neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);

R = 5;
r = 1;

%%
%manhattan distance
figure
hold on

for i = 50:100
    for j = 50:100
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
        
        u = (i - 50)/50;
        v = (j-50)/50;
        
        u = u*2*pi;
        v = v*2*pi;
        
        x=(R+r*cos(v))*cos(u);
        y=(R+r*cos(v))*sin(u);
        z=r*sin(v);
                
        if mod(index,10) == 0
            plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(10,:)],'MarkerFaceColor',[mcolor(10,:)]);
        else
            plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(mod(index,10),:)],'MarkerFaceColor',[mcolor(mod(index,10),:)]);
        end
        
    end
end
grid on
%%

%%




