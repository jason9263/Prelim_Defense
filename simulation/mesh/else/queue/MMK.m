function [meanlen] = MMK(lambda, mu,k,nv)
%init
% lambda = 3;
% mu = 5;
% k = 3;
% nv = 500;%number of variable

%arrive time stamp
at = zeros(1,nv);
%crossing time stamp
ct = zeros(1,nv);
%leave time stamp
lt = zeros(1,nv);

%%
gapt = exprnd(lambda,1,nv);
st = exprnd(mu,1,nv);
st = [st; exprnd(mu,1,nv)];
st = [st; exprnd(mu,1,nv)];
%%
%gapt = zeros(1,nv) + 10;
%st = zeros(3,nv) + 1;

%%
%init the index of three service

at(1) = 0;
for i =2 : nv
    at(i) = at(i-1) + gapt(i-1);
end

%the index number on the three workstation
index = zeros(1,k);
index(1) = 1;

%the pointer record the serviced number of each service station
pointer = zeros(1,3) + 1;
ct(1) = 0;
lt(1) = ct(1) + st(1,1);

%value and position of the vehicle which will leave
v = -1;
pos = -1;

%%
for i = 2 : k
    ct(i) = at(i);
    lt(i) = ct(i) + st(i,pointer(i));
    pointer(i) = pointer(i) + 1;
    index(i) = i;
end

%%
for i = (k+1):nv
    
    [v, pos] = min([lt(index(1)), lt(index(2)), lt(index(3))]);
    
    if at(i) >= v
        ct(i)  = at(i);
    else
        prev = index(pos);
        ct(i) = lt(prev);
    end
    
    lt(i) = ct(i) + st(pos,pointer(pos));
    pointer(pos) = pointer(pos)+1;
    index(pos) = i;
end


%%
%legnth of the queue
lenat = zeros(nv,2);
lenlt = zeros(nv,2);

for i = 1:nv
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

% figure
% hold on
% subplot(2,1,1)
% x = 1:size(len,1);
% title('queue length vs time');
% plot(x, leng);
% xlabel('Time');
% ylabel('Queue Length');

meanlen = mean(leng);

end





