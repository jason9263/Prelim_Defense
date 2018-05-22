%%omt and torus
%%
% create some random point in unit circle
clear
clc
warning off
%
v = omtinit;
%v = rand(90,2)*2-1;
%in = dot(v,v,2)<1;
point = v;
% create unit circle
disk = [];

for i = -1:0.1:1
    disk = [disk; i,1];
end


for i = 0.9:-0.1:-1
    disk = [disk; 1,i];
end

for i = 0.9:-0.1:-1
    disk = [disk;i,-1];
end

for i = -0.9:0.1:1
    disk = [disk;-1,i];
end

%%

% set area to be equal in all cells
area = polyarea(disk(:,1),disk(:,2))*ones(size(point,1),1)/size(point,1);
%area = [0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 1 1]';

% initial power diagram
pd0 = power_diagram(point,zeros(size(point,1),1));

% compute power diagram with desired area
[pd,h] = discrete_optimal_transport(disk,point,area);

%% plot result
figure
plot_power_diagram(pd0);
title('initial power diagram')
hold on

plot(pd.point(:,1),pd.point(:,2),'r*');

plot(disk(:,1),disk(:,2),'r-')
axis([-1 1 -1 1])
figure;
plot_power_diagram(pd);

plot(pd.dual_point_extended(:,1), pd.dual_point_extended(:,2),'r*');

title('final power diagram')
hold on
plot(disk(:,1),disk(:,2),'r-')
axis([-1 1 -1 1])

figure;
plot_power_diagram(pd);

plot(pd.dual_point_extended(:,1), pd.dual_point_extended(:,2),'r*');

title('final power diagram')
hold on
plot(disk(:,1),disk(:,2),'r-')
axis([-3 3 -4 3])