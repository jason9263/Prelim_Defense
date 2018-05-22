function [B] = sigmaB_no(tline)

lsize = size(tline);

B = zeros(lsize(2),1);
B(1) = 1;

end
