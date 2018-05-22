function [A] = sigmaA(sigma, n)

A = zeros(n,n);

%init the first line of matrix A
A(1,1) = 3;
A(1,n) = 1;
for i = 2:n-1
    A(1,i) = 2;
end

for i = 2:n
    A(i,1) = sigma-1;
end

for i =2 :n
    A(i,i) = 1;
end

for i = 3:n
    for j = 2:i-1
        A(i,j) = sigma;
    end
end

end
