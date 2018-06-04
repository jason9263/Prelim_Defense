function [A] = sigmaA(sigma,tline)

sline = size(tline);
index = 1;

total = sline(2);
tmpline = zeros(1,total/2);

for i = 1:2:total
    tmpline(index) = str2double(tline(i));
    index = index + 1;
end

tline = [];
tline = tmpline;

total = total/2;

A = zeros(total,total);
%%
%the firt line
A(1,:) = tline;
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
