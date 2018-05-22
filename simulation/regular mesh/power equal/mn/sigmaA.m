function [A] = sigmaA(sigma,m,n)

%the firt line
for i = 1:m-1
    A(1,i) =  i + 1;
end

A(1,1) = 3;

k = 1;
for i = m + n -2 : n - 2
    A(1,i) = k;
    k = k + 1;
end

for i = m:n-1
    A(1,i) = m;
end

%the first col
for i = 2:m+n-2
    A(i,1) = sigma-1;
end

% the first dig
for i = 2:m+n-2
    A(i,i) = 1;
end

%the down triangle

for i = 3:m+n-2
    for j = 2:i-1
        A(i,j) = sigma;
    end
end

end
