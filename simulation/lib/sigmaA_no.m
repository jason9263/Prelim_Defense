function [A] = sigmaA_no(sigma,tline)

sline = size(tline);
index = 1;

total = sline(2);

if total == 1
    A = tline;
else
    tmpline = zeros(1,total);
    
    for i = 1:total
        tmpline(index) = str2double(tline(i));
        index = index + 1;
    end
    
    A = zeros(total,total);
    A(1,:) = tline;
    
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
end
