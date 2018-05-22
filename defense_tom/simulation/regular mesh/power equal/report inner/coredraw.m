function coredraw(n , m)
%%
%draw lines
figure
% subplot(2,1,1)
% grid minor
% for k = 1:m
%     X = 1:1:n;
%     Y = ones(1,n)*k;
%     hold on
%     
%     plot(X,Y,'ro');
%     plot(X,Y,'r');
% end
% 
% %draw col
% for k = 1:n
%     X = ones(1,m)*k;
%     Y = 1:1:m;
%     plot(X,Y,'r');
% end
% 
% xlabel('Noc or workstation x coordinate');
% ylabel('Noc or workstation y coordinate');
% plot(n-1,m-1,'k*');
% hold off
% 
% axis on
% 
% %%
% subplot(2,1,2);
times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0];
    
    A= [1 4 4
        1 -1 0
        0 sigma-1 1];
    
    X = A\B;
    
    times = [times;1/X(1)];
    
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

xlabel('The ratio of zTcm to wTcp');
ylabel('Speedup');


times= [];
%min ratio
%max ratio
minr = 0.01;
maxr = 0.99;
for sigma = minr:0.01:maxr
    
    B = [1
        0
        0];
    
    A= [1 4 4
        1 -(sigma + 1) 0
        1 -sigma -(sigma + 1)];
    
    X = A\B;
    
    times = [times;1/X(1)];
    
end

X = minr:0.01:maxr;
Y = times';
hold on
plot(X,Y);

legend('With front end','Without front end');
end
