function [meanwaitlen,meanwaittime]=MM1(lamda,mu,sizev)
clc;

%M/M/1 demo
gap = exprnd(lamda,1,sizev);
service = exprnd(mu,1,sizev);

at = zeros(1,sizev);  % arrive time stamp
act = zeros(1,sizev); % come across the crossing time stamp
lt = zeros(1,sizev); % leave time stamp
%%
%init the arrive time stamp
at(1) = 0;
for i = 2:sizev
    at(i) = at(i-1) + gap(i-1);
end
%%
%init the come across time stamp and leave time stamp
act(1) = 0;
lt(1) = act(1) + service(1);

%%
%calculate the arrive, at crossing and leave timestamp
for i = 2: sizev
    %arrive time stamp
    
    if at(i) < lt(i-1)
        act(i) = lt(i-1);
    else
        act(i) = at(i);
    end
    
    %leave time stamp
    
    lt(i) = act(i) + service(i);
    
end

%%
%iwt ith vehicle waiting time in the queue
iwt = zeros(1,sizev);

for i = 1: sizev
    iwt(i) = lt(i) - at(i);
end
%%
%legnth of the queue
lenat = zeros(sizev,2);
lenlt = zeros(sizev,2);

for i = 1:sizev
    lenat(i,1) = at(1,i);
    lenat(i,2) = 1;
    
    lenlt(i,1) = lt(1,i);
    lenlt(i,2) = -1;
    
end
%%
len = [lenat; lenlt];
len = sortrows(len,1);

%%
leng = zeros(1,size(len,1));
for i = 2:size(len,1)
    if len(i,2) > 0
        leng(1,i) = leng(1,i-1) + 1;
    else
        if leng(1,i-1) > 0
            leng(1,i) = leng(1,i-1)-1 ;
        else
            leng(1,i) = 0;
        end
    end
end

%%
% figure
% grid on;
%
% subplot(2,1,1)
% x = 1:size(len,1);
% title('queue length vs time');
% plot(x, leng);
% xlabel('Time');
% ylabel('Queue Length');
%

%
% subplot(2,1,2)
% x = 1:sizev;
% plot(x,iwt);
% title('Car Index VS Wait Time');
% xlabel('Car Index');
% ylabel('Wait Time');


meanwaittime = mean(iwt);
meanwaitlen = mean(leng);
end
