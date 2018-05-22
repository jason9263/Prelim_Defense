function [A] = sigmaA(sigma,tline)

sline = size(tline);
total = sline(2);

if total == 1
    A = tline;
else
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

end
