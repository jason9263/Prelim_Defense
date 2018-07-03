function [S] = getS(scale,numseed,neighbor)

tmpsum = [];

for i = 1:numseed
    tmpsum = [tmpsum;sum(neighbor(i,:))];
end

[neitmp,neitmpindex] = min(tmpsum);


S = [];
for i = 1:10
    sumtmp = 0;
    for j = 1:2*scale
        sumtmp = sumtmp + neighbor(i,j);
        if sumtmp >= neitmp
            S = [S;j];
            break
        else
            if neighbor(i,j) == 0
                S = [S;j];
                break
            end
        end
    end
    
end

end
