function [A] = sigmaA(sigma,m,n)

if m > n
    tmp = m;
    m = n;
    n = tmp;
end

A = zeros(m+n-1,m+n-1);

total = m + n -1;
%%
%the firt line
for i = 1:m-1
    A(1,i) =  1;
end

k = 1;
for i = total :-1: n
    A(1,i) = k;
    k = k + 1;
end

for i = m:n-1
    A(1,i) = m;
end

%%
%second row
A(2,1) = 1;
A(2,2) = -1;

%%
%the first col
for i = 3:total
    A(i,2) = sigma-1;
end

% the first dig
for i = 3: total
    A(i,i) = 1;
end

%the down triangle
for i = 4:total
    for j = 3:i-1
        A(i,j) = sigma;
    end
end


end
