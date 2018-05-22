function [A] = sigmaA_no(sigma,m,n)

if m > n
    tmp = m;
    m = n;
    n = tmp;
end

A = zeros(m+n-1,m+n-1);
total = m + n -1;

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

%the first col
for i = 2: total
    A(i,1) = 1;
end

%the dig
for i = 2: total
    A(i,i) = -(sigma+ 1);
end

%the down triangle
for i = 3:total
    for j = 2:i-1
        A(i,j) = -sigma;
    end
end

end
