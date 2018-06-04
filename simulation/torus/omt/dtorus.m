%%draw torus
%
clc
close all
clear all

figure(1);
hold on
colormap winter
grid on

R=5;
r=1;

mcolor = [
    0.5181    0.2548    0.9160
    0.9436    0.2240    0.0012
    0.6377    0.6678    0.4624
    0.9577    0.8444    0.4243
    0.2407    0.3445    0.4609
    0.6761    0.7805    0.7702
    0.2891    0.6753    0.3225
    0.6718    0.0067    0.7847
    0.6951    0.6022    0.4714
    0.0680    0.3868    0.0358
    ];

index = 1;

u=linspace(0,2*pi,5);
v=linspace(0,2*pi,5);

[u,v]=meshgrid(u,v);

x=(R+r.*cos(v)).*cos(u);
y=(R+r.*cos(v)).*sin(u);
z=r.*sin(v);
mesh(x,y,z);
view([-52,64]);

h=gca;

plot3(x,y,z,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
plot3(x,y,z,'bo');

get(h,'FontSize');
set(h,'FontSize',14);
axis off

% xlabel('X','fontSize',14);
% ylabel('Y','fontSize',14);
% zlabel('Z','fontsize',14);
%title('Torus','fontsize',14);

fh = figure(1);
set(fh, 'color', 'white');