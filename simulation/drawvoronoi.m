%% 9 - 11
clear
clc
figure

X = [9,10,11];
Y = [10,9,11];
hold on
grid on
[vx,vy] = voronoi(X',Y');
plot(X,Y,'r+', vx,vy,'b-');
xlim([8,12]);
ylim([8,12]);
xlabel('X Coordinate');
ylabel('Y Coordinate');
hold off

%%
figure

nX = [];
nY = [];
X = [9,10,11]';
Y = [10,9,11]';

for i = -1 : 1
    tmpX = [];
    
    tmpX = X + i*4;
    for j = -1: 1
        tmpY = [];
        tmpY = Y + j*4;
        
        nX = [nX; tmpX];
        nY = [nY; tmpY];
        
    end
end

hold on
grid on
[vx,vy] = voronoi(nX,nY);
plot(nX,nY,'r+', vx,vy,'b-');
xlim([4,16]);
ylim([4,16]);

x = [8 8 12 12 8]';
y = [8 12 12 8 8]';
plot(x,y,'r');
xlabel('X Coordinate');
ylabel('Y Coordinate');
hold off
%%

%%
figure

nX = [];
nY = [];
X = [9,10,11]';
Y = [10,9,11]';

for i = -1 : 1
    tmpX = [];
    
    tmpX = X + i*4;
    for j = -1: 1
        tmpY = [];
        tmpY = Y + j*4;
        
        nX = [nX; tmpX];
        nY = [nY; tmpY];
        
    end
end

hold on
grid on
[vx,vy] = voronoi(nX,nY);
plot(nX,nY,'r+', vx,vy,'b-');
xlim([8,12]);
ylim([8,12]);

x = [8 8 12 12 8]';
y = [8 12 12 8 8]';
plot(x,y,'r');
xlabel('X Coordinate');
ylabel('Y Coordinate');
hold off
