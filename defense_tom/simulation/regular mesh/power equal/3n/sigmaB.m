function [B] = sigmaB(sigma,n)

B = zeros(1,n);
B(1) = 1;
B = B';
end
