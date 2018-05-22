function [B] = sigmaB(tline)

tsize = size(tline);
B = zeros(tsize(2)/2,1);
B(1) = 1;

end
