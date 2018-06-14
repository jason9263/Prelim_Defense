%%draw torus
%
clc
close all
clear all
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
figure(1);
hold on

R=5;
r=1;

u=linspace(0,2*pi,100);
v=linspace(0,2*pi,100);

[u,v]=meshgrid(u,v);

x=(R+r.*cos(v)).*cos(u);
y=(R+r.*cos(v)).*sin(u);
z=r.*sin(v);
mesh(x,y,z);
view([-52,64]);

h=gca;

%plot3(x,y,z,'bo');

get(h,'FontSize');
set(h,'FontSize',14);

xlabel('X','fontSize',14);
ylabel('Y','fontSize',14);
zlabel('Z','fontsize',14);
title('Torus','fontsize',14)

fh = figure(1);
set(fh, 'color', 'white');